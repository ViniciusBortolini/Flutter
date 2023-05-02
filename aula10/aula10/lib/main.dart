import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _toDoController = TextEditingController();
  final List _toDoList = [];

  Map<String, dynamic> _lastRemoved = {};
  int _lastRemovedPos = 0;

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newToDo = {};
      newToDo["title"] = _toDoController.text;

      _toDoController.text = "";
      newToDo["ok"] = false;
      _toDoList.add(newToDo);
      _saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 1, 7, 1),
          child: Row(children: [
            Expanded(
                child: TextField(
              controller: _toDoController,
              decoration: const InputDecoration(
                  labelText: "Nova Tarefa",
                  labelStyle: TextStyle(color: Colors.blueAccent)),
            )),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: _addToDo,
              child: const Text("ADD"),
            )
          ]),
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: _toDoList.length,
              itemBuilder: buildItem),
        )
      ]),
    );
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
          title: Text(_toDoList[index]["title"]),
          value: _toDoList[index]["ok"],
          secondary: CircleAvatar(
            child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
          ),
          onChanged: (c) {
            setState(() {
              _toDoList[index]["ok"] = c;
              _saveData();
            });
            print(c);
          }),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(_toDoList[index]);
          _lastRemovedPos = index;
          _toDoList.removeAt(index);

          _saveData();

          final snack = SnackBar(
            content: Text("Tarefa \"${_lastRemoved["title"]}\" removida!"),
            action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _toDoList.insert(_lastRemovedPos, _lastRemoved);
                    _saveData();
                  });
                }),
            duration: const Duration(seconds: 2),
          );

          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(snack);
        });
      },
    );
  }

  Future<File> _getFile() async {
    //Como cada sistema operacional tem suas permissões, usaremos o path provider
    final directory = await getApplicationDocumentsDirectory();

    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();

    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return "";
    }
  }
}
