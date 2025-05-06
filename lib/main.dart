// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_app/constants/colors.dart';
import 'package:flutter_test_app/presentation/login/login.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// void setup() {
//   // Validate required environment variables first
//   _validateEnvVariables();

//   // Register Dio as a singleton in GetIt
//   getIt.registerSingleton<Dio>(setupDio(AppUrls.baseurl));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load environment variables first
  await dotenv.load(fileName: 'assets/.env');

  // setup(); // Setup GetIt after environment is loaded

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(1.0),
      ), // Disable scaling globally
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:
            (context, child) => GetMaterialApp(
              // navigatorObservers: [routeObserver],
              useInheritedMediaQuery: true,
              theme: ThemeData(
                fontFamily: GoogleFonts.poppins().fontFamily,
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme,
                ), // Inherits the app's text theme styles
                scaffoldBackgroundColor: AppColors.whiteColor,
                appBarTheme: const AppBarTheme(
                  surfaceTintColor: Colors.transparent,
                ),
                bottomSheetTheme: const BottomSheetThemeData(
                  surfaceTintColor: AppColors.whiteColor,
                  backgroundColor: AppColors.whiteColor,
                ),
                cardTheme: const CardTheme(
                  surfaceTintColor: AppColors.whiteColor,
                ),
                textSelectionTheme: TextSelectionThemeData(
                  selectionHandleColor: AppColors.primaryColor,
                ),
              ),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Test',
              home: LoginScreen(),
            ),
      ),
    );
  }
}
