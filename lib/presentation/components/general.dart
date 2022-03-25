import 'package:flutter/material.dart';
import 'package:mycart/presentation/screens/colors.dart';

import '../../routes.dart';

PreferredSize MyAppBars({
  List<Widget>? actions,
  Widget? leading,
}) {
  return PreferredSize(
    preferredSize: Size(
      double.maxFinite,
      65,
    ),
    child: AppBar(
      iconTheme: IconThemeData(color: Colors.blue[800]),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: actions,
      leading: leading,
    ),
  );
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key? key,
    required this.slivers,
  }) : super(key: key);

  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: slivers);
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      pinned: false,
      stretch: false,
      backgroundColor: MyColors.main,
      elevation: 5,
      shadowColor: MyColors.main,
      flexibleSpace: Center(
          child: Text(
        title,
        style: Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            color: MyColors.clear,
            letterSpacing: 4),
      )),
      actions: [
        IconButton(
          padding: EdgeInsetsDirectional.zero,
          onPressed: () {
            Navigator.pushNamed(context, Screens.searchScreen);
          },
          icon: Icon(
            Icons.search,
            color: MyColors.clear,
          ),
        )
      ],
    );
  }
}
