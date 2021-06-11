import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/button.dart';
import 'components/text_fields.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class CadastroMedico2 extends StatefulWidget {
  // Map med;

//  CadastroMedico2({this.med}); aprendi a passar coisas entre telas,widget pra acessar
  @override
  _CadastroMedico2State createState() => _CadastroMedico2State();
}

class _CadastroMedico2State extends State<CadastroMedico2> {
  TextEditingController _controllerEspecialidade = TextEditingController();

  TextEditingController _controllerEndereco = TextEditingController();

  TextEditingController _controllerCnpj = TextEditingController();

  TextEditingController _controllerCidade = TextEditingController();
  String dropdownValue;
  String dropdownValue2;
  final Color dropdownColor = Color(0xFF000028);

  String _mensagemErro = "";

  _validarCampos() async {
    String especialidade = _controllerEspecialidade.text;
    String endereco = _controllerEndereco.text;
    String cnpj = _controllerCnpj.text;
    String cidade = _controllerCidade.text;
    Firestore db = Firestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser medicoLogado = await auth.currentUser();
    db.collection("medicos").document(medicoLogado.uid).updateData(
        {"especialidade": especialidade, "endereco": endereco, "cnpj": cnpj, "cidade" : cidade});
  }

  TextFieldLogin textf = TextFieldLogin();

  ButtonLogin btn = ButtonLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '{CadastroM2}',
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
              /* Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                    color: Color(0xFFdcdcdc),
                    child: TextFormField(
                      controller: _controllerEspecialidade,
                      maxLength: 50,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xFF149019), width: 2.0),
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                        labelText: "Especialidade",
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
              ),*/

              Text(
                "Cidade:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, right: 0, left: 0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF149019),
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: DropdownButton<String>(
                    hint: Text("Cidade"),
                    value: dropdownValue2,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 28,

                    elevation: 16,
                    isExpanded: true,
                    underline: SizedBox(),
                    //  dropdownColor: Colors.blue,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    iconEnabledColor: Colors.black,

                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue2 = newValue;
                        _controllerCidade.text = newValue;
                      });
                    },
                    items: <String>[
                      'Santo Ângelo',
                      'Santa Rosa',
                      'Giruá',
                      'Passo Fundo'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Text(
                  "Especialidade:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
            ),
              Padding(
                padding: const EdgeInsets.only(top: 0, right: 0, left: 0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF149019),
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: DropdownButton<String>(
                    hint: Text("Especialidade"),
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 28,

                    elevation: 16,
                    isExpanded: true,
                    underline: SizedBox(),
                    //  dropdownColor: Colors.blue,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    iconEnabledColor: Colors.black,

                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        _controllerEspecialidade.text = newValue;
                      });
                    },
                    items: <String>[
                      'Ortopedista',
                      'Cirurgião',
                      'Dermatologista',
                      'Anestesista',
                      'Hematologista',
                      'Mastologista',
                      'Oncologista'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                    color: Color(0xFFdcdcdc),
                    child: TextFormField(
                      controller: _controllerCnpj,
                      maxLength: 18,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xFF149019), width: 2.0),
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                        labelText: "CNPJ do Consutório",
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
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  controller: _controllerEndereco,
                  maxLength: 50,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          new BorderSide(color: Color(0xFF149019), width: 2.0),
                    ),
                    contentPadding:
                        const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                    labelText: "Endereço do Consultório",
                    labelStyle: TextStyle(
                      color: Colors.black,
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
                padding: const EdgeInsets.only(top: 50),
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
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/menum', (route) => false);
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
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
