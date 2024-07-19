import 'package:flutter/material.dart';

void main() => runApp(ListaDinamica());

class ListaDinamica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Dinâmica',
      home: ListaTela(),
    );
  }
}

List<String> elementosLista = [];

class ListaTela extends StatefulWidget {
  @override
  _ListaTelaState createState() => _ListaTelaState();
}

class _ListaTelaState extends State<ListaTela> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(elementosLista[index]),
            background: slideRightBackground(),
            secondaryBackground: slideLeftBackground(),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                _editarElemento(index);
                return false;
              } else {
                return await _confirmarRemocao(index);
              }
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepOrangeAccent,
                child: IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.pin),
                ),
              ),
              title: Text(
                elementosLista[index],
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.deepOrange,
        ),
        itemCount: elementosLista.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
        onPressed: _adicionarElemento,
      ),
    );
  }

  void _adicionarElemento() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Item'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: 'Digite...'),
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
                _textController.clear();
              },
            ),
            TextButton(
              child: Text('Salvar'),
              onPressed: () {
                String _novoItem = _textController.text;
                if (_novoItem.isNotEmpty) {
                  setState(() {
                    elementosLista.add(_novoItem);
                  });
                  _textController.clear();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _editarElemento(int index) {
    _textController.text = elementosLista[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Item'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: 'Digite...'),
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
                _textController.clear();
              },
            ),
            TextButton(
              child: Text('Salvar'),
              onPressed: () {
                String _novoItem = _textController.text;
                if (_novoItem.isNotEmpty) {
                  setState(() {
                    elementosLista[index] = _novoItem;
                  });
                  _textController.clear();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool?> _confirmarRemocao(int index) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover Item'),
          content: Text('Tem certeza que deseja remover este item?'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Remover'),
              onPressed: () {
                setState(() {
                  elementosLista.removeAt(index);
                });
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.edit, color: Colors.white),
        ),
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
    );
  }
}