import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() => runApp(MapApp());

class MapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.66625354421347, 133.91773349741192),
    zoom: 10,
    bearing: 0.0,
    tilt: 0.0,
  );

  static final LatLng _kMapCenter1 =
      LatLng(34.60292592071646, 133.77596533140598);
  static final LatLng _kMapCenter2 =
      LatLng(34.708217146383404, 133.89949445337012);
  static final LatLng _kMapCenter3 =
      LatLng(34.63214065257664, 133.81144750692854);

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter1,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow:
              InfoWindow(title: "倉敷中央病院", snippet: '〒710-8602 岡山県倉敷市美和１丁目１−１')),
      Marker(
          markerId: MarkerId("marker_2"),
          position: _kMapCenter2,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "岡山医療センター", snippet: '〒701-1192 岡山県岡山市北区田益１７１１−１')),
      Marker(
          markerId: MarkerId("marker_3"),
          position: _kMapCenter3,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "川崎医科大学附属病院", snippet: '〒701-0192 岡山県倉敷市松島５７７')),
    };
  }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = Null as LocationData;
    }

    double currentlat = currentLocation.latitude!;
    double currentlong = currentLocation.longitude!;

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentlat, currentlong),
        zoom: 17.0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _createMarker(),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _currentLocation,
        label: Text('CURRENT LOCATION'),
        icon: Icon(Icons.attribution),
      ),
    );
  }
}
