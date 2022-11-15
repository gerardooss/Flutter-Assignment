class Object01 {
  String name;
  String nominal;
  String type;

  Object01({
    required this.name,
    required this.nominal,
    required this.type,
  });

  get getName => name;
  get getNominal => nominal;
  get getType => type;
}

List<Object01> objectList = [];
