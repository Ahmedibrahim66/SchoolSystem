import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mustafa0_1/Data/mappers/StudentMappers.dart';
import 'package:mustafa0_1/Data/models/StudentModels/CurrentYearAndWeekModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/DaysOfWeekModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ScheduleSubjectModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentClassPeriodModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHomeworkdsAndExamsModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentSibjectModel.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_schedule_entity.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'student_schedual_event.dart';
part 'student_schedual_state.dart';


/// since the  scheudle is part of the dashborad it will not have its separete 
/// widget so this bloc will be used in the dashboard widget. 
 
class StudentSchedualBloc
    extends Bloc<StudentSchedualEvent, StudentSchedualState> {
  final StudentRepository repository;
  StudentSchedualBloc(this.repository)
      : assert(repository != null),
        super(StudentSchedualEmpty());

  StudentClassPeriodModel classPeriodModel;
  List<DaysOfWeekModel> daysOfWeekModel;
  List<StudentSubjectsModel> subjectModel;
  String token;
  String userId;
  List<List<ScheduleSubjectEntity>> finalSchedual;
  final Map<String, List<List<List<StudentHomeworkAndExams>>>>
      weeksHomeworkandExamsMap = {};

  final Map<String, List<DaysOfWeekModel>> daysOfWeekMap = {};
  String currentWeek = "43";
  String currentYear = "2019";
  List<List<List<StudentHomeworkAndExams>>> homeworkAndExams = [
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ];
  CurrentYearAndWeekModel yearAndWeekModel;

  @override
  Stream<StudentSchedualState> mapEventToState(
    StudentSchedualEvent event,
  ) async* {
    if (event is FetchStudentSchedual) {
      yield StudentSchedualLoading(loadingNumber: 0);
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        token = preferences.getString('userToken');
        userId = preferences.getString('userId');

        yearAndWeekModel = await repository.getCurerntWeekAndYear(token);
        print(yearAndWeekModel.year);

        yield StudentScheualMockState();
        yield StudentSchedualLoading(loadingNumber: 1);
        

        daysOfWeekModel = await repository.getWeekDays(
            token, yearAndWeekModel.weekNo, yearAndWeekModel.year);

        currentWeek = yearAndWeekModel.weekNo;
        currentYear = yearAndWeekModel.year;

        // daysOfWeekModel =
        //     await repository.getWeekDays(token, currentWeek, "2019");
        // yield StudentScheualMockState();

        yield StudentSchedualLoading(loadingNumber: 2);

        classPeriodModel =
            await repository.getStudentClassPeriod(token, userId);
        yield StudentScheualMockState();

        yield StudentSchedualLoading(loadingNumber: 3);

        final List<List<ScheduleSubjectModel>> scheduleSubjectModel =
            await repository.getStudentWeekSchedual(token, userId);
        yield StudentScheualMockState();
        print("date is 2 ");

        yield StudentSchedualLoading(loadingNumber: 4);

        List<List<ScheduleSubjectEntity>> schedule =
            StudentDataMapper.scheduleMapper2(
                scheduleSubjectModel, classPeriodModel.classPeriod);
        yield StudentScheualMockState();

        yield StudentSchedualLoading(loadingNumber: 5);

        finalSchedual = schedule;

        subjectModel = await repository.getStudentSubjects(token, userId);
        yield StudentScheualMockState();

        yield StudentSchedualLoading(loadingNumber: 6);

        homeworkAndExams.replaceRange(0, 1, [
          await repository.getStudentDayHomeWrokAndExams(
              token,
              subjectModel[0].classNo,
              subjectModel[0].sectionNo,
              daysOfWeekModel[0].date,
              classPeriodModel.classPeriod)
        ]);
        yield StudentScheualMockState();

        yield StudentSchedualLoading(loadingNumber: 7);

        // TODO: Change this to daily home work and exams || no idea why i wrote this check later
        // List<List<List<StudentHomeworkAndExams>>> weekHomeworkAndExams =
        //     await repository.getStudentWeekHomeWroksAndExams(
        //         token,
        //         subjectModel[0].classNo,
        //         subjectModel[0].sectionNo,
        //         classPeriodModel.classPeriod,
        //         daysOfWeekModel);

        weeksHomeworkandExamsMap["$currentWeek"] = homeworkAndExams;
        daysOfWeekMap["$currentWeek"] = daysOfWeekModel;
        yield StudentSchedualEror();

        yield StudentSchedualLoading(loadingNumber: 8);

        yield StudentSchedualLoaded(
            schedule: finalSchedual,
            daysOfWeek: daysOfWeekMap["$currentWeek"],
            homeworksAndExams: weeksHomeworkandExamsMap["$currentWeek"]);
      } catch (e) {
        yield StudentSchedualEror();
      }
    }

    if (event is NextWeekSchedual) {
      currentWeek = (int.parse(currentWeek) + 1).toString();
      if (currentWeek == "53") {
        currentYear = (int.parse(currentYear) + 1).toString();
        currentWeek = "1";
      }

      if (weeksHomeworkandExamsMap.containsKey(currentWeek)) {
        yield StudentSchedualLoaded(
            schedule: finalSchedual,
            daysOfWeek: daysOfWeekMap["$currentWeek"],
            homeworksAndExams: weeksHomeworkandExamsMap["$currentWeek"]);
      } else {
        yield StudentNewWeekSchedualLoading();
        try {
          // SharedPreferences preferences = await SharedPreferences.getInstance();
          // token = preferences.getString('userToken');
          // String userId = preferences.getString('userId');

          // CurrentYearAndWeekModel yearAndWeekModel =
          //     await repository.getCurerntWeekAndYear(token);

          List<DaysOfWeekModel> daysOfWeekModel =
              await repository.getWeekDays(token, currentWeek, currentYear);

          homeworkAndExams = [null, null, null, null, null, null, null];
          homeworkAndExams.replaceRange(0, 1, [
            await repository.getStudentDayHomeWrokAndExams(
                token,
                subjectModel[0].classNo,
                subjectModel[0].sectionNo,
                daysOfWeekModel[0].date,
                classPeriodModel.classPeriod)
          ]);

          // List<List<List<StudentHomeworkAndExams>>> weekHomeworkAndExams =
          //     await repository.getStudentWeekHomeWroksAndExams(
          //         token,
          //         subjectModel[0].classNo,
          //         subjectModel[0].sectionNo,
          //         classPeriodModel.classPeriod,
          //         daysOfWeekModel);

          weeksHomeworkandExamsMap["$currentWeek"] = homeworkAndExams;
          daysOfWeekMap["$currentWeek"] = daysOfWeekModel;

          yield StudentSchedualLoaded(
              schedule: finalSchedual,
              daysOfWeek: daysOfWeekMap["$currentWeek"],
              homeworksAndExams: homeworkAndExams);
        } catch (e) {
          yield StudentSchedualEror();
        }
      }
    }
    if (event is PrevoiusWeekSchedual) {
      currentWeek = (int.parse(currentWeek) - 1).toString();
      if (currentWeek == "53") {
        currentYear = (int.parse(currentYear) - 1).toString();
        currentWeek = "1";
      }
      if (weeksHomeworkandExamsMap.containsKey(currentWeek)) {
        yield StudentSchedualLoaded(
            schedule: finalSchedual,
            daysOfWeek: daysOfWeekMap["$currentWeek"],
            homeworksAndExams: weeksHomeworkandExamsMap["$currentWeek"]);
      } else {
        yield StudentNewWeekSchedualLoading();
        try {
          // CurrentYearAndWeekModel yearAndWeekModel =
          //     await repository.getCurerntWeekAndYear(token);

          // List<DaysOfWeekModel> daysOfWeekModel = await repository.getWeekDays(
          //     token, yearAndWeekModel.weekNo, yearAndWeekModel.year);

          List<DaysOfWeekModel> daysOfWeekModel =
              await repository.getWeekDays(token, currentWeek, currentYear);

          homeworkAndExams = [null, null, null, null, null, null, null];
          homeworkAndExams.replaceRange(0, 1, [
            await repository.getStudentDayHomeWrokAndExams(
                token,
                subjectModel[0].classNo,
                subjectModel[0].sectionNo,
                daysOfWeekModel[0].date,
                classPeriodModel.classPeriod)
          ]);

          // List<List<List<StudentHomeworkAndExams>>> weekHomeworkAndExams =
          //     await repository.getStudentWeekHomeWroksAndExams(
          //         token,
          //         subjectModel[0].classNo,
          //         subjectModel[0].sectionNo,
          //         classPeriodModel.classPeriod,
          //         daysOfWeekModel);

          weeksHomeworkandExamsMap["$currentWeek"] = homeworkAndExams;
          daysOfWeekMap["$currentWeek"] = daysOfWeekModel;
          yield StudentSchedualLoaded(
              schedule: finalSchedual,
              daysOfWeek: daysOfWeekMap["$currentWeek"],
              homeworksAndExams: weeksHomeworkandExamsMap["$currentWeek"]);
        } catch (e) {
          yield StudentSchedualEror();
        }
      }
    }
    if (event is NewDayChoosenWeekSchedual) {
      yield StudentHomeWorkAndExamsLoading(
          schedule: finalSchedual,
          daysOfWeek: daysOfWeekMap["$currentWeek"],
          homeworksAndExams: weeksHomeworkandExamsMap["$currentWeek"]);
      if (weeksHomeworkandExamsMap["$currentWeek"][event.day] == null && finalSchedual[event.day].isNotEmpty  ) {
       
        try {
          homeworkAndExams.replaceRange(event.day, event.day + 1, [
            await repository.getStudentDayHomeWrokAndExams(
                token,
                subjectModel[0].classNo,
                subjectModel[0].sectionNo,
                daysOfWeekMap["$currentWeek"][event.day].date,
                classPeriodModel.classPeriod)
          ]);
          weeksHomeworkandExamsMap["$currentWeek"] = homeworkAndExams;
        } catch (e) {
          yield StudentSchedualEror();
        }
      }
      yield StudentSchedualLoaded(
          schedule: finalSchedual,
          daysOfWeek: daysOfWeekMap["$currentWeek"],
          homeworksAndExams: weeksHomeworkandExamsMap["$currentWeek"]);
    }
  }
}
