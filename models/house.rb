require_relative('../db/sql_runner.rb')

class House

  attr_reader :id
  attr_accessor :name, :logo

  def initialize(info)
    @name = info['name']
    @logo = info['logo']
    @id = info['id'].to_i if info['id']
  end

  def self.all
    sql = "SELECT * FROM houses"
    values = []
    houses = SqlRunner.run(sql, values)
    return houses.map { |house| House.new(house)}
  end

  def save
    sql = "INSERT INTO houses (name,logo) VALUES ($1, $2) RETURNING *"
    values = [@name, @logo]
    house_data = SqlRunner.run(sql, values)
    @id = house_data[0]['id'].to_i
  end

  def update
    sql = "UPDATE houses SET (name, logo)=($1, $2) WHERE id = $3"
    values = [@name, @logo, @id]
    SqlRunner.run(sql, values)
  end

  def self.find
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@id]
    house = SqlRunner.run(sql, values).first
    return House.new(house)
  end


end
