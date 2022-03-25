import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycart/bloc_layer/login_cubit/login_cubit.dart';
import 'package:mycart/presentation/screens/colors.dart';
import 'package:mycart/routes.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Color> colors = [Colors.purpleAccent, Colors.greenAccent, Colors.red];
  Alignment animated = Alignment.center;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthCubit>().splashChoice(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: MyColors.clear,
            ),
            child: Stack(fit: StackFit.expand, children: [
              Positioned(
                  top: 55,
                  right: -120,
                  child: Image.asset('assets/images/Ellipse.png')),
              Positioned(
                  bottom: 55,
                  left: -120,
                  child: Image.asset('assets/images/Ellipse.png')),
              AnimatedAlign(
                duration: Duration(seconds: 1),
                alignment: cubit.ismoved ? Alignment.centerRight : animated,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Image.asset('assets/images/Group 20.png'),
                ),
              ),
              Positioned.fill(
                bottom: 120,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'MY CRATE',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: MyColors.main),
                    )),
              )
            ]),
          ),
        );
      },
    );
  }
}
