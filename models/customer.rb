require_relative('../db/sql_runner')

class Customer

    attr_reader :id 
    attr_accessor :funds, :name

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @funds = options['funds']
    end

    def save 
        sql = 'INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id'
        values = [@name, @funds]
        customer = SqlRunner.run(sql, values).first
        @id = customer['id'].to_i
    end

    def update
        sql = 'UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3'
        values = [@name, @funds, @id]
        SqlRunner.run(sql, values)
    end

    def delete
        sql = 'DELETE FROM customers WHERE id = $1'
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def tickets()
        sql = 'SELECT tickets.* FROM tickets
        INNER JOIN customers ON customers.id = tickets.customer_id
        WHERE customer_id = $1'
        values = [@id]
        customer_tickets = SqlRunner.run(sql, values)
        return Ticket.map_items(customer_tickets)
    end

    def number_of_tickets()
        return tickets.length
    end





    def films()
        sql = "SELECT films.* FROM films
                INNER JOIN tickets ON films.id = tickets.film_id
                WHERE customer_id = $1"
        values = [@id]
        customer_films = SqlRunner.run(sql, values)
        return Film.map_items(customer_films)
    end

    def self.all()
        sql = 'SELECT * FROM customers'
        customer_data = SqlRunner.run(sql)
        return customer_data.map{ |customer| Customer.new(customer)}
    end

    def self.delete_all()
        sql = 'DELETE FROM customers'
        SqlRunner.run(sql)
    end

    def self.map_items(data)
        result = data.map{|customer| Customer.new(customer)}
        return result
    end

end