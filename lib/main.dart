import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/providers/app_provider.dart';
import 'package:news_app/shared/styles/app_theme.dart';
import 'package:news_app/views/category_screen.dart';
import 'package:news_app/views/news_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: NewsCloud()));
}

class NewsCloud extends StatelessWidget {
  const NewsCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: CategoryScreen.routeName,
          routes: {
            CategoryScreen.routeName: (context) => CategoryScreen(),
            NewsScreen.routeName: (context) => NewsScreen(),
          },

          theme: AppTheme.lightTheme,

        );
      },
    );
  }
}
