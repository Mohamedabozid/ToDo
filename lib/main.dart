import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/db/db_helper.dart';
import 'package:to_do/services/theme_services.dart';
import 'package:to_do/styles/theme.dart';
import 'package:to_do/ui/pages/home_page/components/constants.dart';
import 'package:to_do/ui/pages/home_page/cubit/cubit.dart';
import 'package:to_do/ui/pages/home_page/home_page.dart';
import 'package:to_do/ui/pages/on_boarding_screen/log_in_screen/log_in.dart';

import 'db/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  await DBHelper.initDb();
  await GetStorage.init();

  Widget widget;
  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = HomePage();
  } else {
    widget = LogIn();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  MyApp({
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ToDoCubit()..getUserData(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeServices().themes,
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
