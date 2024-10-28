import 'dart:async';

import '../../data/data_sources/remote/api/api_request.dart';
import '../../data/data_sources/remote/api/api_response.dart';
import '../../data/models/base/base_model.dart';

abstract interface class ApiRepository {
  Future<dynamic>
      request<TModel extends BaseModel, TResponse extends ApiResponse<TModel>>({
    required BaseApiRequest apiRequest,
    required TResponse apiResponse,
  });
}
