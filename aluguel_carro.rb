print "Informe a quantidade de dias alugados: "
dias = gets.to_i

print "Informe a quantidade de quilômetros rodados: "
km = gets.to_f

total = (dias * 60) + (km * 0.15)

puts "Total a pagar: R$#{'%.2f' % total}"
