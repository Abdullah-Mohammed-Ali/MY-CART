import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycart/bloc_layer/fav_cubit/fav_cubit.dart';
import 'package:mycart/data/data_model/shop_models.dart';
import 'package:mycart/presentation/components/general.dart';
import 'package:mycart/presentation/screens/bottom_screens/products_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit()..getFavs(),
      child: Scaffold(
        body: SafeArea(
          child: MyScaffold(slivers: [
            MyAppBar(
              title: 'Favourites',
            ),
            SliverFillRemaining(
              child: BlocBuilder<FavCubit, FavState>(
                builder: (context, state) {
                  var cubit = FavCubit.get(context);
                  if (state is LoadingFavsState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FavsError) {
                    return const AlertDialog(
                      title: Text(
                          'there is an unexpected error, please try again'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: cubit.products.length,
                      itemBuilder: ((context, index) {
                        ProductModel current = cubit.products[index];
                        return Container(
                            padding: EdgeInsets.all(15),
                            height: 120,
                            child: Row(
                              children: [
                                Image.network(current.image),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      top: 10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          current.name,
                                          maxLines: 2,
                                        )),
                                        Expanded(
                                            child:
                                                Text(current.price.toString())),
                                      ],
                                    ),
                                  ),
                                ),
                                FavIcon(
                                  isFav: true,
                                  onPressed: () async {
                                    await cubit.setFav(current.id);
                                  },
                                ),
                              ],
                            ));
                      }),
                    );
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
