import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:lifoy/core/fakeData/marker.dart';
import 'package:lifoy/modules/map/components/my-location-marker.component.dart';

const MAPBOX_TOKEN =
    'pk.eyJ1Ijoic2Fyb3VtYW45OSIsImEiOiJjbDlvemF6cW0wMjNmM3Z1bDloNXNrNnR2In0.nVEEn49G7Azqd1LZBA-Beg';
const MAPBOX_STYLE = 'mapbox/dark-v10';
const MARKER_COLOR = Color(0xFF3DC5A7);

class MapView extends StatefulWidget {
  MapView({super.key});

  @override
  MapViewState createState() => MapViewState();
}

class MapViewState extends State<MapView> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
        body: Stack(
      children: [
        FlutterMap(
          options: MapOptions(
              center: LatLng(43.611527, 1.420244),
              minZoom: 5,
              maxZoom: 16,
              zoom: 13),
          nonRotatedChildren: [
            TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accesToken}',
                additionalOptions: {
                  'accesToken': MAPBOX_TOKEN,
                  'id': MAPBOX_STYLE
                }),
            MarkerLayer(
              markers: [
                Marker(
                  height: 60,
                  width: 60,
                    point: LatLng(43.611527, 1.420244),
                    builder: (_) {
                      return MyLocationMarker(_animationController);
                    })
              ],
            ),
            MarkerLayer(
                markers: [
                  for (int i = 0; i < fakeMapMarkers.length; i++)
                    Marker(
                      height: 40,
                      width: 40,
                      point: fakeMapMarkers[i].location!,
                      builder: (_) {
                        return GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.pin_drop, color: MARKER_COLOR, size: 30),
                        );
                      },
                    ),
                ],
              ),

          ],
        )
      ],
    ));
  }
}
