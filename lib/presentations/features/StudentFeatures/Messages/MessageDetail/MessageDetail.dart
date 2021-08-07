import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Messages/MessageDetail/bloc/message_detail_bloc.dart';
import 'dart:ui' as ui;

class MessageDetailUI extends StatefulWidget {
  final String messageNo;

  const MessageDetailUI({Key key, this.messageNo}) : super(key: key);
  @override
  _MessageDetailUIState createState() => _MessageDetailUIState();
}

class _MessageDetailUIState extends State<MessageDetailUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppThemeData().primaryColor,
        centerTitle: true,
        title: Text(
          "GT Series",
          style: AppThemeData().lexendDecaText.copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: AppThemeData().primaryColor,
      body: body(),
    );
  }

  Widget body() {
    return BlocBuilder<MessageDetailBloc, MessageDetailState>(
      builder: (context, state) {
        if (state is MessageDetailInitial) {
          BlocProvider.of<MessageDetailBloc>(context)
              .add(FetchMessageDetail(widget.messageNo));
        }
        if (state is MessageDetailLoaded) {
          return message(context, state);
          ;
        }
        if (state is MessageDetailError) {
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
      },
    );
  }

  Widget message(BuildContext context, MessageDetailLoaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              child: Text(
            state.message.msgSubject,
            style: AppThemeData()
                .tajwalText
                .copyWith(color: Colors.white, fontSize: 26),
          )),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: AppThemeData().thirdColor),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(state.message.msgFrom,
                                textDirection: ui.TextDirection.rtl,
                                style: AppThemeData().tajwalText.copyWith(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                            DateFormat("dd-MM-yyyy HH:mm")
                                .format(DateTime.parse(state.message.msgDate)),
                            style: AppThemeData()
                                .tajwalText
                                .copyWith(color: Colors.white, fontSize: 16)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(state.message.msgBody,
                                style: AppThemeData().tajwalText.copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
