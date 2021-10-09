import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/app/core/utils/constants.dart';
import 'http_client.dart';

class HttpClientImpl implements HttpClient {
  late Dio client;

  HttpClientImpl() {
    this.client = Dio(BaseOptions(baseUrl: Constants.BASE_URL));
  }

  HttpClientImpl.url(String baseUrl) {
    this.client = Dio(BaseOptions(baseUrl: baseUrl));
  }

  @override
  Future<dynamic> post(String url,
      {data, Map<String, String> headers = Constants.DEFAULT_HEADERS}) async {
    var response;
    if (data) {
      response =
          this.client.post(url, data: data, options: Options(headers: headers));
      return response;
    }
    response = this.client.post(url, options: Options(headers: headers));

    return response;
  }

  @override
  Future<dynamic> get(String url,
      {Map<String, String> headers = Constants.DEFAULT_HEADERS}) async {
    var response = await this.client.get(url, options: Options(headers: headers));
    return response;
  }

  @override
  Future delete(String url,
      {data, Map<String, String> headers = Constants.DEFAULT_HEADERS}) {
    var response;

    if (data) {
      response = this
          .client
          .delete(url, data: data, options: Options(headers: headers));
      return response;
    }

    response = this.client.delete(url, options: Options(headers: headers));
    return response;
  }

  @override
  Future put(String url,
      {data, Map<String, String> headers = Constants.DEFAULT_HEADERS}) {
    var response;

    if (data) {
      response =
          this.client.put(url, data: data, options: Options(headers: headers));
      return response;
    }

    response = this.client.put(url, options: Options(headers: headers));
    return response;
  }
}
