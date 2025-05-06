import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_app/constants/dimensions.dart';
import 'package:flutter_test_app/constants/strings.dart';
import 'package:flutter_test_app/constants/styles.dart';
import 'package:flutter_test_app/constants/validations.dart';
import 'package:flutter_test_app/controllers/login.dart';
import 'package:flutter_test_app/utils/sizedbox.dart';
import 'package:flutter_test_app/widgets/common_button.dart';
import 'package:flutter_test_app/widgets/common_textfield.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCtr = Get.put(LoginController());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              padding: AppDimensions().symmetricAllPadding(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeight(60.h),
                      Text('Welcome', style: AppStyles.t1),
                      kHeight(10.h),
                      Text('back!', style: AppStyles.t2),
                      kHeight(20.h),
                      Text(
                        AppStrings.loginHeading,
                        style: AppStyles.logintext,
                      ),
                      kHeight(40.h),
                      CustomTextField(
                        controller: loginCtr.usernameCtr,
                        hintText: AppStrings.enterUsername,
                        validator: (value) => validateUsername(value)
                      ),
                      kHeight(10.h),
                      CustomTextField(
                        controller: loginCtr.passCtr,
                        hintText: AppStrings.enterPassword,
                        validator: (value) => validatePassword(value)
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
                            bottom: 50.h,
                          ), // Adjust padding
                          child: CommonButton(
                            ontap: () {
                              // Get.to(()=> HomeScreen());
                              if ((formKey.currentState?.validate() ?? false)) {
                                loginCtr.login(context);
                              }
                            },
                            title: AppStrings.loginButton,
                          ),
                        ),
                      ),
                      kHeight(60.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
