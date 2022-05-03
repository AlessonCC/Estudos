public class bancoSingleton {
    protected int log;

    private static bancoSingleton instance;

    private bancoSingleton(){
    }
    public static bancoSingleton getInstance(){
        if(instance == null)
            instance = new bancoSingleton();
        return instance;
    }
    public String saque() {
        ++log;
        return new String("SAQUE REALIZADO COM SUCESSO");
    }

    public String deposito(){
        ++log;
        return new String("DEPOSITO REALIZADO COM SUCESSO");
    }

    public String transferenciaPIX(){
        ++log;
        return new String("TRANSFERENCIA REALIZADA COM SUCESSO");
    }
    public String report(){
        return new String("Total de logs no sistema bancario: " + log);
    }

}
