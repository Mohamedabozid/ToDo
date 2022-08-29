import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:to_do/ui/pages/home_page/cubit/cubit.dart';
import 'package:to_do/ui/pages/on_boarding_screen/log_in_screen/log_in.dart';
import 'package:to_do/ui/pages/on_boarding_screen/sign_up_screen/cubit/cubit.dart';
import 'package:to_do/ui/pages/on_boarding_screen/sign_up_screen/cubit/states.dart';
import 'package:to_do/ui/size_config.dart';

import '../../../../styles/theme.dart';
import '../../add_task_page/components/rounded_contained.dart';
import '../../add_task_page/components/rounded_input_field.dart';
import '../../home_page/home_page.dart';
import '../log_in_screen/components/already_have_account.dart';
import '../or_divider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) => ToDoRegisterCubit(),
      child: BlocConsumer<ToDoRegisterCubit, ToDoRegisterStates>(
        listener: (context, state)
        {
          if(state is ToDoCreateUserSuccessState)
          {
            navigateAndFinish(context, HomePage());
          }
        },
        builder: (context, state) {

          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: context.theme.backgroundColor,
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
              backgroundColor: context.theme.backgroundColor,
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(children: [
                  Align(
                      alignment: Alignment(-0.7, 0),
                      child: Text(
                        'Sign Up',
                        style: headingStyle.copyWith(letterSpacing: 2),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment(0, 0),
                      child: Text(
                        'Create an account it\'s free',
                        style: bodyStyle.copyWith(
                            letterSpacing: 2, color: Colors.grey),
                      )),
                  InputField(
                    prefixxIcon: Icon(
                      Icons.person,
                      size: 30,
                      color: Appcolors.purple,
                    ),
                    controller: _userNameController,
                    textInputType: TextInputType.text,
                    text: '',
                    hintText: 'Username',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputField(
                    prefixxIcon: Icon(
                      Icons.email_rounded,
                      size: 30,
                      color: Appcolors.purple,
                    ),
                    controller: _emailController,
                    textInputType: TextInputType.text,
                    text: '',
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputField(
                    controller: _phoneNumberController,
                    text: '',
                    hintText: 'Phone Number',
                    textInputType: TextInputType.phone,
                    prefixxIcon: Icon(
                      Icons.phone,
                      size: 30,
                      color: Appcolors.purple,
                    ),
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputField(
                    prefixxIcon: Icon(
                      Icons.lock_rounded,
                      size: 30,
                      color: Appcolors.purple,
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    textInputType: TextInputType.visiblePassword,
                    icon: Icon(Icons.remove_red_eye,
                        size: 30, color: Appcolors.purple),
                    text: '',
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputField(
                    prefixxIcon: Icon(
                      Icons.lock_rounded,
                      size: 30,
                      color: Appcolors.purple,
                    ),
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    icon: Icon(
                      Icons.remove_red_eye,
                      size: 30,
                      color: Appcolors.purple,
                    ),
                    text: '',
                    hintText: 'Confirm password',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      ToDoRegisterCubit.get(context).userRegister(
                        name: _userNameController.text,
                        email: _emailController.text,
                        phone: _phoneNumberController.text,
                        password: _passwordController.text,
                      );
                    },
                    child: RoundedContainer(
                      borderColor: Colors.transparent,
                      color: Appcolors.purple,
                      child: Center(
                          child: Text(
                        'Sign Up',
                        style:
                            bodyStyle.copyWith(color: white, letterSpacing: 1),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AlreadyHaveAccount(
                    onTap: () {
                      Get.to(LogIn());
                    },
                    logIn: false,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  OrDivider(
                    height: 50,
                  ),
                  SizedBox(
                    height: 5,
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
                ]),
              ));
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
