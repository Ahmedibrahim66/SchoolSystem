import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentHomeWrokSubmissions/bloc/view_submission_bloc.dart';
import 'package:mustafa0_1/presentations/widgets/LoadingAnimation.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentHomeworkMaterialSubmssions extends StatefulWidget {
  final String homeSeq;

  const StudentHomeworkMaterialSubmssions({Key key, this.homeSeq})
      : super(key: key);
  @override
  _StudentHomeworkMaterialSubmssionsState createState() =>
      _StudentHomeworkMaterialSubmssionsState();
}

class _StudentHomeworkMaterialSubmssionsState
    extends State<StudentHomeworkMaterialSubmssions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppThemeData().primaryColor,
          centerTitle: true,
          title: Text("تسليمات الوظيفة",
              style: AppThemeData().tajwalText.copyWith(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center),
        ),
        backgroundColor: AppThemeData().primaryColor,
        body: BlocBuilder<ViewSubmissionBloc, ViewSubmissionState>(
          builder: (context, state) {
            if (state is ViewSubmissionInitial) {
              BlocProvider.of<ViewSubmissionBloc>(context)
                  .add(ViewHomeworkSubmission(widget.homeSeq));
            }
            if (state is StudentHomeworkSubmissionLoading) {
              return LoadingAnimation();
            }
            if (state is StudentHomeworkSubmissionLoaded) {
              return Column(
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.list.length,
                          itemBuilder: (context, index) {
                            return Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  launch(
                                      "http://portal.gtseries.net/uploads/${state.list[index].homeworkFileUrl}");
                                },
                                child: Text(
                                    "${state.list[index].homeworkFileDesc}",
                                    textDirection: TextDirection.rtl,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: AppThemeData().tajwalText.copyWith(
                                        color: Colors.blue, fontSize: 30)),
                              ),
                            );
                          }),
                    ),
                  ]);
            }

            if (state is StudentHomeworkSubmissionFailed) {
              return Center(
                child: Text("فشل في عرض التسليمات"),
              );
            }
          },
        ));
  }
}
