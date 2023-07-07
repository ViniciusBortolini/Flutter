import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String documentId;
  String nome;
  String email;
  String senha;

  Usuario(
      {this.documentId = '',
      required this.nome,
      required this.email,
      required this.senha});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  static Usuario fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return Usuario(
      documentId: snapshot.id,
      nome: data['nome'] as String,
      email: data['email'] as String,
      senha: data['senha'] as String,
    );
  }
}
