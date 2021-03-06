require_relative('../db/sql_runner')

class Screening

    attr_reader :id
    attr_accessor :film_id, :show_time
    
    def initialize(options)
        @id = options['id'].to_i if options['id']
        @film_id = options['film_id'].to_i
        @show_time = options['show_time']
    end

    def save
        sql = 'INSERT INTO screenings (film_id, show_time) VALUES ($1, $2) RETURNING id'
        values = [@film_id, @show_time]
        screening = SqlRunner.run(sql, values).first
        @id = screening['id'].to_i
    end

    def self.tickets()
        sql = 'SELECT screenings.show_time, screenings.id as screening_id, tickets.film_id, tickets.customer_id from screenings
        INNER JOIN tickets ON
        screenings.id = tickets.screening_id;'
        all_tickets = SqlRunner.run(sql)
        return all_tickets.map{|ticket| ticket}
    end
    

    def self.total_tickets_sold()
        return tickets.length
    end
        

    def self.show_times
        sql = 'SELECT films.title, screenings.show_time FROM films
        INNER JOIN screenings ON
        films.id = screenings.film_id'
        screening_times = SqlRunner.run(sql)
        return screening_times.map{|time| time}
    end

    def delete
        sql = 'DELETE FROM screenings WHERE id = $1'
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def update
        sql = 'UPDATE screenings SET (film_id, show_time) = ($1, $2) WHERE id = $3'
        values = [@film_id, @show_time, @id]
        SqlRunner.run(sql, values)
    end

    def self.all
        sql = 'SELECT * FROM screenings'
        screening_info = SqlRunner.run(sql)
        return screening_info.map{ |screening| Screening.new(screening)}
    end

    def self.delete_all()
        sql = 'DELETE FROM screenings'
        SqlRunner.run(sql)
    end

    def self.map_items(data)
        result = data.map{|screening| Screening.new(screening)}
        return result
    end
end
