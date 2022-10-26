import '../models/event.model.dart';

abstract class BaseEvent {
    Future<Event> getEvent(String id);
}

class EventService implements BaseEvent {
  @override
  Future<Event> getEvent(String id) {
    // TODO: implement getEvent
    throw UnimplementedError();
  }

}