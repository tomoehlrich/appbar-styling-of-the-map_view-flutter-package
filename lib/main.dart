import 'package:flutter/material.dart';

import 'package:map_view/map_view.dart';

import 'config.dart'; 

void main() {
  MapView.setApiKey(GOOGLE_MAPS_API_KEY);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter map_view Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MapView mapView = MapView();
  CameraPosition cameraPosition;

  void openMap() {
    mapView.show(
        MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: false,
            initialCameraPosition: CameraPosition(
                Location(13.730776, 100.541571), 15.0),
            title: 'Map'),
        toolbarActions: [ToolbarAction('Close   ', 1)]);

    mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        mapView.dismiss();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter map_view Demo'),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => openMap(),             
              child: Text('Open Map')
            )
          ],
        ),
      ),
    );
  }
}
