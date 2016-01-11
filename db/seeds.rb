# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

organization = Organization.first_or_create(name: "thoughtbot")
organization_scope = User.where(organization: organization)
organization_scope.where(email: "person@example.com", name: "John Doe").first_or_create

(1..5).each do |teammate_incrementer|
  organization_scope.where(
    email: "person#{teammate_incrementer}@example.com",
    name: "Person #{teammate_incrementer}"
  ).first_or_create
end
