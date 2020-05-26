import 'package:flutter/material.dart';
import 'package:turkey_earthquake/helper/text_const.dart';
import 'package:turkey_earthquake/helper/utils.dart';
import 'package:provider/provider.dart';
import 'package:turkey_earthquake/mainbody_ui/friendlyexception.dart';
import 'package:turkey_earthquake/models/filter.dart';
import 'package:flutter/foundation.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  static String _selectAllText = "Hepsini Seç";
  static String _deselectAllText = "Seçimleri kaldır";
  static String _doFilterText = "Filtrele";
  Color _expansionTileColor = Colors.grey.shade600;

  final TextStyle _filterTextStyle =
      TextStyle(color: Colors.black, fontSize: 15);

  String selectClearText = _selectAllText;
  bool _isAllSelect = true;
  bool chcbox1 = true;
  bool chcbox3 = true;
  bool chcbox4 = true;
  bool chcbox5 = true;
  bool chcbox6 = true;
  bool chcbox7 = true;
  bool chcbox8 = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    selectClearText = _isAllSelect == true ? _deselectAllText : _selectAllText;
    chcbox1 = context.read<Filters>().chcbox1;
    chcbox3 = context.read<Filters>().chcbox3;
    chcbox4 = context.read<Filters>().chcbox4;
    chcbox5 = context.read<Filters>().chcbox5;
    chcbox6 = context.read<Filters>().chcbox6;
    chcbox7 = context.read<Filters>().chcbox7;
    chcbox8 = context.read<Filters>().chcbox8;

    super.initState();
  }

  void selectClearTextFunc() {
    setState(() {
      if (_isAllSelect) {
        selectClearText = _selectAllText;
        changeStatus(false);
      } else {
        selectClearText = _deselectAllText;
        changeStatus(true);
      }
    });
  }

  void changeStatus(value) {
    chcbox1 = value;
    chcbox3 = value;
    chcbox4 = value;
    chcbox5 = value;
    chcbox6 = value;
    chcbox7 = value;
    chcbox8 = value;
    _isAllSelect = value;
  }

  void _sendFilter() {
    List<Filter> fItems = new List<Filter>();

    if (chcbox1) {
      fItems.add(Filter.createInstance(0.0, 1.0));
    }
    if (chcbox3) {
      fItems.add(Filter.createInstance(1.01, 3));
    }
    if (chcbox4) {
      fItems.add(Filter.createInstance(3.01, 4));
    }
    if (chcbox5) {
      fItems.add(Filter.createInstance(4.01, 5));
    }
    if (chcbox6) {
      fItems.add(Filter.createInstance(5.01, 6));
    }
    if (chcbox7) {
      fItems.add(Filter.createInstance(6.01, 7));
    }
    if (chcbox8) {
      fItems.add(Filter.createInstance(7.01, 15.0));
    }

    Filters filters = Filters();
    filters.items = fItems;
    filters.chcbox1 = chcbox1;
    filters.chcbox3 = chcbox3;
    filters.chcbox4 = chcbox4;
    filters.chcbox5 = chcbox5;
    filters.chcbox6 = chcbox6;
    filters.chcbox7 = chcbox7;
    filters.chcbox8 = chcbox8;

    context.read<Filters>().Update(filters);
    Navigator.pop(context, "/");
    Utils.ShowUpdateEqInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    ConstText.myAppTitle,
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 0, blurRadius: 0),
                ],
                image: DecorationImage(
                    image: AssetImage(
                      "assets/depremAppBar.jpg",
                    ),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 40,
            ),
            title: Text('Son Deprem Listesi',style: _filterTextStyle,),
            trailing: Icon(
              Icons.arrow_right,
              size: 40,
            ),
            onTap: () {
              //Navigator.pushNamed(context, "/");
              Navigator.pop(context, "/");
            },
          ),
          ExpansionTile(
            initiallyExpanded: true,
            backgroundColor: Colors.grey.shade300,
            leading: Icon(
              Icons.perm_device_information,
              color: _expansionTileColor,
              size: 40,
            ),
            title: Text('Filtrele',style: _filterTextStyle),
            trailing: Icon(
              Icons.arrow_drop_down,
              size: 40,
            ),
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  FlatButton(
                    color: Colors.grey.shade400,
                    child: Text(selectClearText),
                    onPressed: () {
                      selectClearTextFunc();
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  FlatButton(
                    color: Colors.grey.shade400,
                    child: Text(_doFilterText),
                    onPressed: () {
                      _sendFilter();
                    },
                  ),
                ],
              ),
              _createFilter(1.0, context, Filter.createInstance(0.0, 1.0)),
              _createFilter(3.0, context, Filter.createInstance(1.01, 3)),
              _createFilter(4.0, context, Filter.createInstance(3.01, 4)),
              _createFilter(5.0, context, Filter.createInstance(4.01, 5)),
              _createFilter(6.0, context, Filter.createInstance(5.01, 6)),
              _createFilter(7.0, context, Filter.createInstance(6.01, 7)),
              _createFilter(8.0, context, Filter.createInstance(7.01, 15)),
              SizedBox(
                height: 20,
              )
            ],
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.local_laundry_service,
          //     size: 40,
          //   ),
          //   title: Text('En Büyük Depremler',style: _filterTextStyle,),
          //   trailing: Icon(
          //     Icons.arrow_right,
          //     size: 40,
          //   ),
          //   onTap: () {
          //     // Navigator.pushNamed(context, "/hizmetler");
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.image,
          //     size: 40,
          //   ),
          //   title: Text('Galeri',style: _filterTextStyle,),
          //   trailing: Icon(
          //     Icons.arrow_right,
          //     size: 40,
          //   ),
          //   onTap: () {
          //     //Navigator.pushNamed(context, "/galeri");
          //   },
          // ),
        ],
      ),
    ));
  }

  Widget _createFilter(double mag, BuildContext context, Filter f) {
    if (mag == 1.0) {
      return Center(
        child: Card(
            elevation: 4,
            child: Container(
                decoration: BoxDecoration(
                  color: Utils.DecideListTileColor(mag),
                  border: Border.all(
                      //color: //Utils.DecideListTileColor(mag),
                      ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 40,
                child: Center(
                    child: Row(
                  children: <Widget>[
                    Switch(
                        value: chcbox1,
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            chcbox1 = newValue;
                          });
                        }),
                    Text(
                      '0 ile 1 arasındakiler',
                      style: _filterTextStyle,
                    )
                  ],
                )))),
      );
    } else if (mag == 3.0) {
      return Center(
        child: Card(
            elevation: 4,
            child: Container(
                decoration: BoxDecoration(
                  color: Utils.DecideListTileColor(mag),
                  border: Border.all(
                      //color: //Utils.DecideListTileColor(mag),
                      ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 40,
                child: Center(
                    child: Row(
                  children: <Widget>[
                    Switch(
                        value: chcbox3,
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            chcbox3 = newValue;
                          });
                        }),
                    Text(
                      '1 ile 3 arasındakiler',
                      style: _filterTextStyle,
                    ),
                  ],
                )))),
      );
    } else if (mag == 4.0) {
      return Center(
        child: Card(
            elevation: 4,
            child: Container(
                decoration: BoxDecoration(
                  color: Utils.DecideListTileColor(mag),
                  border: Border.all(
                      //color: //Utils.DecideListTileColor(mag),
                      ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 40,
                child: Center(
                    child: Row(
                  children: <Widget>[
                    Switch(
                        value: chcbox4,
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            chcbox4 = newValue;
                          });
                          Text('Remember me');
                        }),
                    Text(
                      '3 ile 4 arasındakiler',
                      style: _filterTextStyle,
                    )
                  ],
                )))),
      );
    } else if (mag == 5.0) {
      return Center(
        child: Card(
            elevation: 4,
            child: Container(
                decoration: BoxDecoration(
                  color: Utils.DecideListTileColor(mag),
                  border: Border.all(
                      //color: //Utils.DecideListTileColor(mag),
                      ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 40,
                child: Center(
                    child: Row(
                  children: <Widget>[
                    Switch(
                        value: chcbox5,
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            chcbox5 = newValue;
                          });
                        }),
                    Text(
                      '4 ile 5 arasındakiler',
                      style: _filterTextStyle,
                    )
                  ],
                )))),
      );
    } else if (mag == 6.0) {
      return Center(
        child: Card(
            elevation: 4,
            child: Container(
                decoration: BoxDecoration(
                  color: Utils.DecideListTileColor(mag),
                  border: Border.all(
                      //color: //Utils.DecideListTileColor(mag),
                      ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 40,
                child: Center(
                    child: Row(
                  children: <Widget>[
                    Switch(
                        value: chcbox6,
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            chcbox6 = newValue;
                          });
                        }),
                    Text(
                      '5 ile 6 arasındakiler',
                      style: _filterTextStyle,
                    )
                  ],
                )))),
      );
    } else if (mag == 7.0) {
      return Center(
        child: Card(
            elevation: 4,
            child: Container(
                decoration: BoxDecoration(
                  color: Utils.DecideListTileColor(mag),
                  border: Border.all(
                      //color: //Utils.DecideListTileColor(mag),
                      ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 40,
                child: Center(
                    child: Row(
                  children: <Widget>[
                    Switch(
                        value: chcbox7,
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            chcbox7 = newValue;
                          });
                        }),
                    Text(
                      '6 ile 7 arasındakiler',
                      style: _filterTextStyle,
                    )
                  ],
                )))),
      );
    } else if (mag == 8.0) {
      return Center(
        child: Card(
            elevation: 4,
            child: Container(
                decoration: BoxDecoration(
                  color: Utils.DecideListTileColor(mag),
                  border: Border.all(
                      //color: //Utils.DecideListTileColor(mag),
                      ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 40,
                child: Center(
                    child: Row(
                  children: <Widget>[
                    Switch(
                        value: chcbox8,
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            chcbox8 = newValue;
                          });
                        }),
                    Text(
                      "7'den büyükler",
                      style: _filterTextStyle,
                    )
                  ],
                )))),
      );
    } else
      return FriendlyException.withTitle(
          "Sınırlar dışında olan bir büyüklük değeri .");
  }
}
