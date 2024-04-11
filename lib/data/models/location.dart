//
//  mails_weight
//  location
//

enum Location {
  local('Local', 1),
  international('International', 2);

  const Location(this.name, this.cost);
  final String name;
  final double cost;

  @override
  String toString() => name;
}
