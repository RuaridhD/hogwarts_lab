require('pg')
require_relative('house.rb')
# require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :age

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @age = options["age"]
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, age) VALUES ($1, $2, $3) RETURNING id;"
    values = [@first_name, @last_name, @age]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end
