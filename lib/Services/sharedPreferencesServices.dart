import "package:shared_preferences/shared_preferences.dart";

class SharedPreferencesServices{

  Future<String>? getString() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString("x-auth-token");
  return token!;
  }

  setString(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("x-auth-token", token);
  }

}