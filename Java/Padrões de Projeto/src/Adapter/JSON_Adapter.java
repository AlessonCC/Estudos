package Adapter;

public class JSON_Adapter extends JSON_Criptomoedas implements TargetArquivo {

    @Override
    public void carregarArquivo(String arquivo) {
        JSON_carregarArquivo(arquivo);
    }
    @Override
    public void diagramaDashboard() {
        JSON_diagramaDashboard();
    }
}
