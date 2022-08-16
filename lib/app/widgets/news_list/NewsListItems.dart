import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/helpers.dart';
import 'package:trainee_task/app/utility/shared_services/api_services.dart';
import 'package:trainee_task/app/widgets/news_page/Newspage.dart';

class NewsListItems extends StatelessWidget {
  const NewsListItems({Key? key, required this.news}) : super(key: key);
  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Newspage(
                  news: News(
                      contentAr: news[index].contentAr,
                      contentEn: news[index].contentEn,
                      titleAr: news[index].titleAr,
                      titleEn: news[index].titleEn,
                      image: news[index].image,
                      createdAt: news[index].createdAt,
                      id: news[index].id),
                ),
              ),
            ),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 120,
                padding: EdgeInsets.all(0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(news[index].image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(4)),
                        width: 120,
                        height: 94,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 15,
                      child: Container(
                        padding: Helpers.isAr
                            ? EdgeInsets.only(top: 0)
                            : EdgeInsets.only(top: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "sportsleagueWord".tr(),
                              style: TextStyle(
                                  fontFamily: 'regular',
                                  color: AppColors.textGrey,
                                  fontSize: 14),
                            ),
                            Flexible(
                              flex: 5,
                              child: Text(
                                Helpers.isAr
                                    ? news[index].titleAr
                                    : news[index].titleEn,
                                style:
                                    TextStyle(fontFamily: 'bold', fontSize: 18),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                Helpers.getDateFormat(news[index].createdAt),
                                style: TextStyle(
                                    fontFamily: 'regular',
                                    fontSize: 11,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
