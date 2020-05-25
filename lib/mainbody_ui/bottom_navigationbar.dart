import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.loyalty,
              color: Colors.red,
            ),
            title: Text(
              "Beğen",
              style: TextStyle(color: Colors.red),
            )),
        BottomNavigationBarItem(
            activeIcon: FlatButton(
              child: Text("Filtreleri Kaldır"),
              onPressed: (){
                debugPrint("Filtreli kaldır butonuna basldı.");
              },
            ),
            icon: Icon(Icons.filter, color: Colors.blue),
            title: Text("Filtreleri Kaldır")),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.green,
            ),
            title: Text("Profilim")),
      ],
    );
  }
}
