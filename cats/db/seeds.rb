# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


c1 = Cat.create(name: 'Nikki', birth_date: '19910226', color: 'yellow', sex: 'F', description: 'I am Nikki and I meow!')
c2 = Cat.create(name: 'Josh', birth_date: '19931120', color: 'brown', sex: 'M', description: 'I am Josh and I bark!')

req1 = CatRentalRequest.create(cat_id: c1.id, start_date: '20181113', end_date: '20181115', status: 'PENDING')
req2 = CatRentalRequest.create(cat_id: c2.id, start_date: '20181110', end_date: '20181113', status: 'PENDING')
