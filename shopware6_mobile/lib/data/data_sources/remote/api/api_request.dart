import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/extensions/map_extension.dart';

enum HttpMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  const HttpMethod(this.name);

  final String name;
}

abstract class BaseApiRequest {
  Uri get _parsedUri => Uri.parse(host);
  Uri get _uri => Uri(
        host: _parsedUri.host,
        scheme: _parsedUri.scheme,
        port: _parsedUri.port,
        path: path.isEmpty ? _parsedUri.path : path,
        query: parameters.mapToStringWithPrefix(),
      );
  Map<String, dynamic>? get body => null;
  Map<String, String>? get parameters => null;
  HttpMethod get method;
  String get host;
  String get path;

  http.BaseRequest httpRequest();
}

abstract class ApiRequest extends BaseApiRequest {
  @override
  http.Request httpRequest() {
    http.Request request;
    switch (method) {
      case HttpMethod.delete:
      case HttpMethod.get:
        request = http.Request(method.name, _uri);
      case HttpMethod.put:
      case HttpMethod.post:
        request = http.Request(method.name, _uri);
        if (body != null) {
          request.body = jsonEncode(body);
        }
    }
    request.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers['sw-access-key'] = 'SWSCYWNMWHVYOGKZQMNTYTC1QW';
    return request;
  }
}

abstract class AuthorizedApiRequest extends ApiRequest {
  String? authorizationToken;

  @override
  http.Request httpRequest() => super.httpRequest()
    ..headers.addAll(<String, String>{
      HttpHeaders.authorizationHeader: '$authorizationToken'
    });
}
