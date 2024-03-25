import 'package:dio/dio.dart';

class TelegramModule {

  void sendRequest(
      String token,
      String message) async {
    try {
      final dio = Dio();
      final response = await dio.post('https://91cb-89-187-174-121.ngrok-free.app/token/',
          data: {"user":"$token"});
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}