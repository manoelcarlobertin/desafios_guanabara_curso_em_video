puts "Digite seu nome completo:"
nome = gets.chomp
# Capitaliza cada palavra, mapeou o array e alterou cada palavra.
nomes = nome.split.map(&:capitalize) # split: Divide o nome em um array de palavras.
# map(&:capitalize): Aplica capitalize em cada palavra do array (deixa a 1ª letra maiúscula).
puts "nomes: #{nomes.join(', ')}."

primeiro = nomes[0]
ultimo = nomes[-1]

puts "Primeiro nome: #{primeiro.upcase}."
puts "Último nome: #{ultimo.upcase}."
