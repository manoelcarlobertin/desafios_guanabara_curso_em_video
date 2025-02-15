# Códigos ANSI para cores
VERDE = "\e[32m"; VERMELHO = "\e[31m"; RESET = "\e[0m"
def colorir_letras(palavra)
  palavra.chars.map do |letra|
    cor = [VERDE, VERMELHO].sample # Escolhe aleatoriamente entre verde e vermelho
    "#{cor}#{letra}#{RESET}"
  end.join
end
print "Qual o valor do apartamento? R$"
valor = gets.to_f
print "Qual o seu salário? R$"
salario = gets.to_f
print "Em quantos anos você pretende pagar? "
anos = gets.to_i
# Cáculos
prestacao = valor / (anos * 12)
salario_maximo = salario * 0.30
# IMpressão da Análise de Cŕedito
puts "\nPara pagar um apartamento de R$#{valor.round(2)}"
puts "em #{anos} anos, a prestação será de R$#{prestacao.round(2)}"
# Impressão com Condições
if prestacao <= salario_maximo
    puts "Empréstimo *#{colorir_letras("APROVADO")}*!"
else
    puts "Empréstimo *#{colorir_letras("NEGADO")}*! A prestação excede 30% do seu salário."
end

