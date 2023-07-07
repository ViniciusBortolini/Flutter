import 'package:flutter/material.dart';
import 'EdicaoUsuario.dart';
import 'usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TerceiraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuários'),
      ),
      body: CadastroUsuario(),
    );
  }
}

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final _formKey = GlobalKey<FormState>();

  String _nome = '';
  String _email = '';
  String _senha = '';

// Referência para a coleção 'usuarios' no Firestore
  final CollectionReference _usuariosCollection =
      FirebaseFirestore.instance.collection('usuarios');

  void adicionarUsuario(String nome, String email, String senha) async {
    try {
      await _usuariosCollection.add({
        'nome': nome,
        'email': email,
        'senha': senha,
      });
      print('Usuário cadastrado com sucesso!');
    } catch (error) {
      print('Erro ao cadastrar usuário: $error');
    }
  }

  void _removerUsuario(String documentId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir usuário'),
          content: const Text('Tem certeza que deseja excluir este usuário?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await _usuariosCollection.doc(documentId).delete();
                  Navigator.of(context).pop(true);
                  print('Usuário removido com sucesso!');
                } catch (error) {
                  print('Erro ao remover usuário: $error');
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  void modificarUsuario(String documentId) async {
    final usuarioSnapshot = await _usuariosCollection.doc(documentId).get();
    final Usuario usuario = Usuario.fromSnapshot(usuarioSnapshot);
    final novoUsuario = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EdicaoUsuario(usuario: usuario, documentId: documentId),
      ),
    );
    if (novoUsuario != null) {
      try {
        await _usuariosCollection.doc(documentId).update(novoUsuario.toMap());
        print('Usuário modificado com sucesso!');
      } catch (error) {
        print('Erro ao modificar usuário: $error');
      }
    }
  }

  void imprimirLista(QuerySnapshot snapshot) {
    final usuarios =
        snapshot.docs.map((doc) => Usuario.fromSnapshot(doc)).toList();
    print(usuarios.length);
    for (Usuario elemento in usuarios) {
      print(elemento.nome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nome = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira o e-mail';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira a senha';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _senha = value!;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
// Salvar dados do usuário
                        adicionarUsuario(_nome, _email, _senha);
// print('Nome: $_nome');
// print('E-mail: $_email');
// print('Senha: $_senha');
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text('Cadastrar'),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
// Lista de usuários cadastrados
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _usuariosCollection.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Erro ao carregar usuários');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  imprimirLista(snapshot.data!);

                  final usuarios = snapshot.data!.docs
                      .map((doc) => Usuario.fromSnapshot(doc))
                      .toList();

                  return ListView.builder(
                    itemCount: usuarios.length,
                    itemBuilder: (context, index) {
                      final usuario = usuarios[index];
                      return ListTile(
                        title: Text(usuario.nome),
                        subtitle: Text(usuario.email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                modificarUsuario(usuario.documentId);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _removerUsuario(usuario.documentId);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
