# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Candidate.create!(first_name: "Paul", last_name: "Riviere", email: "paul@mail.com", salary: 45, nl_date: "02/03/1990", hired: false)
Firm.create!(name: "Cheerz", recruiter: true)
