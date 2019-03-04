class HomeController < ApplicationController
  def index
  	@jobs = SearchJobs.new(@firms).perform
  end


  def show
  	@jobs = SearchJobs.new(@firms).perform #ici, je démarre mon scraper

  	ex_json = File.read('public/temp.json') #je lis l'ancien json du scrap précédent
	@ex_hash = JSON.parse(ex_json) # je parse le fichier pour utiliser les anciennes données

	File.open("public/temp.json","w") do |f|  # j'ouvre et stocke les nouvelles données
		 f.write(@jobs.to_json)
	end

	overlapping_elements = @jobs.to_a & @ex_hash.to_a
	@exc1 = @jobs.to_a - overlapping_elements #array modifié contenant un nouveau job
	@exc2 = @ex_hash.to_a - overlapping_elements

  	end
end
