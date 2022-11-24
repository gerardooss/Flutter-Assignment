// Income-Outcome Object [Assignment 8]
class Object01 {
  String name;
  String nominal;
  String type;
  String date;

  Object01({
    required this.name,
    required this.nominal,
    required this.type,
    required this.date,
  });

  get getName => name;
  get getNominal => nominal;
  get getType => type;
  get getDate => date;
}

List<Object01> objectList = [];
