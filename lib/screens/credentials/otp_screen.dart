import 'dart:async';

import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/classes/utils.dart';
import 'package:canton/screens/vehicle_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _pinController = TextEditingController();
  bool _timerInProgress = true;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          _timerInProgress = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppAssets.backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                text: 'Enter OTP',
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                textColor: AppAssets.primaryColor),
            const SizedBox(
              height: 10,
            ),
            const CustomTextWidget(
                text: 'We have sent you a code on your number.',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
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
                    Pinput(
                      controller: _pinController,
                      validator: (s) {
                        return s == '2222' ? null : 'Pin is incorrect';
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) {
                        if (pin == '2222') {
                          Utils().toastMessage('Login Successfull');
                          Get.to(const VehicleSelection(),
                              transition: Transition.downToUp);
                        }
                        setState(() {
                          _pinController.clear();
                          _timerInProgress = false;
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    _timerInProgress
                        ? CustomTextWidget(
                            text: 'Resend OTP in $_start seconds')
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomTextWidget(
                                text: 'Didnt recieve OTP?',
                                textColor: Colors.black,
                                fontSize: 15,
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _timerInProgress = true;
                                    _start = 60;
                                  });
                                  _pinController.clear();
                                  startTimer();
                                },
                                child: const CustomTextWidget(
                                  text: 'Resend OTP',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                    //

                    const SizedBox(height: 20.0),
                    CustomButton(
                      onTap: () {},
                      color: AppAssets.primaryColor,
                      text: 'Submit',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
