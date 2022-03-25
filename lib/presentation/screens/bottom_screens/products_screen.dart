import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycart/bloc_layer/login_cubit/login_cubit.dart';
import 'package:mycart/bloc_layer/shop_cubit/shop_cubit.dart';
import 'package:mycart/data/data_model/shop_models.dart';
import 'package:mycart/presentation/components/buttons.dart';
import 'package:mycart/presentation/components/general.dart';
import 'package:mycart/presentation/components/text_field.dart';
import 'package:mycart/presentation/screens/colors.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen();

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit()..getHome(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthStates>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
              backgroundColor: MyColors.clear,
              body: SafeArea(
                child: BlocBuilder<ShopCubit, ShopState>(
                  builder: (context, state) {
                    var shopCubit = ShopCubit.get(context);
                    if (state is ScreenSuccess) {
                      List<CategoryModel> categories =
                          shopCubit.categoriesList!;
                      return MyScaffold(slivers: [
                        MyAppBar(title: 'MY CRATE'),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CarouselSlider.builder(
                                  options: CarouselOptions(
                                      height: 150,
                                      autoPlay: true,
                                      aspectRatio: 0.5,
                                      viewportFraction: 1,
                                      reverse: false,
                                      autoPlayInterval: Duration(seconds: 3),
                                      enableInfiniteScroll: false,
                                      enlargeCenterPage: true,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.scale,
                                      autoPlayAnimationDuration:
                                          Duration(seconds: 1),
                                      disableCenter: true),
                                  itemBuilder: (BuildContext context, int index,
                                      int realIndex) {
                                    return Image.network(
                                      shopCubit
                                          .homeModel!.banners[index].image!,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                  itemCount:
                                      shopCubit.homeModel!.banners.length,
                                ),
                                SizedBox(height: 15),
                                HeadText(lable: 'Categories'),
                                SizedBox(height: 10),
                                Container(
                                  height: 130,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        CategoryModel currentCategory =
                                            categories[index];
                                        return Container(
                                          width: 90,
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              Image.network(
                                                currentCategory.image!,
                                                fit: BoxFit.fill,
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  } else {
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  }
                                                },
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                child: Container(
                                                  width: 90,
                                                  color: MyColors
                                                      .categoryBlackBackground,
                                                  child: Text(
                                                      currentCategory.name!,
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              backgroundColor:
                                                                  MyColors
                                                                      .categoryBlackBackground,
                                                              color: Colors
                                                                  .white)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: 15,
                                        );
                                      },
                                      itemCount: categories.length),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                HeadText(
                                  lable: 'New Deals',
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          sliver: SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                ProductModel currentProduct =
                                    shopCubit.homeModel!.products[index];
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            color: MyColors.disable,
                                            offset: Offset(1, 5),
                                            blurRadius: 2)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 6,
                                            child: Image.network(
                                                currentProduct.image)),
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  currentProduct.name,
                                                  textAlign: TextAlign.left,
                                                  maxLines: 2,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                          fontSize: 11,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          color:
                                                              MyColors.disable,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Text(
                                                currentProduct.oldPrice
                                                    .toString(),
                                                style: TextStyle(
                                                    color: MyColors.main,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              if (currentProduct.discount != 0)
                                                Expanded(
                                                  child: Text(
                                                    currentProduct.price
                                                        .toString(),
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          color:
                                                              MyColors.disable,
                                                          fontSize: 10,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                                  ),
                                                ),
                                              Spacer(),
                                              FavIcon(
                                                isFav: shopCubit.favorites[
                                                    currentProduct.id]!,
                                                onPressed: () async {
                                                  await shopCubit.setFav(
                                                      id: currentProduct.id);
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                                  childCount:
                                      shopCubit.homeModel!.products.length),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.5,
                              )),
                        )
                      ]);
                    } else if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          DefaultButton(
                              onPressed: () async {
                                cubit.logOut(context: context);
                              },
                              lable: 'log out'),
                          const SizedBox(height: 20),
                          CategoryButton(
                            color: Colors.blue.shade300.withOpacity(0.6),
                            onPressed: () {
                              print('object');
                            },
                            label: 'Woman',
                            image: 'assets/images/Mask Group 1.png',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class FavIcon extends StatelessWidget {
  const FavIcon({
    Key? key,
    required this.isFav,
    required this.onPressed,
  }) : super(key: key);

  final bool isFav;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      color: MyColors.disable,
      padding: EdgeInsets.all(0),
      icon: isFav
          ? Icon(
              Icons.favorite,
              color: MyColors.main,
            )
          : Icon(Icons.favorite_border),
      onPressed: onPressed,
    );
  }
}
