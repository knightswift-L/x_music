import 'package:event_bus/event_bus.dart';

class EventBusHelper{
  static final EventBusHelper _singleton = EventBusHelper._internal();
  late EventBus _eventBus;
  factory EventBusHelper() {
    return _singleton;
  }

  EventBusHelper._internal(){
    _eventBus = EventBus();
  }
  Stream<T> on<T>() {
    return _eventBus.on<T>();
  }

  /// Fires a new event on the event bus with the specified [event].
  ///
  void fire(event) {
    _eventBus.fire(event);
  }
}