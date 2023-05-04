import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MapController mapController = MapController();
  //variavel a ser declarada posteriormente
  late UserLocationOptions userLocationOptions;
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    userLocationOptions = UserLocationOptions(
      context: context,
      mapController: mapController,
      zoomToCurrentLocationOnLoad: false,
      updateMapLocationOnPositionChange: false,
      showMoveToCurrentLocationFloatingActionButton: false,
      markers: markers,
    );

    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-26.7786836, -51.0227104),
          zoom: 16.0,
          minZoom: 10,
          onLongPress: addPin,
          //recebe a localização do usuário
          plugins: [
            UserLocationPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/{users}/clgzpr38h00vp01qngzjjh0nt/tiles/256/{z}/{x}/{y}@2x?access_token={Inserir accessToken}',
            additionalOptions: {
              'accessToken': '{Inserir accessToken}',
            },
          ),
          //classe responsável por adicionar marcadores no mapa
          MarkerLayerOptions(
            markers: markers,
          ),
          userLocationOptions,
        ],
        mapController: mapController,
      ),
    );
  }

  addPin(LatLng latlng) {
    setState(() {
      markers.add(Marker(
        width: 30.0,
        height: 30.0,
        point: latlng,
        builder: (ctx) => Container(
          child: Image.asset('images/pin.png'),
        ),
      ));
    });
  }
}
