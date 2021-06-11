import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConsultasMarcadasP extends StatefulWidget {
  @override
  _ConsultasMarcadasPState createState() => _ConsultasMarcadasPState();
}

class _ConsultasMarcadasPState extends State<ConsultasMarcadasP> {
  final _controllerStream = StreamController<QuerySnapshot>.broadcast();
  String _controllerIdUsu;

  void initState() {
    super.initState();

    _adicionarListenerConsultas();
  }

  _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    _controllerIdUsu = usuarioLogado.uid;
  }

  Future<Stream<QuerySnapshot>> _adicionarListenerConsultas() async {
    await _recuperarDadosUsuario();
    Firestore db = Firestore.instance;
    Stream<QuerySnapshot> stream = db
        .collection("consultas")
        .where('idusu', isEqualTo: _controllerIdUsu)
        .snapshots();

    stream.listen((dados) {
      _controllerStream.add(dados);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '{Consultas Marcadas}',
          style: TextStyle(
            fontSize: 30,
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
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: StreamBuilder(
                stream: _controllerStream.stream,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                    case ConnectionState.done:
                      QuerySnapshot querySnapshot = snapshot.data;

                      if (querySnapshot.documents.length == 0) {
                        return Container(
                          padding: EdgeInsets.all(25),
                          child: Text(
                            "Nenhum anúncio! :( " + _controllerIdUsu,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        );
                      }

                      return ListView.builder(
                          itemCount: querySnapshot.documents.length,
                          itemBuilder: (_, indice) {
                            List<DocumentSnapshot> medicos =
                                querySnapshot.documents.toList();
                            DocumentSnapshot documentSnapshot = medicos[indice];

                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 2),
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "Horário: " +
                                                          documentSnapshot[
                                                              "horario"],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20),
                                                      child: Text(
                                                        "Cidade: " +
                                                            documentSnapshot[
                                                                "cidade"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              bottom: 10),
                                                      child: Text(
                                                        "Médico(a): " +
                                                            documentSnapshot[
                                                                "nomemed"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            );
                          });
                  }
                  return Container();
                }),
          )
        ],
      ),
    );
  }
}
