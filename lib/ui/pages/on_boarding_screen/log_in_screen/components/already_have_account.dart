import 'package:flutter/material.dart';

import '../../../../../styles/theme.dart';

class AlreadyHaveAccount extends StatelessWidget {


  const AlreadyHaveAccount({Key? key, this.logIn = true, required this.onTap})
      : super(key: key);
  final bool logIn;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          logIn?'Dont\'t have an account ? ':'Already have an account',
          style: supHeadingStyle.copyWith(
              fontSize: 15, color: darkHeaderClr.withOpacity(0.7)),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
           logIn? 'SignUp ':'LogIn',
            style: supHeadingStyle.copyWith(
                fontSize: 15, color: Appcolors.purple),
          ),
        ),
      ],

    );
  }


}
