import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/constants/AppColors.dart';
import 'package:shopx/core/widgets/MyDrawer.dart';
import 'package:shopx/features/card/presentation/pages/Cart.dart';
import 'package:shopx/features/shop/data/Product.dart';
import 'package:shopx/features/shop/domain/cubit/products_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shopx/features/shop/presentation/pages/ViewProduct.dart';

class ViewAllProducts extends StatefulWidget {
  @override
  _ViewAllProductsState createState() => _ViewAllProductsState();
}

class _ViewAllProductsState extends State<ViewAllProducts>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => ProductsCubit()..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.Red,
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart_outlined) , onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            })
          ],
          title: Text('Products By Categories'.tr()),
          bottom: TabBar(
            indicatorColor: AppColors.White,
            tabs: [
              Tab(
                text: 'Electronics'.tr(),
              ),
              Tab(
                text: 'Jewelery'.tr(),
              ),
              Tab(
                text: 'Men Clothing'.tr(),
              ),
              Tab(
                text: 'Women Clothing'.tr(),
              ),
            ],
            controller: tabController,
          ),
        ),
        drawer: MyDrawer(),
        body: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            print('Products listener');
            print(state);
            if (state is ProductsError)
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
          },
          builder: (context, state) {
            print('Products builder');
            print(state);
            if (state is ProductsLoading)
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.Red,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.PGrey),
                ),
              );
            else if (state is ProductsSuccessfully)
              return TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: state.product.length,
                    itemBuilder: (context, i) {
                      return state.product[i].category == Category.ELECTRONICS
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ViewProduct(product: state.product[i],)),
                                  );
                                },
                                child: Card(
                                  elevation: 2.0,
                                  shadowColor: AppColors.Red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 200.0,
                                        child: Hero(
                                            tag: "Image",
                                            child: Image.network(state.product[i].image)),
                                      ),
                                      SizedBox(height:6.0,),
                                      Text(
                                        state.product[i].title,
                                        style: TextStyle(fontSize: 20.0),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height:4.0,),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            state.product[i].price.toString() +
                                                " \$",
                                            style: TextStyle(
                                              color: AppColors.Red,
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    },
                  ),
                  ListView.builder(
                    itemCount: state.product.length,
                    itemBuilder: (context, i) {
                      return state.product[i].category == Category.JEWELERY
                          ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ViewProduct(product: state.product[i],)),
                            );
                          },
                          child: Card(
                            elevation: 2.0,
                            shadowColor: AppColors.Red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Container(
                                  height: 200.0,
                                  child: Hero(
                                      tag: "Image",
                                      child: Image.network(state.product[i].image)),
                                ),
                                SizedBox(height:6.0,),
                                Text(
                                  state.product[i].title,
                                  style: TextStyle(fontSize: 20.0),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height:4.0,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      state.product[i].price.toString() +
                                          " \$",
                                      style: TextStyle(
                                        color: AppColors.Red,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                          : Container();
                    },
                  ),
                  ListView.builder(
                    itemCount: state.product.length,
                    itemBuilder: (context, i) {
                      return state.product[i].category == Category.MEN_CLOTHING
                          ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ViewProduct(product: state.product[i],)),
                            );
                          },
                          child: Card(
                            elevation: 2.0,
                            shadowColor: AppColors.Red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Container(
                                  height: 200.0,
                                  child: Hero(
                                      tag: "Image",
                                      child: Image.network(state.product[i].image)),
                                ),
                                SizedBox(height:6.0,),
                                Text(
                                  state.product[i].title,
                                  style: TextStyle(fontSize: 20.0),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height:4.0,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      state.product[i].price.toString() +
                                          " \$",
                                      style: TextStyle(
                                        color: AppColors.Red,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                          : Container();
                    },
                  ),
                  ListView.builder(
                    itemCount: state.product.length,
                    itemBuilder: (context, i) {
                      return state.product[i].category == Category.WOMEN_CLOTHING
                          ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ViewProduct(product: state.product[i],)),
                            );
                          },
                          child: Card(
                            elevation: 2.0,
                            shadowColor: AppColors.Red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Container(
                                  height: 200.0,
                                  child: Hero(
                                      tag: "Image",
                                      child: Image.network(state.product[i].image)),
                                ),
                                SizedBox(height:6.0,),
                                Text(
                                  state.product[i].title,
                                  style: TextStyle(fontSize: 20.0),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height:4.0,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      state.product[i].price.toString() +
                                          " \$",
                                      style: TextStyle(
                                        color: AppColors.Red,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                          : Container();
                    },
                  ),
                ],
              );
            else
              return Container();
          },
        ),
      ),
    );
  }
}
