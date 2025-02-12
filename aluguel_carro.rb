print "Informe a quantidade de dias alugados: "
dias = gets.to_i
PRECO_DIA = 60

print "Informe a quantidade de quilômetros rodados: "
km = gets.to_f
PRECO_KM = 0.15

total = (dias * PRECO_DIA) + (km * PRECO_KM)

puts "Total a pagar: R$#{'%.2f' % total}"
