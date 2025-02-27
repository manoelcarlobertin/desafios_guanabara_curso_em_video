# encapsula toda a lógica de validação, e a repetição é tratada com loop.
def solicitar_genero
  loop do
    print 'Informe o gênero [M/F]: '
    genero = gets.chomp.strip.upcase

    if %w[M F].include?(genero)
      puts "\e[32mGênero [#{genero}] registrado com sucesso.\e[0m"
      return genero # sai do loop.
    else
      puts "\e[31mOpção inválida. Tente novamente...\e[0m"
    end
  end
end

# Chamada da função para teste
solicitar_genero
