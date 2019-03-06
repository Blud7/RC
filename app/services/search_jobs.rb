require 'watir'
require 'csv'
require 'json'

class SearchJobs
	attr_accessor :downcased_name, :usable_names

	def initialize(firms)
		@firms = ["Doctrine","Dataiku","Doctolib","Drivy"]
		@usable_names = []
		@urls_array =[]
		@jobs_array = []
		@my_hash = Hash.new{|hsh,key| hsh[key] = [] }
		Selenium::WebDriver::Chrome.path = "/app/.apt/usr/bin/google-chrome"
		Selenium::WebDriver::Chrome.driver_path = "/usr/local/bin/chromedriver"
		@browser = Watir::Browser.new(:chrome, {:chromeOptions => {:args => ['--headless', '--window-size=1200x600']}})
		@firms.map do |key|
			downcased_name = key.downcase
			@usable_names << downcased_name
		end
	end

	def perform 
		@usable_names.map do |firm|
			url = "https://www.welcometothejungle.co/companies/#{firm}/jobs"
			@urls_array << url
		end

		@urls_array.map do |key|
			@browser.goto key
			@browser.driver.manage.timeouts.implicit_wait = 3
			d = @browser.spans class: 'ais-Highlight-nonHighlighted'

			d.each do |k|
				k.exists?
				@my_hash[key].push k.text
			end
		end
		CSV.open("data.csv", "wb") {|csv| @my_hash.to_a.each {|elem| csv << elem} }
	end
end

