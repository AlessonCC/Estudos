package Adapter;

public class XML_Adapter extends XML_Criptomoedas implements TargetArquivo{
    @Override
    public void carregarArquivo(String arquivo) {
        XML_carregarArquivo(arquivo);
    }

    @Override
    public void diagramaDashboard() {
        XML_diagramaDashboard();
    }
}
