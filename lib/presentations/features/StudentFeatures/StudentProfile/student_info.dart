import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mustafa0_1/Domain/entities/student_info_entity.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentProfile/bloc/student_info_bloc.dart';
import 'package:skeleton_text/skeleton_text.dart';

class StudentIdCard extends StatefulWidget {
  @override
  _StudentIdCardState createState() => _StudentIdCardState();
}

class _StudentIdCardState extends State<StudentIdCard> {
  StudentInfoEntity studentInfo;
  Future studentInfoFuture;

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentInfoBloc, StudentInfoState>(
        builder: (context, state) {
      if (state is StudentInfoEmpty) {
        BlocProvider.of<StudentInfoBloc>(context).add(FetchStudentInfo());
      }
      if (state is StudentInfoError) {
        return Center(
          child: Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<StudentInfoBloc>(context)
                              .add(FetchStudentInfo());
                        },
                        child: Icon(Icons.refresh)),
                  )
                ],
                title: Text(
                  'البطاقة الشخصية',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white,
                    fontFamily: 'Lemonada',
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.grey[850],
                elevation: 0.0,
              ),
              body: Text("فشل في الاتصال")),
        );
      }
      if (state is StudentInfoLoaded) {
        studentInfo = state.studentInfoEntity;
        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<StudentInfoBloc>(context)
                          .add(FetchStudentInfo());
                    },
                    child: Icon(Icons.refresh)),
              )
            ],
            title: Text(
              'البطاقة الشخصية',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.white,
                fontFamily: 'Lemonada',
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.grey[900],
                padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 40.0),
                child: studentInfoWidgets()),
          ),
        );
      }
      return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<StudentInfoBloc>(context)
                          .add(FetchStudentInfo());
                    },
                    child: Icon(Icons.refresh)),
              )
            ],
            title: Text(
              'البطاقة الشخصية',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.white,
                fontFamily: 'Lemonada',
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            elevation: 0.0,
          ),
          body: SingleChildScrollView(child: loadingWidgetAnimation()));
    });
  }

  Column studentInfoWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.white10,
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 55,
            ),
            radius: 40,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            '${studentInfo.fullName}',
            style: TextStyle(
              fontFamily: 'Lemonade',
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.amberAccent,
            ),
          ),
        ),
        Divider(
          height: 60.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'رقم الطالب',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.filter_1,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          studentInfo.studnetNo == null
              ? "غير متوفر"
              : '${studentInfo.studnetNo}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 30.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'رقم الهوية',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.filter_2,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          studentInfo.idCardNo == null
              ? "غير متوفر"
              : '${studentInfo.idCardNo}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 30.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'اسم ولي الأمر',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.assignment_ind,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          studentInfo.parentName == null
              ? "غير متوفر"
              : '${studentInfo.parentName}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 30.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'اسم الأم',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.assignment_ind,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          studentInfo.motherName == null
              ? "غير متوفر"
              : '	${studentInfo.motherName}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 30.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'الصف',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.class_,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          studentInfo.currentClass == null
              ? "غير متوفر"
              : '${studentInfo.currentClass}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 30.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'تاريخ الميلاد',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.date_range,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          studentInfo.birthDate == null
              ? "غير متوفر"
              : '${studentInfo.birthDate}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 30.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'الجنس',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              MdiIcons.genderMaleFemale,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          studentInfo.gender == null ? "غير متوفر" : '${studentInfo.gender}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 30.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'رقم البيت',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.phone,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          studentInfo.studentHomeTel == null
              ? "غير متوفر"
              : '${studentInfo.studentHomeTel}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 30.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'تلفون ولي الأمر',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.phone,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          studentInfo.parentMobile == null
              ? "غير متوفر"
              : '${studentInfo.parentMobile}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 30.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'تلفون الأم',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.phone,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          studentInfo.motherPhone == null
              ? "غير متوفر"
              : '${studentInfo.motherPhone}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 60.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'البريد الإلكتروني',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.mail,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        Text(
          studentInfo.studEmail == null
              ? "غير متوفر"
              : '${studentInfo.studEmail}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 60.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'بريد الأب الإلكتروني',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.mail,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        Text(
          studentInfo.parentEmail == null
              ? "غير متوفر"
              : '${studentInfo.parentEmail}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 60.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'بريد الأم الإلكتروني',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.mail,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        Text(
          studentInfo.motherEmail == null
              ? "غير متوفر"
              : '${studentInfo.motherEmail}',
          style: TextStyle(
            fontFamily: 'Lemonade',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        Divider(
          height: 60.0,
          color: Colors.grey[850],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'ملاحظات المدرسة',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 15),
            Icon(
              MdiIcons.note,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(15),
          color: Colors.amberAccent,
          child: Center(
            child: new Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  studentInfo.remarks == null
                      ? "لا يوجد ملاحظات"
                      : '${studentInfo.remarks}',
                  style: TextStyle(
                    fontFamily: 'Lemonade',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[850],
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Container loadingWidgetAnimation() {
    return Container(
         color: Colors.grey[900],
                padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 40.0),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.white10,
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 55,
              ),
              radius: 40,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 200.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          )),
          Divider(
            height: 60.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'رقم الطالب',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.filter_1,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'رقم الهوية',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.filter_2,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'اسم ولي الأمر',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.assignment_ind,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'اسم الأم',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.assignment_ind,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'الصف',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.class_,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'تاريخ الميلاد',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.date_range,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'الجنس',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                MdiIcons.genderMaleFemale,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'رقم البيت',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.phone,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'تلفون ولي الأمر',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.phone,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'تلفون الأم',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.phone,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 60.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'البريد الإلكتروني',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.mail,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 60.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'بريد الأب الإلكتروني',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.mail,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 60.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'بريد الأم الإلكتروني',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.mail,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SkeletonAnimation(
              gradientColor: Colors.amberAccent,
              child: Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Divider(
            height: 60.0,
            color: Colors.grey[850],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'ملاحظات المدرسة',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Icon(
                MdiIcons.note,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.amberAccent,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SkeletonAnimation(
                  gradientColor: Colors.amberAccent,
                  child: Container(
                    width: 120.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
