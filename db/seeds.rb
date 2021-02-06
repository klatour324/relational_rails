# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
Bookstore.destroy_all

philly = Location.create! ({name: "Philadelphia",population: 1500000,urban: true})
nyc = Location.create! ({name: "New York City",population: 8400000,urban: true})
mtown = Location.create! ({name: "Middletown",population: 65000,urban: false})

philly.bookstores.create! ({name: "Joseph Fox BookStop",inventory: 444,open: false})
philly.bookstores.create! ({name: "Harriett's Bookshop",inventory: 3000,open: true})

nyc.bookstores.create! ({name: "Strand Book Store",inventory: 600,open: true})
nyc.bookstores.create! ({name: "Rizzoli Bookstore",inventory: 470,open: true})

mtown.bookstores.create! ({name: "Barnes and Nobles",inventory: 13000,open: true})
mtown.bookstores.create! ({name: "River Road Books",inventory: 0,open: false})
