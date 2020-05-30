import 'package:flutter/material.dart';
import 'package:turkey_earthquake/Service/earthquake_sw.dart';
import 'package:turkey_earthquake/helper/utils.dart';
import 'package:turkey_earthquake/models/earthquake.dart';
import 'package:turkey_earthquake/models/filter.dart';
import 'package:turkey_earthquake/screens/detailscreen.dart';
import 'eq_card.dart';
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
                      return EqCard(snapshot.data[index], context, onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return DetailScreen(snapshot.data[index]);
                            },
                          ),
                        );
                      });
                    });
              }
          }
        });
  }

 

  Future<List<EarthQuake>> _getEartquakeList() async {
    return EarthQuakeService.GetEQList(widget._filterItems);
  }
}
