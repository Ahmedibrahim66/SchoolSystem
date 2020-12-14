import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ZoomLinksModel.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/ZoomLinksPage/bloc/zoom_links_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ZoomLinksPage extends StatefulWidget {
  @override
  _ZoomLinksPageState createState() => _ZoomLinksPageState();
}

class _ZoomLinksPageState extends State<ZoomLinksPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZoomLinksBloc, ZoomLinksState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                BlocProvider.of<ZoomLinksBloc>(context).add(FetchZoomLinks());
              },
              child: Icon(Icons.refresh)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_forward)),
            ),
          ],
          elevation: 0,
          backgroundColor: AppThemeData().primaryColor,
          centerTitle: true,
          title: Text(
            "GT Series",
            style: AppThemeData().lexendDecaText.copyWith(color: Colors.white),
          ),
        ),
        backgroundColor: AppThemeData().primaryColor,
        body: body(state),
      );
    });
  }

  Widget body(ZoomLinksState state) {
    if (state is ZoomLinksInitial) {
      BlocProvider.of<ZoomLinksBloc>(context).add(FetchZoomLinks());
    }
    if (state is ZoomLinksLoaded) {
      return zoomLinksbody(state);
    }
    if (state is ZoomLinksError) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[900],
        child: Text("فشل في الاتصال"),
      );
    }

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

  Widget zoomLinksbody(ZoomLinksLoaded state) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 100,
                child: Image.asset(
                    "assets/StudentDiscussionPageAssests/zoom.png")),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 4,
                child: FittedBox(
                    child: Text(
                  "لقاءات Zoom",
                  style:
                      AppThemeData().tajwalText.copyWith(color: Colors.white),
                ))),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return noteItem(state.list[index]);
                  }),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget noteItem(ZoomLinkModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          try {
            launch(model.meetingLink);
          } catch (e) {}
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: AppThemeData().thirdColor),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      model.subjectDesc,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("الموضوع",
                        style: AppThemeData().tajwalText.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("",
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 14)),
                    SizedBox(
                      width: 20,
                    ),
                    Text(": اسم المعلم/ة",
                        style: AppThemeData().tajwalText.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(model.meetingDesc,
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 14)),
                    SizedBox(
                      width: 20,
                    ),
                    Text("عنوان اللقاء",
                        style: AppThemeData().tajwalText.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(model.meetingDate,
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 14)),
                    SizedBox(
                      width: 20,
                    ),
                    Text("تاريخ اللقاء",
                        style: AppThemeData().tajwalText.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(model.startTime,
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 14)),
                    SizedBox(
                      width: 20,
                    ),
                    Text("وقت اللقاء",
                        style: AppThemeData().tajwalText.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: RaisedButton(
                  onPressed: () {
                    try {
                      launch(model.meetingLink);
                    } catch (e) {}
                  },
                  color: Colors.green,
                  child: Text("الدخول الى لقاء zoom",
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 14)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
