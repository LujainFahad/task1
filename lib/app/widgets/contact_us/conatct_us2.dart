import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:trainee_task/app/utility/app_colors.dart';
import 'package:trainee_task/app/utility/constant.dart';
import 'package:trainee_task/app/utility/helpers.dart';
import 'package:trainee_task/app/utility/shared_widgets/post_button.dart';
import 'package:file_picker/file_picker.dart';

class Contactusstep2 extends StatefulWidget {
  const Contactusstep2({Key? key}) : super(key: key);

  static List<TextEditingController> textFields = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  static List<String> errors = ['', '', ''];
  @override
  State<Contactusstep2> createState() => Contactusstep2State();
}

class Contactusstep2State extends State<Contactusstep2> {
  bool _isSelected = false;
  static FilePickerResult? resultFinal;
  String fileName = '';

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;

    fileName = result.files.first.name.toString();
    resultFinal = result;
    setState(() {
      _isSelected = true;
    });
  }

  final List<String> _inquiryType = [
    "complaint".tr(),
    "suggestion".tr(),
    "inquiry".tr()
  ];
  int _inquiryIndex = -1;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFF3F3F3),
          appBar: AppBar(
            title: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  Constants.spl_icon_path,
                  height: 40,
                  width: 61,
                ),
              ],
            ),
            backgroundColor: Colors.white,
            toolbarHeight: 66,
            centerTitle: true,
            bottom: TabBar(
                indicatorWeight: 5,
                labelColor: AppColors.main,
                indicatorColor: AppColors.main,
                tabs: [
                  ListTile(
                    title: Expanded(
                      child: Row(
                        children: [
                          const SizedBox(width: 30),
                          Text(
                            "infoWord".tr(),
                            style: const TextStyle(
                                fontSize: 20, fontFamily: 'regular'),
                          ),
                        ],
                      ),
                    ),
                    trailing: Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: const Text(
                              '2/2',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF707070)),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "nextWord".tr(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF707070),
                                  fontFamily: 'regular'),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "send".tr(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF707070),
                                  fontFamily: 'regular'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "contactusWord".tr(),
                style: const TextStyle(
                    color: AppColors.main, fontSize: 22, fontFamily: 'regular'),
              ),
              const SizedBox(
                height: 40, //20 before
              ),
              Flexible(
                  child: Form(
                child: ListView(children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "title".tr(),
                        style: const TextStyle(
                            color: AppColors.main,
                            fontSize: 15,
                            fontFamily: 'regular'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Helpers.contactField(context, "inquiry".tr(),
                            Contactusstep2.textFields[0]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          Contactusstep2.errors[0],
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                            fontFamily: 'regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "messageType".tr(),
                        style: const TextStyle(
                          color: AppColors.main,
                          fontSize: 15,
                          fontFamily: 'bold',
                        ),
                      ),
                      //isAr ? const SizedBox(width: 250) : const SizedBox(width: 210),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        onTap: () => {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Wrap(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            horizontalTitleGap: -50,
                                            leading: TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                "closeWord".tr(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontFamily: 'bold',
                                                ),
                                              ),
                                            ),
                                            title: Center(
                                              child: Text(
                                                "chooseWord".tr(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'bold',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              height: 1.2,
                                              width: double.infinity,
                                              color: Colors.grey[300]),
                                          const SizedBox(height: 40),
                                          Column(
                                            children: [
                                              _inquiryIndex == 0
                                                  ? ListTile(
                                                      tileColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              207,
                                                              215,
                                                              241),
                                                      leading: Text(
                                                        _inquiryType[0],
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'regular',
                                                        ),
                                                      ),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFF0F1737),
                                                            width: 1),
                                                      ),
                                                      trailing: const Icon(
                                                          Icons.circle,
                                                          color:
                                                              AppColors.main),
                                                    )
                                                  : ListTile(
                                                      onTap: () => setState(
                                                          () => _inquiryIndex =
                                                              0),
                                                      leading: Text(
                                                        _inquiryType[0],
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'regular',
                                                        ),
                                                      ),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1),
                                                      ),
                                                      trailing: Icon(
                                                          Icons.circle,
                                                          color:
                                                              Colors.grey[200]),
                                                    ),
                                              const SizedBox(height: 20),
                                              _inquiryIndex == 1
                                                  ? ListTile(
                                                      tileColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              207,
                                                              215,
                                                              241),
                                                      leading: Text(
                                                        _inquiryType[1],
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'regular',
                                                        ),
                                                      ),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFF0F1737),
                                                            width: 1),
                                                      ),
                                                      trailing: const Icon(
                                                          Icons.circle,
                                                          color:
                                                              AppColors.main),
                                                    )
                                                  : ListTile(
                                                      onTap: () => setState(
                                                          () => _inquiryIndex =
                                                              1),
                                                      leading: Text(
                                                        _inquiryType[1],
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'regular',
                                                        ),
                                                      ),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1),
                                                      ),
                                                      trailing: Icon(
                                                          Icons.circle,
                                                          color:
                                                              Colors.grey[200]),
                                                    ),
                                              const SizedBox(height: 20),
                                              _inquiryIndex == 2
                                                  ? ListTile(
                                                      tileColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              207,
                                                              215,
                                                              241),
                                                      leading: Text(
                                                        _inquiryType[2],
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'regular',
                                                        ),
                                                      ),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Color(
                                                                0xFF0F1737),
                                                            width: 1),
                                                      ),
                                                      trailing: const Icon(
                                                          Icons.circle,
                                                          color:
                                                              AppColors.main),
                                                    )
                                                  : ListTile(
                                                      onTap: () => setState(
                                                          () => _inquiryIndex =
                                                              2),
                                                      leading: Text(
                                                        _inquiryType[2],
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'regular',
                                                        ),
                                                      ),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1),
                                                      ),
                                                      trailing: Icon(
                                                          Icons.circle,
                                                          color:
                                                              Colors.grey[200]),
                                                    ),
                                            ],
                                          ),
                                          const SizedBox(height: 50),
                                          SizedBox(
                                            height: 45,
                                            width: 319,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                try {
                                                  Contactusstep2
                                                          .textFields[1].text =
                                                      _inquiryType[
                                                          _inquiryIndex];
                                                  Navigator.pop(context);
                                                } catch (_) {
                                                  /* do nothing when pressed before selection since index = -1 */
                                                }
                                              },
                                              child: Text(
                                                "chooseType".tr(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20,
                                                  fontFamily: 'regular',
                                                ),
                                              ),
                                              style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                )),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(AppColors.main),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30)),
                            ),
                          ),
                        },
                        readOnly: true,
                        style: const TextStyle(
                          color: AppColors.main,
                          fontSize: 15,
                        ),
                        controller: Contactusstep2.textFields[1],
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          hintText: "inquiry".tr(),
                        ),
                        cursorColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          Contactusstep2.errors[1],
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                            fontFamily: 'regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "messageContent".tr(),
                        style: const TextStyle(
                          color: AppColors.main,
                          fontSize: 15,
                          fontFamily: 'bold',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Helpers.contactField(context, "write".tr(),
                            Contactusstep2.textFields[2]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          Contactusstep2.errors[2],
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                            fontFamily: 'regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "attachment".tr(),
                        style: const TextStyle(
                          color: AppColors.main,
                          fontSize: 15,
                          fontFamily: 'bold',
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "optional".tr(),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF707070),
                          fontFamily: 'bold',
                        ),
                      ),
                    ],
                  ),
                ]),
              )),
              Column(
                children: [
                  SizedBox(
                    height: 45,
                    width: 319,
                    child: _isSelected
                        ? ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isSelected = false;
                              });
                              resultFinal = null;
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: AppColors.main, width: 1))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFF3F3F3)),
                              elevation: MaterialStateProperty.all<double>(0.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  fileName,
                                  style: const TextStyle(
                                    color: AppColors.main,
                                    fontSize: 17,
                                    fontFamily: 'regular',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.clear,
                                  color: Color(0xFF930808),
                                )
                              ],
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              _pickFile();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: AppColors.main, width: 1))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFF3F3F3)),
                              elevation: MaterialStateProperty.all<double>(0.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "attach".tr(),
                                  style: const TextStyle(
                                    color: AppColors.main,
                                    fontSize: 17,
                                    fontFamily: 'regular',
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.add,
                                  color: AppColors.main,
                                )
                              ],
                            ),
                          ),
                  ),
                ],
              ),
              Helpers.isAr
                  ? const SizedBox(height: 55)
                  : const SizedBox(height: 80),
              PostButton(
                buttonT: "send".tr(),
                page: 2,
              ),
              const SizedBox(height: 20)
            ],
          ),
        ));
  }
}
