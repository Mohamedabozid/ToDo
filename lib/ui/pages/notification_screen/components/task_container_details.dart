import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/styles/theme.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({Key? key, required this.payLoad}) : super(key: key);
  final String payLoad;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Appcolors.purple,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.text_format,
                  size: 35,
                  color: Get.isDarkMode ? Appcolors.white : Appcolors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Title',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color:
                      Get.isDarkMode ? Appcolors.white : Appcolors.white),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              payLoad.toString().split('|')[0],
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode ? Appcolors.white : Appcolors.white),
            ),
            SizedBox(
              height: 15,
            ),

            Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  size: 35,
                  color: Get.isDarkMode ? Appcolors.white : Appcolors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Description',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color:
                      Get.isDarkMode ? Appcolors.white : Appcolors.white),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              payLoad.toString().split('|')[1],
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode ? Appcolors.white : Appcolors.white),
            ),
            SizedBox(
              height: 15,
            ),

            Row(
              children: [
                Icon(
                  Icons.date_range_outlined,
                  size: 35,
                  color: Get.isDarkMode ? Appcolors.white : Appcolors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Date',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color:
                      Get.isDarkMode ? Appcolors.white : Appcolors.white),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              payLoad.toString().split('|')[2], style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 20, color: Get.isDarkMode ? Appcolors.white : Appcolors.white),
            ),
          ],
        ),
      ),
    );
  }
}
