import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  String _id;

  SecondScreen({String id}):_id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title :Text('Second Screen ${_id != null ? _id : '' }')),
      body: Center(child: RaisedButton(onPressed: (){
        Navigator.pop(context);
      },child: Text('Return to main screen'),),),
    );
  }
}