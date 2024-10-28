import '../../../models/product/product_param_model.dart';
import '../../remote/api/api_config.dart';
import '../../remote/api/api_request.dart';

class FetchProductsRequest extends ApiRequest {
  FetchProductsRequest(this.model);

  final ProductParamModel model;

  @override
  String get host => ApiConfig.apiBaseUrl;

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String get path => '/store-api/product';

  @override
  Map<String, dynamic>? get body => model.toJson();
}
