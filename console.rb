require_relative('models/student.rb')
require_relative('models/house.rb')
require_relative('./db/sql_runner.rb')
require('pry-byebug')

# House.delete_all()
# Student.delete_all()

student1 = Student.new(
  {
    "first_name" => "Harry",
    "last_name" => "Potter",
    "age" => 16
    # "house_id" => house1.id
    }
)

student1.save()

house1 = House.new(
  {
    "house_name" => "Gryffindor"
  }
)

house1.save()


binding.pry
nil
