class Aluno {
  bool matricula = true;
  String curso;
  String nome;

  Aluno(this.nome, this.curso);
  void cancelarMatricula() {
    matricula = false;
  }

  void pagarMensalidade(double mensalidade) {
    print("Valor da Mensalidade é 100%");
  }
}

class Bolsista extends Aluno {
  int bolsa;
  bool situacaoBolsa = true;

  Bolsista(this.bolsa, String nome, String curso) : super(nome, curso);

  void renovarBolsa() {
    situacaoBolsa = true;
  }

  @override
  void pagarMensalidade(double mensalidade) {
    mensalidade = mensalidade - (mensalidade * bolsa / 100);
    print(mensalidade);
  }
}

class Estagiario extends Aluno {
  String registroProfissional = "0";

  Estagiario(String nome, String curso) : super(nome, curso);
  void trabalhar() {
    print("trabalhando");
  }
}

void main() {
  Bolsista b1 = Bolsista(50, "Vinicius", "Sistemas de Informação");
  b1.pagarMensalidade(1000);
  Aluno a1 = Aluno("Vinicius De", "Engenharia");
  a1.pagarMensalidade(1000);
}
