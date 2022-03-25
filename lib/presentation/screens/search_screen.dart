import 'package:flutter/material.dart';
import 'package:mycart/presentation/components/general.dart';
import 'package:mycart/presentation/screens/colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyScaffold(
      slivers: [
        SliverAppBar(
          backgroundColor: MyColors.main,
          title: TextFormField(
            controller: searchController,
            validator: (value) {},
            decoration: InputDecoration(
                label: Text(
              'search here',
              style: TextStyle(color: MyColors.clear),
            )),
          ),
        )
      ],
    ));
  }
}
