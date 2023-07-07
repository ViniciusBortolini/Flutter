import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Segunda Pagina'),
        ),
        body: CadastroUsuario());
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

  final List<String> _usuariosCadastrados = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
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
                  print('Nome: $_nome');
                  print('E-mail: $_email');
                  print('Senha: $_senha');
                  // Limpar formulário
                  _formKey.currentState!.reset();
                }
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
