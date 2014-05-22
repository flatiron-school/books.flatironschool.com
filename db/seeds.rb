# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.create(provider: "github", uid: "4651810", nickname: "den1k", admin: true, token: "f362d5cac8bb6857ed23698a2350e806770a0eb4")

Organization.create(name: "flatiron-school-students")

TAGS = ["ruby", "javascript", "css", "rails", "html", "d3", "command line", "oop", "beginner", "advanced", "intermediate"]
TAGS.each{|t|Tag.create(:label => t)}
