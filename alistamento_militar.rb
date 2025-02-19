require 'date'

def alistamento
  puts "Você deve se alistar?"

  print "Qual é o seu gênero? "
  genero = gets.chomp.downcase

  case genero # Usando case para verificar o gênero, evitando múltiplos if.
  when "feminino", "mulher"
    puts "Você não é obrigada a se alistar no exército."

    print "Mesmo assim, deseja se alistar? (Sim/Não): "
    deseja = gets.chomp.downcase

    if deseja == "sim"
      puts "Ok, então continue preenchendo o formulário."
    else
      puts "Mesmo assim, preencha o formulário caso mude de ideia."
    end

  when "masculino", "homem"
    puts "O seu alistamento é obrigatório."
    puts "Continue preenchendo o formulário."

  else
    puts "Gênero inválido. Tente novamente."
    return # para interromper o código no caso de gênero inválido.
  end

  print "Em que ano você nasceu? "
  ano_nascimento = gets.chomp.to_i

  ano_atual = Date.today.year
  idade = ano_atual - ano_nascimento
  ano_alistamento = ano_nascimento + 18
  anos_faltam = 18 - idade
  anos_atraso = idade - 18
  # Refatorando a lógica de tempo, tornando o código mais claro.
  puts "\n=== Status do Alistamento ==="
  if idade < 18
    puts "Ainda não é hora de se alistar. Você tem #{idade} anos."
    puts "Seu alistamento será em #{ano_alistamento}."
  elsif idade == 18
    puts "Já está na hora de se alistar no exército!"
  elsif idade.between?(19, 21)
    puts "Já se passou #{anos_atraso} #{anos_atraso == 1 ? 'ano' : 'anos'} desde seu alistamento em #{ano_alistamento}."
    puts "Se não se alistou ainda, corra!"
  else
    puts "Já se passaram #{anos_atraso} anos desde o seu alistamento em #{ano_alistamento}."
    puts "Se você ainda não se alistou, o que está esperando?"
  end
end

alistamento
