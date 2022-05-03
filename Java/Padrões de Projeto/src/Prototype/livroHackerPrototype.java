package Prototype;

public class livroHackerPrototype implements livroPrototype{
    private String titulo = "Mercado Sombrio" , nomeDedicatoria,
            categoria = "Hacking", autor = "Misha Glenny", editora = "Companhia das Letras";
    private int qtdPaginas = 392;

    public livroHackerPrototype(){
        setNomeDedicatoria(null);
    }
    public livroHackerPrototype(livroHackerPrototype livro){
        livro.getNomeDedicatoria();
    }
    @Override
    public String exibirImpressao() {
        return "Titulo do livro: " + getTitulo()+ "\nAutor: " + getAutor() + "\nEditora: "+getEditora() + "\nCategoria: " +getCategoria()
                + "\nQuantidade de Paginas: " + getQtdPaginas() + "\nDedicatoria: " + getNomeDedicatoria()+"\n";
    }

    @Override
    public livroPrototype clone() {
        return new livroHackerPrototype(this);
    }

    public String getTitulo() {
        return titulo;
    }

    public String getNomeDedicatoria() {
        return nomeDedicatoria;
    }

    public void setNomeDedicatoria(String nomeDedicatoria) {
        this.nomeDedicatoria = nomeDedicatoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public String getAutor() {
        return autor;
    }

    public String getEditora() {
        return editora;
    }

    public int getQtdPaginas() {
        return qtdPaginas;
    }
}
