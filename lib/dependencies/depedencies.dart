import 'package:canton/controller/userController.dart';
import 'package:get/get.dart';

Future<void> initializeDependencies() async {
  Get.put(UserController());
}