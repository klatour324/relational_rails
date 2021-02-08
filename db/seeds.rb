# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bookstore.destroy_all
Location.destroy_all

philly = Location.create! ({name: "Philadelphia",population: 1500000,urban: true})
sleep(2)
nyc = Location.create! ({name: "New York City",population: 8400000,urban: true})
sleep(2)
mtown = Location.create! ({name: "Middletown",population: 65000,urban: false})

philly.bookstores.create! ({name: "Joseph Fox BookStop",inventory: 444,open: false})
philly.bookstores.create! ({name: "Harriett's Bookshop",inventory: 3000,open: true})

nyc.bookstores.create! ({name: "Strand Book Store",inventory: 600,open: false})
nyc.bookstores.create! ({name: "Rizzoli Bookstore",inventory: 470,open: true})

mtown.bookstores.create! ({name: "Barnes and Nobles",inventory: 13000,open: true})
mtown.bookstores.create! ({name: "River Road Books",inventory: 0,open: false})

Book.destroy_all
Library.destroy_all

chicago_public_library = Library.create!({name: "Chicago Public Library", public: true, years_opened: 150})
newberry_library = Library.create!({name: "Newberry Library", public: false, years_opened: 75})
harold_washington_library = Library.create!({name: "Harold Washington Library", public: true, years_opened: 90})

chicago_public_library.books.create!({title: "A Mind for Numbers", checked_out: false, pages: 267})
chicago_public_library.books.create!({title: "So You Want to Talk about Race?", checked_out: true, pages: 317})

newberry_library.books.create!({title: "Dictionary of Midwestern Literature", checked_out: false, pages: 695})
newberry_library.books.create!({title: "Weather and Society: Toward Integrated Approaches", checked_out: false, pages: 179})

harold_washington_library.books.create!({title: "11/22/63", checked_out: true, pages: 989})
harold_washington_library.books.create!({title: "The Handmaid's Tale", checked_out: false, pages: 345})
