import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/utsav_details/bindings/utsav_details_binding.dart';
import 'app/modules/utsav_details/views/utsav_details_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Utsav Details",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Inter', // Assuming Inter font or similar modern sans-serif
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: "/utsav-details",
      getPages: [
        GetPage(
          name: "/utsav-details",
          page: () => const UtsavDetailsView(),
          binding: UtsavDetailsBinding(),
        ),
      ],
    );
  }
}