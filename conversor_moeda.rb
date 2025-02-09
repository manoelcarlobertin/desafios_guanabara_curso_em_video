# desafio do gustavo guanabara #10
print "Digite um valor em reais: R% "
valor_reais = gets.chomp.to_f

# Taxas de conversão aproximadas (09/02/2025)
taxa_dolar = 0.17       # 1 Real ≈ 0.17 BRL/USD
taxa_euro = 0.15        # 1 Real ≈ 0.15 Euros BRL/EUR
taxa_peso = 30.0        # 1 Real ≈ 30 Pesos Argentinos BRL/ARS

dolar = valor_reais * taxa_dolar
euro = valor_reais * taxa_euro
peso = valor_reais * taxa_peso

puts "\nValor em Dólar Americano: $#{'%.2f' % dolar}"
puts "Valor em Euro: €#{'%.2f' % euro}"
puts "Valor em Pesos Argentinos: ARS #{'%.2f' % peso}"
