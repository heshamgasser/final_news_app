import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/styles/app_color.dart';

class SettingsWidget extends StatelessWidget {
  String optionOne;
  String optionTwo;
  bool optionOneSelected;
  Function changeValue;

  SettingsWidget(
      {required this.optionOne,
      required this.optionTwo,
      required this.optionOneSelected,
      required this.changeValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: AppColor.primaryColor),
      ),
      child: Row(
        children: [
          Text(
            optionOneSelected ? optionOne : optionTwo,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Spacer(),
          Text(
            'Ar',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(width: 5.w),
          Switch(
            activeTrackColor: AppColor.primaryColor,
            inactiveTrackColor: AppColor.primaryColor,
            value: optionOneSelected,
            onChanged: (value) {
              changeValue();
            },
          ),
          SizedBox(width: 5.w),
          Text(
            'En',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
