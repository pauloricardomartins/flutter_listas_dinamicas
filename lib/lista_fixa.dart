import 'package:flutter/material.dart';
import 'Item.dart';

class ListaApp extends StatelessWidget {

List<String> itens = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aplicativo Lista',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Lista', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.deepPurple,
              centerTitle: true,
            ),
            body: ListView.builder(
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Item(itemName: itens[index]),
                        ),
                      );
                    },
                    title: Text(
                      itens[index],
                      style: TextStyle(color: Colors.deepPurpleAccent),
                    ),
                    subtitle: Text("Texto"),
                    leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        child: IconTheme(
                            child: Icon(Icons.add_task),
                            data: IconThemeData(color: Colors.white))),
                  );
                })));
  }
}
