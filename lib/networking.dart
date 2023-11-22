import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper({required this.url, this.page});
  final String url;
  final dynamic page;

  //register
  Future register(String email, String password, String fullName) async {
    try {
      Response response = await post(
          Uri.parse('https://api.famhive-dev.novahub.vn/$url'),
          body: {
            'email': email,
            'password': password,
            'fullName': fullName,
          });
      if (response.statusCode == 200) {
        page;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //login
  Future login(String email, String password) async {
    try {
      Response response = await post(
          Uri.parse('https://api.famhive-dev.novahub.vn/$url'),
          body: {
            'email': email,
            'password': password,
          });
      return response.statusCode;
    } catch (e) {
      print(e.toString());
    }
  }
}
