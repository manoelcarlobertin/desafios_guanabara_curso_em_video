require 'colorize'

module CalculadoraAreas
  def self.menu
    puts '=' * 55
    puts '🌈 PROGRAMA DE ÁREAS - GEOMETRIA 📐'.center(55).colorize(:magenta).bold
    puts '=' * 55
    puts <<~MENU
      Digite:
      [ 1 ] para calcular a área de um triângulo equilátero
      [ 2 ] para calcular a área de um triângulo retângulo
      [ 3 ] para calcular a área de um triângulo qualquer
      [ 4 ] para calcular a área de um quadrado
      [ 5 ] para calcular a área de um retângulo
      [ 6 ] para calcular a área de um losango
      [ 7 ] para calcular a área de um paralelogramo
      [ 8 ] para calcular a área de um quadrilátero qualquer
      [ 9 ] para calcular a área de um polígono regular
      [ 10 ] para calcular a área de um círculo
    MENU
    print 'Sua opção: '.colorize(:green)
    gets.chomp.to_i
  end

  def self.calcula_area(opcao)
    case opcao
    when 1
      lado = pedir_valor('Digite o lado do triângulo equilátero: ')
      area = (Math.sqrt(3) / 4) * lado**2
      mostrar_area('Triângulo Equilátero', area)
    when 2
      base = pedir_valor('Digite a base do triângulo retângulo: ')
      altura = pedir_valor('Digite a altura do triângulo retângulo: ')
      area = (base * altura) / 2
      mostrar_area('Triângulo Retângulo', area)
    when 3
      base = pedir_valor('Digite a base do triângulo qualquer: ')
      altura = pedir_valor('Digite a altura do triângulo qualquer: ')
      area = (base * altura) / 2
      mostrar_area('Triângulo Qualquer', area)
    when 4
      lado = pedir_valor('Digite o lado do quadrado: ')
      area = lado**2
      mostrar_area('Quadrado', area)
    when 5
      base = pedir_valor('Digite a base do retângulo: ')
      altura = pedir_valor('Digite a altura do retângulo: ')
      area = base * altura
      mostrar_area('Retângulo', area)
    when 6
      diagonal_maior = pedir_valor('Digite a diagonal maior do losango: ')
      diagonal_menor = pedir_valor('Digite a diagonal menor do losango: ')
      area = (diagonal_maior * diagonal_menor) / 2
      mostrar_area('Losango', area)
    when 7
      base = pedir_valor('Digite a base do paralelogramo: ')
      altura = pedir_valor('Digite a altura do paralelogramo: ')
      area = base * altura
      mostrar_area('Paralelogramo', area)
    when 8
      base = pedir_valor('Digite a base do quadrilátero: ')
      altura = pedir_valor('Digite a altura do quadrilátero: ')
      area = base * altura
      mostrar_area('Quadrilátero', area)
    when 9
      perimetro = pedir_valor('Digite o perímetro do polígono regular: ')
      apotema = pedir_valor('Digite a apótema do polígono regular: ')
      area = (perimetro * apotema) / 2
      mostrar_area('Polígono Regular', area)
    when 10
      raio = pedir_valor('Digite o raio do círculo: ')
      area = Math::PI * raio**2
      mostrar_area('Círculo', area)
    else
      puts 'Opção inválida!'.colorize(:red)
    end
  end

  def self.pedir_valor(prompt)
    print prompt.colorize(:cyan)
    gets.chomp.to_f
  end

  def self.mostrar_area(figura, area)
    puts "A área do #{figura} é: #{'%.2f' % area} cm²".colorize(:green).bold
  end

  def self.run
    loop do
      opcao = menu
      calcula_area(opcao)
      print 'Deseja realizar outro cálculo? [S/N]: '.colorize(:yellow)
      break if gets.chomp.strip.upcase == 'N'
    end
    puts 'Programa Encerrado! 🎯'.colorize(:cyan)
  end
end

CalculadoraAreas.run
