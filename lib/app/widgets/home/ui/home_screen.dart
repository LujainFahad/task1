import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/helpers.dart';
import 'package:trainee_task/app/utility/shared_widgets/glowing_scroll_widget.dart';
import 'package:trainee_task/app/utility/shared_widgets/repository.dart';
import 'package:trainee_task/app/widgets/home/core/bloc/home_bloc.dart';
import 'package:trainee_task/app/widgets/news_list/Newslist.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

  static String urlID = 'kNakfT7WXhw';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: urlID,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

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
                  bottom: Constants.MINI_PADDING,
                  top: Constants.SMALL_PADDING,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("latestNewsWord".tr(),
                          style: TextStyle(fontFamily: 'regular')),
                    ),
                    Container(
                      child: GestureDetector(
                        child: Text("moreButtonWord".tr(),
                            style: TextStyle(
                                fontFamily: 'regular', color: Colors.blue)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Newslist(),
                            ),
                          );
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
                          child: Text("refreshWord".tr()))
                    ],
                  );
                } else if (state is HomeLoaded) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(state.news[0].image),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              "sportsleagueWord".tr(),
                              style: TextStyle(
                                  fontFamily: 'regular',
                                  color: Colors.grey[600]),
                            ),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              Helpers.isAr
                                  ? state.news[0].titleAr
                                  : state.news[0].titleEn,
                              style: TextStyle(fontFamily: 'bold'),
                            ),
                          ))
                        ],
                      ),
                    ],
                  );
                }
                return SizedBox(width: 50);
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
                      child: Text("upcomingMatchWord".tr(),
                          style: TextStyle(fontFamily: 'regular')),
                    ),
                    Container(
                      child: Text("moreButtonWord".tr(),
                          style: TextStyle(
                              fontFamily: 'regular', color: Colors.blue)),
                    ),
                  ],
                ),
              ),
              Row(children: [
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Image.asset(
                                Constants.hilal_icon_path,
                              ),
                            ),
                            Text(
                              'alhilalWord'.tr(),
                              style: TextStyle(fontFamily: 'bold'),
                            ),
                            Column(
                              children: [
                                Text(
                                  "23:00",
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  'date1Word'.tr(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ],
                            ),
                            Text(
                              'alahliWord'.tr(),
                              style: TextStyle(fontFamily: 'bold'),
                            ),
                            Flexible(
                              child: Image.asset(
                                Constants.ahli_icon_path,
                              ),
                            )
                          ],
                        ),
                        const Divider(height: 1.0, color: Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Image.asset(
                                Constants.ettihad_icon_path,
                              ),
                            ),
                            Text(
                              'alettihadWord'.tr(),
                              style: TextStyle(fontFamily: 'bold'),
                            ),
                            Column(
                              children: [
                                Text(
                                  "22:00",
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  'date2Word'.tr(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ],
                            ),
                            Text(
                              'alshababWord'.tr(),
                              style: TextStyle(fontFamily: 'bold'),
                            ),
                            Flexible(
                              child: Image.asset(
                                Constants.shabab_icon_path,
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          height: 1.0,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Image.asset(
                                Constants.ettifaq_icon_path,
                              ),
                            ),
                            Text(
                              'alettifaqWord'.tr(),
                              style: TextStyle(fontFamily: 'bold'),
                            ),
                            Column(
                              children: [
                                Text(
                                  "10:00",
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  'date3Word'.tr(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ],
                            ),
                            Text(
                              'alnasserWord'.tr(),
                              style: TextStyle(fontFamily: 'bold'),
                            ),
                            Flexible(
                              child: Image.asset(
                                Constants.nasser_icon_path,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
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
                      child: Text("latestTweetsWord".tr(),
                          style: TextStyle(fontFamily: 'regular')),
                    ),
                    Container(
                      child: Text("moreButtonWord".tr(),
                          style: TextStyle(
                              fontFamily: 'regular', color: Colors.blue)),
                    ),
                  ],
                ),
              ),
              //tweets
              Container(
                height: 155,
                width: double.infinity,
                color: Colors.white,
                child: Column(children: [
                  const SizedBox(height: 10),
                  Expanded(
                      child: Row(
                    children: [
                      const SizedBox(width: 5),
                      Image.asset(
                        Constants.spl_icon_path,
                        scale: 1.5,
                      ),
                      Column(
                        children: [
                          Text(
                            "saudiLeagueWord".tr(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'bold',
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                Helpers.isAr ? 'spl@' : '@spl',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF6A6666),
                                  fontFamily: 'regular',
                                ),
                              ),
                              const SizedBox(width: 50)
                            ],
                          )),
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(height: 10),
                  Expanded(
                      child: const Text(
                    'عندما يريد العالم أن يتكلّم  ، فهو يتحدّث بلغة يونيكود. تسجّل الآن لحضور المؤتمر الدولي العاشر ليونيكود (Unicode Conference)، الذي سيعقد في 10-12 آذار 1997 بمدينة مَايِنْتْس، ألمانيا. ',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'regular',
                    ),
                  )),
                ]),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                height: 155,
                width: double.infinity,
                color: Colors.white,
                child: Column(children: [
                  const SizedBox(height: 10),
                  Expanded(
                      child: Row(
                    children: [
                      const SizedBox(width: 5),
                      Image.asset(
                        Constants.spl_icon_path,
                        scale: 1.5,
                      ),
                      Column(
                        children: [
                          Text(
                            "saudiLeagueWord".tr(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'bold',
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                Helpers.isAr ? 'spl@' : '@spl',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF6A6666),
                                  fontFamily: 'regular',
                                ),
                              ),
                              const SizedBox(width: 50)
                            ],
                          )),
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(height: 10),
                  Expanded(
                      child: const Text(
                    'عندما يريد العالم أن يتكلّم  ، فهو يتحدّث بلغة يونيكود. تسجّل الآن لحضور المؤتمر الدولي العاشر ليونيكود (Unicode Conference)، الذي سيعقد في 10-12 آذار 1997 بمدينة مَايِنْتْس، ألمانيا. ',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'regular',
                    ),
                  )),
                ]),
              ),
              SizedBox(
                height: 30,
              ),

              //poll
              Row(children: [
                const SizedBox(width: 10),
                Text(
                  "predictWord".tr(),
                  style: const TextStyle(
                      fontSize: 16, color: Colors.black, fontFamily: 'regular'),
                ),
              ]),
              const SizedBox(height: 10),
              Container(
                height: 186,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Container(
                            width: 100,
                            height: 80,
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(color: const Color(0xFFD1D1D1))),
                            child: Image.asset(Constants.ettihad_icon_path),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: 100,
                            height: 80,
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(color: const Color(0xFFD1D1D1))),
                            child: Image.asset(Constants.hilal_icon_path),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: 100,
                            height: 80,
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(color: const Color(0xFFD1D1D1))),
                            child: Image.asset(Constants.nasser_icon_path),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "الاتحاد",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'bold',
                          ),
                        ),
                        Text(
                          "الهلال",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'bold',
                          ),
                        ),
                        Text(
                          "النصر",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'bold',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          ' %30',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7C7C7C),
                            fontFamily: 'regular',
                          ),
                        ),
                        Text(
                          ' %50',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7C7C7C),
                            fontFamily: 'regular',
                          ),
                        ),
                        Text(
                          ' %20',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7C7C7C),
                            fontFamily: 'regular',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //videos
              Row(children: [
                const SizedBox(width: 10),
                Text(
                  "videoWord".tr(),
                  style: const TextStyle(
                      fontSize: 16, color: Colors.black, fontFamily: 'regular'),
                ),
              ]),
              Container(
                height: 220,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: 343,
                    height: 195,
                    child: Scaffold(
                      body: YoutubePlayer(
                        controller: _controller,
                        liveUIColor: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(children: [
                const SizedBox(width: 10),
                Text(
                  "sponsorsWord".tr(),
                  style: const TextStyle(
                      fontSize: 16, color: Colors.black, fontFamily: 'regular'),
                ),
              ]),
              Container(
                height: 125,
                width: double.infinity,
                color: Colors.white,
                child: ListView(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      child: Image.asset(Constants.sp1),
                    ),
                    InkWell(
                      child: Image.asset(Constants.sp2),
                    ),
                    InkWell(
                      child: Image.asset(Constants.sp3),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
