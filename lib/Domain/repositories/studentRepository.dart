import 'package:mustafa0_1/Data/models/StudentModels/BehaviourModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ChatListModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/CurrentYearAndWeekModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/DailyMarksModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/DaysOfWeekModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ExamQuestionReviewModel.dart';

import 'package:mustafa0_1/Data/models/StudentModels/ScheduleSubjectModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentAbsenceModel.dart';

import 'package:mustafa0_1/Data/models/StudentModels/StudentClassPeriodModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentExamModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHealthModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHomeworkdsAndExamsModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentInfoModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentLateModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentSibjectModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/Student_payment_model.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentLearningMaterialModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/chatModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/examQuestionAnswerModel.dart';


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
 
  //student chat
  Future<List<ChatListModel>>  getStudentChatList(String token, String userId);
  Future<List<ChatModel>> getChatListChat(String token , String userId , String chatRoomId);
  Future sendChatMessaeg(String token ,String userId, String chatRoomId , String message);
  
  //view exam to review
  Future<List<StudentExamModel>> getStudentExamsList(String token, String userId);
  Future<List<ExamQuestionReviewModel>> enterStudentExamReview(String token, String userId, int examId);
  Future<List<ExamQuestionReviewModel>> getStudentExamReviewQuestion(String token, String userId, int examId, int questionSeq);
  
  //view exam to answer
  Future<List<ExamQuestionAnswerModel>> showStudentExam(String token, String userId, int examId);
  Future<List<ExamQuestionAnswerModel>> showSelectedQuestion(String token, String userId, int examId, int questionSeq);
  Future<String> submitQuestionAnswer(String token, String userId, int examId, int questionSeq, String selectedAnswer, String isEnd);
  

}