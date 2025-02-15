print 'Digite seu nome completo: '
nome = gets.chomp.upcase
if nome.include?('SILVA')
  puts "Seu nome #{nome} tem Silva? *Sim.*"
  nome_sem_silva = nome.gsub('SILVA', '')
  puts "O seu nome sem Silva é #{nome_sem_silva}..."
else
  puts "Seu nome #{nome} tem *Silva?* Não."
end
