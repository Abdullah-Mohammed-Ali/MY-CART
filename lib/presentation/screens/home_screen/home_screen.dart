import 'package:flutter/material.dart';
import 'package:mycart/presentation/screens/bottom_screens/category_screen.dart';
import 'package:mycart/presentation/screens/bottom_screens/crate_screen.dart';
import 'package:mycart/presentation/screens/bottom_screens/favourite_screen.dart';
import 'package:mycart/presentation/screens/bottom_screens/products_screen.dart';
import 'package:mycart/presentation/screens/bottom_screens/setting_screen.dart';
import 'package:mycart/presentation/screens/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  List<Widget> screens = [
    ProductsScreen(),
    const CategoryScreen(),
    const CrateScreen(),
    const FavouriteScreen(),
    SettingScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: MyColors.main,
        selectedIconTheme: IconThemeData(color: MyColors.main),
        unselectedIconTheme: IconThemeData(color: MyColors.disable),
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.animateToPage(currentIndex,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubic);
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
              ),
              label: 'categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'Crate'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
              label: 'favorites'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'setting'),
        ],
      ),
      body: PageView(
        children: screens,
        controller: pageController,
        onPageChanged: (index) {
          setState(() {});
          currentIndex = index;
        },
      ),
    );
  }
}
