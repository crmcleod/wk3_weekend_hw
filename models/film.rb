require_relative('../db/sql_runner')

class Film

    attr_reader :id
    attr_accessor :title, :price

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @price = options['price']
    end

    def save
        sql = 'INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id'
        values = [@title, @price]
        film = SqlRunner.run(sql, values).first
        @id = film['id'].to_i
    end

    def update
        sql = 'UPDATE films SET (title, price) = ($1, $2) where id = $3'
        values = [@title, @price, @id]
        SqlRunner.run(sql, values)
    end

    def delete
        sql = 'DELETE FROM films WHERE id = $1'
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def customers()
        sql = 'SELECT customers.* FROM customers
        INNER JOIN tickets ON customers.id = tickets.customer_id
        WHERE film_id = $1'
        values = [@id]
        film_customers = SqlRunner.run(sql, values)
        return Customer.map_items(film_customers)
    end
        
    def number_of_customers_seeing_film()
        return customers.length
    end

    def self.all()
        sql = "SELECT * FROM films"
        film_data =  SqlRunner.run(sql)
        return film_data.map {|film| Film.new(film)}
    end

    def self.delete_all()
        sql = 'DELETE FROM films'
        SqlRunner.run(sql)
    end

    def self.map_items(data)
        result = data.map{ |film| Film.new(film)}
        return result
    end
end