import 'destination.dart';

class Station{
  final String name;
  final List<Destination> destinationsUp;
  final List<Destination> destinationsDown;

  const Station({required this.name, required this.destinationsUp, required this.destinationsDown});

  @override
  String toString() {
    return 'Station{name: $name, destinationsUp: $destinationsUp, destinationsDown: $destinationsDown}';
  }
}


