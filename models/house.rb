require('pg')
require_relative('student.rb')
require_relative('../db/sql_runner.rb')

class House

  attr_reader :id
  attr_accessor :house_name

  def initialize(options)
    @id = options["id"].to_i
    @house_name = options["house_name"]
  end

  def save()
    sql = "INSERT INTO houses (house_name) VALUES ($1) RETURNING id;"
    values = [@house_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

end
