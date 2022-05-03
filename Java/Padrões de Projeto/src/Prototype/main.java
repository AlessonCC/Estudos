package Prototype;

public class main {
    public static void main(String[] args) {

        livroHackerPrototype first = new livroHackerPrototype();
        first.setNomeDedicatoria("Valtteri Bottas");

        livroHackerPrototype clone1 = (livroHackerPrototype)first.clone();
        livroHackerPrototype clone2 = (livroHackerPrototype)first.clone();
        livroHackerPrototype clone3 = (livroHackerPrototype)first.clone();

        clone1.setNomeDedicatoria("Lewis Hamilton");
        clone2.setNomeDedicatoria("Charles Leclerc");
        clone3.setNomeDedicatoria("Max Vesrtappen");
        System.out.println(first.exibirImpressao());
        System.out.println(clone1.exibirImpressao());
        System.out.println(clone2.exibirImpressao());
        System.out.println(clone3.exibirImpressao());
    }
}
