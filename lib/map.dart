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

//岡山医療センター
  static final LatLng _kMapCenter1 =
      LatLng(34.708217146383404, 133.89949445337012);
  static final LatLng _kMapCenter2 =
      LatLng(34.60376162764936, 133.93291086288482);
  static final LatLng _kMapCenter3 =
      LatLng(34.651098997796716, 133.91548938430836);
  static final LatLng _kMapCenter4 =
      LatLng(34.65217209246849, 133.8852464531018);
  static final LatLng _kMapCenter5 =
      LatLng(34.63582324034132, 133.9235467340495);
  static final LatLng _kMapCenter6 =
      LatLng(34.67093025062045, 133.91740409965377);
  static final LatLng _kMapCenter7 =
      LatLng(34.67276945736568, 133.92080819913693);
  static final LatLng _kMapCenter8 =
      LatLng(34.684056994683274, 133.8255956303437);
  static final LatLng _kMapCenter9 =
      LatLng(34.63184097125553, 133.95526536103202);
  static final LatLng _kMapCenter10 =
      LatLng(34.63496252096324, 133.8827038644807);
  static final LatLng _kMapCenter11 =
      LatLng(34.63010384249658, 133.95939450654973);
  static final LatLng _kMapCenter12 =
      LatLng(34.602431677162585, 133.7761906800831);
  static final LatLng _kMapCenter13 =
      LatLng(34.542363103470386, 133.7070731512453);
  static final LatLng _kMapCenter14 =
      LatLng(34.6031846484478, 133.91770291551384);
  static final LatLng _kMapCenter15 =
      LatLng(34.541777330288845, 133.68087787991365);
  static final LatLng _kMapCenter16 =
      LatLng(35.06448652498616, 134.0034244162597);
  static final LatLng _kMapCenter17 =
      LatLng(34.987480558219886, 133.4595409689726);
  static final LatLng _kMapCenter18 =
      LatLng(34.64717620098, 133.90437099779973);
  static final LatLng _kMapCenter19 =
      LatLng(34.6520588109457, 133.8564300798732);
  static final LatLng _kMapCenter20 =
      LatLng(34.62449895260611, 133.80404118430758);
  static final LatLng _kMapCenter21 =
      LatLng(34.593340972497046, 133.75713881128948);
  static final LatLng _kMapCenter22 =
      LatLng(34.593340972497046, 133.75713881128948);
  static final LatLng _kMapCenter23 =
      LatLng(34.60362232364671, 133.77313627119486);
  static final LatLng _kMapCenter24 =
      LatLng(34.80532478191133, 134.16151742377954);
  static final LatLng _kMapCenter25 =
      LatLng(34.54757513301896, 133.67254226896077);
  static final LatLng _kMapCenter26 =
      LatLng(34.60179163722425, 133.77024478688455);
  static final LatLng _kMapCenter27 =
      LatLng(34.54178751783545, 133.7387663977967);
  static final LatLng _kMapCenter28 =
      LatLng(35.01339898035546, 134.14703728617172);
  static final LatLng _kMapCenter29 =
      LatLng(34.47813426772436, 133.52059271895897);
  static final LatLng _kMapCenter30 =
      LatLng(34.54184928071644, 133.62623626896053);
  static final LatLng _kMapCenter31 =
      LatLng(34.983496338459766, 133.46936942664496);
  static final LatLng _kMapCenter32 =
      LatLng(34.675363154698175, 133.95964041129176);
  static final LatLng _kMapCenter33 =
      LatLng(34.99446192379721, 133.44554198431783);
  static final LatLng _kMapCenter34 =
      LatLng(34.6521887745407, 134.03248555547222);
  static final LatLng _kMapCenter35 =
      LatLng(34.681088353846974, 133.90455816896434);
  static final LatLng _kMapCenter36 =
      LatLng(34.59302199608723, 133.76168316710852);
  static final LatLng _kMapCenter37 =
      LatLng(34.571843166255604, 133.76128398430617);
  static final LatLng _kMapCenter38 =
      LatLng(34.65586362974635, 133.91107168430844);
  static final LatLng _kMapCenter39 =
      LatLng(34.53401877406795, 133.7393256843054);
  static final LatLng _kMapCenter40 =
      LatLng(34.63197292276209, 133.81135094779935);
  static final LatLng _kMapCenter41 =
      LatLng(34.70890896148848, 133.95859683202403);
  static final LatLng _kMapCenter42 =
      LatLng(34.624342503626536, 133.96445876267617);
  static final LatLng _kMapCenter43 =
      LatLng(34.54181478889408, 133.74281174729342);
  static final LatLng _kMapCenter44 =
      LatLng(34.67346398859386, 133.89584867804376);
  static final LatLng _kMapCenter45 =
      LatLng(34.663605110382484, 133.90764584044385);
  static final LatLng _kMapCenter46 =
      LatLng(34.588291358792446, 133.76513213196935);
  static final LatLng _kMapCenter47 =
      LatLng(35.05626092838025, 133.97995520200377);
  static final LatLng _kMapCenter48 =
      LatLng(35.064774287019645, 134.0397031321867);
  static final LatLng _kMapCenter49 =
      LatLng(35.07186428229107, 133.93550405644913);

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("hospital_1"),
          position: _kMapCenter1,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "岡山医療センター", snippet: '岡山県岡山市北区田益１７１１−１    086-294-9911')),
      Marker(
          markerId: MarkerId("hospital_2"),
          position: _kMapCenter2,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "岡山労災病院",
              snippet: '岡山県岡山市南区築港緑町１丁目１０−２５    086-262-0131')),
      Marker(
          markerId: MarkerId("hospital_3"),
          position: _kMapCenter3,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "	岡山県精神科医療センター",
              snippet: '岡山県岡山市北区鹿田本町３−１６    086-225-3821')),
      Marker(
          markerId: MarkerId("hospital_4"),
          position: _kMapCenter4,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "岡山市総合医療センター 岡山市立市民病院",
              snippet: '岡山県岡山市北区北長瀬表町３丁目２０−１    086-737-3000')),
      Marker(
          markerId: MarkerId("hospital_5"),
          position: _kMapCenter5,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "岡山赤十字病院", snippet: '岡山県岡山市北区青江２丁目１−１    086-222-8811')),
      Marker(
          markerId: MarkerId("hospital_6"),
          position: _kMapCenter6,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "	岡山済生会外来センター病院	",
              snippet: '岡山県岡山市北区伊福町１丁目１７−１８    086-252-2211')),
      Marker(
          markerId: MarkerId("hospital_7"),
          position: _kMapCenter7,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "岡山済生会総合病院", snippet: '岡山県岡山市北区国体町２−２５    086-252-2211')),
      Marker(
          markerId: MarkerId("hospital_8"),
          position: _kMapCenter8,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "済生会吉備病院", snippet: '岡山県岡山市北区高松原古才５８４−１    086-287-8655')),
      Marker(
          markerId: MarkerId("hospital_9"),
          position: _kMapCenter9,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "	岡山旭東病院", snippet: '岡山県岡山市中区倉田５６７−１    086-276-3231')),
      Marker(
          markerId: MarkerId("hospital_10"),
          position: _kMapCenter10,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "岡山県健康づくり財団附属病院",
              snippet: '岡山県岡山市北区平田４０８−１    086-241-0880')),
      Marker(
          markerId: MarkerId("hospital_11"),
          position: _kMapCenter11,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "岡山リハビリテーション病院",
              snippet: '岡山県岡山市中区倉田５０３−１    086-274-7001')),
      Marker(
          markerId: MarkerId("hospital_12"),
          position: _kMapCenter12,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "倉敷中央病院", snippet: '岡山県倉敷市美和１丁目１−１    086-422-0210')),
      Marker(
          markerId: MarkerId("hospital_13"),
          position: _kMapCenter13,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "倉敷中央病院リバーサイド",
              snippet: '岡山県倉敷市鶴の浦２丁目６−１１    086-448-1111')),
      Marker(
          markerId: MarkerId("hospital_14"),
          position: _kMapCenter14,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "慈圭病院", snippet: '岡山県岡山市南区浦安本町１００−２    086-262-1191')),
      Marker(
          markerId: MarkerId("hospital_15"),
          position: _kMapCenter15,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "公益財団法人 弘仁会 玉島病院",
              snippet: '岡山県倉敷市玉島乙島４０３０    086-522-4141')),
      Marker(
          markerId: MarkerId("hospital_16"),
          position: _kMapCenter16,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow:
              InfoWindow(title: "大谷病院", snippet: '岡山県津山市田町３３    0868-22-9381')),
      Marker(
          markerId: MarkerId("hospital_17"),
          position: _kMapCenter17,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "太田病院", snippet: '岡山県新見市西方４２６    0867-72-0214')),
      Marker(
          markerId: MarkerId("hospital_18"),
          position: _kMapCenter18,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "おおもと病院", snippet: '岡山県岡山市北区大元１丁目１−５    086-241-6888')),
      Marker(
          markerId: MarkerId("hospital_19"),
          position: _kMapCenter19,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "梶木病院", snippet: '岡山県岡山市北区西花尻１２３１−１    086-293-3355')),
      Marker(
          markerId: MarkerId("hospital_20"),
          position: _kMapCenter20,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "倉敷スイートホスピタル", snippet: '岡山県倉敷市中庄３５４２−１    086-463-7111')),
      Marker(
          markerId: MarkerId("hospital_21"),
          position: _kMapCenter21,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "倉敷第一病院", snippet: '岡山県倉敷市老松町５丁目３−１０    086-424-1000')),
      Marker(
          markerId: MarkerId("hospital_22"),
          position: _kMapCenter22,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "重井医学研究所附属病院", snippet: '岡山県岡山市南区山田２１１７    086-282-5311')),
      Marker(
          markerId: MarkerId("hospital_23"),
          position: _kMapCenter23,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "しげい病院", snippet: '岡山県倉敷市幸町２−３０    086-422-3655')),
      Marker(
          markerId: MarkerId("hospital_24"),
          position: _kMapCenter24,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "平病院", snippet: '岡山県和気郡和気町尺所４３８    0869-93-1155')),
      Marker(
          markerId: MarkerId("hospital_25"),
          position: _kMapCenter25,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "玉島中央病院", snippet: '岡山県倉敷市玉島阿賀崎２丁目１−１    086-526-8111')),
      Marker(
          markerId: MarkerId("hospital_26"),
          position: _kMapCenter26,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "松田病院", snippet: '岡山県倉敷市鶴形１丁目３−１０    086-422-3550')),
      Marker(
          markerId: MarkerId("hospital_27"),
          position: _kMapCenter27,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "水島第一病院", snippet: '岡山県倉敷市神田２丁目３−３３    086-444-5333')),
      Marker(
          markerId: MarkerId("hospital_28"),
          position: _kMapCenter28,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "美作中央病院", snippet: '岡山県美作市明見３５７−１    0868-72-0461')),
      Marker(
          markerId: MarkerId("hospital_29"),
          position: _kMapCenter29,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "笠岡第一病院", snippet: '岡山県笠岡市横島１９４５    0865-67-0211')),
      Marker(
          markerId: MarkerId("hospital_30"),
          position: _kMapCenter30,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "金光病院", snippet: '岡山県浅口市金光町占見新田７４０    0865-42-3211')),
      Marker(
          markerId: MarkerId("hospital_31"),
          position: _kMapCenter31,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "新見中央病院", snippet: '岡山県新見市新見８２７−１    0867-72-2110')),
      Marker(
          markerId: MarkerId("hospital_32"),
          position: _kMapCenter32,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "竜操整形外科病院", snippet: '岡山県岡山市中区藤原２１−１    086-273-1233')),
      Marker(
          markerId: MarkerId("hospital_33"),
          position: _kMapCenter33,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "渡辺病院", snippet: '岡山県新見市高尾２２７８−１    0867-72-2123')),
      Marker(
          markerId: MarkerId("hospital_34"),
          position: _kMapCenter34,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "社会医療法人岡村一心堂病院",
              snippet: '岡山県岡山市東区西大寺南２丁目１−７    086-942-9919')),
      Marker(
          markerId: MarkerId("hospital_35"),
          position: _kMapCenter35,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "岡山中央病院", snippet: '岡山県岡山市北区伊島町６−３    086-252-3221')),
      Marker(
          markerId: MarkerId("hospital_36"),
          position: _kMapCenter35,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "倉敷平成病院", snippet: '岡山県倉敷市老松町４丁目３−３８    086-427-1111')),
      Marker(
          markerId: MarkerId("hospital_37"),
          position: _kMapCenter37,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "倉敷リハビリテーション病院",
              snippet: '岡山県倉敷市笹沖２１ 倉敷リハビリテーション病院（水和会）    086-421-3311')),
      Marker(
          markerId: MarkerId("hospital_38"),
          position: _kMapCenter38,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "社会医療法人 光生病院",
              snippet: '岡山県岡山市北区厚生町３丁目８−３５    086-222-6806')),
      Marker(
          markerId: MarkerId("hospital_39"),
          position: _kMapCenter39,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "水島中央病院", snippet: '岡山県倉敷市水島青葉町４−５    086-444-3311')),
      Marker(
          markerId: MarkerId("hospital_40"),
          position: _kMapCenter40,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "川崎医科大学附属病院", snippet: '岡山県倉敷市松島５７７    086-462-1111')),
      Marker(
          markerId: MarkerId("hospital_41"),
          position: _kMapCenter41,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "旭川荘療育・医療センター",
              snippet: '岡山県岡山市北区祇園８６６ 旭川療育園    086-275-8555')),
      Marker(
          markerId: MarkerId("hospital_42"),
          position: _kMapCenter42,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "岡山博愛会病院", snippet: '岡山県岡山市中区江崎４５６-２    086-274-8101')),
      Marker(
          markerId: MarkerId("hospital_43"),
          position: _kMapCenter43,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "水島協同病院", snippet: '岡山県倉敷市水島南春日町１-１    086-444-3211')),
      Marker(
          markerId: MarkerId("hospital_44"),
          position: _kMapCenter44,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "旭ヶ丘病院", snippet: '岡山県岡山市北区万成東町３-１   	086-252-1185')),
      Marker(
          markerId: MarkerId("hospital_45"),
          position: _kMapCenter45,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "河田病院", snippet: '岡山県岡山市北区富町２-１５-２１    086-252-1231')),
      Marker(
          markerId: MarkerId("hospital_46"),
          position: _kMapCenter46,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "倉敷成人病センター", snippet: '岡山県倉敷市白楽町２５０    086-422-2111')),
      Marker(
          markerId: MarkerId("hospital_47"),
          position: _kMapCenter47,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "積善病院", snippet: '岡山県津山市一方１４０    0868-22-3166')),
      Marker(
          markerId: MarkerId("hospital_48"),
          position: _kMapCenter48,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "津山中央病院", snippet: '岡山県津山市川崎１７５６    0868-21-8111')),
      Marker(
          markerId: MarkerId("hospital_49"),
          position: _kMapCenter49,
          icon: BitmapDescriptor.defaultMarkerWithHue(5.4),
          infoWindow: InfoWindow(
              title: "芳野病院", snippet: '岡山県苫田郡鏡野町吉原３１２   0868-21-8111')),
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
