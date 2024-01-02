
class Destination{
  final String name;
  final double distance;
  final int price;

  const Destination({required this.name, required this.distance, required this.price});

  @override
  String toString() {
    return 'Destination{name: $name, distance: $distance, price: $price}';
  }
}