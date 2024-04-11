//
//  mails_weight
//  zones
//


import 'package:postai/data/models/location.dart';

enum Zones {
  zone1(Location.local, 'Zone 1', 1),
  zone2(Location.local, 'Zone 2', 2),
  zone3(Location.local, 'Zone 3', 3),
  zoneA(Location.international, 'Zone A', 2),
  zoneB(Location.international, 'Zone B', 4),
  zoneC(Location.international, 'Zone C', 6),
  zoneD(Location.international, 'Zone D', 8);

  const Zones(this.location, this.name, this.cost);
  final Location location;
  final String name;
  final double cost;

  @override
  String toString() => name;
}
