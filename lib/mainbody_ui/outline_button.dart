import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {

 
String buttonText;
Icon icon;
  GestureTapCallback onTap;


CustomOutlineButton(this.buttonText,this.icon,this.onTap);

  @override
  Widget build(BuildContext context) {
    OutlineButton(
        onPressed: onTap,
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: icon),
            Align(
                alignment: Alignment.center,
                child: Text(
                 buttonText,
                  textAlign: TextAlign.center,
                ))
          ],
        ),
        highlightedBorderColor: Colors.orange,
        color: Colors.green,
         
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)));
  }
}
