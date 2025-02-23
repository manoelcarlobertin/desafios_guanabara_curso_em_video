# Eu percebi um padrão quanto aos múltiplos de 3 ímpares:
# por ex: os 10 primeiros múltiplos de 3: 3;6;9;12;15;18;21;24;27;30
# pode-se observar que o padrão * par, impar * se repete,
# por isso achei essa a maneira mais eficiente para esse caso:

# QUERO A SOMA DE IMPARES MULTIPLOS DE 3. A partir de 3

def generate_multiples_of_3_impar(limit)
  i = 3
  multiples = []
  while i <= limit
    multiples << i
    i += 6 # Corrigido para incrementar corretamente múltiplos de 3 ímpares.
  end
  multiples
end

puts '✨' * 31
puts ''
puts "🔥 Gerando múltiplos de 3 * só os ímpares * e salvando na lista! 🔥"
puts ''
puts '✨' * 31

multiples = generate_multiples_of_3_impar(500) # Defina um limite para evitar loop infinito

puts "🎯 Múltiplos de 3 encontrados: #{multiples.join(' | ')} 🚀"

puts "A soma dos múltiplos de 3 só os impares:"

sum_multiples = multiples.reduce(:+)
puts "Soma total é: #{sum_multiples}"

puts ''
puts '✨' * 31
puts ''
puts '✅ Fim do script! ✅'
puts ''
puts '✨' * 31
