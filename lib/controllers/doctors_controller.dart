import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/loggedin_user.dart';

final doctorCntler = Get.put(DoctorController());

class DoctorController extends GetxController {
  List<LoggedInUser> doctorsList = [];

  fetchDoctors() async {
    await FirebaseFirestore.instance.collection("users").get().then((snapshot) {
      for (var doc in snapshot.docs) {
        doctorsList.add(LoggedInUser(
            email: doc["email"],
            password: doc["password"],
            role: doc["role"],
            userName: doc["userName"]));

        print("doctors in the list ${doctorsList.length}");
      }
    });
    update();
  }
}
