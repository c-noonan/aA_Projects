# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all
Band.create(name: 'Guns and Roses')
Band.create(name: 'Aerosmith')
Band.create(name: 'Tom Petty and the Heartbreakers')
Band.create(name: 'Eagles')
Band.create(name: 'Backstreet Boys')
Band.create(name: 'N\'Sync')
Band.create(name: 'Boys II Men')
Band.create(name: 'Nirvana')
Band.create(name: 'AC/DC')
Band.create(name: 'The Beatles')

User.destroy_all
User.create(email: 'alex@gmail.com', password: 'secret1')
User.create(email: 'katie@gmail.com', password: 'secret2')
User.create(email: 'cliff@gmail.com', password: 'secret3')
User.create(email: 'joe@gmail.com', password: 'secret4')
User.create(email: 'nathan@gmail.com', password: 'secret5')
