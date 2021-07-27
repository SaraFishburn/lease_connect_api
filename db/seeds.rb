# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Maintenance.destroy_all
User.destroy_all
Event.destroy_all
Document.destroy_all
House.destroy_all


tamarama = House.create(
    title:"Tamarama Beach Unit", 
    address:"1A Pacific Ave, Tamarama NSW 2026", 
    image_url:"https://res.cloudinary.com/rafaelmellocloud/image/upload/v1627102938/4_yjlenm.jpg"
)

vaucluse = House.create(
    title:"Vaucluse Family Retreat", 
    address:"69A Wentworth Rd, Vaucluse NSW 2030", 
    image_url:"https://res.cloudinary.com/rafaelmellocloud/image/upload/v1627102938/1_ot31b0.jpg"
)

bronte = House.create(
    title:"Bronte Hamptons Apartment", 
    address:"18A Bronte Rd, Bronte NSW 2024", 
    image_url:"https://res.cloudinary.com/rafaelmellocloud/image/upload/v1627102938/3_yml2ow.jpg"
)

pointpiper = House.create(
    title:"Point Piper Boat House", 
    address:"42A Wolseley Road, Point Piper NSW 2027", 
    image_url:"https://res.cloudinary.com/rafaelmellocloud/image/upload/v1627102938/2_jy9n61.jpg"
)

tamarama.tenants.create(
    name:"Gemma Elsom", 
    email:"gemmaelsom@gemma.com", 
    password:"1234", 
    phone_number:"0411 111 111", 
    role_name:"tenant"
)

tamarama.tenants.create(
    name:"Property Manager 1", 
    email:"propertymanager1@realestate.com", 
    password:"1234", 
    phone_number:"0455 555 555", 
    role_name:"property_manager"
)

vaucluse.tenants.create(
    name:"Sara Fishburn", 
    email:"sarafishburn@sara.com", 
    password:"abcd", 
    phone_number:"0422 222 222", 
    role_name:"tenant"
)

vaucluse.tenants.create(
    name:"Property Manager 2", 
    email:"propertymanager2@realestate.com", 
    password:"abcd", 
    phone_number:"0466 666 666", 
    role_name:"property_manager"
)

bronte.tenants.create(
    name:"Rafael Mello", 
    email:"rafaelmello@rafael.com", 
    password:"5678", 
    phone_number:"0433 333 333", 
    role_name:"tenant"
)

bronte.tenants.create(
    name:"Property Manager 3", 
    email:"propertymanager3@realestate.com", 
    password:"5678", 
    phone_number:"0477 777 777", 
    role_name:"property_manager"
)

pointpiper.tenants.create(
    name:"Ben Elsom", 
    email:"benelsom@ben.com", 
    password:"efgh", 
    phone_number:"0444 444 444", 
    role_name:"tenant"
)

pointpiper.tenants.create(
    name:"Property Manager 4", 
    email:"propertymanager4@realestate.com", 
    password:"efgh", 
    phone_number:"0488 888 888", 
    role_name:"property_manager"
)

Event.create(event_type: 'fuzz', datetime: Time.now)