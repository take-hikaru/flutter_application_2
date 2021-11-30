import 'package:flutter/material.dart';
// flutter_mapパッケージ追加
import 'package:flutter_map/flutter_map.dart';

void main() {
  runApp(MapApp());
}

class MapApp extends StatefulWidget {
  @override
  _MapAppState createState() => new _MapAppState();
}

class _MapAppState extends State<MapApp> {
  String _title = 'map_app';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'map_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        // flutter_map設定
        body: FlutterMap(
          // マップ表示設定
          options: MapOptions(
            // center: latLng.LatLng(51.5, -0.09),
            zoom: 14.0,
          ),

          layers: [
            //背景地図読み込み (Maptiler)
            TileLayerOptions(
              urlTemplate:
                  'https://api.maptiler.com/maps/basic/256/{z}/{x}/{y}.png?key=REA8esGH2GMiqhcEuNkP',
            ),
          ],
        ),
      ),
    );
  }
}
