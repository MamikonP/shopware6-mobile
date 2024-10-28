import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../domain/repositories/api_repository.dart';
import '../data_sources/remote/api/api_data_source.dart';
import '../data_sources/remote/api/api_request.dart';
import '../data_sources/remote/api/api_response.dart';
import '../models/base/base_model.dart';

class ApiRepositoryImp implements ApiRepository {
  ApiRepositoryImp({required this.apiDataSource});

  final ApiDataSource apiDataSource;

  @override
  Future<dynamic>
      request<TModel extends BaseModel, TResponse extends ApiResponse<TModel>>({
    required BaseApiRequest apiRequest,
    required TResponse apiResponse,
  }) async {
    final BaseApiRequest baseApiRequest = await _authorizeRequest(apiRequest);
    final http.Response result =
        await apiDataSource.perform(apiRequest: baseApiRequest);
    if (result.statusCode == HttpStatus.ok &&
        result.body.toUpperCase() == 'OK') {
      return apiResponse.result(result.body);
    }
    return apiResponse.result(json.decode(result.body));
  }

  Future<T> _authorizeRequest<T extends BaseApiRequest>(T request) async {
    if (request is AuthorizedApiRequest) {
      request.authorizationToken = 'Bearer token'; // TODO: should be changed
    }
    return request;
  }
}
