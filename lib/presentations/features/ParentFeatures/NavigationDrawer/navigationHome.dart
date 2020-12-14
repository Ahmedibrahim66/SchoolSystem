import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa0_1/presentations/features/ParentFeatures/NavigationDrawer/bloc/parentnavigation_bloc.dart';
import 'package:mustafa0_1/presentations/features/ParentFeatures/chooseChildPage/chooseChild.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationHome.dart';

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
            //fetch the parent children
            BlocProvider.of<ParentnavigationBloc>(context).add(FetchParentChildrensEvent());
          }

          if(state is ParentChildInitial)
          {
            //navigation home for the first child
            return NavigationHome();
          }
          if(state is ChildrenChange){
            
            //choose child page
            return ChooseChildPage(children: state.children,);
           
            
          }
         
          return Container(
            color: Colors.white,
          );

    });
  }

}