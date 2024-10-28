import '../../../models/base/response_model.dart';

abstract class ApiResponse<T> {
  dynamic result(dynamic body);
}

abstract class ApiListResponse<T> extends ApiResponse<T> {
  @override
  List<T> result(dynamic body) => models(body);

  List<T> models(dynamic body);

  List<T> parseModels(
      List<dynamic> json, T Function(dynamic json) fromJsonTModel) {
    final ResponseModel<T> responseModel =
        ResponseModel<T>.fromJson(json, fromJsonTModel);
    return responseModel.data;
  }
}

abstract class ApiObjectResponse<T> extends ApiResponse<T> {
  @override
  T result(dynamic body) => model(body);

  T model(dynamic body);

  T parseModel(
      Map<String, dynamic> json, T Function(dynamic json) fromJsonTModel) {
    final ResponseDataModel<T> responseDataModel =
        ResponseDataModel<T>.fromJson(json, fromJsonTModel);
    return responseDataModel.data;
  }
}
