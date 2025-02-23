# Coletando 6 números e classificando entre pares e ímpares
soma_pares = soma_impares = contador_pares = contador_impares = 0

(1..6).each do |c|
  print "Digite o #{c}º valor: "
  num = gets.chomp.to_i

  if num.even?
    soma_pares += num
    contador_pares += 1
  else
    soma_impares += num
    contador_impares += 1
  end
end

total_numeros = contador_pares + contador_impares

puts "\nVocê informou um total de #{total_numeros} valores:"
puts "- #{contador_pares} pares, com soma total de #{soma_pares}."
puts "- #{contador_impares} ímpares, com soma total de #{soma_impares}."
