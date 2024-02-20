import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPricingWidget extends StatelessWidget {
  final String imagePath;
  final String planType;
  final String planPrice;
  final VoidCallback onTap;

  const CustomPricingWidget({
    super.key,
    required this.planType,
    required this.planPrice,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: AppAssets.backgroundColor,
          height: Get.height * 0.20,
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height * 0.18,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: AppAssets.primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/icons/$imagePath',
                            color: Colors.white70),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                            text: planType,
                            fontWeight: FontWeight.w600,
                            fontSize: 24),
                        CustomTextWidget(
                          text: planPrice,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
