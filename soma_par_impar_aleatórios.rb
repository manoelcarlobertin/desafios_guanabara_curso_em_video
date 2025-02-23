# Gerando 6 números aleatórios únicos, separando pares e ímpares e exibindo o resultado
numeros = (1..100).to_a.sample(6) # Gera 6 números * únicos * entre 1 e 100
pares, impares = numeros.partition(&:even?)

# Exibição dos resultados formatados
puts "\n🔹 Números sorteados: #{numeros.join(', ')}"
puts "\n🔹 Classificação dos números:"
puts "- Pares: #{pares.join(', ')} | Soma: #{pares.sum}"
puts "- Ímpares: #{impares.join(', ')} | Soma: #{impares.sum}"

# Gerando 6 números aleatórios, separando pares e ímpares e exibindo o resultado

numeros = Array.new(6) { rand(1..100) } # Gera 6 números aleatórios entre 1 e 100
# pares, impares = [], [] # aqui os números se REPETEM.
puts "\n Números sorteados, que podem se * reperir * : #{numeros.join(', ')}"
# numeros.each do |num|
#   case num.even?
#   when true
#     pares << num
#   else
#     impares << num
#   end
# end

# # Exibição dos resultados
# puts "\n🔹 Números gerados: #{numeros.join(', ')}"
# puts "\n🔹 Classificação dos números:"
# puts "- Pares: #{pares.join(', ')} | Soma: #{pares.sum}"
# puts "- Ímpares: #{impares.join(', ')} | Soma: #{impares.sum}"
