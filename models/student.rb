require('pg')
require_relative('house.rb')
require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :age

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @age = options["age"]
    @house_id = options["house_id"].to_i
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def age
    return (@age)
  end

  def house()
    return (@house_id).to_s
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, age) VALUES ($1, $2, $3) RETURNING id;"
    values = [@first_name, @last_name, @age]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run(sql)
    return students.map{|student| self.new(student)}
  end

  def self.find(id)
   sql = "SELECT * FROM students WHERE id = $1;"
   values = [id]
   students = SqlRunner.run(sql, values)
   student_hash = students[0]
   return Student.new(student_hash)
  end

end
