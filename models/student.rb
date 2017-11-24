require_relative('../db/sql_runner.rb')
require_relative('house.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :house_id

  def initialize(info)
    @first_name = info['first_name']
    @last_name = info['last_name']
    @age = info['age'].to_i
    @house_id = info['house_id'].to_i
    @id = info['id'].to_i if info['id']
  end

  def full_name
    return "#{@first_name}#{@last_name}"
  end

  def self.all
    sql = "SELECT * FROM students"
    values = []
    students = SqlRunner.run(sql, values)
    return students.map { |student| Student.new(student)}
  end

  def self.delete
    sql = "DELETE FROM students"
    values = []
    SqlRunner.run(sql, values)
  end

  def save
    sql = "INSERT INTO students (first_name, last_name, age, house_id) VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @age, @house_id]
    student_data = SqlRunner.run(sql, values)
    @id = student_data[0]['id'].to_i
  end

  def delete
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE students SET (first_name, last_name, age, house_id)=($1, $2, $3, $4) WHERE id = $5"
    values = [@first_name, @last_name, @age, @house_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    return Student.new(student.first)
  end

  def house
    sql = "SELECT * FROM houses WHERE id = $1 "
    values = [@house_id]
    houses = SqlRunner.run(sql, values)
    return House.new(houses.first)
  end



end
