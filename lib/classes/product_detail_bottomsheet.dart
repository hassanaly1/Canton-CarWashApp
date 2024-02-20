import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class ProductDetailBottomSheet extends StatelessWidget {
  final String text;
  final String description;
  final String imageUrl;
  final String price;
  void Function()? onPressed;

  ProductDetailBottomSheet({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      height: MediaQuery.of(context).size.height * 0.95,
      child: Scaffold(
        backgroundColor: AppAssets.backgroundColor,
        body: Stack(children: [
          Positioned(
              left: 0.0,
              right: 0.0,
              child: Container(
                width: double.maxFinite,
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/$imageUrl'))),
              )),
          const Positioned(
              top: 45.0,
              left: 20.0,
              right: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  Icon(Icons.shopping_cart_outlined, color: Colors.white)
                ],
              )),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0, //to get the whole page height
              top: 120.0 - 20.0, //to do the upper side curved
              child: Container(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: text,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10.0),
                      Expanded(
                        child: SingleChildScrollView(
                            child: ReadMoreText(
                          description,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          trimLines: 8,
                          colorClickableText: Colors.black,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        )),
                      )
                    ]),
              ))
        ]),
        bottomNavigationBar: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          decoration: const BoxDecoration(
              color: Color(0xFFf7f6f4),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () {},
                width: Get.width * 0.8,
                text: 'Add to Cart',
                color: AppAssets.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
