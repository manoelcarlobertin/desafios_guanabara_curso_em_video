print "Digite seu nome completo: "
nome = gets.chomp

puts "Seu nome em maiúsculas é #{nome.upcase}"
puts "Seu nome em minúsculas é #{nome.downcase}"

# Quantas letras ao todo (sem considerar espaços).
puts "Seu nome tem #{nome.gsub(' ', '').length} letras"
puts "Seu primeiro nome tem #{nome.split[0].length} letras"

puts "Total de letras (sem espaços): #{nome.delete(' ').length}"
