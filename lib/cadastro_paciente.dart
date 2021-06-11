import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/components/text_fields.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:medico/menup.dart';
import 'package:medico/model/usuario.dart';
import 'components/button.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class CadastroPaciente extends StatefulWidget {
  @override
  _CadastroPacienteState createState() => _CadastroPacienteState();
}

class _CadastroPacienteState extends State<CadastroPaciente> {
  TextField teste;

  TextEditingController _controllerNome = TextEditingController();

  TextEditingController _controllerCpf = TextEditingController();

  TextEditingController _controllerEmail = TextEditingController();

  TextEditingController _controllerCelular = TextEditingController();

  TextEditingController _controllerSenha = TextEditingController();

  TextEditingController _controllerConfirma = TextEditingController();

  String _mensagemErro = "";

  TextFieldLogin textf = TextFieldLogin();

  ButtonLogin btn = ButtonLogin();

  @override
  _validarCampos() {
    String nome = _controllerNome.text;
    String cpf = _controllerCpf.text;
    String email = _controllerEmail.text;
    String celular = _controllerCelular.text;
    String senha = _controllerSenha.text;
    String confirma = _controllerConfirma.text;
    if (nome.isNotEmpty && nome.length > 2) {
      if (cpf.isNotEmpty && cpf.length > 10) {
        if (email.isNotEmpty && email.contains("@")) {
          if (celular.isNotEmpty && celular.length > 10) {
            if (senha.isNotEmpty && senha.length > 5) {
              if (confirma == senha) {
                setState(() {
                 // _mensagemErro = "sucesso";
                });
                Usuario usuario = Usuario();
                usuario.nome = nome;
                usuario.cpf = cpf;
                usuario.email = email;
                usuario.celular = celular;
                usuario.senha = senha;
                _cadastrarUsuario(usuario);
               
              } else {
                setState(() {
                  _mensagemErro = "As senhas não são iguais";
                });
              }
            } else {
              setState(() {
                _mensagemErro = "Senha não pode ser menor que 6 caractéres";
              });
            }
          } else {
            setState(() {
              _mensagemErro = "Preencha o Celular corretamente";
            });
          }
        } else {
          setState(() {
            _mensagemErro = "Preencha o email corretamente";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha o cpf corretamente";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o nome corretamente";
      });
    }
  }

  _cadastrarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
    //  setState(() {
      //  _mensagemErro = "cadastrado";
      //});
       Firestore db = Firestore.instance;
       db.collection("usuarios")
       .document(firebaseUser.user.uid)
       .setData(usuario.toMap());
        Navigator.of(context).pushNamedAndRemoveUntil('/menup', (route) => false);
    }).catchError((error) {
      print("error f:" + error.toString());
      _mensagemErro = "erro ao cadastrar";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '{CadastroP}',
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
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: ListView(children: <Widget>[
              Container(
                  color: Color(0xFFdcdcdc),
                  child: TextFormField(
                    controller: _controllerNome,
                    maxLength: 50,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Color(0xFF149019), width: 2.0),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                      labelText: "Nome Completo:",
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
              Container(
                  color: Color(0xFFdcdcdc),
                  child: TextFormField(
                    controller: _controllerCpf,
                    maxLength: 14,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      /*  prefixIcon: Icon(
               icone.icon,
              // color: Colors.black,
             ),
  */

                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Color(0xFF149019), width: 2.0),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                      labelText: "CPF",
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
              Container(
                  color: Color(0xFFdcdcdc),
                  child: TextFormField(
                    controller: _controllerEmail,
                    maxLength: 50,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Color(0xFF149019), width: 2.0),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                      labelText: "Email: ",
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
              Container(
                
                  color: Color(0xFFdcdcdc),
                  child: TextFormField(
                    controller: _controllerCelular,
                    maxLength: 15,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      /*  prefixIcon: Icon(
               icone.icon,
              // color: Colors.black,
             ),
  */

                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Color(0xFF149019), width: 2.0),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                      labelText: "Celular",
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
              Container(
                  color: Color(0xFFdcdcdc),
                  child: TextFormField(
                    controller: _controllerSenha,
                    maxLength: 16,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    decoration: InputDecoration(
                      /*  prefixIcon: Icon(
               icone.icon,
              // color: Colors.black,
             ),
  */

                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Color(0xFF149019), width: 2.0),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                      labelText: "Senha",
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
              Container(
                  color: Color(0xFFdcdcdc),
                  child: TextFormField(
                    controller: _controllerConfirma,
                    maxLength: 16,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    decoration: InputDecoration(
                      /*  prefixIcon: Icon(
               icone.icon,
              // color: Colors.black,
             ),
  */

                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Color(0xFF149019), width: 2.0),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                      labelText: "Confirma Senha",
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
              Container(
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
                      "Próximo",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Beauty',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _mensagemErro,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
