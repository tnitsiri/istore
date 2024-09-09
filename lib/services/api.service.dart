import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:istore/enums/env.enum.dart';

// ANCHOR Api Service
class ApiService {
  late Dio dio;

  ApiService() {
    _init();
  }

  // ANCHOR Init
  void _init() {
    BaseOptions options = BaseOptions(
      baseUrl: '${dotenv.env[EnvKeyEnum.apiUrl.name] as String}/',
      connectTimeout: const Duration(
        seconds: 15,
      ),
      sendTimeout: const Duration(
        seconds: 15,
      ),
      receiveTimeout: const Duration(
        seconds: 15,
      ),
    );

    dio = Dio(
      options,
    );
  }
}
