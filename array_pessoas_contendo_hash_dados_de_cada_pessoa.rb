require 'faker'

# Módulo para definir cores de formatação no terminal
module Colors
  RED = "\033[31m"
  GREEN = "\033[32m"
  YELLOW = "\033[33m"
  BLUE = "\033[34m"
  WHITE = "\033[97m"
  PURPLE = "\033[35m"
  NONE = "\033[m"
  CINZA_AZUL = "\033[94m"
  CIANO = "\033[36m"
end

# Classe que representa uma pessoa
class Pessoa
  attr_accessor :nome, :sexo, :idade

  def initialize(nome, sexo, idade)
  #construtor da classe, responsável por inicializar os atributos.
    @nome = nome
    @sexo = sexo
    @idade = idade
  end
#{Colors::CIANO}-=#{Colors::NONE}
  # Método para exibir os dados de uma pessoa
  def to_s
  # retorna uma string formatada com os dados da pessoa, utilizando cores para destacar as informações.
    "#{Colors::CIANO}Nome:#{Colors::NONE}#{Colors::CINZA_AZUL} #{@nome}#{Colors::NONE}, " \
    "#{Colors::YELLOW}Sexo:#{Colors::NONE}#{Colors::WHITE} #{@sexo}#{Colors::NONE}, " \
    "#{Colors::BLUE}Idade:#{Colors::NONE}#{Colors::RED} #{@idade} #{Colors::NONE}."
  end
end

# Classe para gerenciar o cadastro de pessoas
class CadastroPessoas
  include Colors

  def initialize
    @pessoas = [] # Array para armazenar as pessoas cadastradas
  end

  # Método para gerar dados fictícios de * uma pessoa * em * cada * Hash.
  def gerar_dados_pessoa
    Pessoa.new(
      Faker::Name.name, # Gera um nome fictício
      ['M', 'F'].sample, # Escolhe aleatoriamente entre 'M' e 'F'
      rand(18..65) # Gera uma idade entre 18 e 65 anos
    )
  end

  # Método para cadastrar 5 pessoas automaticamente.
  def cadastrar_pessoas(quantidade)
    quantidade.times do
      pessoa = gerar_dados_pessoa
      @pessoas << pessoa # um Array recebendo vários Hash, respectivamente.
    end
  end

   # Método para exibir o total de pessoas cadastradas
   def exibir_total_pessoas
    puts "\n#{Colors::GREEN} O total de pessoas cadastradas: * #{@pessoas.size} * #{Colors::NONE}."
  end

  # Método para calcular a média de idades
  def calcular_media_idades
    soma_idades = @pessoas.sum(&:idade)
    soma_idades.to_i / @pessoas.size # idade inteira, pra não aparecer média-de-idade "quebrada."
  end

  # Método para exibir a média de idades
  def exibir_media_idades(media_idades)
    puts "\n#{Colors::RED} A média de idades cadastradas é * #{media_idades.round(2)} anos * #{Colors::NONE}."
  end

  # Flexibilidade: O código se adapta automaticamente à quantidade de mulheres cadastradas.
  def exibir_mulheres_cadastradas
    mulheres = @pessoas.select { |pessoa| pessoa.sexo == 'F' }.map(&:nome) # Array com nomes mapeados.

    case mulheres.size
    when 0
      puts "\n#{Colors::PURPLE} Nenhuma mulher cadastrada. #{Colors::NONE}"
    when 1
      puts "\n#{Colors::PURPLE} A mulher cadastrada é: #{mulheres.first} #{Colors::NONE}"
    when 2
      puts "\n#{Colors::PURPLE} As mulheres cadastradas são: #{mulheres.join(' e ')} #{Colors::NONE}"
    else # Por último as 3 ou mais mulheres...
      puts "\n#{Colors::PURPLE} As mulheres cadastradas são: #{mulheres[0..-2].join(', ')} e #{mulheres.last} #{Colors::NONE}"
    end
  end

  # Método para exibir pessoas acima da média de idades
  def exibir_pessoas_acima_da_media(media_idades)
    puts "\n#{Colors::YELLOW}Pessoas que estão igual/acima dos * #{media_idades} anos *: #{Colors::NONE}"
    @pessoas.each do |pessoa|
      if pessoa.idade >= media_idades
        puts pessoa.to_s
        puts "---" * 16
      end
    end
  end

  # Método para exibir o resumo dos dados cadastrados
  def exibir_resumo
    media_idades = calcular_media_idades

    exibir_total_pessoas
    exibir_media_idades(media_idades)
    exibir_mulheres_cadastradas
    exibir_pessoas_acima_da_media(media_idades)
  end

  # Método para limpar o terminal
  def limpar_terminal
    system('clear') || system('cls') # Funciona tanto no Linux/Mac (clear) quanto no Windows (cls)
  end
end

# Script principal
if __FILE__ == $0
  QUANTIDADE_PESSOAS = 5 # Constante para definir a quantidade de pessoas a serem cadastradas.

  cadastro = CadastroPessoas.new # Cria uma instância da classe.

  # Exibir cabeçalho formatado.
  puts "#{Colors::CIANO}-=#{Colors::NONE}" * 24
  puts "#{Colors::WHITE}           Cadastro de pessoas"
  puts "#{Colors::CIANO}-=#{Colors::NONE}" * 24

  # Cadastrar 5 pessoas automaticamente
  cadastro.cadastrar_pessoas(QUANTIDADE_PESSOAS)

  # Exibir resumo dos dados
  cadastro.exibir_resumo

  # Limpar o terminal ao final
  puts "\n#{Colors::GREEN}Aperte ENTER para limpar o terminal.#{Colors::NONE}"
  gets
  cadastro.limpar_terminal
end