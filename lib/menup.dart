import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medico/components/button.dart';

class MenuP extends StatefulWidget {
  @override
  _MenuPState createState() => _MenuPState();
}

class _MenuPState extends State<MenuP> {
  ButtonLogin btn = ButtonLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '{Menu}',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Beauty',
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        body: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/tela_cadastro.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 50, right: 56),
            child:
                btn.createButtonPushWhite('Procura Consultório', context, "/procura_consultorio"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 50, right: 60),
            child:
                btn.createButtonPushWhite('Consultas Marcadas', context, "/consultas_marcadasp"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250, left: 50, right: 60),
            child: btn.createButtonPushWhite('Mensagens', context, "/"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350, left: 50, right: 60),
            child: btn.createButtonPushWhite('Configurações', context, "/"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 450, left: 50, right: 60),
            child: btn.createButtonPushWhite('Sair', context, "/"),
          ),
        ]));
  }
}
