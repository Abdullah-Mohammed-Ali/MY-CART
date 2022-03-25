import 'package:flutter/material.dart';
import 'package:mycart/presentation/screens/colors.dart';

class MyTextForm extends StatelessWidget {
  MyTextForm(
      {Key? key,
      required this.controller,
      required this.validate,
      this.isPass = false,
      this.icon,
      this.enabled = true,
      this.textInputType = TextInputType.text,
      this.height = 45,
      required this.lable})
      : super(key: key);
  TextInputType textInputType;
  final String lable;
  double height;
  Icon? icon;
  final TextEditingController controller;
  bool isPass;
  bool enabled;
  // String title;
  var validate;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: enabled,
        keyboardType: textInputType,
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: icon,
          labelText: lable,
        ),
        validator: validate,
      ),
    );
  }
}

class HeadText extends StatelessWidget {
  HeadText({
    required this.lable,
    Key? key,
  }) : super(key: key);

  String lable;

  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: Theme.of(context).textTheme.headline4!.copyWith(
          fontWeight: FontWeight.w300, fontSize: 20, color: MyColors.main),
    );
  }
}

class MyLable extends StatelessWidget {
  MyLable({
    Key? key,
    required this.controller,
    required this.lable,
    required this.content,
  }) : super(key: key);

  final TextEditingController controller;
  final String lable;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable),
        SizedBox(
          height: 3,
        ),
        MyTextForm(
          validate: (value) {
            if (controller.selection.isValid) return '';
          },
          controller: controller,
          enabled: false,
          lable: content,
        ),
      ],
    );
  }
}
