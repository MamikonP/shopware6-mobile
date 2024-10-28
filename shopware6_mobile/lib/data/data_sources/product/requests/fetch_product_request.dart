import '../../remote/api/api_config.dart';
import '../../remote/api/api_request.dart';

class FetchProductsRequest extends ApiRequest {
  FetchProductsRequest();

  @override
  String get host => ApiConfig.apiBaseUrl;

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String get path => '/store-api/product';

  @override
  Map<String, String>? get body => <String, String>{'page': '1', 'limit': '20'};
}
