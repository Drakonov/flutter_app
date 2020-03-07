import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:validators/sanitizers.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculatorState();
}

class CalculatorState extends State {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _formKey,
      child: new Container(
          padding: new EdgeInsets.all(5.0),
          child: new Column(children: <Widget>[
            new Row(children: <Widget>[
              new Text('Ширина (мм):'),
              new Container(padding: new EdgeInsets.all(5.0),width: 300.0,
                child: new TextFormField(
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty || !isNumeric(value))
                    return 'Проверьте первое значение';
                },
              ),
              ),

            ],),
            new Row(children: <Widget>[
              new Text('Высота (мм):'),
              new Container(padding: new EdgeInsets.all(5.0),width: 300.0,
                child: new TextFormField(
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty || !isNumeric(value))
                      return 'Проверьте второе значение';
                  },
                ),
              ),
            ],),
            new FlatButton(onPressed: (){
              if(_formKey.currentState.validate()) Scaffold.of(context).showSnackBar(SnackBar(content: Text('У тебя получилось!'),backgroundColor: Colors.green));
            }, child: Text('Проверить'),color: Colors.blue,textColor: Colors.white,)
          ]),

//            child: new RaisedButton(onPressed: (){
//              if(_formKey.currentState.validate()) Scaffold.of(context).showSnackBar(SnackBar(content: Text('У тебя получилось!'),backgroundColor: Colors.green));
//            }, child: null)
          ));
  }
}
