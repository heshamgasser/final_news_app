import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/news_model.dart';

class NewsWidget extends StatelessWidget {
  List<Articles> articles;

  NewsWidget({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            height: 340.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.black),
                color: Colors.white38),
            child: SizedBox(
              height: 310.h,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r),),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      height: 232.h,
                      width: double.infinity,
                      imageUrl: articles[index].urlToImage ?? '',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            articles[index].source?.name ?? '',
                            style: Theme.of(context).textTheme.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            articles[index].title ?? '',
                            style: Theme.of(context).textTheme.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              articles[index].publishedAt?.substring(0, 10) ??
                                  '',
                              style: Theme.of(context).textTheme.displaySmall,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10.h);
        },
        itemCount: articles.length,
      ),
    );
  }
}
