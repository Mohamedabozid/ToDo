import 'package:flutter/material.dart';

import '../home_page/home_page.dart';
import 'on_borading_page/on_bordaing.dart';
import 'welcome_Screen/welcome_screen.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  int _currentPage = 0;
  List<Widget> list = [OnBoardingPage(), WelcomePage(), HomePage()];
  // final PageController _pageController = PageController(initialPage: 0);
  // int _currentPage = 0;
  // List<Widget> list = [OnBoardingPage(), WelcomePage(), HomePage()];
  // List<Widget> _buildPageIndicator() {
  //   List<Widget> list = [OnBoardingPage(), WelcomePage(), HomePage()];
  //   for (int i = 0; i < _numPages; i++) {
  //     list.add(i == _currentPage ? _indicator(true) : _indicator(false));
  //   }
  //   return list;
   //}

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [...list,],
      ),
      Indicator(index: _currentPage)
    ]);
  }

}
class Indicator extends StatelessWidget {
   const Indicator({Key? key,required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0,0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _indicator(index==0?true:false),
          _indicator(index==1?true:false),
          _indicator(index==2?true:false),
          ],
      ),
    );
  }
}
Widget _indicator(bool isActive) {
  return Container(
    height: 10,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 10 : 8.0,
      width: isActive ? 12 : 8.0,
      decoration: BoxDecoration(
        boxShadow: [
          isActive
              ? BoxShadow(
            color: Color(0XFF2FB7B2).withOpacity(0.72),
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: Offset(
              0.0,
              0.0,
            ),
          )
              : BoxShadow(
            color: Colors.transparent,
          )
        ],
        shape: BoxShape.circle,
        color: isActive ? Color(0XFF6BC4C9) : Color(0XFFEAEAEA),
      ),
    ),
  );
}