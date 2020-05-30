require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

    film1 = Film.new({'title' => 'Blade Trinity', 'price' => 8})
    film2 = Film.new({'title' => 'Amityville Horror', 'price' => 10})
    film3 = Film.new({'title' => 'Deadpool','price' => 12})

    film1.save()
    film2.save()
    film3.save()

    customer1 = Customer.new({'name' => 'Hugh Jackman', 'funds' => 100})
    customer2 = Customer.new({'name' => 'Jason Statham','funds' => 125})
    customer3 = Customer.new({'name' => 'Christian Bale', 'funds' => 150})

    customer1.save()
    customer2.save()
    customer3.save()

    ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
    ticket2 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer1.id})
    ticket3 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer1.id})
    ticket4 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
    ticket5 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer2.id})
    ticket6 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer3.id})
    ticket7 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer3.id})

    ticket1.save()
    ticket2.save()
    ticket3.save()
    ticket4.save()
    ticket5.save()
    ticket6.save()
    ticket7.save()

    customer1_films = customer1.films()
    customer2_films = customer2.films()
    customer3_films = customer3.films()

    customer1_tickets = customer1.tickets()
    customer1.pay_tickets()
    customer2_tickets = customer2.tickets()
    customer2.pay_tickets()
    customer3_tickets = customer3.tickets()
    customer3.pay_tickets()


    customer1_number_of_tickets = customer1.number_of_tickets()
    customer2_number_of_tickets = customer2.number_of_tickets()
    customer3_number_of_tickets = customer3.number_of_tickets()

    film1_number_of_customers = film1.number_of_customers_seeing_film()
    film2_number_of_customers = film2.number_of_customers_seeing_film()
    film3_number_of_customers = film3.number_of_customers_seeing_film()

    customer1_cost_for_customers_tickets = customer1.cost_for_customers_tickets()
    customer2_cost_for_customers_tickets = customer2.cost_for_customers_tickets()
    customer3_cost_for_customers_tickets = customer3.cost_for_customers_tickets()

binding.pry
nil