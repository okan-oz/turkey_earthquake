import 'package:flutter/material.dart';
import 'package:turkey_earthquake/Service/earthquake_sw.dart';
import 'package:turkey_earthquake/helper/utils.dart';
import 'package:turkey_earthquake/models/earthquake.dart';
import 'package:turkey_earthquake/models/filter.dart';
import 'package:turkey_earthquake/screens/detailscreen.dart';
import 'friendlyexception.dart';

class EarthQuakeList extends StatefulWidget {
  
  List<Filter> _filterItems;
  EarthQuakeList(this._filterItems);
  @override
  _EarthQuakeListState createState() => _EarthQuakeListState();
}

class _EarthQuakeListState extends State<EarthQuakeList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _prepareEQList(),
    );
  }

  Widget _prepareEQList() {
    return FutureBuilder(
        future: _getEartquakeList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<EarthQuake>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return FriendlyException();
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return _createEQCard(context, snapshot.data[index]);
                    });
              }
          }
        });
  }

  Widget _createEQCard(BuildContext context, EarthQuake eq) {
    return Card(
        elevation: 5,
        child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.grey,//Utils.DecideListTileColor(eq.mag),
          //   ),
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
          height: 75,
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              child: Text(
                eq.mag.toString(),
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Utils.DecideListTileColor(eq.mag),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(eq)),
              );
            },
            title: Text(eq.title.toString()),
            subtitle: Text(eq.date),
            trailing: Icon(
              Icons.view_headline,
              color:Colors.grey.shade600, //Utils.DecideListTileColor(eq.mag),
            ),
          ),
        ));
  }

  Future<List<EarthQuake>> _getEartquakeList() async {
    return EarthQuakeService.GetEQList(widget._filterItems);
  }
}
