package Builder;

public class fogueteBuilder {
    private String modelo;
    private String motor;
    private Double tanqueCombustivel;
    private int numAssentos;
    private String fabricante;

    public foguete build(){
        return new foguete(modelo, motor, tanqueCombustivel, numAssentos, fabricante);
    }

    public fogueteBuilder buildModelo(String modelo){
        this.modelo = modelo;
        return this;
    }
    public fogueteBuilder buildMotor(String motor){
        this.motor = motor;
        return this;
    }
    public fogueteBuilder buildTanqueCombustivel(Double tanqueCombustivel){
        this.tanqueCombustivel = tanqueCombustivel;
        return this;
    }
    public fogueteBuilder buildNumAssentos(int numAssentos){
        this.numAssentos = numAssentos;
        return this;
    }
    public fogueteBuilder buildFabricante(String fabricante){
        this.fabricante = fabricante;
        return this;
    }
}
