print "Digite o preço do produto R$ "
preco_inicial = gets.chomp.to_f # apanha o preço do produto
print "Digite o desconto percentual "
desconto_percentual = gets.chomp.to_f # apanha o desconto

valor_desconto = preco_inicial * (desconto_percentual / 100.0)
preco_final = preco_inicial - valor_desconto

puts "Total: R$ #{'%.2f' % preco_final} à vista com desconto."
