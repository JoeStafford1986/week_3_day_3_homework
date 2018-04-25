require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists(name) VALUES($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  # def self.all()
  #   sql = "SELECT * FROM customers"
  #   customers = SqlRunner.run(sql)
  #   customers_array = customers.map{ |customer| Customer.new(customer) }
  #   return customers_array
  # end
end
