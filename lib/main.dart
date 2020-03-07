import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Calculator.dart';
import 'package:flutter_app/UnlessListView.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';
import 'package:validators/sanitizers.dart';

class NewsBox extends StatelessWidget {
  final String _title;
  final String _text;
  String _imageurl;
  int _num;
  bool _like;

  NewsBox(this._title, this._text,
      {String imageurl, int num = 0, bool like = false}) {
    _imageurl = imageurl;
    _num = num;
    _like = like;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageurl != null && _imageurl != '')
      return new Container(
        color: Colors.black12,
        height: 100.0,
        child: new Row(children: [
          new Image.network(_imageurl,
              width: 100.0, height: 100.0, fit: BoxFit.cover),
          new Expanded(
              child: new Container(
                  padding: new EdgeInsets.all(5.0),
                  child: new Column(children: [
                    new Text(_title,
                        style: new TextStyle(fontSize: 20.0),
                        overflow: TextOverflow.ellipsis),
                    new Expanded(
                        child: new Text(_text,
                            softWrap: true, textAlign: TextAlign.justify))
                  ]))),
          new NewsBoxFavourit(_num, _like)
        ]),
      );
    return new Container(
      child: new Row(
        children: [
          new Expanded(
              child: new Container(
                  padding: new EdgeInsets.all(5.0),
                  child: new Column(children: [
                    new Text(_title,
                        style: TextStyle(fontSize: 20.0),
                        overflow: TextOverflow.ellipsis),
                    new Expanded(
                        child: new Text(_text,
                            softWrap: true, textAlign: TextAlign.justify))
                  ]))),
          new NewsBoxFavourit(_num, _like)
        ],
      ),
    );
  }
}
class NewsBoxFavourit extends StatefulWidget {
  final int _num;
  final bool _like;

  NewsBoxFavourit(this._num, this._like);

  @override
  createState() => new NewsBoxFavoriteState(_num, _like);
}
class NewsBoxFavoriteState extends State<NewsBoxFavourit> {
  int num;
  bool like;

  NewsBoxFavoriteState(this.num, this.like);

  void pressButton() {
    setState(() {
      like = !like;

      if (like)
        num++;
      else
        num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(children: [
      new Expanded(
          child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new Text('В избранном $num', textAlign: TextAlign.center),
            new IconButton(
                icon: new Icon(like ? Icons.star : Icons.star_border,
                    size: 30.0, color: Colors.blue[500]),
                onPressed: pressButton)
          ],
        ),
      ))
    ]);
    return null;
  }
}

class MyBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: [
          new Text('Hello World!'),
          new FlatButton(
            onPressed: () async {
              const url = 'https://flutter.su';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text('Open Url'),
            color: Colors.red,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}

class MyList extends StatefulWidget {

  @override
  createState() => new MyListState();
}
class MyListState extends State<MyList>{
  @override
  Widget build(BuildContext context) {
    return new ListView(children: <Widget>[
      new Text('0000'),
      new MyBody(),
      new Divider(),

      new Text ('0001'),
      new NewsBox('Hello', 'Hello world',
        imageurl: 'https://flutter.su/favicon.png', num: 10),
      new Divider(),

      new Text ('0002'),
    ]);
  }
}

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          appBar: new AppBar(title: const Text('Ебаный калькулятор')),
          body: new Calculator(),
      )
  ));
}
