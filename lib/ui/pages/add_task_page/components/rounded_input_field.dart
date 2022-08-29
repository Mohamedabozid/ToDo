import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/ui/pages/add_task_page/components/rounded_contained.dart';

import '../../../../styles/theme.dart';

class InputField extends StatelessWidget {
  TextEditingController? controller;
  final String hintText;
  final String text;
  final Widget? widget;
  Icon? icon;
  TextInputType? textInputType;
  Icon? prefixxIcon;

  final bool obscureText;


  InputField(
      {Key? key,
      this.controller,
      required this.hintText,
      required this.text,
      this.widget,
      this.icon,
      this.prefixxIcon,
      this.obscureText = false,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: bodyStyle.copyWith(letterSpacing: 2),
        ),
        RoundedContainer(
          borderColor: Appcolors.purple,
          color: kPrimaryLightColor,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(


                  obscureText: obscureText,
                  keyboardType: textInputType,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: Appcolors.black,
                      fontWeight: FontWeight.w500,letterSpacing: 1),
                  readOnly: widget != null ? true : false,
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: prefixxIcon,
                    suffixIcon: icon,
                    hintText: hintText,
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Appcolors.purple,
                        fontWeight: FontWeight.w500,letterSpacing: 2),
                    border: InputBorder.none,
                    // enabledBorder: UnderlineInputBorder(
                    //     borderSide: BorderSide(
                    //         width: 0, color: context.theme.backgroundColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 0, color: context.theme.backgroundColor)),
                  ),
                ),
              ),
              widget ?? Container(),
            ],
          ),
        ),
      ],
    );
  }


}
