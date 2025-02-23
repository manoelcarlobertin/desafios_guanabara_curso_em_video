
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int jogador, computador;

    printf("\n=== PEDRA, PAPEL E TESOURA ===\n\n");

    printf("1 - PEDRA\n");
    printf("2 - PAPEL\n");
    printf("3 - TESOURA\n");
    printf("\nEscolha sua jogada: ");
    scanf("%d", &jogador);

    srand(time(NULL));
    computador = rand() % 3 + 1;

    printf("\nComputador escolheu: %d\n", computador);

    if (jogador == computador) {
        printf("\nEMPATE!\n");
    }
    else if ((jogador == 1 && computador == 3) ||
             (jogador == 2 && computador == 1) ||
             (jogador == 3 && computador == 2)) {
        printf("\nVOCÊ VENCEU!\n");
    }
    else {
        printf("\nCOMPUTADOR VENCEU!\n");
    }

    return 0;
}
