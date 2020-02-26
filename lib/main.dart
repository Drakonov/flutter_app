 import 'package:flutter/material.dart';

class MyBody extends StatelessWidget{
  Widget build(BuildContext context){
    return new Center(
      child: new Column(
        children: [
          new Text('Hello World!'),
          new FlatButton(onPressed:(){}, child: Text('Open Site'),color: Colors.red,textColor: Colors.white,)
        ],
      ),
    );
  }
}

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Horoshev.com')),
        body: new MyBody(),
      )
    )
  );
}