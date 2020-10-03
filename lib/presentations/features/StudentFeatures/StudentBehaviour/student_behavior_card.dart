import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mustafa0_1/Domain/entities/student_behaviour_entity.dart';

class BehaviourProfileCard extends StatelessWidget {
  final StudentBehaviourEntity behaviour;

  BehaviourProfileCard(this.behaviour);

  @override
  Widget build(BuildContext context) {
    return ExpansionCard(
      title: Container(
        color: Colors.grey[850],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Directionality(
                textDirection: TextDirection.rtl,
                child: new ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                  title: Text(
                    behaviour.studentNo,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'رقم الطالب',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    MdiIcons.idCard,
                    color: Colors.white,
                    size: 35,
                  ),
                )),
            new Directionality(
                textDirection: TextDirection.rtl,
                child: new ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                  title: Text(
                    behaviour.behDate,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'التاريخ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.date_range,
                    size: 35,
                    color: Colors.white,
                  ),
                )),
            Divider(
              height: 10,
              color: Colors.grey[900],
            ),
          ],
        ),
      ),
      children: <Widget>[
        new Directionality(
            textDirection: TextDirection.rtl,
            child: new ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              subtitle: Text(
                'البيان',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              title: Text(
                behaviour.alertDesc,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.details,
                size: 35,
                color: Colors.white,
              ),
            )),
        Divider(
          height: 10,
          color: Colors.grey[900],
        ),
        new Directionality(
            textDirection: TextDirection.rtl,
            child: new ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              subtitle: Text(
                'المدخل',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              title: Text(
                behaviour.behDesc,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.live_help,
                size: 35,
                color: Colors.white,
              ),
            )),
        Divider(
          height: 10,
          color: Colors.grey[900],
        ),
        new Directionality(
            textDirection: TextDirection.rtl,
            child: new ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              title: Text(
                behaviour.remarks,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'الملاحظات',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.note,
                color: Colors.white,
                size: 35,
              ),
            )),
        new Directionality(
            textDirection: TextDirection.rtl,
            child: new ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              title: Text(
                behaviour.procDesc,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'الإجراء',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                MdiIcons.hammer,
                color: Colors.white,
                size: 35,
              ),
            )),
        new Directionality(
            textDirection: TextDirection.rtl,
            child: new ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              title: Text(
                behaviour.semester,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'الفصل',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                MdiIcons.school,
                color: Colors.white,
                size: 35,
              ),
            )),
        new Directionality(
            textDirection: TextDirection.rtl,
            child: new ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              title: Text(
                behaviour.points,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'النقاط',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                MdiIcons.starFourPoints,
                color: Colors.white,
                size: 35,
              ),
            )),
      ],
    );
  }
}
