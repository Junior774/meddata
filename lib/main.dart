import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:medico/consultas_marcadasp.dart';
import 'package:medico/procura_consultorio.dart';
import 'cadastro.dart';
import 'menum.dart';
import 'recuperar_senha.dart';
import 'cadastro_medico.dart';
import 'cadastro_medico2.dart';
import "cadastro_paciente.dart";

import 'Home.dart';
import 'login.dart';
import 'menup.dart';

void main() async {
  runApp(MaterialApp(
    routes: {
      "/cadastro": (context) => Cadastro(),
      "/cadastro_paciente": (context) => CadastroPaciente(),
       "/cadastro_medico": (context) => CadastroMedico(),
        "/cadastro_medico2": (context) => CadastroMedico2(),
        "/menup": (context) => MenuP(),
        "/menum": (context) => Menum(),
        "/recuperar_senha": (context) => RecuperarSenha(),
        "/procura_consultorio": (context) => ProcuraConsultorio(),
        "/consultas_marcadasp": (context) => ConsultasMarcadasP(),
    },
    title: 'Med Data',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: Login(),
  ));

  /* Firestore.instance.collection("usuarios")
  .document("009")
  .setData({
    "nome" : "nao sei",
    "idade" : "13"
  });*/
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
