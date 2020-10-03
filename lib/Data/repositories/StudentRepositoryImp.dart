import 'package:mustafa0_1/Data/DataSources/remoteData/studentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/models/BehaviourModel.dart';
import 'package:mustafa0_1/Data/models/CurrentYearAndWeekModel.dart';
import 'package:mustafa0_1/Data/models/DailyMarksModel.dart';
import 'package:mustafa0_1/Data/models/DaysOfWeekModel.dart';
import 'package:mustafa0_1/Data/models/ScheduleSubjectModel.dart';
import 'package:mustafa0_1/Data/models/StudentAbsenceModel.dart';
import 'package:mustafa0_1/Data/models/StudentHealthModel.dart';
import 'package:mustafa0_1/Data/models/StudentHomeworkdsAndExamsModel.dart';
import 'package:mustafa0_1/Data/models/StudentClassPeriodModel.dart';
import 'package:mustafa0_1/Data/models/StudentInfoModel.dart';
import 'package:mustafa0_1/Data/models/StudentLateModel.dart';
import 'package:mustafa0_1/Data/models/StudentLearningMaterialModel.dart';
import 'package:mustafa0_1/Data/models/StudentSibjectModel.dart';
import 'package:mustafa0_1/Data/models/Student_payment_model.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';

class StudentRepositoryImp implements StudentRepository {
  StudentRemoteDataSource studentRemoteDataSource;

  StudentRepositoryImp(this.studentRemoteDataSource);

  @override
  Future<StudentInfoModel> getStudentInfo(String token, String userId) async {
    return await studentRemoteDataSource.getStudentInfo(token, userId);
  }

  @override
  Future<List<ScheduleSubjectModel>> getStudentDaySchedual(
      String token, String userId, int day) async {
    return await studentRemoteDataSource.getStudentDaySchedual(
        token, userId, day);
  }

  @override
  Future<List<List<ScheduleSubjectModel>>> getStudentWeekSchedual(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentWeekSchedual(token, userId);
  }

  @override
  Future<List<StudentBehaviourModel>> getStudentBehaviour(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentBehaviour(token, userId);
  }

  @override
  Future<List<StudentAbsenceModel>> getStudentAbsence(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentAbsence(token, userId);
  }

  @override
  Future<List<StudentPaymentModel>> getStudentPayment(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentPayment(token, userId);
  }

  @override
  Future<List<DailyMarksModel>> getStudentDailyMarks(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentDailyMarks(token, userId);
  }

  @override
  Future<CurrentYearAndWeekModel> getCurerntWeekAndYear(String token) async {
    return await studentRemoteDataSource.getCurerntWeekAndYear(token);
  }

  @override
  Future<StudentClassPeriodModel> getStudentClassPeriod(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentClassPeriod(token, userId);
  }

  @override
  Future<List<StudentHomeworkAndExams>> getStudentHomeWorksAndExams(
      String token,
      String classNo,
      String sectionNo,
      String dayDate,
      String classPeriod) async {
    return await studentRemoteDataSource.getStudentHomeWorksAndExams(
        token, classNo, sectionNo, dayDate, classPeriod);
  }

  @override
  Future<List<StudentSubjectsModel>> getStudentSubjects(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentSubjects(token, userId);
  }

  @override
  Future<List<DaysOfWeekModel>> getWeekDays(
      String token, String weekNum, String year) async {
    return await studentRemoteDataSource.getWeekDays(token, weekNum, year);
  }

  @override
  Future<List<List<StudentHomeworkAndExams>>> getStudentDayHomeWrokAndExams(String token, String classNo, String sectionNo, String dayDate, String numberOfPeriods) async {
    return await studentRemoteDataSource.getStudentDayHomeWrokAndExams(token, classNo, sectionNo, dayDate, numberOfPeriods);
  }

  @override
  Future<List<List<List<StudentHomeworkAndExams>>>> getStudentWeekHomeWroksAndExams(String token, String classNo, String sectionNo, String numberOfPeriods, List<DaysOfWeekModel> daysOfWeek) async {
    return await studentRemoteDataSource.getStudentWeekHomeWroksAndExams(token, classNo, sectionNo, numberOfPeriods, daysOfWeek);
  }

  @override
  Future<List<StudentLearningMaterialModel>> getStudentLearningMaterial(String token, String userId) async {
    return await studentRemoteDataSource.getStudentLearningMaterial(token,userId);
    
  }

  @override
  Future<List<StudentLateModel>> getStudentLate(String token, String userId) async {
    return await studentRemoteDataSource.getStudentLate(token, userId);
  }

  @override
  Future<List<StudentHealthModel>> getStudentHealth(String token, String userId) async  {
    return await studentRemoteDataSource.getStudentHealth(token, userId);
  }

 
}
