import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  TextFieldLogin({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {}
  Widget teste(int y) {
    return Material();
  }

  Widget createTextField(String text) {
    return Material(
        child: Container(
      child: TextField(
        maxLength: 50,
        decoration: new InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: text,
          contentPadding:
              const EdgeInsets.only(left: 15.0, bottom: 0.0, top: .0),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(
              color: Colors.green,
            ),
            borderRadius: new BorderRadius.circular(0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.white),
            borderRadius: new BorderRadius.circular(10.7),
          ),
        ),
      ),
    ));
  }

  Widget createTextField2(String text, Icon icone, int f) {
    // f= fontSize

    return Material(
      child: Container(
          child: TextFormField(
        maxLength: 50,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icone.icon,
            // color: Colors.black,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF149019), width: 3.0),
          ),
          contentPadding: const EdgeInsets.only(left: 15.0, bottom: 0, top: 0),
          labelText: text,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        style: TextStyle(
          fontSize: 15,
        ),
      )),
    );
  }

  Widget createTextFieldPassword(String text, Icon icone, int f) {
    // f= fontSize

    return Material(
      child: Container(
          child: TextFormField(
        maxLength: 16,
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icone.icon,
            // color: Colors.black,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF149019), width: 3.0),
          ),
          contentPadding: const EdgeInsets.only(left: 15.0, bottom: 0, top: 0),
          labelText: text,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        style: TextStyle(
          fontSize: 15,
        ),
      )),
    );
  }

  Widget createTextField2Grey(String text, int f) {
    // f= fontSize

    return Material(
      child: Container(
          color: Color(0xFFdcdcdc),
          child: TextFormField(
             
            maxLength: f,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    new BorderSide(color: Color(0xFF149019), width: 2.0),
              ),
              contentPadding: const EdgeInsets.only(left: 0, bottom: 0, top: 0),
              labelText: text,
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
    );
  }

  Widget createTextField2GreyNumeros(String text, int f) {
    // f= fontSize

    return Material(
      child: Container(
          color: Color(0xFFdcdcdc),
          child: TextFormField(
            maxLength: f,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              /*  prefixIcon: Icon(
               icone.icon,
              // color: Colors.black,
             ),
  */

              enabledBorder: UnderlineInputBorder(
                borderSide:
                    new BorderSide(color: Color(0xFF149019), width: 2.0),
              ),
              contentPadding: const EdgeInsets.only(left: 0, bottom: 0, top: 0),
              labelText: text,
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
    );
  }

  Widget createTextField2GreyPassword(String text, int f) {
    // f= fontSize

    return Material(
      child: Container(
          color: Color(0xFFdcdcdc),
          child: TextFormField(
            maxLength: f,
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              /*  prefixIcon: Icon(
               icone.icon,
              // color: Colors.black,
             ),
  */

              enabledBorder: UnderlineInputBorder(
                borderSide:
                    new BorderSide(color: Color(0xFF149019), width: 2.0),
              ),
              contentPadding: const EdgeInsets.only(left: 0, bottom: 0, top: 0),
              labelText: text,
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
    );
  }

  Widget createTextField2GreyTentativa(String text, int f) {
    // f= fontSize

    return Material(
      child: Container(
          //  color: Color(0xFFdcdcdc),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 2.0, color: Color(0xFF149019)),
              left: BorderSide(width: 2.0, color: Color(0xFF149019)),
              right: BorderSide(width: 2.0, color: Color(0xFF149019)),
              bottom: BorderSide(width: 2.0, color: Color(0xFF149019)),
            ),
          ),
          child: TextFormField(
            maxLength: 50,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              /*  prefixIcon: Icon(
               icone.icon,
              // color: Colors.black,
             ),
  */

              enabledBorder: UnderlineInputBorder(
                borderSide:
                    new BorderSide(color: Color(0xFF149019), width: 2.0),
              ),

              contentPadding: const EdgeInsets.only(left: 0, bottom: 0, top: 0),
              labelText: text,
              counterText: "",
              // fillColor: Colors.lightBlue,
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
    );
  }
} //class
