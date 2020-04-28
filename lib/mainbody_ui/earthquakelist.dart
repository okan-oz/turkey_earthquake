import 'package:flutter/material.dart';
import 'package:turkey_earthquake/Service/earthquake_sw.dart';
import 'package:turkey_earthquake/helper/utils.dart';
import 'package:turkey_earthquake/models/earthquake.dart';
import 'package:turkey_earthquake/screens/detailscreen.dart';

class EarthQuakeList extends StatefulWidget {
  @override
  _EarthQuakeListState createState() => _EarthQuakeListState();
}

class _EarthQuakeListState extends State<EarthQuakeList> {
  @override
  void initState() {
    // TODO: implement initState
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
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return _createEQCard(context, snapshot.data[index]);
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _createEQCard(BuildContext context, EarthQuake eq) {
    return Card(
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Utils.DecideListTileColor(eq.mag),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 80,
          child: ListTile(
            leading: CircleAvatar(
              radius: 45.0,
              child: Text(
                eq.mag.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
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
            trailing: Icon(Icons.forward,color: Utils.DecideListTileColor(eq.mag),),
          ),
        ));
  }

   

  Future<List<EarthQuake>> _getEartquakeList() async {
    return EarthQuakeService.GetEQList();
  }


}
