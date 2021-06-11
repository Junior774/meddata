import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecuperarSenha extends StatefulWidget {

  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  TextEditingController _controllerRecuperar = TextEditingController();
  String _mensagemErro = "";
  _enviarEmail(){
    String email = _controllerRecuperar.text;
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.sendPasswordResetEmail(email: email)
    .then((value){
      setState(() {
        _mensagemErro="email enviado, verifique seu email";
      });
       })
    .catchError((erro){
    setState(() {
       _mensagemErro = "Ocorreu um erro, certifique-se que o email está correto e tente novamente";
    }); 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '{Recuperar Senha}',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Beauty',
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body:Stack(
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
             padding: const EdgeInsets.only(top:100,left:40,right:40),
             child: Container(
                    color: Color(0xFFdcdcdc),
                    child: TextFormField(
                      controller: _controllerRecuperar,
                      maxLength: 50,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xFF149019), width: 2.0),
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 5, bottom: 0, top: 0),
                        labelText: "Digite seu email:",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
           ),
           Padding(
             padding: const EdgeInsets.only(top:220,left:60,right:60),
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
                        
                        _enviarEmail();
                      },
                      child: Text(
                        "Enviar",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Beauty',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
           ),
            Padding(
              padding: const EdgeInsets.only(top: 300,left: 70,right: 60),
              child: Text(
                _mensagemErro,
                style: TextStyle(fontSize: 16,color: Colors.red),
              ),
            ),
                       Padding(
             padding: const EdgeInsets.only(top:400,left:60,right:60),
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

                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      },
                      child: Text(
                        "Voltar ao Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Beauty',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
           ),
        ]
      ),

    );
  }
}
