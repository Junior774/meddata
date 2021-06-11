import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/anuncio.dart';
import 'model/consulta.dart';

class ProcuraConsultorio extends StatefulWidget  {
  @override
  _ProcuraConsultorioState createState() => _ProcuraConsultorioState();
}

class _ProcuraConsultorioState extends State<ProcuraConsultorio> {
  TextEditingController _controllerDoutor = TextEditingController();
  final _controller = StreamController<QuerySnapshot>.broadcast();
  String _controllerIdUsu;
  String _controllerIdMed;                         
   String   _controllerNomeMed;
   String      _controllerEndereco ;      
  String _controllerCidade;
  String   _controllerHorario;
  String dropdownValue;
  String dropdownValue2;
  final Color dropdownColor = Color(0xFF000028);
  Future<Stream<QuerySnapshot>> _adicionarListenerMedicos() async {
    Firestore db = Firestore.instance;
    Stream<QuerySnapshot> stream = db.collection("medicos").snapshots();
    stream.listen((dados) {
      _controller.add(dados);
    });
  }

  void initState() {
    super.initState();
    _adicionarListenerMedicos();
    _recuperarDadosUsuario();
  }
   _recuperarDadosUsuario() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    _controllerIdUsu = usuarioLogado.uid;
  }
 _validarCampos(String idmedi,String hora) async {
               Firestore db = Firestore.instance;
               DocumentSnapshot snapshot = await db.collection("medicos").document(idmedi).get();
               DocumentSnapshot snapshotUser = await db.collection("usuarios").document(_controllerIdUsu).get();
                Consulta consulta = Consulta();
                consulta.idMed= idmedi;       
                consulta.idUsu = _controllerIdUsu;
                consulta.horario = hora;
                consulta.cidade = snapshot["cidade"];
                consulta.endereco = snapshot["endereco"];
                consulta.nomeMed = snapshot["nome"];
                consulta.nomeUsu = snapshotUser["nome"];
               db.collection("consultas")
              .add(consulta.toMap());
  }
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '{Procure Consultórios}',
          style: TextStyle(
            fontSize: 30,
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
          padding: const EdgeInsets.only(top: 20, right: 230, left: 30),
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
          padding: const EdgeInsets.only(top: 20, right: 40, left: 220),
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
              hint: Text("Consultórios"),

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
          padding: const EdgeInsets.only(top: 100),
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection("medicos")
                  .where('cidade', isEqualTo: dropdownValue2)
                  .where('especialidade', isEqualTo: dropdownValue)
                  .snapshots(),
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
                          "Nenhum anúncio! :( ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    //  querySnapshot.metadata;
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
                                                  horizontal: 10, vertical: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "Nome: " +
                                                        documentSnapshot[
                                                            "nome"],
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
                                                      "Especialidade: " +
                                                          documentSnapshot[
                                                              "especialidade"],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 7),
                                                  child: Text(
                                                    "Aperte para marcar consulta",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: Container(
                                                    height: 40,
                                                    width: 83,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Color(0xFFb0feba),

                                                            // Color(0xFF7fbb66),

                                                            Color(0xFF007400),
                                                          ]),
                                                      border: Border(
                                                        top: BorderSide(
                                                            width: 2.0,
                                                            color: Color(
                                                                0xFF009f00)),
                                                        left: BorderSide(
                                                            width: 2.0,
                                                            color: Color(
                                                                0xFF009f00)),
                                                        right: BorderSide(
                                                            width: 2.0,
                                                            color: Color(
                                                                0xFF009f00)),
                                                        bottom: BorderSide(
                                                            width: 2.0,
                                                            color: Color(
                                                                0xFF009f00)),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                            
                                                    ),
                                                    child: SizedBox(
                                                      child: FlatButton(
                                                        onPressed: (){
                                                        
                                                            
                                                          
                                 
                                                          
              
                                                           _recuperarDadosUsuario();
                                                          _validarCampos(documentSnapshot.documentID, "Quarta\n08:00");
                                                          Navigator.pushReplacementNamed(context, '/consultas_marcadasp');
                                                        },
                                                        child: Text(
                                                          "Quarta 08:00",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            //  fontFamily: 'Beauty',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                 Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                    height: 40,
                                                    width: 83,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Color(0xFFb0feba),

                                                            // Color(0xFF7fbb66),

                                                            Color(0xFF007400),
                                                          ]),
                                                      border: Border(
                                                        top: BorderSide(
                                                            width: 2.0,
                                                            color: Color(
                                                                0xFF009f00)),
                                                        left: BorderSide(
                                                            width: 2.0,
                                                            color: Color(
                                                                0xFF009f00)),
                                                        right: BorderSide(
                                                            width: 2.0,
                                                            color: Color(
                                                                0xFF009f00)),
                                                        bottom: BorderSide(
                                                            width: 2.0,
                                                            color: Color(
                                                                0xFF009f00)),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                            
                                                    ),
                                                    child: SizedBox(
                                                      child: FlatButton(
                                                        onPressed: (){
                                                        
                                                            
                                                          
                                 
                                                          /*Navigator.push(btnContext,
              MaterialPageRoute(builder: (btnContext) => Cadastro())
              );*/
                                                           _recuperarDadosUsuario();
                                                          _validarCampos(documentSnapshot.documentID, "Sexta\n08:00");
                                                        },
                                                        child: Text(
                                                          "Sexta\n08:00",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            //  fontFamily: 'Beauty',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
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
        ),
      ]),
    );
  }
}
