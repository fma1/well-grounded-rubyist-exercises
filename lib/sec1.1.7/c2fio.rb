puts "Reading Celsius temperature value from data file..."
fahrenheit_temp = File.read("temp.dat").to_i
celsius_temp = (fahrenheit_temp - 32) * 5 / 9
puts "Saving result to output file 'temp.out'"
fh = File.new("temp.out", "w")
fh.puts celsius_temp
fh.close