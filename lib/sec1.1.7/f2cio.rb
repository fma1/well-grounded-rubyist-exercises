puts "Reading Celsius temperature value from data file..."
celsius_temp = File.read("temp.dat").to_i
fahrenheit_temp = (celsius_temp * 9 / 5) + 32
puts "Saving result to output file 'temp.out'"
fh = File.new("temp.out", "w")
fh.puts fahrenheit_temp
fh.close