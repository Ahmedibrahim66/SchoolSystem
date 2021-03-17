import 'dart:io';

import 'package:mustafa0_1/Data/DataSources/remoteData/studentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/models/StudentModels/BehaviourModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ChatListModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/CurrentYearAndWeekModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/DailyMarksModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/DaysOfWeekModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ExamQuestionReviewModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ScheduleSubjectModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentAbsenceModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentExamModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHealthModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHomeworkMaterialModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHomeworkMaterialSubmission.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHomeworkdsAndExamsModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentClassPeriodModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentInfoModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentLateModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentLearningMaterialModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentSibjectModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/Student_payment_model.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ZoomLinksModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/chatModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/examQuestionAnswerModel.dart';
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
  Future<List<List<StudentHomeworkAndExams>>> getStudentDayHomeWrokAndExams(
      String token,
      String classNo,
      String sectionNo,
      String dayDate,
      String numberOfPeriods) async {
    return await studentRemoteDataSource.getStudentDayHomeWrokAndExams(
        token, classNo, sectionNo, dayDate, numberOfPeriods);
  }

  @override
  Future<List<List<List<StudentHomeworkAndExams>>>>
      getStudentWeekHomeWroksAndExams(
          String token,
          String classNo,
          String sectionNo,
          String numberOfPeriods,
          List<DaysOfWeekModel> daysOfWeek) async {
    return await studentRemoteDataSource.getStudentWeekHomeWroksAndExams(
        token, classNo, sectionNo, numberOfPeriods, daysOfWeek);
  }

  @override
  Future<List<StudentLearningMaterialModel>> getStudentLearningMaterial(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentLearningMaterial(
        token, userId);
  }

  @override
  Future<List<StudentLateModel>> getStudentLate(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentLate(token, userId);
  }

  @override
  Future<List<StudentHealthModel>> getStudentHealth(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentHealth(token, userId);
  }

  @override
  Future<List<ChatListModel>> getStudentChatList(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentChatList(token, userId);
  }

  @override
  Future<List<ChatModel>> getChatListChat(
      String token, String userId, String chatRoomId) async {
    return await studentRemoteDataSource.getChatListChat(
        token, userId, chatRoomId);
  }

  @override
  Future sendChatMessaeg(
      String token, String userId, String chatRoomId, String message) async {
    return await studentRemoteDataSource.sendChatMessaeg(
        token, userId, chatRoomId, message);
  }

  @override
  Future<List<StudentExamModel>> getStudentExamsList(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentExamsList(token, userId);
  }

  @override
  Future<List<ExamQuestionReviewModel>> enterStudentExamReview(
      String token, String userId, int examId) async {
    return await studentRemoteDataSource.enterStudentExamReview(
        token, userId, examId);
  }

  @override
  Future<List<ExamQuestionReviewModel>> getStudentExamReviewQuestion(
      String token, String userId, int examId, int questionSeq) async {
    return await studentRemoteDataSource.getStudentExamReviewQuestion(
        token, userId, examId, questionSeq);
  }

  @override
  Future<List<ExamQuestionAnswerModel>> showSelectedQuestion(
      String token, String userId, int examId, int questionSeq) async {
    return await studentRemoteDataSource.showSelectedQuestion(
        token, userId, examId, questionSeq);
  }

  @override
  Future<List<ExamQuestionAnswerModel>> showStudentExam(
      String token, String userId, int examId) async {
    return await studentRemoteDataSource.showStudentExam(token, userId, examId);
  }

  @override
  Future<String> submitQuestionAnswer(String token, String userId, int examId,
      int questionSeq, String selectedAnswer, String isEnd, File file) async {
    return await studentRemoteDataSource.submitQuestionAnswer(
        token, userId, examId, questionSeq, selectedAnswer, isEnd, file);
  }

  @override
  Future<List<ZoomLinkModel>> getZoomLinks(String token, String userId) async {
    return await studentRemoteDataSource.getZoomLinks(token, userId);
  }

  @override
  Future<List<StudentsHomeworkMaterialModel>> getStudentHomeworkMaterial(
      String token, String userId) async {
    return await studentRemoteDataSource.getStudentHomeworkMaterial(
        token, userId);
  }

  @override
  Future<bool> submitHomeWork(
      String token, String studentNumber, String seq, List<File> files) async {
    return await studentRemoteDataSource.submitHomeWork(
        token, studentNumber, seq, files);
  }

  @override
  Future<List<StudentHomeworkMaterialSubmission>>
      getStudentHomeworkMaterialSubmissions(
          String token, String userId, String seq) async {
    return await studentRemoteDataSource.getStudentHomeworkMaterialSubmissions(
        token, userId, seq);
  }
}
