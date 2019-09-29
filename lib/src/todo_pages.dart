import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todoItem = [];
  String descricao;
  int index;
  List<bool> isDone = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas by Ian Brito'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          if (_todoItem.length > index) {
            return _builderCardItem(_todoItem[index], index);
          }
        },
        scrollDirection: Axis.vertical,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showDialog,
      ),
    );
  }

  Widget _builderCardItem(dynamic item, index) => Card(
        child: Row(
          children: [
            Checkbox(
              value: isDone[index],
              onChanged: (val) {
                setState(() {
                  isDone[index] = isDone[index] ? false : true;
                });
              },
            ),
            Expanded(
              child: ListTile(
                title: new Text(item),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete_outline),
              color: Colors.grey,
              iconSize: 22,
              onPressed: () {
                _removeTodo(index);
              },
            ),
          ],
        ),
        color: isDone[index] ? Color.fromRGBO(204, 204, 204, 0) : null,
      );

  Future<void> _showDialog() async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20),
          title: Text('Nova Tarefa'),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Tarefa',
                  ),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  onChanged: (val) {
                    setState(() {
                      descricao = val;
                    });
                  },
                ),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            FlatButton(
                child: Text('Adicionar'),
                onPressed: () {
                  _addTodo();
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  void _addTodo() {
    setState(() {
      index = _todoItem.length;
      isDone.add(false);
      _todoItem.add(descricao);
      descricao = '';
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _todoItem.removeAt(index);
      isDone.removeAt(index);
    });
  }
}
