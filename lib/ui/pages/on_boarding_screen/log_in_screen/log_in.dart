import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:to_do/ui/pages/home_page/cubit/cubit.dart';
import 'package:to_do/ui/pages/home_page/home_page.dart';
import 'package:to_do/ui/pages/on_boarding_screen/log_in_screen/cubit/cubit.dart';
import 'package:to_do/ui/pages/on_boarding_screen/log_in_screen/cubit/states.dart';
import 'package:to_do/ui/pages/on_boarding_screen/sign_up_screen/sign_up_screen.dart';

import '../../../../db/cache_helper.dart';
import '../../../../ui/size_config.dart';
import '../../../../styles/theme.dart';
import '../../add_task_page/components/rounded_contained.dart';
import '../../add_task_page/components/rounded_input_field.dart';
import '../or_divider.dart';
import 'components/already_have_account.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

late TextEditingController _emailController;
late TextEditingController _passwordController;

class _LogInState extends State<LogIn> {
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) => ToDoLoginCubit(),
      child: BlocConsumer<ToDoLoginCubit, ToDoLoginStates>(
        listener: (context, state)
        {
          if(state is ToDoLoginSuccessState)
          {
            CacheHelper.saveData(
                key: 'uId',
                value: state.uId
            ).then((value) {
              navigateAndFinish(
                context,
                HomePage(),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Appcolors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(-0.5, 0),
                    child: Text(
                      'Welcome !',
                      style: supHeadingStyle.copyWith(
                          fontSize: 22, letterSpacing: 2),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign In To Continue !',
                    style: supHeadingStyle.copyWith(
                        letterSpacing: 2,
                        fontSize: 20,
                        color: darkHeaderClr.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.1,
                  ),
                  InputField(
                    obscureText: false,
                    controller: _emailController,
                    text: '',
                    hintText: 'Email Address',
                    textInputType: TextInputType.emailAddress,
                    prefixxIcon: Icon(
                      Icons.email_rounded,
                      size: 25,
                      color: Appcolors.purple,
                    ),
                  ),
                  InputField(
                    obscureText: true,
                    controller: _passwordController,
                    text: '',
                    hintText: 'Password',
                    textInputType: TextInputType.visiblePassword,
                    prefixxIcon: Icon(
                      Icons.password_outlined,
                      size: 25,
                      color: Appcolors.purple,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      ToDoLoginCubit.get(context).userLogin(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
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
                  SizedBox(
                    height: 10,
                  ),
                  AlreadyHaveAccount(
                    onTap: () {

                    },
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.02,
                  ),
                  OrDivider(
                    height: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          'images/google.png',
                          width: SizeConfig.screenWidth * 0.1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/facebook.png',
                          width: SizeConfig.screenWidth * 0.1,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  void navigateAndFinish(
      context,
      widget,
      ) =>
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => widget), (route) {
        return false;
      });
}
