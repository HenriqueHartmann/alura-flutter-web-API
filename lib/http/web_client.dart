import 'package:http/http.dart';

void findAll() async {
  const String endpoint = 'http://172.16.83.104:8080';
  const String api = '/transactions';

  final Response response = await get(Uri.parse(endpoint + api));
  print(response.body);
}