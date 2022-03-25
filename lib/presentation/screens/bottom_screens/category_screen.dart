import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycart/bloc_layer/shop_cubit/shop_cubit.dart';
import 'package:mycart/data/data_model/shop_models.dart';
import 'package:mycart/presentation/components/general.dart';
import 'package:mycart/presentation/screens/bottom_screens/products_screen.dart';
import 'package:mycart/presentation/screens/colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getCategories(),
      child: Scaffold(
        backgroundColor: MyColors.clear,
        body: SafeArea(
          child: BlocBuilder<ShopCubit, ShopState>(
            builder: (context, state) {
              var cubit = ShopCubit.get(context);
              if (state is CategorySuccess) {
                return MyScaffold(slivers: [
                  MyAppBar(title: 'Categories'),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      CategoryModel currentCategory =
                          state.categoriesModel.data![index];
                      return Column(
                        children: [
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Container(
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                    ),
                                    child: Image.network(
                                      currentCategory.image!,
                                      fit: BoxFit.fill,
                                    )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Text(
                                    currentCategory.name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                            color: MyColors.disable),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: MyColors.disable,
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Divider(),
                        ],
                      );
                    }, childCount: state.categoriesModel.data!.length),
                  )
                ]);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
