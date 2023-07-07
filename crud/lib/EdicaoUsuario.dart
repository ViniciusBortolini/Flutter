import 'package:flutter/material.dart';
import 'usuario.dart';

class EdicaoUsuario extends StatefulWidget {
  final Usuario usuario;
  final String documentId; // Novo parâmetro

  const EdicaoUsuario(
      {required this.usuario, required this.documentId}); // Atualizado

  @override
  _EdicaoUsuarioState createState() => _EdicaoUsuarioState();
}

class _EdicaoUsuarioState extends State<EdicaoUsuario> {
  final _formKey = GlobalKey<FormState>();

  late String _nome;
  late String _email;
  late String _senha;

  @override
  void initState() {
    super.initState();
    _nome = widget.usuario.nome;
    _email = widget.usuario.email;
    _senha = widget.usuario.senha;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: _nome,
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
                initialValue: _email,
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
                initialValue: _senha,
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
                    // Atualizar dados do usuário
                    final usuarioAtualizado = Usuario(
                      nome: _nome,
                      email: _email,
                      senha: _senha,
                    );
                    // Aqui você pode adicionar o código para salvar os dados do usuário atualizado
                    Navigator.pop(context, usuarioAtualizado);
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
