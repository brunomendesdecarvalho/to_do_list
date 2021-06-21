import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'todo.dart';

String numString(int num) {
  return (num + 1).toString();
}

void main() {
  runApp(
    MaterialApp(
      title: 'Lista de Afazeres',
      home: ListaTarefas(
        todos: List.generate(
          10,
          (i) => Tarefa(
            'Tarefa ' + numString(i),
            'Descrição da tarefa ' + numString(i),
          ),
        ),
      ),
    ),
  );
}

class ListaTarefas extends StatelessWidget {
  final List<Tarefa> todos;

  ListaTarefas({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Afazeres'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].nome),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalheTarefas(),
                  settings: RouteSettings(
                    arguments: todos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetalheTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Tarefa;
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.corpo),
      ),
    );
  }
}
