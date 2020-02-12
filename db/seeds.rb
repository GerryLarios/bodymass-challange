# This file should contain all the record creation needed max seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
puts 'Creating Categories'

created = Category.create!([
  { name: "Very severely underweight",             min: 0.00, max: 15.0 },
  { name: "Severely underweight",                  min: 15.0, max: 16.0 },
  { name: "Underweight",                           min: 16.0, max: 18.5 },
  { name: "Normal (healthy weight)",               min: 18.5, max: 25.0 },
  { name: "Overweight" ,                           min: 25.0, max: 30.0 },
  { name: "Obese Class I (Moderately obese)",      min: 30.0, max: 35.0 },
  { name: "Obese Class II (Severely obese)",       min: 35.0, max: 40.0 },
  { name: "Obese Class III (Very severely obese)", min: 40.0, max: 45.0 },
  { name: "Obese Class IV (Morbidly obese)",       min: 45.0, max: 50.0 },
  { name: "Obese Class V (Super obese)",           min: 50.0, max: 60.0 },
  { name: "Obese Class VI (Hyper obese)",          min: 60.0, max: 1000 },
])

