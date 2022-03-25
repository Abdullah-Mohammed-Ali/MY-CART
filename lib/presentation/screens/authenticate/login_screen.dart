import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycart/bloc_layer/login_cubit/login_cubit.dart';
import 'package:mycart/presentation/components/buttons.dart';
import 'package:mycart/presentation/components/general.dart';
import 'package:mycart/presentation/components/text_field.dart';
import 'package:mycart/routes.dart';

import '../../consts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool move = false;
  double pos = 60;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height - 15;
    var width = MediaQuery.of(context).size.width - 15;

    return Form(
      key: keyForm,
      child: BlocBuilder<AuthCubit, AuthStates>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          if (state is LoginSuccess) {
            print('go to next screen');
            print(state.user!.photo);
            SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
              Navigator.pushReplacementNamed(context, Screens.homeScreen,
                  arguments: state.user);
            });
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: MyAppBars(),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      loginScreen,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    MyTextForm(
                      height: height * 0.065,
                      lable: 'email Adress',
                      controller: emailController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter email address';
                        }
                      },
                      icon: Icon(Icons.email),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    MyTextForm(
                      height: height * 0.065,
                      isPass: true,
                      controller: passController,
                      lable: 'Password',
                      icon: Icon(Icons.visibility_outlined),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Password is Too Short';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.08,
                    ),
                    AnimatedAlign(
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(seconds: 1),
                      alignment: move
                          ? AlignmentDirectional.centerEnd
                          : AlignmentDirectional.center,
                      child: AnimatedRotation(
                        curve: Curves.decelerate,
                        duration: Duration(milliseconds: 750),
                        turns: move ? 1 : 2,
                        child: AnimatedOpacity(
                          opacity: move ? 0.5 : 1,
                          duration: Duration(milliseconds: 750),
                          child: DefaultButton(
                            lable: 'Login',
                            onPressed: () async {
                              setState(() {
                                move = !move;
                                print(move);
                              });
                              cubit.login(
                                  email: emailController.value.text,
                                  password: passController.value.text);

                              if (keyForm.currentState!.validate()) {}
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('you don\'t have an account ?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Screens.registerScreen);
                          },
                          child: Text(
                            'Register',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.blue[800]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
