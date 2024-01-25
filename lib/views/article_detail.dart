import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/views/widgets/drawer_widget.dart';

import 'category_screen.dart';

class ArticleDetails extends StatelessWidget {
  static const String routeName = 'Article Detail Screen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Articles;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.source?.name ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            BackButton(),

            // IconButton(
            //   onPressed: () {
            //     Navigator.popAndPushNamed(
            //         context, CategoryScreen.routeName);
            //   },
            //   icon: Icon(
            //     Icons.home,
            //     size: 30.sp,
            //   ),
            // )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 232.h,
                  width: double.infinity,
                  imageUrl: args.urlToImage ?? '',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                args.title ?? '',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 10.h),
              Text(
                args.content ?? '',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  args.publishedAt?.substring(0, 10) ?? '',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  // TODO: add webView function
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Full Article',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.play_arrow,
                      size: 30.r,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: DrawerWidget(),
        ),
      ),
    );
  }
}
