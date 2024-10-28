class ResponseModel<T> {
  const ResponseModel(this.data);

  factory ResponseModel.fromJson(
      List<dynamic> json, T Function(dynamic json) fromJsonTModel) {
    final List<T> list = json.map(fromJsonTModel).toList();
    return ResponseModel<T>(list);
  }

  List<dynamic> toJson(Object Function(T value) toJsonTModel) =>
      this.data.map(toJsonTModel).toList();

  final List<T> data;
}

class ResponseDataModel<T> {
  const ResponseDataModel(this.data);

  factory ResponseDataModel.fromJson(Map<String, dynamic> json,
          T Function(dynamic json) fromJsonTModel) =>
      ResponseDataModel<T>(fromJsonTModel(json));

  dynamic toJson(Object Function(T value) toJsonTModel) =>
      toJsonTModel(this.data);

  final T data;
}
