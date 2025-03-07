print('\033[4;35mVejamos a progressão aritmética\033[m')
print "Informe o primeiro termo da PA: "
n = gets.to_i

print "Digite a razão: "
r = gets.to_i

pa = (0..9).map { |c| n + r * c } # * for * por map → Mais idiomático e funcional em Ruby.

puts pa.join(" -> ") + " -> FIM"

# Adição de " -> FIM" → Indica o final da sequência.
if r.zero?
  puts "PA do tipo: CONSTANTE com #{n} termos."
elsif r.positive?
  puts "PA do tipo: CRESCENTE com #{n} termos."
else
  puts "PA do tipo: DECRESCENTE com #{n} termos."
end
