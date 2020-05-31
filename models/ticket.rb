require_relative('../db/sql_runner')
require_relative('./film')
require_relative('./screening')

class Ticket
    attr_reader :id 
    attr_accessor :customer_id, :film_id, :screening_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @customer_id = options['customer_id'].to_i
        @film_id = options['film_id'].to_i
        @screening_Id = options['screening_id'].to_i
    end

    def save
        sql = 'INSERT INTO tickets (film_id, customer_id, screening_id) VALUES ($1, $2, $3) RETURNING id'
        values = [@film_id, @customer_id, @screening_id]
        ticket = SqlRunner.run(sql, values).first
        @id = ticket['id'].to_i
    end

    def delete
        sql = 'DELETE FROM tickets WHERE id = $1'
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def update
        sql = 'UPDATE tickets SET (customer_id, film_id, screening_id) = ($1, $2, $3) WHERE id = $4'
        values = [@film_id, @customer_id, @screening_id, @id]
        SqlRunner.run(sql, values)
    end

    def self.all
        sql = 'SELECT * FROM tickets'
        ticket_info = SqlRunner.run(sql)
        return ticket_info.map{ |ticket| Ticket.new(ticket)}
    end

    def self.delete_all()
        sql = 'DELETE FROM tickets'
        SqlRunner.run(sql)
    end

    def self.map_items(data)
        result = data.map{|ticket| Ticket.new(ticket)}
        return result
    end
end