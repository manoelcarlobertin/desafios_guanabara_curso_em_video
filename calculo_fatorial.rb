# import math
# n1 = int(input('Digite um número para ver o fatorial: '))
# n2 = n1
# print(n2, end=' x ')
# resultado = math.factorial(n1)
# while True:
#     n1 = n1 - 1
#     print(n1, end=' x ',)
#     if n1 == 1:
#         break
# print('0 =',resultado)

# mu = 1
# n = int(input('Digite um numero:'))
# print(f'O fatorial de {n}!:')
# print(f'{n}', end='')
# for c in range(n-1, 0, -1):
#     print(f'x{c}', end='')
#     mu *= c
# print(f' = {n*mu}')

# ---------------------------------------------

# n = int(input('Digite um numero: '))
# r = n
# print(f'O fatorial de {n}!:')
# print(f'{n}', end='')
# mult = 1
# while n != 1:
#     n += -1
#     mult *= n
#     print(f'x{n}', end='')
# print(f' = {r*mult}')

Rapaziada, vou deixar aqui um compilado com as 3 soluções:

# Usando While
n1 = int(input('Digite um número para saber o fatorial: '))
f1 = 1
c1 = n1
while c1 > 1:
    f1 *= c1
    c1 -= 1
print(f'O resultado de {n1}! é  {f1}')

# Usando for
n2 = int(input('Digite um número para saber o fatorial: '))
f2 = 1
for i in range(1, n2 + 1):
    f2 *= i
print(f'O resultado de {n2}! é {f2}')

# Usando math
from math import factorial
n3 = int(input('Digite um número para saber o fatorial: '))
print(f'O resultado de {n3}! é {factorial(n3)}')