import 'package:flutter/material.dart';
import 'package:medico/cadastro.dart';

class ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget createButtonPush(String text, BuildContext btnContext, String rota) {
    return Material(
      child: Container(
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFb0feba),

            // Color(0xFF7fbb66),

            Color(0xFF007400),
          ]),
          border: Border(
            top: BorderSide(width: 2.0, color: Color(0xFF009f00)),
            left: BorderSide(width: 2.0, color: Color(0xFF009f00)),
            right: BorderSide(width: 2.0, color: Color(0xFF009f00)),
            bottom: BorderSide(width: 2.0, color: Color(0xFF009f00)),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // color: Color(0xFF7fbb66),
        ),
        child: SizedBox.expand(
          child: FlatButton(
            onPressed: () {
              /*Navigator.push(btnContext,
              MaterialPageRoute(builder: (btnContext) => Cadastro())
              );*/
              Navigator.pushNamed(btnContext, rota);
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Beauty',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createButtonPushTextBlack(
      String text, BuildContext btnContext, String rota) {
    return Material(
      color: Color(0xFFdcdcdc),
      child: Container(
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFb0feba),

            // Color(0xFF7fbb66),

            Color(0xFF007400),
          ]),
          border: Border(
            top: BorderSide(width: 2.0, color: Color(0xFF009f00)),
            left: BorderSide(width: 2.0, color: Color(0xFF009f00)),
            right: BorderSide(width: 2.0, color: Color(0xFF009f00)),
            bottom: BorderSide(width: 2.0, color: Color(0xFF009f00)),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // color: Color(0xFF7fbb66),
        ),
        child: SizedBox.expand(
          child: FlatButton(
            onPressed: () {
              /*Navigator.push(btnContext,
              MaterialPageRoute(builder: (btnContext) => Cadastro())
              );*/
              Navigator.pushNamed(btnContext, rota);
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Beauty',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createButtonTextGreen(
      String text, BuildContext btnContext, String rota, double h, double f) {
    return Material(
      child: Container(
        height: h,
        alignment: Alignment.centerLeft,
        child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(btnContext, rota);
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: f,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6fed84),
              ),
            )),
      ),
    );
  }

  Widget createButtonTextGreenUnderline(
      String text, BuildContext btnContext, String rota, double h, double f) {
    return Material(
      child: Container(
        height: h,
        alignment: Alignment.centerLeft,
        child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(btnContext, rota);
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: f,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.double,
                color: Color(0xFF6fed84),
              ),
            )),
      ),
    );
  }

  Widget createButtonPushWhite(
      String text, BuildContext btnContext, String rota) {
    return Material(
      color: Color(0xFFdcdcdc),
      child: Container(
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.black),
            left: BorderSide(width: 1.0, color: Colors.black),
            right: BorderSide(width: 1.0, color: Colors.black),
            bottom: BorderSide(width: 1.0, color: Colors.black),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SizedBox.expand(
          child: FlatButton(
            onPressed: () {
              /*Navigator.push(btnContext,
              MaterialPageRoute(builder: (btnContext) => Cadastro())
              );*/

              Navigator.pushNamed(btnContext, rota);
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Beauty',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
} // classe
