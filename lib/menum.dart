import "package:flutter/material.dart";

class Menum extends StatelessWidget {
  //ainda não implementado;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '{Menu M}',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Beauty',
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
