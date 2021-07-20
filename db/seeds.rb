# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

House.destroy_all
User.destroy_all
Event.destroy_all
Maintainence.destroy_all
Document.destroy_all


tamarama = House.create(title:"Tamarama Beach Unit", address:"1A Pacific Ave, Tamarama NSW 2026")
vaucluse = House.create(title:"Vaucluse Family Retreat", address:"69A Wentworth Rd, Vaucluse NSW 2030")
bronte = House.create(title:"Bronte Hamptons Apartment", address:"18A Bronte Rd, Bronte NSW 2024")
pointpiper = House.create(title:"Point Piper Boat House", address:"42A Wolseley Road, Point Piper NSW 2027")

tamarama.users.create(name:"Gemma Elsom", email:"gemmaelsom@gemma.com", password:"1234", phone_number:"0411 111 111", role_name:"tenant")
tamarama.users.create(name:"Property Manager 1", email:"propertymanager1@realestate.com", password:"1234", phone_number:"0455 555 555", role_name:"property_manager")

vaucluse.users.create(name:"Sara Fishburn", email:"sarafishburn@sara.com", password:"abcd", phone_number:"0422 222 222", role_name:"tenant")
vaucluse.users.create(name:"Property Manager 2", email:"propertymanager2@realestate.com", password:"abcd", phone_number:"0466 666 666", role_name:"property_manager")

bronte.users.create(name:"Rafael Mello", email:"rafaelmello@rafael.com", password:"5678", phone_number:"0433 333 333", role_name:"tenant")
bronte.users.create(name:"Property Manager 3", email:"propertymanager3@realestate.com", password:"5678", phone_number:"0477 777 777", role_name:"property_manager")

pointpiper.users.create(name:"Ben Elsom", email:"benelsom@ben.com", password:"efgh", phone_number:"0444 444 444", role_name:"tenant")
pointpiper.users.create(name:"Property Manager 4", email:"propertymanager4@realestate.com", password:"efgh", phone_number:"0488 888 888", role_name:"property_manager")
