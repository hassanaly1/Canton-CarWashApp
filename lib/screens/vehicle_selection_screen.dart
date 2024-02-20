import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleSelection extends StatefulWidget {
  const VehicleSelection({Key? key}) : super(key: key);

  @override
  State<VehicleSelection> createState() => _VehicleSelectionState();
}

class _VehicleSelectionState extends State<VehicleSelection> {
  bool busSelection = false;
  bool carSelection = false;
  bool jeepSelection = false;
  bool bikeSelection = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.primaryColor,
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
                child: Image.asset('assets/icons/vehiclesSelection.png')),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: AppAssets.backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: CustomTextWidget(
                          text: 'Select one vehicle (Max 7ft)',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      CheckboxListTile(
                        title: CustomTextWidget(
                            text: 'Truck',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: colorCondition(busSelection)),
                        secondary: Image.asset('assets/icons/bus.png',
                            color: colorCondition(busSelection)),
                        autofocus: false,
                        activeColor: AppAssets.primaryColor,
                        checkColor: Colors.white,
                        selected: busSelection,
                        value: busSelection,
                        onChanged: (bool? value) {
                          setState(() {
                            busSelection = value!;
                          });
                        },
                      ), //SizedBox
                      CheckboxListTile(
                        title: CustomTextWidget(
                            text: 'hatchback / Sedan',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: colorCondition(carSelection)),
                        secondary: Image.asset('assets/icons/sedan.png',
                            color: colorCondition(carSelection)),
                        autofocus: false,
                        activeColor: AppAssets.primaryColor,
                        checkColor: Colors.white,
                        selected: carSelection,
                        value: carSelection,
                        onChanged: (bool? value) {
                          setState(() {
                            carSelection = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: CustomTextWidget(
                            text: 'Jeep / SUV',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: colorCondition(jeepSelection)),
                        secondary: Image.asset(
                          'assets/icons/jeep.png',
                          color: colorCondition(jeepSelection),
                        ),
                        autofocus: false,
                        activeColor: AppAssets.primaryColor,
                        checkColor: Colors.white,
                        selected: jeepSelection,
                        value: jeepSelection,
                        onChanged: (bool? value) {
                          setState(() {
                            jeepSelection = value!;
                          });
                        },
                      ),
                      // CheckboxListTile(
                      //   title: CustomTextWidget(
                      //       text: 'Motorcycle / Scooter',
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w600,
                      //       textColor: colorCondition(bikeSelection)),
                      //   secondary: Image.asset('assets/icons/motorcycle.png',
                      //       color: colorCondition(bikeSelection)),
                      //   autofocus: false,
                      //   activeColor: AppAssets.primaryColor,
                      //   checkColor: Colors.white,
                      //   selected: bikeSelection,
                      //   value: bikeSelection,
                      //   onChanged: (bool? value) {
                      //     setState(() {
                      //       bikeSelection = value!;
                      //     });
                      //   },
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onTap: () {
                          Get.to(const HomeScreen(),
                              transition: Transition.downToUp);
                        },
                        color: AppAssets.primaryColor,
                        text: 'CONTINUE',
                      ),
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

  MaterialColor colorCondition(bool value) {
    return value == true ? Colors.deepPurple : Colors.grey;
  }
}
