import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data);
    return data;
  }
}

void findAll() async {
  const String endpoint = 'http://172.16.83.104:8080';
  const String api = '/transactions';

  final Client client = InterceptedClient.build(
      interceptors: [LoggingInterceptor()],
      requestTimeout: const Duration(seconds: 5)
  );

  final Response response = await client.get(Uri.parse(endpoint + api));
}