puts "Digite o primeiro lado:"
l1 = gets.chomp.to_f

puts "Digite o segundo lado:"
l2 = gets.chomp.to_f

puts "Digite o terceiro lado:"
l3 = gets.chomp.to_f

# Verifica se os lados formam um triângulo. Conectivo AND todas condições serem TRUE.
if (l2 + l3 > l1) && (l1 + l3 > l2) && (l1 + l2 > l3)
  tipo = if l1 == l2 && l2 == l3
           "equilátero"
         elsif l1 == l2 || l1 == l3 || l2 == l3
           "isósceles"
         else
           "escaleno"
         end
  # Eliminação da redundância na verificação do tipo do triângulo.
  puts "Os lados podem formar um triângulo #{tipo}."
else
  puts "Os lados não podem formar um triângulo."
end
