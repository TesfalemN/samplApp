import 'package:http/http.dart' as http;

class BaseHttpClient extends http.BaseClient {
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return request.send();
  }
}
