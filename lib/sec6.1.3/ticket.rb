class Ticket
  attr_accessor :name, :venue, :date
  def initialize(name, venue, date)
    self.name = name
    self.venue = venue
    self.date = date
  end
  def ===(other_ticket)
    self.date == other_ticket.date
  end
end

class TicketComparer
  def self.compare(*tickets)
    ticket1 = tickets.first
    rest_tickets = tickets.drop(1)
    first_match = rest_tickets.detect { |ticket2| ticket1 === ticket2 }
    puts "Same date as #{first_match.name}!"
  end
end

ticket1 = Ticket.new("ticket1", "Town Hall", "07/08/18")
ticket2 = Ticket.new("ticket2", "Conference Center", "07/08/18")
ticket3 = Ticket.new("ticket3", "Town Hall", "08/09/18")
puts "ticket1 is for an event on: #{ticket1.date}."
case ticket1
when ticket2
  puts "Same date as ticket2!"
when ticket3
  puts "Same date as ticket3!"
else
  puts "No match."
end

TicketComparer.compare(ticket1, ticket2, ticket3)