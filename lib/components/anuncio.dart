import "package:flutter/material.dart";

class AnuncioMedico extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Row(//mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: <Widget>[
                            Text(
                              "Bruno Mendonça",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:20),
                              child: Text(
                                "Santo Angelo",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Padding(
                               padding: const EdgeInsets.only(top:20,bottom: 10),
                              child: Text(
                                "Dermatologista",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    
                    child: Text(
                      "Horários:",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),

                  )
                ]),
          ),
        ),
      ),
    );
  }
}
