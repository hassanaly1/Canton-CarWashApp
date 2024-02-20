import 'package:get/get.dart';

class UserController extends GetxController {
  // RxBool resendOtp = false.obs;
  // RxBool showTimer = true.obs;
  // RxBool loading = false.obs;
  // RxBool loadingImage = false.obs;
  // RxInt start = 60.obs;
  // Rx<XFile?> image = Rx<XFile?>(null);
  // Rx<Brand?> selectedBrand = Rx<Brand?>(Brand(value: 1,name: 'jdot'));
  // Rx<SelectedIndex?> selectedIndex = Rx<SelectedIndex?>(null);
  RxBool icon = false.obs;
  RxBool icon2 = false.obs;


  toogleIcon(){
    icon.value = !icon.value;
  }
  signUpToogle(){
    icon2.value = !icon2.value;
  }

}
