class Pagamento
  def initialize
    @valor = obter_valor("Digite o valor do produto: R$ ")
    exibir_opcoes
    @forma_pagamento = obter_valor("Digite a forma de pagamento: ").to_i
    processar_pagamento
  end

  private

  def obter_valor(mensagem)
    loop do
      print mensagem
      entrada = gets.chomp.gsub(',', '.')

      return entrada.to_f if entrada.match?(/^\d+(\.\d+)?$/) && entrada.to_f.positive?

      puts "⚠️ Entrada inválida! Digite um número válido e positivo."
    end
  end

  def exibir_opcoes
    puts "\nAgora, escolha uma das formas de pagamento abaixo:"
    puts "1. À vista, dinheiro ou pix: 10% de desconto"
    puts "2. À vista, no cartão: 5% de desconto"
    puts "3. Em até 2x no cartão: preço normal"
    puts "4. Em 3x ou mais no cartão: 20% de juros"
  end

  def processar_pagamento
    puts "\n🛒 Processando sua compra..."
    sleep(2)

    case @forma_pagamento
    when 1
      total = @valor * 0.90
      puts "✅ Você escolheu * dinheiro ou pix *. Total a ser pago: #{formatar_moeda(total)} com desconto."
    when 2
      total = @valor * 0.95
      puts "✅ Você escolheu * À vista, no cartão *. Total a ser pago: #{formatar_moeda(total)} com desconto."
    when 3
      puts "✅ Você escolheu * Em até 2x no cartão *. Total a ser pago: #{formatar_moeda(@valor)} == 2 parcelas de #{formatar_moeda((@valor)/2)}."
    when 4
      processar_pagamento_parcelado
    else
      puts "❌ Opção inválida! Tente novamente."
      processar_pagamento
    end

    puts "🛍️ Obrigado pela compra! Tenha um bom dia! ☀️"
  end

  def processar_pagamento_parcelado
    qtd_parcelas = obter_valor("Número de parcelas: ").to_i

    if qtd_parcelas < 3
      puts "❌ Nesta forma de pagamento, o mínimo são 3 parcelas!"
      processar_pagamento_parcelado
    else
      total_com_juros = @valor * 1.20
      parcela = total_com_juros / qtd_parcelas
      puts "💳 Sua compra será parcelada em #{qtd_parcelas}x de #{formatar_moeda(parcela)} com 20% de juros."
      puts "💰 O total a pagar será #{formatar_moeda(total_com_juros)}."
    end
  end

  def formatar_moeda(valor)
    "R$ #{'%.2f' % valor}".gsub('.', ',')
  end
end

# Executa o programa
Pagamento.new
