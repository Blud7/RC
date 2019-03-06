class UserMailer < ApplicationMailer
 
  def new_job_mailer(ex_hash)
  	headers['X-MJ-CustomID'] = 'rubyPR_Test_ID_1469790724'
	headers['X-MJ-EventPayload'] = 'rubyPR_Test_Payload'
	headers['X-MJ-TemplateLanguage'] = 'true'

	@ex_hash = ex_hash
 	@jobs = SearchJobs.new(@firms).perform 
	@used_in_mail = []

	@overlapping_elements = @jobs.to_a & @ex_hash.to_a #jusqu'ici c'est ok
	@exc1 = @jobs.to_a - @overlapping_elements
	@exc2 = @ex_hash.to_a - @overlapping_elements

		n=0
			@exc1.each do |key|
				@new_jobs = key[1]
			begin
				@ex_jobs = @exc2[n][1]
			rescue
			end
			@only_new_elements = @new_jobs.difference(@ex_jobs)

	 	n=n+1
		end

		mail(from: "paul@recruitersclub.io", to: "paul@recruitersclub.io",
          subject: "Here is my mailer")
  	end
end