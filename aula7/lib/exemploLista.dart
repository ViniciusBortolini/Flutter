void main() {
  // criando uma lista
  List<String> nomes = ["Eduardo", "André", "Lucas", "Guilherme"];
  print("Lista Posicao 0: " + nomes[0].toString());

  // adicionar elementos
  nomes.add("Alana");
  print("Lista ao Adicionar um novo elemento: " + nomes.toString());

  // tamanho da lista
  print("Tamanho da Lista: " + (nomes.length).toString());

  // removendo um item da lista
  nomes.removeAt(0);
  print(nomes);

  // inserindo um item na lista (informando posição)
  nomes.insert(1, "anna");
  nomes.insert(1, "Maria");
  nomes.insert(1, "Cristiano");
  print(nomes);

  // procurar se um item consta na lista
  print(nomes.contains("Christian"));
  print(nomes.contains("ana"));
}
