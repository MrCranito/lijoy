import 'package:algolia/algolia.dart';
import 'package:lifoy/main.dart';
import 'package:latlong2/latlong.dart';
import '../models/event.model.dart';

abstract class BaseEvent {
    Future<Event> getEvent(String id);


    Future<List<Event>> getEventsFromLocalization(LatLng userLoc);
}

class EventService implements BaseEvent {

    ///
  /// Initiate Algolia in your project
  ///
  Algolia algolia = Application.algolia;


  

  
  @override
  Future<Event> getEvent(String id) {
    // TODO: implement getEvent
    throw UnimplementedError();
  }



  @override 
  Future<List<Event>> getEventsFromLocalization(LatLng userLoc) async {
    print('ici');
    List<Event> events = [];
    final locAsString = userLoc.latitude.toString() + ',' + userLoc.longitude.toString();
    final query = algolia.instance.index('events');
    AlgoliaQuerySnapshot snapshot = await query.query('').setAroundLatLng(locAsString).getObjects();
    snapshot.hits.forEach((element) {
      events.add(Event.fromJson(element.data));
    });
    return events;
  }

}