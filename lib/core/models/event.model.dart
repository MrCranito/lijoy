import 'package:latlong2/latlong.dart';

class Event {
  String name;
  LatLng localization;
  List<String> categoryIds;
  String urlImage;

  Event({required this.name, required this.localization, required this.categoryIds, required this.urlImage});

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        name: json["name"],
        localization: LatLng(json["_geoloc"]['lat'], json["_geoloc"]['lng']),
        categoryIds: json["categoryIds"],
        urlImage: json["urlImage"],
    );
}