import 'package:ticket_seller/constants/stations.dart';
import 'package:ticket_seller/models/destination.dart';

final List<Destination> mirpur12DestinationsUp = [
  const Destination(name: mirpur10, distance: 2.00, price: 10),
  const Destination(name: agargaon, distance: 4.00, price: 15),
  const Destination(name: mohakhali, distance: 6.00, price: 20),
  const Destination(name: gulshan1, distance: 8.00, price: 25),
  const Destination(name: badda, distance: 10.00, price: 30),
  const Destination(name: rampura, distance: 12.00, price: 35),
];

final List<Destination> mirpur12DestinationsDown = [
];

final List<Destination> mirpur10DestinationsUp = [
  const Destination(name: agargaon, distance: 2.00, price: 10),
  const Destination(name: mohakhali, distance: 4.00, price: 15),
  const Destination(name: gulshan1, distance: 6.00, price: 20),
  const Destination(name: badda, distance: 8.00, price: 25),
  const Destination(name: rampura, distance: 10.00, price: 30),
];

final List<Destination> mirpur10DestinationsDown = [
  const Destination(name: mirpur12, distance: 2.00, price: 10),
];

final List<Destination> agargaonDestinationsUp = [
  const Destination(name: mohakhali, distance: 2.00, price: 10),
  const Destination(name: gulshan1, distance: 4.00, price: 15),
  const Destination(name: badda, distance: 6.00, price: 20),
  const Destination(name: rampura, distance: 8.00, price: 25),
];

final List<Destination> agargaonDestinationsDown = [
  const Destination(name: mirpur10, distance: 2.00, price: 10),
  const Destination(name: mirpur12, distance: 4.00, price: 15),
];

final List<Destination> mohakhaliDestinationsUp = [
  const Destination(name: gulshan1, distance: 2.00, price: 10),
  const Destination(name: badda, distance: 4.00, price: 15),
  const Destination(name: rampura, distance: 6.00, price: 20),
];

final List<Destination> mohakhaliDestinationsDown = [
  const Destination(name: agargaon, distance: 2.00, price: 10),
  const Destination(name: mirpur10, distance: 4.00, price: 15),
  const Destination(name: mirpur12, distance: 6.00, price: 20),
];

final List<Destination> gulshan1DestinationsUp = [
  const Destination(name: badda, distance: 2.00, price: 10),
  const Destination(name: rampura, distance: 4.00, price: 15),
];

final List<Destination> gulshan1DestinationsDown = [
  const Destination(name: mohakhali, distance: 2.00, price: 10),
  const Destination(name: agargaon, distance: 4.00, price: 15),
  const Destination(name: mirpur10, distance: 6.00, price: 20),
  const Destination(name: mirpur12, distance: 8.00, price: 25),
];

final List<Destination> baddaDestinationsUp = [
  const Destination(name: rampura, distance: 2.00, price: 10),
];

final List<Destination> baddaDestinationsDown = [
  const Destination(name: gulshan1, distance: 2.00, price: 10),
  const Destination(name: mohakhali, distance: 4.00, price: 15),
  const Destination(name: agargaon, distance: 6.00, price: 20),
  const Destination(name: mirpur10, distance: 8.00, price: 25),
  const Destination(name: mirpur12, distance: 10.00, price: 30),
];

final List<Destination> rampuraDestinationsUp = [
];

final List<Destination> rampuraDestinationsDown = [
  const Destination(name: badda, distance: 2.00, price: 10),
  const Destination(name: gulshan1, distance: 4.00, price: 15),
  const Destination(name: mohakhali, distance: 6.00, price: 20),
  const Destination(name: agargaon, distance: 8.00, price: 25),
  const Destination(name: mirpur10, distance: 10.00, price: 30),
  const Destination(name: mirpur12, distance: 12.00, price: 35),
];
