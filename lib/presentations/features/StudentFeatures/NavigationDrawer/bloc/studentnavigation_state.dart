part of 'studentnavigation_bloc.dart';

abstract class StudentnavigationState extends Equatable {
   // 0 is student 1 is parent
  const StudentnavigationState(this.state);
  final int state;

  
  @override
  List<Object> get props => [];
}

class StudentnavigationInitial extends StudentnavigationState {

  StudentnavigationInitial(int state) : super(state);

}

class StudentnavigationToHome extends StudentnavigationState {

  StudentnavigationToHome(int state) : super(state);

}

class StudentProfileState extends StudentnavigationState {
  StudentProfileState(int state) : super(state);

}
class StudentMarksState extends StudentnavigationState {
  StudentMarksState(int state) : super(state);
 
}
class StudentsDiscussionState extends StudentnavigationState {
  StudentsDiscussionState(int state) : super(state);
 
}
class StudentPlaneState extends StudentnavigationState {
  StudentPlaneState(int state) : super(state);

}
class StudentsHomeworksState extends StudentnavigationState {
  StudentsHomeworksState(int state) : super(state);

}
class StudentsPaymentState extends StudentnavigationState {
  StudentsPaymentState(int state) : super(state);

}
class StudentsLearningMaterialState extends StudentnavigationState {
  StudentsLearningMaterialState(int state) : super(state);
   
}

class ParentChooseChildState extends StudentnavigationState {
  ParentChooseChildState() : super(1);
}
