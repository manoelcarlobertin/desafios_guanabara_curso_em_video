ano_atual = Time.now.year
maiores, menores = [], []

(1..4).each do |i|
  nascimento = nil # não posso iniciar um ano, -> a não ser com * nil *.

  loop do
    print "\033[1mDigite a data de nascimento da #{i}ª pessoa: \033[m"
    # variável * input * criada afim de validar entrada do ano nascimento.
    input = gets.chomp #  → * input * já é convertido para Integer.
    # Corrige * next * mal posicionado (substituído por * break * quando a entrada é válida).
    if input.match?(/^\d+$/) # Regex que entrada * só * possua número.
      nascimento = input.to_i
      break if nascimento.between?(1900, ano_atual) # Sai do loop se o ano for válido.
    end
    puts "❌ Entrada inválida! Digite um ano entre 1900 e \033[1;35m#{ano_atual}\033[m."
  end
  idade = ano_atual - nascimento # cálculo da idade.
  maiores << nascimento if idade >= 18 # Essa abordagem mantém a legibilidade e evita um else
  menores << nascimento if idade < 18 # desnecessário melhoram a clareza e eficiência do código. 🚀
end

maiores.sort! # sort!: * Ordena * as listas diretamente.
menores.sort! # Uso de size: Conta os elementos dos arrays sem precisar de variáveis extras.
puts "\n📌 Temos #{maiores.size} pessoas **maiores** de idade, que nasceram em: #{maiores.join(', ')}"
puts "📌 Temos #{menores.size} pessoas **menores** de idade, que nasceram em: #{menores.join(', ')}"
