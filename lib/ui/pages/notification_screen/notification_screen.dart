import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles/theme.dart';
import 'components/task_container_details.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payLoad}) : super(key: key);
  final String payLoad;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? _payLoad;

  @override
  void initState() {
    _payLoad = widget.payLoad;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.theme.backgroundColor ,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        title: Text(
         'Hello Mohamed ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30 ,
            color: Get.isDarkMode ? Appcolors.white : Appcolors.purple,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  'Hello Mohamed',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color:
                          Get.isDarkMode ? Appcolors.white : Appcolors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'You have a new reminder',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode ? Appcolors.white : darkGreyClr),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: TaskContainer(payLoad: _payLoad!,)),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
