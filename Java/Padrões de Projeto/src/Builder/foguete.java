package Builder;

public class foguete {
    private String modelo;
    private String motor;
    private Double tanqueCombustivel;
    private int numAssentos;
    private String fabricante;

    public foguete(String modelo, String motor, Double tanqueCombustivel, int numAssentos, String fabricante) {
        this.modelo = modelo;
        this.motor = motor;
        this.tanqueCombustivel = tanqueCombustivel;
        this.numAssentos = numAssentos;
        this.fabricante = fabricante;
    }

    public String getModelo() {
        return modelo;
    }

    public String getMotor() {
        return motor;
    }

    public Double getTanqueCombustivel() {
        return tanqueCombustivel;
    }

    public int getNumAssentos() {
        return numAssentos;
    }

    public String getFabricante() {
        return fabricante;
    }

    @Override
    public String toString() {
        return "foguete{" +
                "modelo='" + modelo + '\'' +
                ", motor='" + motor + '\'' +
                ", tanqueCombustivel=" + tanqueCombustivel +
                ", numAssentos=" + numAssentos +
                ", fabricante='" + fabricante + '\'' +
                '}';
    }
}
