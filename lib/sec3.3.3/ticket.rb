# YYYY-MM-DD date regular expression
$date_regexp = /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/.freeze

class Ticket
  def initialize(venue)
    @venue = venue
  end
  def set_price(amount)
    @price = amount
  end
  def price
    @price
  end
  def venue
    @venue
  end
  def date=(new_date)
    if new_date.match($date_regexp)
      puts "Setting date to #{new_date}..."
      @date = new_date
    else
      puts "Please submit the date in the format 'yyyy-mm-dd'."
    end
  end
  def discount(percentage)
    @price = (price * (1 - percentage / 100.0)).to_i
  end
end


th = Ticket.new("Town Hall")
th.set_price(100)
puts "The ticket for #{th.venue} has been discounted 15% to #{th.discount(15)}."
th.date = "2013-11-12"
th.date = "13-11-12"
