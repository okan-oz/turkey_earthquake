import 'package:flutter/material.dart';
import 'package:turkey_earthquake/helper/text_const.dart';
import 'package:turkey_earthquake/helper/utils.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                  
                    Icons.filter,
                    color: Colors.white,
                    size: 100.0,
                  ),
                  Text(
                    ConstText.myAppTitle,
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Anasayfa'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.perm_device_information),
            title: Text('Filtrele'),
            trailing: Icon(Icons.arrow_drop_down),
            children: <Widget>[
              _createFilter(1.0),
              _createFilter(3.0),
              _createFilter(4.0),
              _createFilter(5.0),
              _createFilter(6.0),
              _createFilter(7.0),

            ],
          ),
          ListTile(
            leading: Icon(Icons.local_laundry_service),
            title: Text('Hizmetler'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, "/hizmetler");
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Galeri'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, "/galeri");
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Nasıl Yapıyoruz'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, "/nasilyapiyoruz");
            },
          ),
          ListTile(
            leading: Icon(Icons.keyboard),
            title: Text('Ücret Hesapla'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, "/ucrethesapla");
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('İletişim'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, "/iletisim");
            },
          ),
        ],
      ),
    );
  }

  Widget _createFilter(double mag) {
    return Center(
      child: Card(
          elevation: 4,
          child: Container(
              decoration: BoxDecoration(
                color:Utils.DecideListTileColor(mag),
                border: Border.all(
                  color: Utils.DecideListTileColor(mag),
                ),
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
              height: 40,
              child: Center(
                child: ListTile(
                  leading: Center(
                    child: CircleAvatar(
                      radius: 20.0,
                      child: Text(
                        mag.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      backgroundColor: Utils.DecideListTileColor(mag),
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => DetailScreen(eq)),
                    // );
                  },
                ),
              ))),
    );
  }
}
