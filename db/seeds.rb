# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.create([
	{ name: "Rome",
		image_url: "https://lonelyplanetimages.imgix.net/mastheads/stock-photo-roman-sunset-77415821.jpg?sharp=10&vib=20&w=1200"},

	{ name: "London",
		image_url: "https://media.timeout.com/images/100644443/image.jpg"},
		
	{ name: "Gibraltar",
  	image_url: "https://www.azamaraclubcruises.com/sites/default/files/heros/gibraltar-united-kingdom.jpg"},

  { name: "San Francisco",
  image_url: "http://www.sftravel.com/sites/sftraveldev.prod.acquia-sites.com/files/SanFrancisco_0.jpg"}
])
