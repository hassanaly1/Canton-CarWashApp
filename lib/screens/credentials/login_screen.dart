import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/classes/custom_textfield.dart';
import 'package:canton/controller/userController.dart';
import 'package:canton/screens/credentials/signup_screen.dart';
import 'package:canton/screens/membership/custom_detail_screen.dart';
import 'package:canton/screens/vehicle_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final bool isAdmin;
  final userController = Get.find<UserController>();
  GlobalKey formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _openBottomSheet();
    });
  }

  // Future<void> signIn() async {
  //   try {
  //     if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
  //       showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (context) => const Center(
  //             child: CircularProgressIndicator(),
  //           ));
  //
  //       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passController.text.trim(),
  //       );
  //
  //       if (userCredential.user != null) {
  //         // Get.to(const GeofencingLocation());
  //         bool isAdmin = await _checkUserRole(userCredential.user!.uid);
  //         log("role is $isAdmin ");
  //         if (isAdmin) {
  //           userModel = await getUser();
  //
  //           Get.to(() => const AdminDashboardScreen());
  //         } else {
  //           Get.to(() => const GeofencingLocation());
  //         }
  //       } else {
  //         if (mounted) {
  //           Navigator.pop(context);
  //
  //           showDialog(
  //             context: context,
  //             builder: (context) => AlertDialog(
  //               title: const Text(
  //                 "Something went wrong.. try again ",
  //                 textAlign: TextAlign.center,
  //               ),
  //               actions: [
  //                 Center(
  //                   child: ElevatedButton(
  //                     onPressed: () => Navigator.pop(context),
  //                     style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
  //                     child: const Text("Close"),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           );
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     Navigator.pop(context);
  //
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text(
  //           "$e",
  //           textAlign: TextAlign.center,
  //         ),
  //         actions: [
  //           Center(
  //             child: ElevatedButton(
  //               onPressed: () => Navigator.pop(context),
  //               style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
  //               child: const Text("Close"),
  //             ),
  //           )
  //         ],
  //       ),
  //     );
  //     print('user error $e');
  //   }
  // }
  //
  // Future<bool> _checkUserRole(String uid) async {
  //   final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   log("user role : ${userDoc.data()!['role']}");
  //
  //   return userDoc.exists && userDoc.data()!['role'].toString().toLowerCase() == 'admin';
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: AppAssets.backgroundColor,
            body: Obx(
              () => SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                              height: Get.height * 0.2,
                              width: 200,
                              child: Image.asset(
                                  'assets/images/car_wash_logo.png',
                                  fit: BoxFit.cover,
                                  height: Get.height * 0.2)),
                        ),
                        const SizedBox(height: 20),
                        const CustomTextWidget(
                            text: 'Welcome Back!',
                            textColor: AppAssets.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0),
                        const CustomTextWidget(
                            text: 'Sign in to continue!',
                            fontWeight: FontWeight.w500),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 5,
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                CustomTextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    obscureText: false,
                                    hint: 'Enter your email'),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextFormField(
                                  keyboardType: TextInputType.text,

                                  controller: passController,
                                  obscureText:
                                      userController.icon.value == false
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
                                const SizedBox(height: 10),
                                const Align(
                                    alignment: Alignment.bottomRight,
                                    child: CustomTextWidget(
                                        text: 'Forget password?')),
                                const SizedBox(height: 10),
                                CustomButton(
                                  onTap: () {
                                    Get.to(const VehicleSelection(),
                                        transition: Transition.downToUp);
                                  },
                                  color: AppAssets.primaryColor,
                                  text: 'LOGIN'.tr,
                                ),
                                const SizedBox(height: 10),
                                CustomButton(
                                  onTap: () {
                                    Get.to(const SignupScreen(),
                                        transition: Transition.rightToLeft);
                                  },
                                  color: Colors.white,
                                  textColor: AppAssets.primaryColor,
                                  text: 'SIGNUP'.tr,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }

  Future<void> _openBottomSheet() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Container(
            height: Get.height,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Terms and Conditions",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.cancel),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 10, right: 20),
                            child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                          );
                        }),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onTap: () {
                      Get.to(const CustomDetailScreen(),
                          transition: Transition.rightToLeft);
                    },
                    color: AppAssets.primaryColor,
                    text: 'Accept'.tr,
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
