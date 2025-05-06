import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants/strings.dart';
import 'package:flutter_test_app/controllers/get_product.dart';
import 'package:flutter_test_app/controllers/update_product.dart';
import 'package:flutter_test_app/presentation/update_product/update_product.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCtr = Get.put(GetProductController());
    var updateCtr = Get.put(UpdateProductController());
    return Scaffold(
      body: ListView.builder(
        itemCount: homeCtr.productData.length,
        itemBuilder:(context, index) {
          final data = homeCtr.productData[index];
          return Card(
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async{
                      await updateCtr.getProducts(data.id.toString());
                      Get.to(()=> UpdateProductScreen());
                      
                    }, child: Text(AppStrings.editButton)),
                    Column(
                      children: [
                        Text(data.price.toString()),
                        Text(data.price.toString()),
                        Text(data.price.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
          
        },));
  }
}
