import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/helpers.dart';
import 'package:trainee_task/app/utility/shared_services/api_services.dart';
import 'package:trainee_task/app/utility/shared_widgets/repository.dart';
import 'package:trainee_task/app/widgets/news_list/NewsListItems.dart';
import 'package:trainee_task/app/widgets/news_list/bloc/news_list_bloc.dart';
import 'package:trainee_task/app/widgets/news_page/Newspage.dart';

class Newslist extends StatefulWidget {
  const Newslist({
    Key? key,
  }) : super(key: key);
  @override
  State<Newslist> createState() => _newsListState();
}

class _newsListState extends State<Newslist> {
  late http.Client client;
  @override
  void initState() {
    super.initState();
    client = http.Client();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsListBloc(newsRepo: NewsRepository(client))..add(GetNews()),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.backgroundColor1,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Constants.nav_icon_path),
                      fit: BoxFit.fill)),
            ),
            elevation: 0,
            centerTitle: true,
            title: SvgPicture.asset(
              Constants.splash_icon_path,
              height: 40,
              width: 61,
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "newsWord".tr()),
                Tab(text: "photoWord".tr()),
                Tab(text: "videoWord".tr())
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BlocBuilder<NewsListBloc, NewsListState>(
                  builder: (context, state) {
                if (state is NewsListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  );
                } else if (state is NewsListFailure) {
                  return Column(
                    children: [
                      Text(state.msg),
                      ElevatedButton(
                          onPressed: () =>
                              BlocProvider.of<NewsListBloc>(context)
                                  .add(GetNews()),
                          child: Text("refreshWord".tr()))
                    ],
                  );
                } else if (state is NewsListLoaded) {
                  return NewsListItems(news: state.news);
                }
                return SizedBox();
              }),
              Container(
                child: Text("Images"),
              ),
              Container(
                child: Text("Videos"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
