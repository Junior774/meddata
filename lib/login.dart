import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medico/cadastro.dart';

import 'components/button.dart';
import 'components/text_fields.dart';
import 'model/usuario.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextFieldLogin textFields = TextFieldLogin();
  ButtonLogin btn = ButtonLogin();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos() {
    String email = _controllerEmail.text;

    String senha = _controllerSenha.text;

    if (senha.isNotEmpty) {
     /* setState(() {
        _mensagemErro = "sucesso";
      });*/
      Usuario usuario = Usuario();

      usuario.email = email;

      usuario.senha = senha;
      _logarUsuario(usuario);
    } else {
      setState(() {
        _mensagemErro = "Dados não conferemm";
      });
    }
  }

  _logarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
            email: usuario.email,
             password: usuario.senha)
        .then((firebaseUser) {
      Navigator.pushReplacementNamed(context, "/menup");
    }).catchError((error) {
      setState(() {
        _mensagemErro = "Erro no login";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_login.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(120, 50, 0, 0),
          child: Container(
            width: 168,
            height: 168,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 280),
          child: Container(
            alignment: Alignment.topCenter,
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Beauty',
                color: Color(0xFF6fed84),
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 320),
          child: Scaffold(
            body: ListView(children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),

                //    'Digite seu E-mail aqui', Icon(Icons.email), 20),
                child: TextFormField(
                  controller: _controllerEmail,
                  maxLength: 50,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      // color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          new BorderSide(color: Color(0xFF149019), width: 3.0),
                    ),
                    contentPadding:
                        const EdgeInsets.only(left: 15.0, bottom: 0, top: 0),
                    labelText: 'Digite seu E-mail aqui',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
                child: TextFormField(
                  controller: _controllerSenha,
                  maxLength: 16,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,

                      // color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          new BorderSide(color: Color(0xFF149019), width: 3.0),
                    ),
                    contentPadding:
                        const EdgeInsets.only(left: 15.0, bottom: 0, top: 0),
                    labelText: "Digite sua senha aqui",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 500, left: 50, right: 60),
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
                  _validarCampos();
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Beauty',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 570, left: 60),
          child: Text(
            _mensagemErro,
            style: TextStyle(fontSize: 15, color: Colors.red),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 597, left: 90),
          child: Text(
            'Recuperar senha?',
            style: TextStyle(fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 589, left: 210),
          child: btn.createButtonTextGreenUnderline(
            'Clique aqui',
            context,
            '/recuperar_senha',
            30,
            18,
          ), //*(texto, height, fontSize)
        ),
        Padding(
          padding: const EdgeInsets.only(top: 625, left: 86),
          child: btn.createButtonTextGreen('Criar Conta', context, "/cadastro",
              40, 40), //*(texto, height, fontSize)
        ),
      ]),
    );
  }
}
