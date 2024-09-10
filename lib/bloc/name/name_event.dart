abstract class NameEvent{}

class NameSet extends NameEvent{
  final String name;
  NameSet(this.name);
}

class NameUpdate extends NameEvent{
  final String name;
  NameUpdate(this.name);
}

class NameDelete extends NameEvent{
  final String name;
  NameDelete(this.name);
}