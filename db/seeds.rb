require('pry-byebug')
require('pp')
require_relative('../models/house.rb')
require_relative('../models/student.rb')


house_fire = House.new({"name" => "Fire", "logo" => "url_1"})
house_earth = House.new({"name" => "Earth", "logo" => "url_2"})
house_air = House.new({"name" => "Air", "logo" => "url_3"})
house_water = House.new({"name" => "Water", "logo" => "url_4"})

house_fire.save
house_earth.save
house_air.save
house_water.save

student_1 = Student.new({
  "first_name" => "Walter",
  "last_name" => "White",
  "house_id" => house_fire.id,
  "age" => 15
})

student_2 = Student.new({
  "first_name" => "Jesse",
  "last_name" => "Pinkman",
  "house_id" => house_air.id,
  "age" => 16
})

student_1.save
student_2.save


binding.pry
nil
