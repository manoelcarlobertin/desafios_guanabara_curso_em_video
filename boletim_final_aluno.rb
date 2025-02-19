def obter_notas
  notas = []

  (1..4).each do |i|
    loop do
      print "Nota #{i} (zero até 10): "
      nota = gets.chomp

      # Verifica se a entrada é um número válido (incluindo negativos e decimais)
      if nota.match?(/\A-?\d+(\.\d{1,2})?\z/) && nota.to_f.between?(0, 10)
        notas << nota.to_f.round(2) # Converte para float e arredonda para 2 casas decimais
        break
      else
        puts "❌ NOTA INVÁLIDA! Digite um valor entre -10 e 10 com até duas casas decimais."
      end
    end
  end

  notas
end

puts "Digite as notas dos 4 trimestres para saber se você passou de ano."

# Obtendo todas as notas com validação
notas = obter_notas

# Calculando a média
media = (notas.sum / notas.size).round(2)

puts "\nCalculando..."
sleep(2) # Simula um tempo de processamento

# Exibe o resultado baseado na média calculada
puts "\n=== Resultado ==="
case media
when 7.0..Float::INFINITY
  puts "🎉 Parabéns! Sua média foi #{media} e você passou de ano!"
when 5.0...7.0
  puts "📚 Sua média foi #{media}. Você está de recuperação!"
else
  puts "❌ Sua média foi #{media}. Você está reprovado. Volte no próximo ano!"
end
