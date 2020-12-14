import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/Chat/bloc/chat_bloc.dart';

class SendChat extends StatefulWidget {
  @override
  _SendChatState createState() => _SendChatState();
}

class _SendChatState extends State<SendChat> {
  TextEditingController messageController = TextEditingController();
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Container(),
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
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey2,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                maxLines: 15,
                minLines: 15,
                controller: messageController,
                decoration: inputdecoration("ادخل رسالتك", "الرسالة"),
                validator: (val) {
                  if (val.isEmpty) {
                    return "الرجاء ادخال رسالة ";
                  } else
                    return null;
                },
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_formKey2.currentState.validate()) {
                print("valid");
                BlocProvider.of<ChatBloc>(context)
                    .add(SendMessage(messageController.text));
                BlocProvider.of<ChatBloc>(context).add(FetchChat());
                Navigator.pop(context);
              } else
                print("not valid");
            },
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "ارسال",
                  style: AppThemeData().tajwalText.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  inputdecoration(String labelText, String hintText) {
    return InputDecoration(
      labelText: '$labelText',
      hintText: '$hintText',
      helperText: '',
      fillColor: AppThemeData().primaryColor,
      filled: true,
      hintStyle: TextStyle(color: Colors.white60),
      labelStyle: TextStyle(color: Colors.white),

      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

      //errorStyle: TextStyle(fontSize: 0),
      alignLabelWithHint: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.white),
        //borderRadius: BorderRadius.circular(100),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.blue, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}
