import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mustafa0_1/Data/models/StudentModels/chatModel.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Chat/bloc/chat_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Chat/sendChat.dart';

class Chat extends StatefulWidget {
  final String chatRoomName;

  const Chat({Key key, this.chatRoomName}) : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String title = "GT Series";
  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      changeStatusBarColor();
      return Scaffold(
        appBar: AppBar(
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
          leading: GestureDetector(
              onTap: () {
                BlocProvider.of<ChatBloc>(context).add(FetchChat());
              },
              child: Icon(Icons.refresh)),
          elevation: 0,
          backgroundColor: AppThemeData().primaryColor,
          centerTitle: true,
          title: Text(
            widget.chatRoomName,
            style: AppThemeData().lexendDecaText.copyWith(color: Colors.white),
          ),
        ),
        backgroundColor: AppThemeData().primaryColor,
        body: body(state),
      );
    });
  }

  Widget body(ChatState state) {
    if (state is ChatInitial) {
      BlocProvider.of<ChatBloc>(context).add(FetchChat());
    }
    if (state is ChatLoaded) {
      return chatList(state);
    }
    if (state is ChatError) {
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

  Widget chatList(ChatLoaded state) {

    return Column(
      children: [
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              controller: _controller,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ListView.builder(
                            controller: _controller,
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return noteItem(state.list[index]);
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (newcontext) => BlocProvider.value(
                      value: BlocProvider.of<ChatBloc>(context),
                      child: new SendChat()),
                ));
          },
          child: Container(
            width: double.infinity,
            height: 60,
            color: AppThemeData().secondaryColor,
            child: Center(
                child: Text("مشاركة",
                    style: AppThemeData().tajwalText.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
          ),
        ),
      ],
    );
  }

  Widget noteItem(ChatModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      model.chaterName,
                      style: AppThemeData().tajwalText.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      model.date.substring(0, 19),
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 14),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(model.message == null ? "" : model.message,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
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
