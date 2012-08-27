# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bubble::User.where(:login => "system").first_or_create! do |u|
  u.password = u.password_confirmation = "123456"
  u.is_superadmin = true
end
