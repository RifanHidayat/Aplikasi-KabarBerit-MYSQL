import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  void saveData(int value,String nama,email,phone,id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("value", value);
    sharedPreferences.setString("nama", nama);
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("phone", phone);
    sharedPreferences.setString("id", id);


  }
  void logout() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.remove("value");
    sharedPreferences.remove("nama");
    sharedPreferences.remove("photo");
    sharedPreferences.remove("uid");
    sharedPreferences.remove("email");

  }
  void onBoardingof() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("shared", 1);


  }

}

