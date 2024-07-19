import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String itemName;

  Item({required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName, style: TextStyle( color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        
      ),
    );
  }
}