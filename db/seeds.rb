# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Inserting categories'
Category.find_or_create_by description: 'Cerámicas y pisos'
Category.find_or_create_by description: 'Accesorios de baños y pisos'
Category.find_or_create_by description: 'Accesorios para cocina'
Category.find_or_create_by description: 'Electricidad e iluminación'
Category.find_or_create_by description: 'Accesorios de baños y pisos'
Category.find_or_create_by description: 'Pinturas y pegamentos'
Category.find_or_create_by description: 'Construcción'
Category.find_or_create_by description: 'Materiales y productos pétreos (cementos, piedrín, arena)'
Category.find_or_create_by description: 'Metales y mecánica (láminas, perlines, alambres)'
Category.find_or_create_by description: 'Equipos de construcción'
Category.find_or_create_by description: 'Maderas y carpintería'
Category.find_or_create_by description: 'Aires acondicionados y ventilación'
Category.find_or_create_by description: 'Vidrios'
Category.find_or_create_by description: 'Herramientas'
Category.find_or_create_by description: 'Jardinería y agricultura'
Category.find_or_create_by description: 'Puertas y ventanas'
Category.find_or_create_by description: 'Hogar'
Category.find_or_create_by description: 'Muebles'
Category.find_or_create_by description: 'Electrodomésticos'


