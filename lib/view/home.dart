import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mvc_app/controller/controller.dart';
import 'package:mvc_app/view/product_tyl.dart';

class HomePage extends StatelessWidget {
    final ProductController productController = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("MakeUp MVC App"),
        ),
        titleSpacing: 60,
        backgroundColor: Colors.black26,
        toolbarHeight: 50,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Best MakeUp",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.view_list_rounded,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
          child:  Obx(

                      () {
                    if (productController.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else
                      return StaggeredGridView.countBuilder(


                        crossAxisCount: 3,
                        itemCount: productController.productList.length,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          return ProductTile(productController.productList[index]);
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      );
                  }),    )
        ],
      ),
    );
  }
}
