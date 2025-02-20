require 'time'

# Programador: Bertin Manoel (Convertido para Ruby e Refatorado)
# Objetivo: Calcular o aumento percentual necessário para restaurar o valor original após um desconto.

def obter_data_hora
  tempo_atual = Time.now
  meses = %w[janeiro fevereiro março abril maio junho julho agosto setembro outubro novembro dezembro]
  mes_atual = meses[tempo_atual.month - 1]

  {
    data: "#{tempo_atual.day} de #{mes_atual} de #{tempo_atual.year}",
    hora: tempo_atual.strftime("%H:%M:%S")
  }
end

def obter_valor(mensagem)
  loop do
    print mensagem
    entrada = gets.chomp.gsub(',', '.')

    # Verifica se a entrada é um número válido
    if entrada.match?(/^\d+(\.\d+)?$/)
      return entrada.to_f
    else
      puts "⚠️ Entrada inválida! Digite um * número válido * ."
    end
  end
end

def calcular_valor_com_desconto(valor_original, percentual_desconto)
  valor_original - (valor_original * (percentual_desconto / 100))
end

def calcular_percentual_reajuste(valor_original, valor_com_desconto)
  return 0 if valor_com_desconto.zero? # Evita divisão por zero

  ((valor_original - valor_com_desconto) * 100) / valor_com_desconto
end

def formatar_moeda(valor)
  "R$ #{'%.2f' % valor}".gsub('.', ',')
end

# Obtendo a data e hora atual
info_tempo = obter_data_hora

puts "=" * 80
puts "Gerador de aumento percentual p/ restaurar valor original após um desconto".center(80)
puts "Rio de Janeiro, #{info_tempo[:data]}".center(80)
puts "Hora: #{info_tempo[:hora]}".center(80)
puts "=" * 80

# Entrada de dados com validação rigorosa
valor_original = obter_valor("Digite o valor do produto (ex: 900.00): R$ ")
percentual_desconto = obter_valor("Informe só o nº da taxa de desconto (ex: 10.0): ")

# Cálculos
valor_com_desconto = calcular_valor_com_desconto(valor_original, percentual_desconto)
percentual_reajuste = calcular_percentual_reajuste(valor_original, valor_com_desconto)
valor_reajustado = valor_com_desconto + (valor_com_desconto * (percentual_reajuste / 100))

# Exibição dos resultados
puts "\n📌 O valor original do produto: #{formatar_moeda(valor_original)}"
puts "🔻 Com desconto de #{percentual_desconto.round(1)}%, o novo valor é: #{formatar_moeda(valor_com_desconto)}"
puts "📈 Para restaurar o valor original, aplique um reajuste de #{percentual_reajuste.round(1)}%"
puts "✅ Após o reajuste, o novo valor será: #{formatar_moeda(valor_reajustado)}"
