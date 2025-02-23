import java.time.LocalDate;
import java.util.Scanner;

public class MeuPrograma2 {
    public static void main(String[] args) {
        Usuario usuario = new Usuario();
        usuario.cadastrarUsuario();
        usuario.imprimirInformacoes();
    }
}

// Classe Pai (superclasse)
class Pessoa {
    protected String nome;
    protected int anoNascimento;

    public Pessoa() {
        this.nome = "";
        this.anoNascimento = 0;
    }
}

// Classe Usuário herda de Pessoa
class Usuario extends Pessoa {
    public void cadastrarUsuario() {
        try (Scanner scanner = new Scanner(System.in)) {
            this.nome = obterNome(scanner);
            this.anoNascimento = obterAnoNascimento(scanner);
        }
    }

    private String obterNome(Scanner scanner) {
        String nome;
        do {
            System.out.print("Digite seu nome (somente letras): ");
            nome = scanner.nextLine().trim();

            if (!validarNome(nome)) {
                System.out.println("Nome inválido! Digite apenas letras do alfabeto em português.");
                nome = ""; // Força o loop a repetir
            }
        } while (nome.isEmpty());

        return capitalizarNome(nome);
    }

    private boolean validarNome(String nome) {
        return nome.matches("^[A-Za-zÀ-ÖØ-öø-ÿ\\s]+$"); // Permite letras com acentos e espaços
    }

    private String capitalizarNome(String nome) {
        String[] partesNome = nome.toLowerCase().split("\\s+");
        StringBuilder nomeCapitalizado = new StringBuilder();

        for (String parte : partesNome) {
            nomeCapitalizado.append(Character.toUpperCase(parte.charAt(0)))
                            .append(parte.substring(1))
                            .append(" ");
        }
        return nomeCapitalizado.toString().trim();
    }

    private int obterAnoNascimento(Scanner scanner) {
        int ano;
        int anoAtual = LocalDate.now().getYear();

        while (true) {
            System.out.print("Digite seu ano de nascimento: ");
            try {
                ano = Integer.parseInt(scanner.nextLine());
                if (ano > 1900 && ano <= anoAtual) {
                    return ano;
                } else {
                    System.out.println("Ano inválido. Digite um ano entre 1900 e " + anoAtual + ".");
                }
            } catch (NumberFormatException e) {
                System.out.println("Entrada inválida. Digite um número válido.");
            }
        }
    }

    private String determinarFaixaEtaria() {
        int idade = LocalDate.now().getYear() - anoNascimento;
        return (idade < 12) ? "Criança 🧒" : (idade < 18) ? "Adolescente 🧑" : "Adulto 🏆";
    }

    public void imprimirInformacoes() {
        System.out.println("\n============================");
        System.out.println("🎉 Informações do Usuário 🎉");
        System.out.println("============================");
        System.out.printf("📝 Nome: %s%n", nome);
        System.out.printf("🎂 Ano de Nascimento: %d%n", anoNascimento);
        System.out.printf("📌 Faixa Etária: %s%n", determinarFaixaEtaria());
        System.out.println("============================");
    }
}
