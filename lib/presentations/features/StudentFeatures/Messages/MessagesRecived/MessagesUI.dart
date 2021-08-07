import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:mustafa0_1/Data/DataSources/remoteData/studentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/models/SharedModels/Message.dart';
import 'package:mustafa0_1/Data/models/SharedModels/MessageDetail.dart';
import 'package:mustafa0_1/Data/repositories/StudentRepositoryImp.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Messages/MessageDetail/MessageDetail.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Messages/MessageDetail/bloc/message_detail_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Messages/MessagesRecived/bloc/messages_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationDrawer.dart';

class MessagesUI extends StatefulWidget {
  @override
  _MessagesUIState createState() => _MessagesUIState();
}

class _MessagesUIState extends State<MessagesUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              BlocProvider.of<MessagesBloc>(context).add(FetchMessages());
            },
            child: Icon(Icons.refresh)),
        elevation: 0,
        backgroundColor: AppThemeData().primaryColor,
        centerTitle: true,
        title: Text(
          "GT Series",
          style: AppThemeData().lexendDecaText.copyWith(color: Colors.white),
        ),
      ),
      endDrawer: StudentNavigationDrawer(),
      backgroundColor: AppThemeData().primaryColor,
      body: body(),
    );
  }

  Widget body() {
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state) {
        if (state is MessagesInitial) {
          BlocProvider.of<MessagesBloc>(context).add(FetchMessages());
        }
        if (state is MessageLoaded) {
          return messagesList(context, state);
          ;
        }
        if (state is MessageError) {
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

  Column messagesList(BuildContext context, MessageLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
              width: MediaQuery.of(context).size.width / 5,
              child: FittedBox(
                  child: Text(
                "الرسائل",
                style: AppThemeData().tajwalText.copyWith(color: Colors.white),
              ))),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return noteItem(state.list[index]);
              }),
        )
      ],
    );
  }

  Widget noteItem(Message message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider<MessageDetailBloc>(
                    create: (context) => MessageDetailBloc(
                        new StudentRepositoryImp(
                            new StudentRemoteDataSource())),
                    child: MessageDetailUI(
                      messageNo: message.msgNo.toString(),
                    )),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: AppThemeData().thirdColor),
          height: 120,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            message.msgSubject,
                            style: AppThemeData().tajwalText.copyWith(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              DateFormat("dd-MM-yyyy HH:mm")
                                  .format(DateTime.parse(message.msgDate)),
                              style: AppThemeData()
                                  .tajwalText
                                  .copyWith(color: Colors.white, fontSize: 16)),
                          Text(message.subjectDesc,
                              style: AppThemeData()
                                  .tajwalText
                                  .copyWith(color: Colors.white, fontSize: 16)),
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
                          Text(message.msgFrom,
                              style: AppThemeData()
                                  .tajwalText
                                  .copyWith(color: Colors.white, fontSize: 14)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Icon(
                  Icons.email,
                  size: 45,
                  color: AppThemeData().primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
