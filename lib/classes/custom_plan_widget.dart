import 'package:canton/classes/addtocart_screen.dart';
import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/classes/product_detail_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPlanWidget extends StatelessWidget {
  final String packageName;
  final String packagePrice;
  final String packageImagePath;
  final String packageDescription;

  const CustomPlanWidget(
      {super.key,
      required this.packageName,
      required this.packagePrice,
      required this.packageImagePath,
      required this.packageDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      child: Container(
        color: AppAssets.backgroundColor,
        height: Get.height * 0.23,
        child: Stack(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: Get.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              bottom: 10.0,
              left: 10.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/$packageImagePath',
                    height: Get.height * 0.2,
                    width: Get.width * 0.3,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: packageName,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                      CustomTextWidget(
                        text: packagePrice,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 10.0),
                      CustomButton(
                        onTap: () {
                          //   print('Product Detail Clickedddd!');
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductDetailBottomSheet(
                                text: packageName,
                                imageUrl: packageImagePath,
                                description: packageDescription,
                                price: packagePrice,
                                onPressed: () {},
                              );
                            },
                          );
                        },
                        width: Get.width * 0.48,
                        height: 40,
                        text: 'Product Detail'.tr,
                      ),
                      const SizedBox(height: 10.0),
                      CustomButton(
                        onTap: () {
                          // print('Add to Cart Clickeddd');
                          Get.to(const AddToCartScreen(),
                              transition: Transition.upToDown);
                        },
                        width: Get.width * 0.48,
                        height: 40,
                        text: 'Add to Cart'.tr,
                        color: Colors.white,
                        textColor: AppAssets.primaryColor,
                      ),
                      const SizedBox(height: 10.0)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
