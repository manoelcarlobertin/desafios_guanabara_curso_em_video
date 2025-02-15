# Saber se a cidade digitada começão com a palavra *SAO* ou *SÃO*?
puts "Enter your city name:"
city = gets.chomp.strip.capitalize # → Remove espaços extras do início e fim da entrada.

# Normaliza para lidar com diferentes formas de escrever "São"
normalized_city = city.gsub(/^Sao/i, "São")
# gsub(/^Sao/i, "São") → Substitui "Sao" por "São"

# apenas se estiver no início (^ indica "começa com").
# O i torna a verificação case-insensitive (SÃO/São).

puts "Cidade digitada: #{city}."
puts normalized_city.include?("São") # → Verifica se "São" aparece em qualquer parte do nome.
puts normalized_city.start_with?("São")
# Isso garante que "Sao Paulo" seja tratado como "São Paulo".
