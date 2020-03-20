
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
bool _isZero = false;

class SandGlass{
  int _sand = 0;

  time(){
    return _sand;
  }

  Future tick() async{
    _sand = 100;
    print('Start:tick');
    while(_sand>0){
      print('tick: $_sand');
      _sand--;
      await new Future.delayed(const Duration(milliseconds: 100));
    }
    _isZero=true;
    print('end:tick');
  }
}


class AsyncAwait extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AsyncAwaitState();
}

class AsyncAwaitState extends State{
  SandGlass clock = SandGlass();
  bool isZero = false;

  _reDrawWidget() async{
    if(clock.time() == -1){return;};
    await new Future.delayed(const Duration(milliseconds: 300));
    setState(() {});
  }

  @override
  void initState() {
    clock.tick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _reDrawWidget();

    if(!_isZero) {
      return Scaffold(
          appBar: AppBar(title: Text('Screen')),
          body: Column(
            children: <Widget>[
              Center(child: Text('time is: ${clock.time()}'),),
            ],
          ));
    }else{
      return Scaffold(
          appBar: AppBar(title: Text('Screen')),
          body: Column(
            children: <Widget>[
           AlertDialog(
            title: Text('Ваш ответ:'),
            actions: [
            FlatButton(
              onPressed: () {Navigator.pop(context);},
              child: Text('Больше'),
            ),
            FlatButton(
              onPressed: () {Navigator.pop(context);},
              child: Text('Меньше'),
          ),
        ],
      ),
              Center(child: Text('time is: ${clock.time()}'),),
            ],
          ));
    }

  }
}