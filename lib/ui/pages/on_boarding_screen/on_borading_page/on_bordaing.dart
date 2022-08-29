import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:to_do/ui/pages/home_page/home_page.dart';
import 'package:to_do/ui/pages/on_boarding_screen/welcome_Screen/welcome_screen.dart';

import '../../../../styles/theme.dart';
import '../../../size_config.dart';
import '../../../widgets/button.dart';
import 'components/circular_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _pageController=PageController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: null,
      body: Container(
        height: SizeConfig.screenHeight,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment(0.9, -0.9),
              child: MyButton(
                height: SizeConfig.screenHeight * 0.07,
                width: SizeConfig.screenWidth * 0.2,
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Get.to(()=>HomePage());
                },
                label: 'Skip',
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/To do list-cuate.svg' ,
                    width: SizeConfig.screenWidth * 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Manage Your Task',
                    style: supHeadingStyle.copyWith(letterSpacing: 2),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'With This Small App You Can Orgnize\n All Your Tasks and Duties in A One\n Single App',
                    style: subBodyStyle.copyWith(
                        letterSpacing: 1,
                        color: darkHeaderClr.withOpacity(0.7)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircularButton(
                    height: 90,
                    width: 90,
                    borderRadius: BorderRadius.circular(70),
                    color: Appcolors.pink,
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 30,
                      color: white,
                    ),
                    onTap: () {
                      Get.off(WelcomePage());
                    },
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
