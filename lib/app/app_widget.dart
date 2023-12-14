import 'package:flutter/material.dart';
import 'package:pagination_assignment/core/color_constant.dart';
import 'package:pagination_assignment/dashboard_pagination/page/dashboard_pagination.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        primaryColor: ColorConstant.leadCardPrimaryDarkColor,
      ),
      home: const DashboardPagination(),
    );
  }
}
