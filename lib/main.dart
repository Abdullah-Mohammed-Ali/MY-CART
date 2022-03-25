import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycart/bloc_layer/login_cubit/login_cubit.dart';
import 'package:mycart/data/data_provider/api/login_provider.dart';
import 'package:mycart/data/data_provider/api/shop_provider.dart';
import 'package:mycart/data/data_provider/local/cashe_helper.dart';
import 'package:mycart/presentation/screens/colors.dart';
import 'package:mycart/routes.dart';
import 'bloc_layer/observer.dart';

Future<Void?> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAll();

  BlocOverrides.runZoned(() => runApp(MyApp()), blocObserver: MyBlocObserver());
}

Future<void> initAll() async {
  ApiAuth.init();
  await ShopProvider.init();
  await CasheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: MyColors.main));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyAppRoutes _appRoutes = MyAppRoutes();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        darkTheme: ThemeData(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: MyColors.main,
          )),
        ),
        initialRoute: Screens.splashScreen,
        onGenerateRoute: _appRoutes.generateRoute,
      ),
    );
  }
}
