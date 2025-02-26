pesos = [] # Array vazio para armazenar os pesos.

(1..5).each do |i|
  peso = nil
  loop do # Uso de loop do para garantir entrada válida.
    print "Digite o peso da #{i}ª pessoa 🚀(entre 39 e 250 kg)🔥: "
    input = gets.chomp

    # Verifica se o input é numérico e está dentro do intervalo permitido.
    if input.match?(/^\d+(\.\d+)?$/) && (39..250).include?(input.to_f) # Regex inteiros e decimais.
      peso = input.to_f
      break # Sai do loop se a entrada for válida.
    else
      puts '❌ Entrada inválida! Digite um número entre 39 e 250.'
    end
  end
  pesos << peso # Adiciona peso validado ao array
end

puts "\n📌 O maior peso registrado foi: #{pesos.max} kg"
puts "📌 O menor peso registrado foi: #{pesos.min} kg"
