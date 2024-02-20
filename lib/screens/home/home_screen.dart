import 'package:canton/classes/addtocart_screen.dart';
import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/screens/contactus/contact_us_screen.dart';
import 'package:canton/screens/credentials/login_screen.dart';
import 'package:canton/screens/membership/membership_cancelation_screen.dart';
import 'package:canton/screens/membership/membership_purchase_screen.dart';
import 'package:card_slider/card_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<List<String>> packages = [
    ['Exterior Package', '\$8'],
    ['Super Package', '\$10'],
    ['Supreme Package', '\$15'],
    ['Works Wash Package', '\$20']
  ];

  final drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Color> valuesDataColors = [
      Colors.purple,
      Colors.yellow,
      Colors.green,
      Colors.red,
      Colors.grey,
      Colors.blue,
    ];

    List<Widget> valuesWidget = [];
    for (int i = 0; i < valuesDataColors.length; i++) {
      valuesWidget.add(Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: valuesDataColors[i],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 40, child: Image.asset('assets/icons/visa.png')),
                const CustomTextWidget(text: '**** **** 3787 3232'),
                const CustomTextWidget(text: 'Valid Date'),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                        text: '10/23', fontWeight: FontWeight.w600),
                    CustomTextWidget(
                        text: 'Elli Sikjhy', fontWeight: FontWeight.w600),
                  ],
                ),
              ],
            ),
          )));
    }
    return Scaffold(
      key: drawerKey,
      drawer: drawerWidget(),
      backgroundColor: AppAssets.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppAssets.backgroundColor,
        leading: InkWell(
          onTap: () {
            drawerKey.currentState?.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(
              'assets/icons/menu.png',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset('assets/icons/notification.png'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      CustomTextWidget(
                        text: 'Username',
                        fontWeight: FontWeight.w600,
                        textColor: AppAssets.primaryColor,
                        fontSize: 18,
                      ),
                      CustomTextWidget(
                          text: '+923XXXXXXXX', textColor: AppAssets.greyColor),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.settings, color: AppAssets.greyColor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30.0,
                      ),
                      child: Container(
                        height: Get.height * 0.22,
                        width: Get.width * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppAssets.greyColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline_rounded,
                                color: AppAssets.greyColor),
                            CustomTextWidget(
                              text: 'Add Your Card Detail',
                              textColor: AppAssets.greyColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: Get.height * 0.35,
                      child: CardSlider(
                        cards: valuesWidget,
                        bottomOffset: .0008,
                        cardHeight: 0.3,
                        cardHeightOffset: 0.02,
                      ),
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0),
              //   child: SizedBox(
              //     height: 30,
              //     child: ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: tabsName.length,
              //         itemBuilder: (BuildContext context, index) => Row(
              //               children: [
              //                 CustomTextWidget(
              //                   text: tabsName[index],
              //                   fontSize: 22,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //                 const SizedBox(
              //                   width: 18,
              //                 )
              //               ],
              //             )),
              //   ),
              // ),
              const CustomTextWidget(
                text: 'Packages',
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: packages.length,
                  itemBuilder: (BuildContext context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(const AddToCartScreen(),
                                transition: Transition.downToUp);
                          },
                          child: SizedBox(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: Get.height * 0.18,
                                        width: Get.width * 0.3,
                                        decoration: BoxDecoration(
                                            color: AppAssets.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                              'assets/icons/jeep.png',
                                              color: Colors.white70),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextWidget(
                                              text: packages[index][0],
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30),
                                          CustomTextWidget(
                                              text: packages[index][1],
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerWidget() {
    return Drawer(
        backgroundColor: AppAssets.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: 'Wardee Warn',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white38,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const MembershipPurchaseScreen(),
                      transition: Transition.rightToLeft);
                },
                child: const Row(
                  children: [
                    CustomTextWidget(
                      text: 'Membership Plan',
                      textColor: Colors.white,
                    ),
                    Spacer(),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const ManageMembershipScreen());
                },
                child: const Row(
                  children: [
                    CustomTextWidget(
                      text: 'Manage Subscription',
                      textColor: Colors.white,
                    ),
                    Spacer(),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const ContactusScreen());
                },
                child: const Row(
                  children: [
                    CustomTextWidget(
                      text: 'About us',
                      textColor: Colors.white,
                    ),
                    Spacer(),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              const Divider(
                thickness: 1,
                color: Colors.white38,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.to(const LoginScreen(),
                        transition: Transition.downToUp),
                    child: const CustomTextWidget(
                      text: 'Logout',
                      textColor: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )

        /*ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [

          ListTile(
            title:textWidget(text: 'Profile',color: textColor),
            onTap: () {
              Get.to(() => ProfileScreen(
                customerId: customerId,
                token: token,
              ));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title:  textWidget(text: 'Switch',color: textColor),
            leading: Icon(Icons.swap_horiz_sharp,color: textColor,),
            onTap: switchOnTap,
          ),
          ListTile(
            title:  textWidget(text: 'Logout',color: textColor),
            onTap: logoutOnTap,
          ),
        ],
      ),*/
        );
  }
}

class CardModel {
  String? cardName;
  String? expDate;
  String? carNumber;
  String? ownerName;
  CardModel(this.cardName, this.carNumber, this.expDate, this.ownerName);
}
