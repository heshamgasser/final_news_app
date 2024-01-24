import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/providers/app_provider.dart';
import 'package:news_app/shared/styles/app_color.dart';
import 'package:news_app/views/category_screen.dart';
import 'package:news_app/views/widgets/setting_widget.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('Hello'),
          accountEmail: Text('heshamgasser32@gmail.com'),
          decoration: BoxDecoration(color: AppColor.primaryColor),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, CategoryScreen.routeName);
                },
                child: Row(
                  children: [
                    Icon(Icons.home, size: 30.sp, color: AppColor.primaryColor,),
                    SizedBox(width: 20.w),
                    Text('Home', style: Theme.of(context).textTheme.displayLarge,)
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Language',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 10.h),
              SettingsWidget(
                  optionOne: 'English',
                  optionTwo: 'Arabic',
                  optionOneSelected: appProvider.optionOneSelected,
                  changeValue: () {
                    appProvider.changeOptionOneSelected();
                  }),
            ],
          ),
        )
      ],
    );
  }
}
