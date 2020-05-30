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



binding.pry
nil