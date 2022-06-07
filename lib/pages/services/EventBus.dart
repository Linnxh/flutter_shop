import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class productContentEvent {
  String? str;

  productContentEvent(String? str) {
    this.str = str;
  }
}