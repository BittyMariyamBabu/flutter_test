import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants/urls.dart';
import 'package:flutter_test_app/models/login_model/login_model.dart';
import 'package:flutter_test_app/presentation/home/home.dart';
import 'package:flutter_test_app/services/api_helper.dart';
import 'package:flutter_test_app/services/local.dart';
import 'package:flutter_test_app/utils/snackbar.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Login Method
var formKeyLogin = GlobalKey<FormState>();
final usernameCtr = TextEditingController();
final passCtr = TextEditingController();
var isLoading = false.obs;

var isVisible = false.obs;
void toggleVisible() => isVisible.value = !isVisible.value;

void login(BuildContext context) async {
  isLoading.value = true;

  try {
    var response = await ApiHelper(AppUrls.baseurl).postRequest(AppUrls.login, {
      "username": usernameCtr.text.trim(),
      "password": passCtr.text.trim(),
    });

    if (response != null) {
      final loginResponse = LoginModel.fromJson(response.data);

      await LocalService.setLoginData(
        kAccessToken: loginResponse.accessToken ?? '',
        kRefreshToken: loginResponse.refreshToken ?? '',
      );

      successToast(
        msg: 'Logged in as ${loginResponse.username ?? 'User'}',
      );

      //Navigate to Home
      Get.offAll(() => HomeScreen(), transition: Transition.cupertino);
    } else {
      errorToast(msg: 'Login failed: Invalid response');
    }
  } catch (e) {
    errorToast(msg: 'Unexpected error occurred');
    if (kDebugMode) {
      print("Unexpected login error: $e");
    }
  } finally {
    isLoading.value = false;
  }
}
}
