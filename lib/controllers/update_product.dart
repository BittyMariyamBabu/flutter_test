
import 'package:flutter/foundation.dart';
import 'package:flutter_test_app/constants/urls.dart';
import 'package:flutter_test_app/models/get_products_model/get_products_model.dart';
import 'package:flutter_test_app/models/get_products_model/product.dart';
import 'package:flutter_test_app/services/api_helper.dart';
import 'package:flutter_test_app/utils/snackbar.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  final RxBool _loading = false.obs;
  final RxBool _error = false.obs;
  String _message = "";
  late final RxList<Product> _productData =
      RxList<Product>([]);

  RxBool get error => _error;
  RxBool get loading => _loading;
  String get message => _message;
  RxList<Product> get productData => _productData;

  getProducts(String id) async {
  loading.value = true;
  try {
    var response = await ApiHelper(AppUrls.baseurl).getRequest(AppUrls.getProduct);

    if (response != null) {
       GetProductsModel tempdata = GetProductsModel.fromJson(response.data);
      _productData.value = tempdata.products ?? [];
    } else {
      errorToast(msg: 'Login failed: Invalid response');
    }
  } catch (e) {
    errorToast(msg: 'Unexpected error occurred');
    if (kDebugMode) {
      print("Unexpected login error: $e");
    }
  } finally {
    loading.value = false;
  }
}

}

