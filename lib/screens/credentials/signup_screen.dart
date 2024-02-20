import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/classes/custom_textfield.dart';
import 'package:canton/controller/userController.dart';
import 'package:canton/screens/credentials/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../classes/app_assets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  UserController userController = Get.find<UserController>();
  final _formKey2 = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();

  /* Future<bool> _checkUserExists(String uid) async {
    final userDocs = await FirebaseFirestore.instance.collection('users').get();

    final emailsToDelete = userDocs.docs.where((doc) => doc.data()['email'] == newEmailController.text.trim()).toList();
    if (emailsToDelete.isNotEmpty) {
      for (var doc in emailsToDelete) {
        await doc.reference.delete();
        print('User document deleted');
      }
      return true;
    }

    print('${emailsToDelete.length} user documents deleted');
    return true;
  }*/

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey2,
      child: Scaffold(
          backgroundColor: AppAssets.backgroundColor,
          resizeToAvoidBottomInset: true,
          body: Obx(
            () => SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                          //color: Colors.purple,
                          height: Get.height * 0.2,
                          width: 200,
                          child: Image.asset(
                            'assets/images/car_wash_logo.png',
                            fit: BoxFit.cover,
                            height: Get.height * 0.2,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextWidget(
                        text: 'Create an Account',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        textColor: AppAssets.primaryColor),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 5,
                      // color: Colors.white,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              keyboardType: TextInputType.text,
                              controller: nameController,
                              obscureText: false,
                              hint: 'Enter your full name',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: newEmailController,
                              obscureText: false,
                              hint: 'Enter your email',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              keyboardType: TextInputType.text,

                              controller: newPassController,
                              obscureText: userController.icon.value == false
                                  ? true
                                  : false,

                              hint: 'Enter your password',
                              // suffixIcon: GestureDetector(
                              //   onTap: () {
                              //     userController.toogleIcon();
                              //   },
                              //   child: userController.icon.value == true
                              //       ? const Icon(Icons.remove_red_eye)
                              //       : const Icon(Icons.remove_red_eye_outlined),
                              // ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              onTap: () {
                                if (_formKey2.currentState!.validate()) {
                                  Get.to(() => const LoginScreen());
                                }

                                // Get.to(const GeofencingLocation());
                                // signIn();
                                // if(formKey2.currentState?.validate()){
                                //
                                // }
                              },
                              color: AppAssets.primaryColor,
                              text: 'Create an Account',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomTextWidget(
                                    text: "If you've already have an Account?",
                                    fontSize: 12.0,
                                    textColor: AppAssets.primaryColor),
                                InkWell(
                                    onTap: () {
                                      Get.to(() => const LoginScreen());
                                    },
                                    child: const CustomTextWidget(
                                        text: " Login",
                                        fontSize: 17.0,
                                        textColor: AppAssets.primaryColor,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
