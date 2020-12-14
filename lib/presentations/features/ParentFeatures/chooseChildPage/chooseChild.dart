import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Data/models/ParentModels/ParentChildrenModels.dart';
import 'package:mustafa0_1/presentations/features/Authentication/bloc/authentication_bloc.dart';

class ChooseChildPage extends StatefulWidget {
  final List<ParentChildrenModel> children;

  const ChooseChildPage({Key key, this.children}) : super(key: key);

  @override
  _ChooseChildPageState createState() => _ChooseChildPageState();
}

class _ChooseChildPageState extends State<ChooseChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          child: ListView.builder(
              itemCount: widget.children.length,
              itemBuilder: (context, index) {
                return Center(child: 
                RaisedButton(
                  onPressed: (){
                    BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationChangeChildEvent(widget.children[index].studentNo));
                  },
                  child: Text(widget.children[index].fullName))
                );
              }),
        ),
      ),
    );
  }
}
