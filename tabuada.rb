# Solicita ao usuário para digitar um número
print "Digite um número para ver sua tabuada: "

# Lê o número digitado pelo usuário e converte para inteiro
numero = gets.chomp.to_i

# Imprime a tabuada do número de 1 a 10
puts "Tabuada do #{numero}:"

# Loop de 1 a 10 para calcular e imprimir a tabuada
(1..10).each do |i|
  resultado = numero * i
  puts "#{numero} x #{i} = #{resultado}"
end
