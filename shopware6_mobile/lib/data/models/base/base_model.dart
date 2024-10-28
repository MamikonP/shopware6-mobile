abstract class BaseModel {}

class EmptyModel implements BaseModel {
  const EmptyModel(this.body);

  final Object? body;
}
