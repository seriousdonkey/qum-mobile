import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qum/app_bindings.dart';
import 'package:qum/ui/routes/app_pages.dart';
import 'package:qum/ui/routes/app_routes.dart';

void main() {
  initializeDateFormatting('de');
  runApp(const QumApp());
}

class QumApp extends StatelessWidget {
  const QumApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Qum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.DASHBOARD,
      initialBinding: AppBindings(),
    );
  }
}
