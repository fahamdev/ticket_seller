import 'package:ticket_seller/constants/destinations.dart';
import 'package:ticket_seller/models/station.dart';

const String mirpur12 = 'Mirpur 12';
const String mirpur10 = 'Mirpur 10';
const String agargaon = 'Agargaon';
const String mohakhali = 'Mohakhali';
const String gulshan1 = 'Gulshan 1';
const String badda = 'Badda';
const String rampura = 'Rampura';

final Station mirpur12Station = Station(name: mirpur12, destinationsUp: mirpur12DestinationsUp, destinationsDown: mirpur12DestinationsDown);
final Station mirpur10Station = Station(name: mirpur10, destinationsUp: mirpur10DestinationsUp, destinationsDown: mirpur10DestinationsDown);
final Station agargaonStation = Station(name: agargaon, destinationsUp: agargaonDestinationsUp, destinationsDown: agargaonDestinationsDown);
final Station mohakhaliStation = Station(name: mohakhali, destinationsUp: mohakhaliDestinationsUp, destinationsDown: mohakhaliDestinationsDown);
final Station gulshan1Station = Station(name: gulshan1, destinationsUp: gulshan1DestinationsUp, destinationsDown: gulshan1DestinationsDown);
final Station baddaStation = Station(name: badda, destinationsUp: baddaDestinationsUp, destinationsDown: baddaDestinationsDown);
final Station rampuraStation = Station(name: rampura, destinationsUp: rampuraDestinationsUp, destinationsDown: rampuraDestinationsDown);

final List<Station> stations = [
  mirpur12Station,
  mirpur10Station,
  agargaonStation,
  mohakhaliStation,
  gulshan1Station,
  baddaStation,
  rampuraStation
];
