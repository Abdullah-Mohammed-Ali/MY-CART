import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycart/bloc_layer/login_cubit/login_cubit.dart';
import 'package:mycart/presentation/components/buttons.dart';
import 'package:mycart/presentation/components/general.dart';
import 'package:mycart/presentation/components/text_field.dart';
import 'package:mycart/routes.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var phoneController = TextEditingController();

  GlobalKey<FormState> myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height - 15;
    var width = MediaQuery.of(context).size.width - 15;
    var cubit = AuthCubit.get(context);
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
            Navigator.pushNamed(context, Screens.homeScreen,
                arguments: state.user);
          });
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: MyAppBars(),
          body: Form(
            key: myKey,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 0, 20.0, 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: const [
                          Center(
                            child: CircleAvatar(
                              radius: 85,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    MyTextForm(
                        controller: userNameController,
                        validate: (val) {
                          if (val.isEmpty) {
                            return 'enter user name';
                          }
                        },
                        lable: 'User Name'),
                    SizedBox(height: height * 0.025),
                    MyTextForm(
                        height: height * 0.065,
                        controller: emailController,
                        validate: (val) {
                          if (val.isEmpty) {
                            return 'enter email';
                          }
                        },
                        lable: 'Email'),
                    SizedBox(height: height * 0.025),
                    MyTextForm(
                        isPass: true,
                        height: height * 0.065,
                        controller: passController,
                        validate: (val) {
                          if (val.isEmpty) {
                            return 'enter password';
                          }
                        },
                        lable: 'Password'),
                    SizedBox(height: height * 0.025),
                    MyTextForm(
                        textInputType: TextInputType.phone,
                        height: height * 0.065,
                        controller: phoneController,
                        validate: (val) {
                          if (val.isEmpty) {
                            return 'enter phone number';
                          }
                        },
                        lable: 'Phone Number'),
                    SizedBox(height: height * 0.03),
                    DefaultButton(
                      onPressed: () {
                        if (myKey.currentState!.validate()) {
                          cubit.register(
                            name: userNameController.text,
                            phone: phoneController.text,
                            password: passController.text,
                            email: emailController.text,
                          );
                        }
                      },
                      lable: 'Register',
                      height: height * 0.07,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
