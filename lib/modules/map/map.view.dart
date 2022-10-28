import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:lifoy/core/fakeData/events.dart';
import 'package:lifoy/modules/map/components/map-item-detail/map-item-details.component.dart';
import 'package:lifoy/modules/map/components/my-location-marker.component.dart';

import '../../core/models/event.model.dart';

const MAPBOX_TOKEN =
    'pk.eyJ1Ijoic2Fyb3VtYW45OSIsImEiOiJjbDlvemF6cW0wMjNmM3Z1bDloNXNrNnR2In0.nVEEn49G7Azqd1LZBA-Beg';
const MAPBOX_STYLE = 'mapbox/light-v10';
const MARKER_COLOR = Color(0xFF3DC5A7);

class MapView extends StatefulWidget {
  MapView({super.key});
  final fakeService = FakeEventService();
  @override
  MapViewState createState() => MapViewState();
}

class MapViewState extends State<MapView> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;


  final _pageController = PageController(initialPage: 0);

  final _mapController = MapController();

  bool _isMapItemDetailOpen = false;

  List<Event> eventLists = [];

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

  void getMarkersAroundMe() async {
    widget.fakeService.getEventsFromLocalization(LatLng(43.611527, 1.420244))
        .then((List<Event> list) => {
          setState(() {
            eventLists = list;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
        body: Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
              center: LatLng(43.611527, 1.420244),
              minZoom: 5,
              maxZoom: 16,
              zoom: 13,
              onPositionChanged: (position, changed) {
                if (_isMapItemDetailOpen) {
                  setState(() {
                    _isMapItemDetailOpen = false;
                  });
                }
                getMarkersAroundMe();
              },
              ),
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
                for (int i = 0; i < eventLists.length; i++)
                  Marker(
                    height: 40,
                    width: 40,
                    point: eventLists[i].localization!,
                    builder: (_) {
                      return GestureDetector(
                        onTap: () {
                           setState(() {
                            _isMapItemDetailOpen = true;
                          });
                          _mapController.move(eventLists[i].localization!, _mapController.zoom);
                          _pageController.animateToPage(i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                         
                        },
                        child:
                            Icon(Icons.pin_drop, color: MARKER_COLOR, size: 30),
                      );
                    },
                  ),
              ],
            )
          ],
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: eventLists.length,
                itemBuilder: (context, index) {
                  return MapItemDetailComponent(
                    event: eventLists[index],
                    index: index,
                  );
                })),
      ],
    ));
  }
}
