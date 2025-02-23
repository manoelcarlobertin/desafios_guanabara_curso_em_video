
#include <stdio.h>
#include <time.h>

int main() {
    int anoNascimento, anoAtual, idade;

    // Obter ano atual automaticamente
    time_t t = time(NULL);
    struct tm *data = localtime(&t);
    anoAtual = data->tm_year + 1900;

    // Solicitar entrada do usuário
    printf("Digite o ano do seu nascimento: ");
    scanf("%d", &anoNascimento);

    // Calcular idade
    idade = anoAtual - anoNascimento;

    // Imprimir resultado
    printf("Sua idade é: %d anos\n", idade);

    return 0;
}
/*
gcc programa1.c -o c_minha_idade

./c_minha_idade
 */
