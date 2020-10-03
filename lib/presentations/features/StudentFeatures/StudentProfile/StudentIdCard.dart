import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Domain/entities/student_info_entity.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/bloc/student_info_bloc.dart';

class StudentIDCard extends StatefulWidget {
  @override
  _StudentIDCardState createState() => _StudentIDCardState();
}

class _StudentIDCardState extends State<StudentIDCard> {
  StudentInfoEntity studentInfo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentInfoBloc, StudentInfoState>(
        builder: (context, state) {
      if (state is StudentInfoEmpty) {
        BlocProvider.of<StudentInfoBloc>(context).add(FetchStudentInfo());
      }
      if (state is StudentInfoError) {
        changeStatusBarColor();
        return Container(child: Center(child: Text("فشل في الاتصال")));
      }

      if (state is StudentInfoLoaded) {
        changeStatusBarColor();
        studentInfo = state.studentInfoEntity;
        return upperBody();
      }
      if (state is StudentInfoLoading) {
        changeStatusBarColor();
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 56,
            child: Center(
              child: SpinKitFadingCube(
                color: Colors.white,
                size: 80.0,
              ),
            ));
      }
      return Container();
    });
  }

  Widget upperBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 100,
                child: SvgPicture.asset(
                    "assets/StudentProfilePageAssets/female.svg" ,)),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 2,
                child: FittedBox(
                    child: Text(
                  studentInfo.fullName,
                  style:
                      AppThemeData().tajwalText.copyWith(color: Colors.white),
                ))),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 5,
                child: FittedBox(
                    child: Text(
                  studentInfo.studnetNo,
                  style:
                      AppThemeData().tajwalText.copyWith(color: Colors.white),
                ))),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  profileItem("رقم الهوية : ", studentInfo.idCardNo,
                      "assets/StudentProfilePageAssets/driver-license.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem("اسم ولي الأمر : ", studentInfo.parentName,
                      "assets/StudentProfilePageAssets/father.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem("اسم الأم : ", studentInfo.motherName,
                      "assets/StudentProfilePageAssets/woman.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem("الصف : ", studentInfo.currentClass,
                      "assets/StudentProfilePageAssets/video.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem("تاريخ الميلاد : ", studentInfo.birthDate,
                      "assets/StudentProfilePageAssets/calendar.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem("الجنس : ", studentInfo.gender,
                      "assets/StudentProfilePageAssets/male-and-female.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem("رقم البيت : ", studentInfo.studentHomeTel,
                      "assets/StudentProfilePageAssets/smart-home.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem("تلفون ولي الأمر : ", studentInfo.parentMobile,
                      "assets/StudentProfilePageAssets/phone.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem("تلفون الأم : ", studentInfo.motherPhone,
                      "assets/StudentProfilePageAssets/phone.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem("البريد الالكتروني : ", studentInfo.studEmail,
                      "assets/StudentProfilePageAssets/gmail.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem(
                      "بريد الأب الالكرتوني : ",
                      studentInfo.parentEmail,
                      "assets/StudentProfilePageAssets/gmail.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  profileItem(
                      "بريد الأم الالكتروني : ",
                      studentInfo.motherEmail,
                      "assets/StudentProfilePageAssets/gmail.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  noteItem("ملاحظات المدرسة : ", studentInfo.motherEmail,
                      "assets/StudentProfilePageAssets/notepad.svg"),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container profileItem(String title, String field, String icon) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppThemeData().thirdColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "$title",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    field == null ? "غير متوفر" : "$field",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.black, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 50,
              height: 40,
              child: SvgPicture.asset("$icon"),
            ),
          ],
        ),
      ),
    );
  }

  Container noteItem(String title, String field, String icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppThemeData().thirdColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "$title",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 100,
                    alignment: Alignment.centerRight,
                    child: Text(
                      field == null ? "غير متوفر" : "$field",
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 50,
                  height: 40,
                  child: SvgPicture.asset("$icon"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppThemeData().primaryColor);
  }
}
