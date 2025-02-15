# Um ano é bissexto se satisfizer uma das seguintes condições abaixo:
def bissexto?(ano)
  # Ano é multiplo de 4 mas não é múltiplo de 100 (evita que anos como 1900 sejam bissextos erroneamente).
  if (ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0) # no *OU* basta uma condição é *V* => true.
    true
    # Se um ano for múltiplo de 400, ele é bissexto, INDEPENDENTE da regra anterior (exemplo: o ano 2000).
  else
    false
  end
end
puts "Digite um ano para verificar se é bissexto:"
ano = gets.chomp.to_i
puts bissexto?(ano) ? "#{ano} é um ano bissexto!" : "#{ano} não é um ano bissexto."
# Por que existem anos bissextos?
# O ano bissexto existe porque o tempo que a Terra leva para dar a volta no Sol
# é de aproximadamente 365 dias, 5 horas, 48 minutos e 46 segundos.
# Para corrigir esse erro, a cada quatro anos é adicionado um dia, o 29 de fevereiro.
