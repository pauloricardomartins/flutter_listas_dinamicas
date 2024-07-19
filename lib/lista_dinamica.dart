import 'package:flutter/material.dart';

class ListaDinamica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Lista Dinâmica', home: ListaTela());
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
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrangeAccent,
              child: IconTheme(
                child: Icon(Icons.pin),
                data: IconThemeData(color: Colors.white),
              ),
            ),
            title: Text(
              elementosLista[index],
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
            onLongPress: () {
              _removerElemento(index);
            },
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
                  }),
              TextButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    String _novoItem = _textController.text;
                    setState(() {
                      elementosLista.add(_novoItem);
                    });
                    Navigator.of(context).pop();
                    _textController.clear();
                  })
            ],
          );
        });
  }


void _removerElemento(int index) {
 showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover Item'),
          content: Text('Tem certeza que deseja remover este item?'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Remover'),
              onPressed: () {
                setState(() {
                  elementosLista.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
}
  
}

