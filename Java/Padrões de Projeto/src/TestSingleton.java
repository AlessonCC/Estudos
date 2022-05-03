public class TestSingleton {
    public static void main(String[] args) {
        bancoSingleton banco = bancoSingleton.getInstance();
        System.out.println(banco.transferenciaPIX());
        System.out.println(banco.transferenciaPIX());
        System.out.println(banco.transferenciaPIX());
        System.out.println(banco.deposito());
        System.out.println(banco.saque());
        System.out.println(banco.report());
    }
}
