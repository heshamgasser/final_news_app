import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/sources_model.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/shared/network/api_manager.dart';
import 'package:news_app/views/widgets/news_widget.dart';
import 'package:provider/provider.dart';

import '../../shared/styles/app_color.dart';

class GetSourcesWidget extends StatelessWidget {
  List<Sources> sources;

  GetSourcesWidget({required this.sources});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NewsProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 40.h,
          child: Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    provider.changeSourceIndex(index: index);
                  },
                  child: Container(
                    width: 120.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryColor),
                      color: provider.selectedSource == index
                          ? Colors.white
                          : AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        sources[index].name ?? '',
                        style: provider.selectedSource == index
                            ? Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColor.primaryColor)
                            : Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemCount: sources.length,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        FutureBuilder(
          future: ApiManager.getNews(sources[provider.selectedSource].id ?? ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              );
            }
            var articles = snapshot.data?.articles ?? [];
            return NewsWidget(articles: articles);
          },
        )
      ],
    );
  }
}
