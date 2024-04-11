//
//  mails_weight
//  mail_type
//

enum MailType {
  type1('Type 1', 1),
  type2('Type 2', 2),
  type3('Type 3', 3);

  const MailType(this.name, this.cost);
  final String name;
  final double cost;

  @override
  String toString() => name;
}
