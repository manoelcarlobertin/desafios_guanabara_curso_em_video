print "Digite a velocidade atual do carro: "
vel = gets.chomp.to_f

print "Digite a velocidade permitida: "
lim = gets.chomp.to_i

if vel > lim
  multa = (vel - lim) * 7
  puts "Você ultrapassou o limite de #{lim} km/h."
  puts "Multado! Multa de R$#{'%.2f' % multa}."
else
  puts "Dentro do limite. Boa viagem!"
end

puts "Respeite o limite! Tenha uma viagem com segurança!"