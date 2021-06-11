import 'package:flutter/material.dart';

import 'components/button.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  ButtonLogin btn = ButtonLogin();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '{Cadastro}',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Beauty',
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/tela_cadastro.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(130, 50, 0, 0),
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(150, 190, 0, 0),
            child: Text(
              'Você é:',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250, left: 50, right: 60),
            child:
                btn.createButtonPushWhite('Médico', context, "/cadastro_medico"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(180, 315, 0, 0),
            child: Text(
              'Ou:',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 360, left: 50, right: 60),
            child: btn.createButtonPushWhite(
                'Paciente', context, "/cadastro_paciente"),
          ),
        ],
      ),
    );
  }
}
