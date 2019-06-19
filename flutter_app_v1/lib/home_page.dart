import 'package:flutter/material.dart';
import 'package:flutter_app_v1/pages/page1.dart';

import 'pages/page2.dart';
import 'pages/page3.dart';

class HomePageAntiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeiro App Flutter"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Center(
          child: _listView(),
        ));
  }

  _listView() {
    return ListView(
      children: <Widget>[
        _text("Texto 1"),
        _img("assets/images/dogs1.jpg"),
        _img("assets/images/dogs2.jpg"),
        _img("assets/images/dogs3.jpg"),
        _img("assets/images/dogs4.jpg"),
        _img("assets/images/dogs5.jpg"),
        _row(),
      ],
    );
  }

  _pageView() {
    return Padding(
        padding: EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: SizedBox(
          height: 300,
          child: PageView(
            children: <Widget>[
              _img("assets/images/dogs1.jpg"),
              _img("assets/images/dogs2.jpg"),
              _img("assets/images/dogs3.jpg"),
              _img("assets/images/dogs4.jpg"),
              _img("assets/images/dogs5.jpg"),
            ],
          ),
        ));
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _button("Btn 1", "Clicou no Botão 1!"),
        _button("Btn 2", "Clicou no Botão 2!"),
        _button("Btn 3", "Clicou no Botão 3!"),
      ],
    );
  }

  _column() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _text("Texto 1"),
        _pageView(),
        _row(),
      ],
    );
  }

  _button(String caption, String returnString) {
    return RaisedButton(
        color: Colors.blue,
        child: Text(
          caption,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        onPressed: () => _onClickOk(returnString));
  }

  void _onClickOk(String msg) {
    print(msg);
  }

  _text(String txt) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }
}

//Stateful - Muda de estado. É possível recarregar o conteúdo da tela
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Toda classe Stateful implementa o State
class _HomePageState extends State<HomePage> {
  String _msg = "Não Clicou";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeiro App Flutter"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Center(
        child: _column(),
      ),
    );
  }

  _listView() {
    return ListView(
      children: <Widget>[
        _text(),
        _img("assets/images/dogs1.jpg"),
        _img("assets/images/dogs2.jpg"),
        _img("assets/images/dogs3.jpg"),
        _img("assets/images/dogs4.jpg"),
        _img("assets/images/dogs5.jpg"),
        _row(),
      ],
    );
  }

  _pageView() {
    return Padding(
        padding: EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: SizedBox(
          height: 300,
          child: PageView(
            children: <Widget>[
              _img("assets/images/dogs1.jpg"),
              _img("assets/images/dogs2.jpg"),
              _img("assets/images/dogs3.jpg"),
              _img("assets/images/dogs4.jpg"),
              _img("assets/images/dogs5.jpg"),
            ],
          ),
        ));
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _button("Page 1", "Clicou no Botão 1!", () => _onClickPage(Page1())),
        _button("Page 2", "Clicou no Botão 2!", () => _onClickPage(Page2())),
        _button("Page 3", "Clicou no Botão 3!", () => _onClickPage(Page3())),
      ],
    );
  }

  _column() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _text(),
        _pageView(),
        _row(),
      ],
    );
  }

  _button(String caption, String returnString, function()) {
    return RaisedButton(
        color: Colors.blue,
        child: Text(
          caption,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () => function());
  }

  void _onClickOk(String msg) {
    //Forçar o flutter a redesenhar a tela
    setState(() {
      _msg = msg;
    });
  }

  void _onClickPage1() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Page1();
    }));
  }

  void _onClickPage2() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Page2();
    }));
  }

  void _onClickPage3() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Page3();
    }));
  }

  void _onClickPage(Widget page) async{
    String valFromPage = await Navigator.push(context, MaterialPageRoute(builder: (context){
      return page;
    }));

    if (valFromPage != null) {
      setState(() {
        _msg = valFromPage;
      });
    }
  }

  _text() {
    return Text(
      _msg,
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }
}
