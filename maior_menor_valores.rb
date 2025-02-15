puts "Digite 3 números reais:"
numeros = []
3.times do |i|
  print "Número #{i + 1}: "
  numeros << gets.chomp.to_f
end
puts "\nNúmeros no Array: [#{numeros.join(', ')}]."
# Verificar números repetidos e contar quantas vezes cada um aparece
numeros_repetidos = numeros.select { |n| numeros.count(n) > 1 }.uniq

if numeros_repetidos.any?
  # Uso do .map para formatar a saída e mostrar cada número repetido junto com sua contagem.
  # Exemplo: Se repetem: 5.0 (2x), 3.2 (2x).
  repeticoes = numeros_repetidos.map { |n| "#{n} (#{numeros.count(n)}x)" }.join(', ')
  puts "\nSe repetem: #{repeticoes}."
else
  puts "\nNão há números repetidos!"
end
puts "\nMaior número: #{numeros.max}."
puts "Menor número: #{numeros.min}."
