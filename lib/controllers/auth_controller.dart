import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_doctor/controllers/loading_controller.dart';
import 'package:e_doctor/models/loggedin_user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authContrler = Get.put(AuthController());

class AuthController extends GetxController {
  String role = '';
  String name = '';
  String email = '';
  String password = '';
  String confirmPass = '';
  String logInEmail = '';
  String logInPassword = '';

  List<LoggedInUser> userProfile = [];

  updateRole(String selectRole) {
    role = selectRole;
    update();
  }

  changeName(String value) {
    name = value;
    update();
  }

  changeEmail(String value) {
    email = value;
    update();
  }

  changePass(String value) {
    password = value;
    update();
  }

  changeConfirmPass(String value) {
    value == password
        ? confirmPass = value
        : loaderController.showErrorMsg("password doesn't match");
    update();
  }

  changeLoginEmail(String value) {
    logInEmail = value;
    update();
  }

  changeLoginPassword(String value) {
    logInPassword = value;
    update();
  }

  fetchUserContent() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("userToken");
     print(token);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(token)
        .get()
        .then((snapshot) {
      print(snapshot.exists);
      // for (var doc in querySnapshot) {
      userProfile.add(LoggedInUser(
          email: snapshot["email"],
          password: snapshot["password"],
          role: snapshot["role"],
          userName: snapshot["userName"]));

      print(userProfile.length);
      // }
    });
    update();
  }
}
