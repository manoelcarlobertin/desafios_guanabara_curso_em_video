# Solicita ao usuário para digitar a altura e largura da parede
print "Digite a altura da parede em metros: "
altura = gets.chomp.to_f

print "Digite o comprimento da parede em metros: "
comprimento = gets.chomp.to_f

print "Digite número de cômodos aprox do seu apto: "
comomodos = gets.chomp.to_f

# Calcula a área da parede
area = altura * comprimento

# Considera que a tinta Suvinil Rende Mais cobre aproximadamente 50 m² por litro
rendimento_tinta = 50

# Calcula a quantidade de tinta necessária em litros
litros_tinta = (area / rendimento_tinta).ceil # Arredonda para cima, pois é melhor ter tinta suficiente

# Preço médio da tinta Suvinil Rende Mais em lojas cariocas (valor pode variar, pesquise os preços)
preco_tinta_litro = 33.00 # Exemplo: R$ 33.00 por litro (mercado livre 09/02/2025 lata de 20 litros)

# Calcula o custo total da tinta
custo_total = litros_tinta * preco_tinta_litro * comomodos

# Exibe os resultados
puts "Área da parede: #{area} m²"
puts "Quantidade de tinta necessária: #{litros_tinta} litro(s) por cada comodo do apto."
puts "Custo total da tinta: R$ #{custo_total.round(2)} para 3 cômodos do apto." # Exibe o custo com 2 casas decimais
if custo_total > 90
  puts "Sugestão: galão de 20 litros no mercado livre dia 09/02/2025."
else
  puts "Sugestão: galão de 18 litros."
end
