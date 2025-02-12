print "Digite a temperatura em graus Celsius: "
input = gets.chomp

# Converte o valor para float e calcula a temperatura em Fahrenheit
celsius = input.to_f
fahrenheit = celsius * 9.0 / 5.0 + 32.0

puts "#{celsius} graus Celsius equivalem a #{fahrenheit} graus Fahrenheit."
