import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactusScreen extends StatefulWidget {
  const ContactusScreen({Key? key}) : super(key: key);

  @override
  State<ContactusScreen> createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          Center(
            child: SizedBox(
                height: Get.height * 0.23,
                width: 200,
                child: Image.asset('assets/icons/car_wash_logo.png',fit: BoxFit.cover,)),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: CustomTextWidget(
                          text: 'About us:',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: CustomTextWidget(
                          text: 'Canton Car Wash App is the easiest way to get your car clean. With our app, you can, 1: Book a car wash in advance 2: Choose from a variety of servicesPay 3: your car wash online 4: Track your car wash historyEarn rewards for using our app',
                          //fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: CustomTextWidget(
                          text: 'Our app is available for both Android and iOS devices. Download the app today and experience the convenience of getting your car clean with Car Wash App!',
                         // fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: CustomTextWidget(
text: 'Contact us:',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: CustomTextWidget(
text: 'cantonabc095@gmail.com',
                        //  fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: CustomTextWidget(
text: '+27389739827',
                        //  fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset('assets/icons/facebook.png')),
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset('assets/icons/instagram.png')),
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset('assets/icons/whatsapp.png')),
                        ],
                      )


                    ],
                  ),
                ),
                //height: 300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
