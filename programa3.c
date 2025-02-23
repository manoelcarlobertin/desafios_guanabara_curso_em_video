// recebe nome e ano nasc, valida, calcula idade e imprime na tela.
#include <stdio.h>
#include <string.h>
#include <time.h>

int main() {
    char nome[50];
    int ano_nascimento, idade;
    time_t t = time(NULL);
    struct tm *data_atual = localtime(&t);
    int ano_atual = data_atual->tm_year + 1900;

    printf("Digite seu nome: ");
    fgets(nome, sizeof(nome), stdin);
    nome[strcspn(nome, "\n")] = '\0';  // Remove o \n do final

    while (strlen(nome) < 2) {
        printf("Nome inválido. Digite novamente: ");
        fgets(nome, sizeof(nome), stdin);
        nome[strcspn(nome, "\n")] = '\0';
    }

    printf("Digite seu ano de nascimento: ");
    scanf("%d", &ano_nascimento);

    while (ano_nascimento < 1900 || ano_nascimento > ano_atual) {
        printf("Ano inválido. Digite novamente: ");
        scanf("%d", &ano_nascimento);
    }

    idade = ano_atual - ano_nascimento;

    printf("\nNome: %s\n", nome);
    printf("Idade: %d anos\n", idade);

    return 0;
}
