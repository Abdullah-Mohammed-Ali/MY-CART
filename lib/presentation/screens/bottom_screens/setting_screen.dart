import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycart/bloc_layer/setting_cubit/setting_cubit.dart';
import 'package:mycart/presentation/components/buttons.dart';
import 'package:mycart/presentation/components/general.dart';
import 'package:mycart/presentation/components/text_field.dart';
import 'package:mycart/routes.dart';

class SettingScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingCubit()..getUser(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              var cubit = SettingCubit.get(context);
              if (state is LoadingProfile) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LogOutSuccess) {
                SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
                  Navigator.pushReplacementNamed(
                      context, Screens.WelcomeScreen);
                });
                return Center();
              } else {
                return MyScaffold(
                  slivers: [
                    MyAppBar(
                      title: 'MY CART',
                    ),
                    SliverFillRemaining(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            MyLable(
                              controller: controller,
                              lable: 'Name',
                              content: cubit.currentUser!.name,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            MyLable(
                              controller: controller,
                              lable: 'phone Number',
                              content: cubit.currentUser!.phone,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            MyLable(
                              controller: controller,
                              lable: 'E-mail',
                              content: cubit.currentUser!.email,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            MyLable(
                              controller: controller,
                              lable: 'Points',
                              content: cubit.currentUser!.points.toString(),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DefaultButton(
                                onPressed: () async {
                                  await cubit.logOut();
                                },
                                lable: 'Log Out')
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
