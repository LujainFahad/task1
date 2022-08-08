import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/helpers.dart';
import 'package:trainee_task/app/utility/shared_widgets/glowing_scroll_widget.dart';
import 'package:trainee_task/app/utility/shared_widgets/repository.dart';
import 'package:trainee_task/app/widgets/home/core/bloc/home_bloc.dart';
import 'package:trainee_task/app/widgets/news_page/Newspage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late http.Client client;
  @override
  void initState() {
    super.initState();
    client = http.Client();
  }

  @override
  Widget build(BuildContext context) {
    Widget innerChild = const SizedBox();
    return BlocProvider(
      create: (context) =>
          HomeBloc(newsRepository: NewsRepository(client))..add(GetNews()),
      child: Scaffold(
        backgroundColor: AppColors.appBack,
        appBar: AppBar(
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
          leadingWidth: 375,
          toolbarHeight: 72,
        ),
        body: innerChild = GlowingScrollWidget(
          axisDirection: Helpers.isArabic(context)
              ? AxisDirection.left
              : AxisDirection.right,
          child: ListView(
            children: [
              //news
              Container(
                padding: const EdgeInsets.only(
                  left: Constants.SMALL_PADDING,
                  right: Constants.SMALL_PADDING,
                  bottom: Constants.MEDIUM_PADDING,
                  top: Constants.SMALL_PADDING,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(Helpers.translatingWord("latestNewsWord"),
                          style: TextStyle(fontFamily: 'regular')),
                    ),
                    Container(
                      child: GestureDetector(
                        child: Text(Helpers.translatingWord("moreButtonWord"),
                            style: TextStyle(
                                fontFamily: 'regular', color: Colors.blue)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Newspage()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state is HomeFailure) {
                  return Column(
                    children: [
                      Text(state.msg),
                      ElevatedButton(
                          onPressed: () =>
                              BlocProvider.of<HomeBloc>(context).add(GetNews()),
                          child: Text(Helpers.translatingWord("refreshWord")))
                    ],
                  );
                }
                // else if(state is HomeLoaded){
                //   return
                // }
              }),
              //upcoming match
              Container(
                padding: const EdgeInsets.only(
                  left: Constants.SMALL_PADDING,
                  right: Constants.SMALL_PADDING,
                  bottom: Constants.SMALL_PADDING,
                  top: Constants.SMALL_PADDING,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(Helpers.translatingWord("upcomingMatchWord"),
                          style: TextStyle(fontFamily: 'regular')),
                    ),
                    Container(
                      child: Text(Helpers.translatingWord("moreButtonWord"),
                          style: TextStyle(
                              fontFamily: 'regular', color: Colors.blue)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Ink(
                  height: 140,
                  width: 45,
                  color: AppColors.appWhite,
                  padding: const EdgeInsets.only(
                    left: Constants.SMALL_PADDING,
                    right: Constants.MINI_PADDING,
                    bottom: Constants.SMALL_PADDING,
                    top: Constants.SMALL_PADDING,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Image.asset(
                              Constants.hilal_icon_path,
                            ),
                          ),
                          SizedBox(width: 10.5),
                          Text(
                            Helpers.translatingWord('alhilalWord'),
                            style: TextStyle(fontFamily: 'bold'),
                          ),
                          SizedBox(width: 70),
                          Column(
                            children: [
                              Text(
                                "23:00",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                Helpers.translatingWord('date1Word'),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(width: 75),
                          Text(
                            Helpers.translatingWord('alahliWord'),
                            style: TextStyle(fontFamily: 'bold'),
                          ),
                          SizedBox(width: 10.5),
                          Image.asset(
                            Constants.ahli_icon_path,
                          ),
                        ],
                      ),
                      const Divider(height: 1.0, color: Colors.grey),
                      Row(
                        children: [
                          Flexible(
                            child: Image.asset(
                              Constants.ettihad_icon_path,
                            ),
                          ),
                          SizedBox(width: 10.5),
                          Text(
                            Helpers.translatingWord('alettihadWord'),
                            style: TextStyle(fontFamily: 'bold'),
                          ),
                          SizedBox(width: 55),
                          Column(
                            children: [
                              Text(
                                "22:00",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                Helpers.translatingWord('date2Word'),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(width: 70),
                          Text(
                            Helpers.translatingWord('alshababWord'),
                            style: TextStyle(fontFamily: 'bold'),
                          ),
                          SizedBox(width: 10.5),
                          Image.asset(
                            Constants.shabab_icon_path,
                          ),
                        ],
                      ),
                      const Divider(
                        height: 1.0,
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Image.asset(
                              Constants.ettifaq_icon_path,
                            ),
                          ),
                          SizedBox(width: 10.5),
                          Text(
                            Helpers.translatingWord('alettifaqWord'),
                            style: TextStyle(fontFamily: 'bold'),
                          ),
                          SizedBox(width: 50),
                          Column(
                            children: [
                              Text(
                                "10:00",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                Helpers.translatingWord('date3Word'),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(width: 80),
                          Text(
                            Helpers.translatingWord('alnasserWord'),
                            style: TextStyle(fontFamily: 'bold'),
                          ),
                          SizedBox(width: 10.5),
                          Image.asset(
                            Constants.nasser_icon_path,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //Latest tweets
              Container(
                padding: const EdgeInsets.only(
                  left: Constants.SMALL_PADDING,
                  right: Constants.SMALL_PADDING,
                  bottom: Constants.SMALL_PADDING,
                  top: Constants.SMALL_PADDING,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(Helpers.translatingWord("latestTweetsWord"),
                          style: TextStyle(fontFamily: 'regular')),
                    ),
                    Container(
                      child: Text(Helpers.translatingWord("moreButtonWord"),
                          style: TextStyle(
                              fontFamily: 'regular', color: Colors.blue)),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: Ink(
              //     height: 140,
              //     width: 45,
              //     color: AppColors.appWhite,
              //     padding: const EdgeInsets.only(
              //       left: Constants.SMALL_PADDING,
              //       right: Constants.MINI_PADDING,
              //       bottom: Constants.SMALL_PADDING,
              //       top: Constants.SMALL_PADDING,
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           children: [
              //             Row(
              //               children: [
              //                 Column(
              //                   children: [
              //                     Flexible(
              //                       child: Image.asset(
              //                           Constants.twitter_icon_path),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //             Row(
              //               children: [Text("Hi")],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
