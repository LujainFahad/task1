import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/helpers.dart';
import 'package:trainee_task/app/utility/shared_services/api_services.dart';
import 'package:trainee_task/app/utility/shared_widgets/invisible_expanded.dart';

class Newspage extends StatelessWidget {
  final News news;
  Newspage({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.main,
            title: InvisibleExpandedHeader(
              child: Image.asset(Constants.spl_icon_path),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                news.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    Helpers.isAr ? news.titleAr : news.titleEn,
                    style: TextStyle(fontFamily: 'bold', fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "sportsleagueWord".tr(),
                    style: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    Helpers.getDateFormat(news.createdAt),
                    style: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 11,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    Helpers.isAr ? news.contentAr : news.contentEn,
                    style: TextStyle(fontFamily: 'regular', fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
