import 'package:devsteam/services/http.dart';
import 'package:dio/dio.dart';

class PhotoRepository {
  HttpService _httpService = HttpService();

  Future<Response> fetchUsers() =>
      _httpService.get('/photos');
}
