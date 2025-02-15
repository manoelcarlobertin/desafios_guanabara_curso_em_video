print "Digita a distância(km) aprox. das cidades: "
vgm = gets.chomp.to_f

if vgm <= 200
  prc = vgm * 0.5
else
  prc = vgm * 0.45
end
puts "Preço da passagem: R$#{prc.round(2)}."