import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:to_do/ui/pages/home_page/home_page.dart';
import 'package:to_do/ui/pages/on_boarding_screen/log_in_screen/log_in.dart';
import 'package:to_do/ui/pages/on_boarding_screen/sign_up_screen/sign_up_screen.dart';

import '../../../../styles/theme.dart';
import '../../../size_config.dart';
import '../../add_task_page/components/rounded_contained.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset('images/User flow-amico.svg',
                width: SizeConfig.screenWidth * 0.7,
                height: SizeConfig.screenHeight * 0.5),
            SizedBox(
              height: 10,
            ),
            Text(
              'Hello ! ',
              style: headingStyle.copyWith(
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome to the best Task \n Manager baby ! ',
              style: supHeadingStyle.copyWith(
                  letterSpacing: 2,
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: darkHeaderClr.withOpacity(0.7)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(LogIn());
              },
              child: RoundedContainer(
                borderColor: Colors.transparent,
                color: Appcolors.purple,
                child: Center(
                  child: Text(
                    'Login',
                    style: bodyStyle.copyWith(color: white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {Get.to(SignUpScreen());},
              child: RoundedContainer(
                borderColor: Colors.transparent,
                color: Appcolors.purple,
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: bodyStyle.copyWith(color: white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(HomePage(),
                    curve: Curves.easeInOutQuint,
                    duration: Duration(milliseconds: 300));
              },
              child: RoundedContainer(
                borderColor: Appcolors.purple,
                color: white,
                child: Center(
                  child: Text(
                    'Register Later',
                    style: bodyStyle.copyWith(
                        color: Appcolors.purple, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
