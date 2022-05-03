package Builder;

public class main {
    public static void main(String[] args) {
        foguete foguete1 = new fogueteBuilder()
                .buildModelo("Modelo 1")
                .buildMotor("3 motores")
                .buildTanqueCombustivel(153.0)
                .buildNumAssentos(5)
                .buildFabricante("SpaceX")
                .build();
        System.out.println(foguete1);

        foguete foguete2 = new fogueteBuilder()
                .buildModelo("Modelo 2")
                .buildMotor("5 motores")
                .buildTanqueCombustivel(375.0)
                .buildNumAssentos(10)
                .buildFabricante("Nasa")
                .build();
        System.out.println(foguete2);
    }
}
