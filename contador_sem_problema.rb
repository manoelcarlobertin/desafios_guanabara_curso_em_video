# Constantes para valores padrão
PASSO_PADRAO_CRESCENTE = 1
PASSO_PADRAO_DECRESCENTE = -1

# Função para validar entradas
def validar_entrada(mensagem)
  loop do
    print mensagem
    entrada = gets.chomp
    begin
      return Integer(entrada) # Converte a entrada para inteiro
    rescue ArgumentError
      puts "Erro: Entrada inválida. Digite um número inteiro."
    end
  end
end

# Função para ajustar o passo conforme a direção da contagem
def ajustar_passo(inicio, fim, passo)
  if inicio == fim
    puts 'Início e fim são iguais:'
    return
  elsif inicio < fim
    if passo > 0
      passo # Passo já está na direção correta
    else
      passo_ajustado = passo.abs
      puts "Passo positivo necessário para contagem crescente. Ajustando passo para #{passo_ajustado}."
      passo_ajustado
    end
  else
    if passo < 0
      passo # Passo já está na direção correta
    else
      passo_ajustado = -passo.abs
      puts "Passo negativo necessário para contagem decrescente. Ajustando passo para #{passo_ajustado}."
      passo_ajustado
    end
  end
end

# Função para exibir a contagem
def exibir_contagem(inicio, fim, passo)
  if passo == 0
    puts "Erro: Passo não pode ser zero!"
    return
  end

  # Verifica se o passo é maior que a diferença entre início e fim
  if (inicio < fim && passo > (fim - inicio)) || (inicio > fim && passo < (inicio - fim))
    puts "O passo é maior que a diferença entre início e fim. A contagem parou no primeiro valor."
  end

  if inicio == fim
    # Se início e fim são iguais, exibe apenas o valor
    puts inicio
    return
  end

  inicio.step(fim, passo) do |i|
    puts i
    sleep(0.5) # Adiciona um pequeno delay para melhor visualização
  end
end

# Função principal do contador
def contador(inicio, fim, passo)
  passo_ajustado = ajustar_passo(inicio, fim, passo)
  exibir_contagem(inicio, fim, passo_ajustado)
end

# Exemplo de uso
def main
  puts "==== Contagem Personalizada ===="

  # Solicita e valida as entradas
  inicio = validar_entrada("Digite o início: ")
  fim = validar_entrada("Digite o fim: ")

  loop do
    passo = validar_entrada("Digite o passo: ")
    if passo != 0
      puts "\nSua contagem personalizada:"
      contador(inicio, fim, passo)
      break
    else
      puts "Erro: Passo não pode ser zero. Tente novamente."
    end
  end

  puts 'Game Over!'
end

# Executa o programa
main
