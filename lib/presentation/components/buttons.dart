import 'package:flutter/material.dart';
import 'package:mycart/presentation/screens/colors.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
    required this.onPressed,
    required this.lable,
    this.height = 45,
  }) : super(key: key);

  final Function() onPressed;
  final String lable;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: MyColors.disable,
          blurRadius: 6,
          offset: Offset(0, 8),
        )
      ]),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyColors.main),
          elevation: MaterialStateProperty.all(15),
        ),
        onPressed: onPressed,
        child: Text(
          lable,
          style: Theme.of(context)
              .textTheme
              .button
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  CategoryButton(
      {Key? key,
      required this.color,
      required this.label,
      required this.image,
      required this.onPressed})
      : super(key: key);

  Color color;
  String label;
  String image;
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 100,
        height: 60,
        child: Stack(children: [
          Container(
            foregroundDecoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 3),
                  blurRadius: 5,
                )
              ],
              color: color,
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              image:
                  DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            ),
          ),
          Center(
            child: Text(label,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ]),
      ),
    );
  }
}
