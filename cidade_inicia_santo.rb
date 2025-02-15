print "Digite o nome da cidade: "
cidade = gets.chomp.upcase

if cidade.start_with?("SANTO")
  puts "Sim, a cidade #{cidade} começa com SANTO."
else
  puts "Não, a cidade #{cidade} não começa com SANTO."
end
