nomes = [] # criei um array vazio
# iterei 4x colocando os nomes dentro dele
4.times do
    print "Digite um nome: "
    nomes << gets.chomp
end

puts "Nome sorteado: #{nomes.sample.capitalize}"
