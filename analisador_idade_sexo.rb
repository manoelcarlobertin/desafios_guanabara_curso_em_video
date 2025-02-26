# **Funções reutilizáveis para entrada de dados**
# Função para capturar uma entrada numérica válida.
def obter_numero(mensagem)
  loop do
    print mensagem
    input = gets.chomp
    return input.to_i if input.match?(/^\d+$/) # Verifica se é um número inteiro válido.
    puts "❌ ERRO: Digite apenas números válidos!"
  end
end

# Função para capturar entrada de sexo válida.
def obter_sexo
  loop do
    print ">>>>>> Seu sexo [M / F]: "
    input = gets.chomp.strip.upcase
    return input if ["M", "F"].include?(input)
    puts "❌ ERRO: Tecle apenas as siglas [M / F]!"
  end
end

# Função para exibir mensagens formatadas. Formatação visual organizada.
def linha(titulo = "")
  puts "\n" + "=" * 43
  puts titulo.center(43) unless titulo.empty? # a menos que o títuto não é nil.
  puts "=" * 43
end

# Variáveis principais:
ano_atual = Time.now.year
soma_idade = 0
homem_mais_velho = { nome: "", idade: 0 }
mulheres_menos_20 = 0
pessoas = []

# Loop principal para cadastro
4.times do |i|
  linha("Cadastro da #{i + 1}ª Pessoa")

  print ">>>>>> Digite seu nome: "
  nome = gets.chomp.strip.capitalize

  idade = obter_numero(">>>>>> Digite sua idade: ")

  sexo = obter_sexo

  pessoas << { nome: nome, idade: idade, sexo: sexo }
  soma_idade += idade

  # Verifica se é o homem mais velho
  if sexo == 'M' && idade > homem_mais_velho[:idade]
    homem_mais_velho = { nome: nome, idade: idade }
  end

  # Conta quantas mulheres têm menos de 20 anos
  mulheres_menos_20 += 1 if sexo == "F" && idade < 20
end

# Cálculo da média de idade do grupo
media_idade = soma_idade / pessoas.size.to_f

# Exibição dos resultados finais
linha('RESULTADO FINAL')
puts "📌 Média de idade do grupo: #{media_idade.round(1)} anos"
if homem_mais_velho[:idade].positive?
  puts "📌 O homem mais velho é \e[31m#{homem_mais_velho[:nome]}\e[0m com #{homem_mais_velho[:idade]} anos."
else
  puts '📌 Não há homens cadastrados no grupo.'
end

if mulheres_menos_20.positive?
  puts "📌 Total de mulheres com menos de 20 anos: \e[31m#{mulheres_menos_20}\e[0m"
else
  puts '📌 Não há mulheres cadastradas no grupo.'
end

linha('FIM DO PROGRAMA')
