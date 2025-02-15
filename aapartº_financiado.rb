# Para exemplificar e facilitar o entendimento, vamos simular um financiamento de R$ 300.000,00,
# em 360 meses (30 anos), com uma taxa de 12% ao ano (1% ao mês), utilizando a fórmula do
# cálculo da prestação fixa (SAC ou PRICE).
require_relative 'aa_colorir_letras'
# Definição das variáveis
valor_financiado = 240_000.00 # Valor do empréstimo
taxa_juros_anual = 12.0       # Taxa de juros anual (%)
prazo_meses = 360             # Prazo do financiamento em meses

# Cálculo da taxa de juros mensal
taxa_juros_mensal = (taxa_juros_anual / 100) / 12

# Cálculo da parcela fixa (fórmula do sistema PRICE)
parcela = valor_financiado * (taxa_juros_mensal / (1 - (1 + taxa_juros_mensal) ** -prazo_meses))

# Exibir os resultados
puts "**#{colorir_letras('* Simulação de Financiamento - Sistema PRICE *')}**"
puts "Valor financiado: R$ #{'%.2f' % valor_financiado}"
puts "Prazo: #{prazo_meses} meses (#{prazo_meses / 12} anos)"
puts "Taxa de juros anual: #{taxa_juros_anual}% (#{'%.2f' % (taxa_juros_mensal * 100)}% ao mês)"
puts "Parcela fixa mensal: R$ #{'%.2f' % parcela}"
puts "*#{colorir_letras('*' * 48)}*"