import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_doctor/controllers/loading_controller.dart';
import 'package:e_doctor/models/loggedin_user.dart';
import 'package:e_doctor/screens/patient%20screens/index.dart';
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

  List<LoggedInUser> userProfile =
      []; //for storing a single user that is logged in
  List<LoggedInUser> allProfiles = []; //ffor storing all  users from firebase

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

  fetchAllUsers() async {
    await FirebaseFirestore.instance.collection("users").get().then((snapshot) {
      for (var doc in snapshot.docs) {
        allProfiles.add(LoggedInUser(
            email: doc["email"],
            password: doc["password"],
            role: doc["role"],
            userName: doc["userName"]));
        print("all users ${allProfiles.length}");
      }
    });
    update();
  }

  getOneUser(
    String mail,
    String pass,
  ) async {
    for (var user in allProfiles) {
      if (mail == user.email && pass == user.password) {
        print(mail == user.email);
        print(pass == user.password);
        userProfile.add(LoggedInUser(
            email: user.email,
            password: user.password,
            role: user.role,
            userName: user.userName));
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('userPass', user.password);
        print(user.password);
        print("single user ${userProfile.length}");
        print("single user ${userProfile[0].userName}");
        Get.to(Index());
      }
      update();
    }
  }
}
