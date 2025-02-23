class Cinema
  def initialize
    @assentos = Array.new(10) { Array.new(10, "O") }
    @preco = 20.00
    @sessoes = ["14:00", "16:30", "19:00", "21:30"]
  end

  def mostrar_assentos
    puts "\nMapa de Assentos (O = livre, X = ocupado)"
    puts "   1 2 3 4 5 6 7 8 9 10"
    @assentos.each_with_index do |linha, i|
      print "#{(65 + i).chr} " # o número * 65 * está relacionado ao valor ASCII da letra 'A'.
      linha.each { |assento| print " #{assento}" }
      puts
    end
  end

  def reservar_assento(fila, coluna)
    if @assentos[fila][coluna - 1] == "O"
      @assentos[fila][coluna - 1] = "X"
      return true
    end
    false
  end

  def mostrar_sessoes
    puts "\nSessões disponíveis:"
    @sessoes.each_with_index { |sessao, i| puts "#{i + 1}. #{sessao}" }
  end

  def comprar_ingresso
    loop do
      mostrar_sessoes
      print "\nEscolha uma sessão (1-4): "
      sessao = gets.chomp.to_i - 1

      break unless sessao < 0 || sessao >= @sessoes.length
      puts "Sessão inválida!"
    end

    mostrar_assentos

    loop do
      print "\nEscolha uma fileira (A-J): "
      fila = gets.chomp.upcase.ord - 65 # O 65 é usado para transformar letras (A-J) em índices numéricos (0-9),
      print "Escolha uma coluna (1-10): " # tornando mais fácil manipular a posição escolhida dentro de uma matriz
      coluna = gets.chomp.to_i # ou array representando os assentos. 🚀

      if fila.between?(0, 9) && coluna.between?(1, 10)
        if reservar_assento(fila, coluna)
          puts "\nReserva realizada com sucesso!"
          puts "Valor do ingresso: R$ #{@preco}"
          break
        else
          puts "Assento já ocupado!"
        end
      else
        puts "Posição inválida!"
      end
    end
  end
end

# Iniciar o programa
cinema = Cinema.new
puts "Bem-vindo ao Cinema!"

loop do
  puts "\n1. Comprar ingresso"
  puts "2. Ver mapa de assentos"
  puts "3. Sair"
  print "Escolha uma opção: "

  opcao = gets.chomp.to_i

  case opcao
  when 1
    cinema.comprar_ingresso
  when 2
    cinema.mostrar_assentos
  when 3
    puts "Obrigado por usar nosso sistema!"
    break
  else
    puts "Opção inválida!"
  end
end
