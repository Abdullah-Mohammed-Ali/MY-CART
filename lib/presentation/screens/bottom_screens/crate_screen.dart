import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycart/presentation/components/general.dart';

import '../colors.dart';

class CrateScreen extends StatelessWidget {
  const CrateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: MyAppBars(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: 25),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: MyColors.clear,
                    borderRadius: BorderRadiusDirectional.circular(15),
                    boxShadow: [
                      BoxShadow(color: MyColors.disable, offset: Offset(2, 5))
                    ],
                  ),
                  height: 120,
                  child: Stack(
                    overflow: Overflow.visible,
                    fit: StackFit.passthrough,
                    children: [
                      Text('anyThing'),
                      Positioned(
                        top: -25,
                        child: Container(
                          height: 90,
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/Mask Group 1.png'),
                              ),
                              borderRadius:
                                  BorderRadiusDirectional.circular(15)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 55),
                Container(
                  width: double.maxFinite,
                  height: 160,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: 40,
                        left: 50,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 90,
                          height: 120,
                          decoration: BoxDecoration(
                            color: MyColors.clear,
                            borderRadius: BorderRadiusDirectional.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: MyColors.disable,
                                  offset: Offset(2, 5))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          height: 90,
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/Mask Group 1.png'),
                              ),
                              borderRadius:
                                  BorderRadiusDirectional.circular(15)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
