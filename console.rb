require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')
require_relative('models/screening')

require('pry-byebug')

Screening.delete_all()
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
    customer4 = Customer.new({'name' => 'Bruce Willis', 'funds' => 30})
    customer5 = Customer.new({'name' => 'Ryan Reynolds', 'funds' => 100})

    customer1.save()
    customer2.save()
    customer3.save()
    customer4.save()
    customer5.save()

    screening1 = Screening.new({'film_id' => film1.id, 'show_time' => "20:00" })
    screening2 = Screening.new({'film_id' => film1.id, 'show_time' => "22:00" })
    screening3 = Screening.new({'film_id' => film1.id, 'show_time' => "00:00" })
    screening4 = Screening.new({'film_id' => film2.id, 'show_time' => "13:00" })
    screening5 = Screening.new({'film_id' => film2.id, 'show_time' => "15:30" })
    screening6 = Screening.new({'film_id' => film2.id, 'show_time' => "18:00" })
    screening7 = Screening.new({'film_id' => film3.id, 'show_time' => "11:00" })
    screening8 = Screening.new({'film_id' => film3.id, 'show_time' => "13:00" })
    screening9 = Screening.new({'film_id' => film3.id, 'show_time' => "19:00" })

    screening1.save()
    screening2.save()
    screening3.save()
    screening4.save()
    screening5.save()
    screening6.save()
    screening7.save()
    screening8.save()
    screening9.save()

    all_show_times = Screening.show_times()

    ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id, 'screening_id' => screening1.id})
    ticket2 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer1.id, 'screening_id' => screening4.id})
    ticket3 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer1.id, 'screening_id' => screening7.id})
    ticket4 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id, 'screening_id' => screening5.id})
    ticket5 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer2.id, 'screening_id' => screening8.id})
    ticket6 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer3.id, 'screening_id' => screening2.id})
    ticket7 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer4.id, 'screening_id' => screening5.id})
    ticket8 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer5.id, 'screening_id' => screening3.id})
    ticket9 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer5.id, 'screening_id' => screening8.id})
    ticket10 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer3.id, 'screening_id' => screening6.id})
    ticket11 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer2.id, 'screening_id' => screening1.id})


    ticket1.save()
    ticket2.save()
    ticket3.save()
    ticket4.save()
    ticket5.save()
    ticket6.save()
    ticket7.save()
    ticket8.save()
    ticket9.save()
    ticket10.save()
    ticket11.save()

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