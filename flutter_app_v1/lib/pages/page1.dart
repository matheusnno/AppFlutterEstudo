import 'package:flutter/material.dart';

//Stateless - Não muda de estado. Não é possível recarregar o conteúdo da tela
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Center(
          child: _button("Voltar", "Voltar para Tela Inicial", context),
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
//        _button("Btn 1", "Clicou no Botão 1!"),
//        _button("Btn 2", "Clicou no Botão 2!"),
//        _button("Btn 3", "Clicou no Botão 3!"),
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

  _button(String caption, String returnString, BuildContext context) {
    return RaisedButton(
        color: Colors.blue,
        child: Text(
          caption,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        onPressed: () => _onClickOk(context));
  }

  void _onClickOk(BuildContext context) {
    Navigator.pop(context, "Voltou da Page 1");
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