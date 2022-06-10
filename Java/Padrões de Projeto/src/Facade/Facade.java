package Facade;

public class Facade {
    protected Acaiteria acai;

    public Facade(){
        acai = new Acaiteria();
    }
    public void acaiBomba(){
        acai.setAcai(250);
        acai.setAmendoim(200);
        acai.setPoDeGuarana(200);
        System.out.println("Acai Bomba: Acai "+acai.getAcai()+"g"+ ", Amendoin "+acai.getAmendoim() +"g"+", Po de Guarana "+acai.getPoDeGuarana()+"g");
        acai.fazerAcai();
    }
    public void acaiSergipano(){
        acai.setAcai(250);
        acai.setBanana(100);
        acai.setAmendoim(100);
        acai.setMorango(50);
        System.out.println("Acai Sergipano: Acai "+acai.getAcai()+"g"+ ", Banana "+acai.getBanana() +"g"+", Amendoim "+acai.getAmendoim()+"g"+", Morango "+ acai.getMorango()+"g");
        acai.fazerAcai();
    }
    public void acaiBaiano(){
        acai.setAcai(250);
        acai.setNinho(100);
        acai.setPimenta(50);
        System.out.println("Acai Baiano: Acai "+acai.getAcai()+"g"+ ", Ninho "+acai.getNinho() +"g"+", Pimenta "+acai.getPimenta()+"g");
        acai.fazerAcai();
    }
    public void acaiParanaense(){
        acai.setAcai(250);
        acai.setCastanha(100);
        System.out.println("Acai Paranaense: Acai "+acai.getAcai()+"g"+ ", Castanha "+acai.getCastanha() +"g");
        acai.fazerAcai();
    }
}
/*1. Aplique o padrão Facade para implementar uma solução para o problema abaixo:
        Imagine que você está desenvolvendo um sistema para uma açaiteria onde existem vários
        tipos de acompanhamentos que devem ser cadastrados para controlar as vendas diárias.
        Estão disponíveis para os clientes:
        1. Açaí bomba: açaí (250 g) + amendoim (200 g) + pó de guaraná (200 g)
        2. Açaí sergipano: açaí (250 g) + banana (100 g) + amendoim (100 g) + morango (50 g);
        3. Açaí baiano: açaí (250 g) + ninho (100 g) + pimenta (50 g);
        4. Açaí paraense: açaí (250 g) + castanha (100 g).
        Adicionais:
        1. Leite condensado;
        2. Morango;
        3. Castanha;
        4. Amendoim;
        5. Kiwi;
        6. Banana;
        7. Cereja;
        8. Ninho;*/
