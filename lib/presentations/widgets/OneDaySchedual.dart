import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:mustafa0_1/Data/models/StudentHomeworkdsAndExamsModel.dart';
import 'package:mustafa0_1/Domain/entities/student_schedule_entity.dart';
import 'package:mustafa0_1/presentations/widgets/dialogs/homeworkDialog.dart';

// ignore: must_be_immutable
class OneDaySchedual extends StatelessWidget {
  final String day;
  final List<ScheduleSubjectEntity> classes;
  final int color;
  final String date;
  final List<List<StudentHomeworkAndExams>> homeworksAndExams;

  final colors = [
    0xff8782FF,
    0xffFDC106,
    0xffF06A3F,
    0xffF9AA40,
    0xff607D8B,
    0xff8BC34A,
    0xff9E9E9E
  ];

  OneDaySchedual(
      {this.day, this.classes, this.color, this.date, this.homeworksAndExams});

  List<Widget> cards = new List<Widget>();
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
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
        width: double.infinity,
        color: Colors.grey[850],
        padding: EdgeInsets.all(5.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ExpansionCard(
            title: Container(
              color: Colors.grey[850],
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/SchedualAvatar-min.jpg'),
                    ),
                    title: Text(
                      this.day,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lemonada',
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      this.date,
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            borderRadius: 20.0,
            children: <Widget>[expandedCard()],
          ),
        ));
  }

  Widget expandedCard() {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Container(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        showHomeWorkAndExams(
                            context,
                            classes[index].subjectDesc,
                            homeworksAndExams[index]);
                      },
                      child: Container(
                        width: 150,
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 10.0,
                          color: Color(colors[index]),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Center(
                                      child: Text(
                                        periods[index],
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      classes[index].subjectDesc == null
                                          ? "فراغ"
                                          : classes[index].subjectDesc,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                ],
                              ),
                              Container(
                                height: 25,
                                child: ListView.builder(
                                    itemCount: homeworksAndExams[index].length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index2) {
                                      //exam
                                      if (homeworksAndExams[index][index2]
                                              .materialType ==
                                          "1")
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.red,
                                            ),
                                            width: 25,
                                          ),
                                        );

                                      //homework
                                      if (homeworksAndExams[index][index2]
                                              .materialType ==
                                          "2")
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.blue,
                                            ),
                                            width: 25,
                                          ),
                                        );

                                      //project
                                      if (homeworksAndExams[index][index2]
                                              .materialType ==
                                          "3")
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.green,
                                            ),
                                            width: 25,
                                          ),
                                        );

                                      return Container();
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
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
