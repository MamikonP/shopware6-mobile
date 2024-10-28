import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/failures/api/api_exception.dart';
import 'api_request.dart';

abstract class ApiDataSource {
  Future<http.Response> perform({required BaseApiRequest apiRequest});
}

class ApiDataSourceImp implements ApiDataSource {
  final http.Client _client = http.Client();

  http.Response _performResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 308) {
      return response;
    }
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(message: response.body);
      case 401:
        throw UnauthorizedException();
      case 403:
        throw ForbiddenException();
      case 404:
        throw NotFoundException(response.reasonPhrase);
      case 422:
        throw BackendException(response.body);
      case 409:
        throw ConflictException();
      case 500:
        throw InternalServerException();
      case 502:
        throw BadGateWayException();
      default:
        throw InvalidException(statusCode: response.statusCode);
    }
  }

  @override
  Future<http.Response> perform({required BaseApiRequest apiRequest}) async {
    try {
      final http.BaseRequest request = apiRequest.httpRequest();
      final http.Response response =
          await _client.send(request).then(http.Response.fromStream);
      return _performResponse(response);
    } on SocketException catch (e) {
      throw SocketException(e.message);
    } on TimeoutException {
      throw TimeoutException(
          'Timeout to execute ${apiRequest.method.name} request');
    } on BackendException catch (e) {
      throw BackendException(e.message);
    } on BadRequestException catch (e) {
      throw ApiException(message: e.message);
    } on NotFoundException catch (e) {
      throw NotFoundException(e.message);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
