import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Data/DataSources/remoteData/studentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ChatListModel.dart';
import 'package:mustafa0_1/Data/repositories/StudentRepositoryImp.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Chat/bloc/chat_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Chat/chat.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/ChatList/bloc/chatlist_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationDrawer.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  
  StudentRepository impl = new StudentRepositoryImp( new StudentRemoteDataSource()); 


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatlistBloc, ChatlistState>(builder: (context, state) {
      changeStatusBarColor();
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                BlocProvider.of<ChatlistBloc>(context)
                    .add(FetchStudentChatList());
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
        body: body(state),
      );
    });
  }

  Widget body(ChatlistState state) {
    if (state is ChatlistInitial) {
      BlocProvider.of<ChatlistBloc>(context).add(FetchStudentChatList());
    }
    if (state is ChatListLoaded) {
      return chatList(state);
    }
    if (state is ChatListError) {
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

  Widget chatList(ChatListLoaded state) {
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
                child: SvgPicture.asset(
                    "assets/StudentDiscussionPageAssests/discussion.svg")),
            SizedBox(
              
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 4,
                child: FittedBox(
                    child: Text(
                  "حلقات النقاش",
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
  

  Widget noteItem(ChatListModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => BlocProvider<ChatBloc>(
              create: (context) => ChatBloc(model.chatRoomId ,impl, model.chatName ),
              child: Chat(chatRoomName: model.chatName,)),
          ));
        },
              child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: AppThemeData().thirdColor),
          height: 160,
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
                      model.chatName,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(" : اسم حلقة النقاش",
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
                    Text(model.teacherName,
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
                    Text(model.dateCreated,
                        style: AppThemeData()
                            .tajwalText
                            .copyWith(color: Colors.white, fontSize: 14)),
                    SizedBox(
                      width: 20,
                    ),
                    Text(" : تاريخ الاضافة",
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
                  onPressed: () {},
                  color: Colors.green,
                  child: Text("المشاركة",
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

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppThemeData().primaryColor);
  }
}
