
import 'package:flutter/material.dart';
import 'package:to_do/ui/pages/on_boarding_screen/log_in_screen/log_in.dart';

import '../../../../db/cache_helper.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token',).then((value)
  {
    if(value)
    {
      navigateAndFinish(context, LogIn(),);
    }
  });



}
void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });


// void printFullText(String text)
// {
//   final pattern = RegExp('{1,800}');//800 is the size of each chunk
//   pattern.allMatches(text!).forEach((match))=>print(match.group(0));
// }

String? uId ='';