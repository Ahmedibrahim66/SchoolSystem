import 'dart:convert';
import 'package:http/http.dart';
import 'package:mustafa0_1/Domain/repositories/authenticationRepository.dart';

class AuthenticationRemoteDataSoruce implements AuthenticationRepository {
  @override
  Future<String> authenticate(
      String userName, String password, String userType) async {

    String mainURL = "http://portal.gtseries.net/School_API";
    //Response example
    // {
    // login_status: "Y",
    // login_type: "S",
    // token: "8469796b8c3f8f51553b431f6c4f743d"
    // }
    try {
      print("$userName$password");
      Response response = await get(
          '$mainURL/authenticate/?user=$userName&password=$password&user_type=$userType');

      Map data = jsonDecode(response.body);

      print(data);

      if (data["login_status"] == "Y") {
        return data["token"];

        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('userToken', data["token"]);
        // prefs.setString('userId', userName);

      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
