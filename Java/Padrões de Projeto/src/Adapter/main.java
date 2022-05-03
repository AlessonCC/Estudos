package Adapter;

public class main {
    public static void main(String[] args) {
     TargetArquivo arquivo = new JSON_Adapter();
     arquivo.carregarArquivo("Cripto.JSON");
     arquivo.diagramaDashboard();

     arquivo = new XML_Adapter();
     arquivo.carregarArquivo("Cripto.xml");
     arquivo.diagramaDashboard();
    }
}
