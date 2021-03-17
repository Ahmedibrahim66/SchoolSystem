import 'package:flutter/material.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHomeworkMaterialSubmission.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeWorkSubmissionDialog extends StatelessWidget {
  final List<StudentHomeworkMaterialSubmission> submissionList;

  HomeWorkSubmissionDialog({
    this.submissionList,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        //...bottom card part,
        //...top circlular image part,
        childern(context),
      ],
    );
  }

  childern(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Consts.padding,
        bottom: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
      ),
      margin: EdgeInsets.only(top: Consts.avatarRadius),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text("تسليمات الوظيفة",
              style: AppThemeData().tajwalText.copyWith(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center),
          SizedBox(height: 16.0),
          Container(
            height: 150,
            child: ListView.builder(
                itemCount: submissionList.length,
                itemBuilder: (context, index) {
                  return Flexible(
                    child: GestureDetector(
                      onTap: () {
                        launch(
                            "http://portal.gtseries.net/uploads/${submissionList[index].homeworkFileUrl}");
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${submissionList[index].homeworkFileDesc} :",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: AppThemeData()
                                  .tajwalText
                                  .copyWith(color: Colors.blue, fontSize: 16)),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 24.0),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppThemeData().thirdColor),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(); // To close the dialog
                },
                child: Text(
                  "اغلاق",
                  style:
                      AppThemeData().tajwalText.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 50.0;
}
