import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Messages/MessageDetail/bloc/message_detail_bloc.dart';

class SendMessageUI extends StatefulWidget {
  @override
  _SendMessageUIState createState() => _SendMessageUIState();
}

class _SendMessageUIState extends State<SendMessageUI> {
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
    //   return BlocBuilder<MessageDetailBloc, MessageDetailState>(
    //     builder: (context, state) {
    //       if (state is MessageDetailInitial) {
    //         BlocProvider.of<MessageDetailBloc>(context)
    //             .add(FetchMessageDetail(widget.messageNo));
    //       }
    //       if (state is MessageDetailLoaded) {
    //         return message(context, state);
    //       }
    //       if (state is MessageDetailError) {
    //         return Container(
    //           width: double.infinity,
    //           height: double.infinity,
    //           color: Colors.grey[900],
    //           child: Text("فشل في الاتصال"),
    //         );
    //       }
    //       return Container(
    //           width: MediaQuery.of(context).size.width,
    //           height: MediaQuery.of(context).size.height - 56,
    //           child: Center(
    //             child: SpinKitFadingCube(
    //               color: Colors.white,
    //               size: 80.0,
    //             ),
    //           ));
    //     },
    //   );
  }
}
