import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/Data/models/ParentModels/ParentChildrenModels.dart';
import 'package:mustafa0_1/presentations/features/ParentFeatures/NavigationDrawer/bloc/parentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationHome.dart';
import 'package:mustafa0_1/presentations/widgets/dialogs/chooseChildDialog.dart';

class ParentNavigationHome extends StatefulWidget {
  @override
  _ParentNavigationHomeState createState() => _ParentNavigationHomeState();
}

class _ParentNavigationHomeState extends State<ParentNavigationHome> {
  @override
  Widget build(BuildContext context) {
     return BlocBuilder<ParentnavigationBloc, ParentnavigationState>(
        builder: (context, state) {

          if(state is ParentnavigationInitial)
          {
            BlocProvider.of<ParentnavigationBloc>(context).add(FetchParentChildrensEvent());
          }

          if(state is ParentChildInitial)
          {
            return NavigationHome();
          }
          if(state is ChildrenChange){
            
            Navigator.pop(context);
            showChangeMessage(context , state.children);
            
          }
          return Container(
            color: Colors.white,
          );

    });
  }

   Future showChangeMessage(BuildContext context , List<ParentChildrenModel> list) {
    return showModal(
      configuration: FadeScaleTransitionConfiguration(),
      context: context,
      builder: (BuildContext context) => CustomDialog3(
        children:list,
      ),
    );
  }
}