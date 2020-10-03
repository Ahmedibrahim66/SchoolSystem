import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Data/DataSources/remoteData/studentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/models/StudentHomeworkdsAndExamsModel.dart';
import 'package:mustafa0_1/Data/repositories/StudentRepositoryImp.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationDrawer.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentSchedual/bloc/student_schedual_bloc.dart';
import 'package:mustafa0_1/presentations/widgets/dialogs/homeworkDialog.dart';

class NewStudentDashboard extends StatefulWidget {
  @override
  _NewStudentDashboardState createState() => _NewStudentDashboardState();
}

class _NewStudentDashboardState extends State<NewStudentDashboard> {
  List choosenIndex = [true, false, false, false, false, false, false];
  int choosenIndexNumber = 0;

  final StudentRepository repository =
      new StudentRepositoryImp(StudentRemoteDataSource());

  List periods = [
    "الحصة الاولى",
    "الحصة الثانية",
    "الحصة الثالثة",
    "الحصة الرابعة",
    "الحصة الخامسة",
    "الحصة السادسة",
    "الحصة السابعة",
    "الحصة الثامنة",
  ];

  List periodsColors = [
    Color(0xffB491BE),
    Color(0xffF8A920),
    Color(0xffFF5858),
    Color(0xff181D3D),
    Color(0xffA83974),
    Color(0xffE483EA),
    Color(0xff39A840),
    Color(0xff429FC8),
  ];

  ScrollController controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentSchedualBloc, StudentSchedualState>(
        builder: (context, state) {
      if (state is StudentSchedualEmpty) {
        BlocProvider.of<StudentSchedualBloc>(context)
            .add(FetchStudentSchedual());
      }
      if (state is StudentSchedualLoading) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              height: MediaQuery.of(context).size.height - 56,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loadingAnimation(),
                  SizedBox(
                    height: 50,
                  ),
                  Text("تحميل البيانات.. ${state.loadingNumber} / 8"),
                ],
              ),
            ));
      }
      if (state is StudentSchedualEror) {
        changeStatusBarColor();
        return Scaffold(
          endDrawer: StudentNavigationDrawer(),
            appBar: AppBar(
              
              leading: GestureDetector(
                  onTap: () {
                    BlocProvider.of<StudentSchedualBloc>(context)
                        .add(FetchStudentSchedual());
                  },
                  child: Icon(Icons.refresh)),
              elevation: 0,
              backgroundColor: AppThemeData().primaryColor,
              centerTitle: true,
              title: Text(
                "GT Series",
                style:
                    AppThemeData().lexendDecaText.copyWith(color: Colors.white),
              ),
            ),
            backgroundColor: Colors.white,
            body: Container(child: Center(child: Text("فشل في الاتصال"))));
      }

      if (state is StudentSchedualLoaded ||
          state is StudentHomeWorkAndExamsLoading ||
          state is StudentHomeWorkAndExamsLoaded ||
          state is StudentNewWeekSchedualLoading) {
        changeStatusBarColor();
        return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                  onTap: () {
                    BlocProvider.of<StudentSchedualBloc>(context)
                        .add(FetchStudentSchedual());
                  },
                  child: Icon(Icons.refresh)),
              elevation: 0,
              backgroundColor: AppThemeData().primaryColor,
              centerTitle: true,
              title: Text(
                "GT Series",
                style:
                    AppThemeData().lexendDecaText.copyWith(color: Colors.white),
              ),
            ),
            backgroundColor: Colors.white,
            endDrawer: StudentNavigationDrawer(),
            body: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: AppThemeData().primaryColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(70)),
                            color: AppThemeData().primaryColor,
                          ),
                          child: upperBody(),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(70)),
                          color: Colors.white,
                        ),
                        child: lowerBody(state),
                      ),
                    )
                  ],
                )
              ],
            ));
      }

      return Container();
    });
  }

  Widget upperBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
              bottom: 10,
              left: 0,
              child: SvgPicture.asset(
                "assets/StudentDashBoardAssets/girlBook.svg",
                height: MediaQuery.of(context).size.height / 4,
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "مرحبا",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 20),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                  Text("صبا قصقص",
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 20),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget lowerBody(state) {
    return SingleChildScrollView(
      controller: controller,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: state is StudentNewWeekSchedualLoading
            ? Container(
                height: 2 * MediaQuery.of(context).size.height / 3 - 56,
                child: SpinKitFadingCube(
                  color: AppThemeData().primaryColor,
                  size: 80.0,
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            choosenIndex.setAll(0, [
                              false,
                              false,
                              false,
                              false,
                              false,
                              false,
                              false
                            ]);
                            choosenIndex[0] = true;
                            choosenIndexNumber = 0;
                          });
                          BlocProvider.of<StudentSchedualBloc>(context)
                              .add(PrevoiusWeekSchedual());
                        },
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: AppThemeData().primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: 35,
                              color: AppThemeData().secondaryColor,
                            )),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: <Widget>[
                              Text("من : ${state.daysOfWeek[0].date}",
                                  style: AppThemeData().tajwalText.copyWith(
                                      fontSize: 16,
                                      color: AppThemeData().primaryColor)),
                              Text("الى : ${state.daysOfWeek[6].date}",
                                  style: AppThemeData().tajwalText.copyWith(
                                      fontSize: 16,
                                      color: AppThemeData().primaryColor))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            choosenIndex.setAll(0, [
                              false,
                              false,
                              false,
                              false,
                              false,
                              false,
                              false
                            ]);
                            choosenIndex[0] = true;
                            choosenIndexNumber = 0;
                          });
                          BlocProvider.of<StudentSchedualBloc>(context)
                              .add(NextWeekSchedual());
                        },
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: AppThemeData().primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: 35,
                              color: AppThemeData().secondaryColor,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              choosenIndex.setAll(0, [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ]);
                              choosenIndex[6] = true;
                              choosenIndexNumber = 6;
                            });

                            BlocProvider.of<StudentSchedualBloc>(context)
                                .add(NewDayChoosenWeekSchedual(day: 6));
                          },
                          child: choosenIndex[6]
                              ? daysOfWeekChoosen(
                                  state.daysOfWeek[6].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[6].dayDesc)
                              : daysOfWeekNotChoosen(
                                  state.daysOfWeek[6].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[6].dayDesc)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              choosenIndex.setAll(0, [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ]);
                              choosenIndex[5] = true;
                              choosenIndexNumber = 5;
                            });
                            BlocProvider.of<StudentSchedualBloc>(context)
                                .add(NewDayChoosenWeekSchedual(day: 5));
                          },
                          child: choosenIndex[5]
                              ? daysOfWeekChoosen(
                                  state.daysOfWeek[5].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[5].dayDesc)
                              : daysOfWeekNotChoosen(
                                  state.daysOfWeek[5].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[5].dayDesc)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              choosenIndex.setAll(0, [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ]);
                              choosenIndex[4] = true;
                              choosenIndexNumber = 4;
                            });
                            BlocProvider.of<StudentSchedualBloc>(context)
                                .add(NewDayChoosenWeekSchedual(day: 4));
                          },
                          child: choosenIndex[4]
                              ? daysOfWeekChoosen(
                                  state.daysOfWeek[4].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[4].dayDesc)
                              : daysOfWeekNotChoosen(
                                  state.daysOfWeek[4].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[4].dayDesc)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              choosenIndex.setAll(0, [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ]);
                              choosenIndex[3] = true;
                              choosenIndexNumber = 3;
                            });
                            BlocProvider.of<StudentSchedualBloc>(context)
                                .add(NewDayChoosenWeekSchedual(day: 3));
                          },
                          child: choosenIndex[3]
                              ? daysOfWeekChoosen(
                                  state.daysOfWeek[3].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[3].dayDesc)
                              : daysOfWeekNotChoosen(
                                  state.daysOfWeek[3].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[3].dayDesc)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              choosenIndex.setAll(0, [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ]);
                              choosenIndex[2] = true;
                              choosenIndexNumber = 2;
                            });
                            BlocProvider.of<StudentSchedualBloc>(context)
                                .add(NewDayChoosenWeekSchedual(day: 2));
                          },
                          child: choosenIndex[2]
                              ? daysOfWeekChoosen(
                                  state.daysOfWeek[2].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[2].dayDesc)
                              : daysOfWeekNotChoosen(
                                  state.daysOfWeek[2].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[2].dayDesc)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              choosenIndex.setAll(0, [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ]);
                              choosenIndex[1] = true;
                              choosenIndexNumber = 1;
                            });
                            BlocProvider.of<StudentSchedualBloc>(context)
                                .add(NewDayChoosenWeekSchedual(day: 1));
                          },
                          child: choosenIndex[1]
                              ? daysOfWeekChoosen(
                                  state.daysOfWeek[1].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[1].dayDesc)
                              : daysOfWeekNotChoosen(
                                  state.daysOfWeek[1].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[1].dayDesc)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              choosenIndex.setAll(0, [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ]);
                              choosenIndex[0] = true;
                              choosenIndexNumber = 0;
                            });
                            BlocProvider.of<StudentSchedualBloc>(context)
                                .add(NewDayChoosenWeekSchedual(day: 0));
                          },
                          child: choosenIndex[0]
                              ? daysOfWeekChoosen(
                                  state.daysOfWeek[0].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[0].dayDesc)
                              : daysOfWeekNotChoosen(
                                  state.daysOfWeek[0].date
                                      .toString()
                                      .substring(8, 10),
                                  state.daysOfWeek[0].dayDesc)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (state.schedule[choosenIndexNumber].isNotEmpty)
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.schedule[0].length,
                        itemBuilder: (context, index) {
                          return classPeriodTile(index, state);
                        }),
                ],
              ),
      ),
    );
  }

  Widget classPeriodTile(int index, state) {
    return GestureDetector(
      onTap: () {
        showHomeWorkAndExams(
            context,
            state.schedule[choosenIndexNumber][index].subjectDesc,
            state.homeworksAndExams[choosenIndexNumber][index]);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
          child: Container(
            width: 3 * MediaQuery.of(context).size.width / 4,
            height: 60,
            decoration: BoxDecoration(
                color: periodsColors[index],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          left:
                              state is StudentHomeWorkAndExamsLoading ? 40 : 0),
                      height: 15,
                      width: state is StudentHomeWorkAndExamsLoading ? 15 : 55,
                      child: state is StudentHomeWorkAndExamsLoading
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: state
                                  .homeworksAndExams[choosenIndexNumber][index]
                                  .length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index2) {
                                //exam
                                if (state
                                        .homeworksAndExams[choosenIndexNumber]
                                            [index][index2]
                                        .materialType ==
                                    "1")
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.red,
                                      ),
                                      width: 15,
                                    ),
                                  );

                                //homework
                                if (state
                                        .homeworksAndExams[choosenIndexNumber]
                                            [index][index2]
                                        .materialType ==
                                    "2")
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.blue,
                                      ),
                                      width: 15,
                                    ),
                                  );

                                //project
                                if (state
                                        .homeworksAndExams[choosenIndexNumber]
                                            [index][index2]
                                        .materialType ==
                                    "3")
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.green,
                                      ),
                                      width: 15,
                                    ),
                                  );

                                return Container();
                              })),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${periods[index]} : ${state.schedule[choosenIndexNumber][index].subjectDesc == null ? "فراغ" : state.schedule[choosenIndexNumber][index].subjectDesc}",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 18),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container daysOfWeekChoosen(String date, String day) {
    return Container(
      height: 60,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppThemeData().primaryColor),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "$date",
              style: AppThemeData().tajwalText.copyWith(color: Colors.white),
            ),
            FittedBox(
              child: Text("$day",
                  style:
                      AppThemeData().tajwalText.copyWith(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  Container daysOfWeekNotChoosen(String date, String day) {
    return Container(
      height: 45,
      width: 40,
      decoration: BoxDecoration(
          border: Border.all(color: AppThemeData().primaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "$date",
              style: AppThemeData()
                  .tajwalText
                  .copyWith(color: AppThemeData().primaryColor),
            ),
            Text("$day",
                style: AppThemeData()
                    .tajwalText
                    .copyWith(color: AppThemeData().primaryColor, fontSize: 10))
          ],
        ),
      ),
    );
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppThemeData().primaryColor);
  }

  Widget loadingAnimation() {
    return Center(
      child: SpinKitFadingCube(
        color: AppThemeData().primaryColor,
        size: 80.0,
      ),
    );
  }

  Future showHomeWorkAndExams(BuildContext context, String title,
      List<StudentHomeworkAndExams> homeworksAndExams) {
    return showModal(
      configuration: FadeScaleTransitionConfiguration(),
      context: context,
      builder: (BuildContext context) => CustomDialog2(
        title: "$title",
        description: "تأكد من اسم المستخدم وكلمة المرور",
        homeworkAndExams: homeworksAndExams,
        buttonText: "حسنا",
      ),
    );
  }
}
