import 'package:canton/classes/app_assets.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

AppBar whiteCustomAppBar({required String title, List<Widget>? action}) {
  return AppBar(
    title: CustomTextWidget(
        text: title, fontSize: 20.0, fontWeight: FontWeight.w600),
    centerTitle: true,
    actions: action,
  );
}

Widget drawerWidget() {
  return const Drawer(
      backgroundColor: AppAssets.backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.navigate_next)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Colors.white38,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomTextWidget(
                  text: 'Services',
                ),
                Spacer(),
                Icon(Icons.navigate_next)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomTextWidget(
                  text: 'Wall Reports',
                ),
                Spacer(),
                Icon(Icons.navigate_next)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomTextWidget(
                  text: 'Weather',
                ),
                Spacer(),
                Icon(Icons.navigate_next)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Spacer(),
            Divider(
              thickness: 1,
              color: Colors.white38,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTextWidget(
                  text: 'Logout',
                ),
                Spacer(),
                Icon(Icons.navigate_next)
              ],
            ),
            SizedBox(
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
