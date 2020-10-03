import 'package:mustafa0_1/Data/models/BehaviourModel.dart';
import 'package:mustafa0_1/Data/models/CurrentYearAndWeekModel.dart';
import 'package:mustafa0_1/Data/models/DailyMarksModel.dart';
import 'package:mustafa0_1/Data/models/DaysOfWeekModel.dart';
import 'package:mustafa0_1/Data/models/ScheduleSubjectModel.dart';
import 'package:mustafa0_1/Data/models/StudentAbsenceModel.dart';
import 'package:mustafa0_1/Data/models/StudentClassPeriodModel.dart';
import 'package:mustafa0_1/Data/models/StudentHealthModel.dart';
import 'package:mustafa0_1/Data/models/StudentHomeworkdsAndExamsModel.dart';
import 'package:mustafa0_1/Data/models/StudentInfoModel.dart';
import 'package:mustafa0_1/Data/models/StudentLateModel.dart';
import 'package:mustafa0_1/Data/models/StudentSibjectModel.dart';
import 'package:mustafa0_1/Data/models/Student_payment_model.dart';
import 'package:mustafa0_1/Data/models/StudentLearningMaterialModel.dart';

abstract class StudentRepository {

  Future<StudentInfoModel> getStudentInfo(String token, String userId);
  Future<List<ScheduleSubjectModel>> getStudentDaySchedual(String token, String userId, int day);
  Future<List<List<ScheduleSubjectModel>>> getStudentWeekSchedual(String token, String userId);
  Future<List<StudentBehaviourModel>>  getStudentBehaviour(String token, String userId);
  Future<List<StudentAbsenceModel>>  getStudentAbsence(String token, String userId);
  Future<List<StudentPaymentModel>>  getStudentPayment(String token, String userId);
  Future<List<DailyMarksModel>>  getStudentDailyMarks(String token, String userId);
  Future<List<StudentSubjectsModel>>  getStudentSubjects(String token, String userId);
  Future<StudentClassPeriodModel>  getStudentClassPeriod(String token, String userId);
  Future<List<DaysOfWeekModel>>  getWeekDays(String token, String weekNum , String year);
  Future<CurrentYearAndWeekModel>  getCurerntWeekAndYear(String token);
  Future<List<StudentHomeworkAndExams>>  getStudentHomeWorksAndExams(String token, String classNo, String sectionNo, String dayDate, String classPeriod);
  Future<List<List<StudentHomeworkAndExams>>> getStudentDayHomeWrokAndExams(String token , String classNo, String sectionNo, String dayDate, String numberOfPeriods);
  Future<List<List<List<StudentHomeworkAndExams>>>> getStudentWeekHomeWroksAndExams(String token , String classNo, String sectionNo, String numberOfPeriods , List<DaysOfWeekModel> daysOfWeek);
  Future<List<StudentLearningMaterialModel>> getStudentLearningMaterial(String token, String userId);
  Future<List<StudentLateModel>>  getStudentLate(String token, String userId);
  Future<List<StudentHealthModel>>  getStudentHealth(String token, String userId);


}