import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turkey_earthquake/mainbody_ui/earthquakelist.dart';
import 'package:turkey_earthquake/models/earthquake.dart';

class MapSample extends StatefulWidget {
  EarthQuake eq;

  MapSample(this.eq);

  @override
  State<MapSample> createState() => MapSampleState();

}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set();
  double _zoom = 7;
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  LatLng _lastMapPosition = _center;
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(38.4315, 39.1505));
MapType _defaultMapType = MapType.hybrid;

void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          markers: _markers,
          mapType: _defaultMapType,
          initialCameraPosition: _initialPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          onCameraMove: (position) {
            _lastMapPosition = position.target;
          },
        ),
         Container(
              margin: EdgeInsets.only(top: 80, right: 10),
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                      child: Icon(Icons.layers),
                      elevation: 5,
                      backgroundColor: Colors.teal[200],
                      onPressed: () {
                       _changeMapType();
                        print('Changing the Map Type');
                      }),
                ]),
            )
      ],
    );
  }

void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  Future<void> _goToEarthQuake() async {
    double lat = widget.eq.lat;
    double long = widget.eq.lng;
    GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(widget.eq.lokasyon),
          position: LatLng(lat, long),
          infoWindow: InfoWindow(title: widget.eq.mag.toString(),snippet: widget.eq.lokasyon),
      
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _goToEarthQuake();
  }

@override
  void dispose() {
    super.dispose();
  }

}
