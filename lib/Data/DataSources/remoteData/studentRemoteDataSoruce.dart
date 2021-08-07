import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mustafa0_1/Data/models/SharedModels/Message.dart';
import 'package:mustafa0_1/Data/models/SharedModels/MessageDetail.dart';
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
import 'package:path/path.dart';

class StudentRemoteDataSource implements StudentRepository {
  @override
  Future<StudentInfoModel> getStudentInfo(String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response =
          await get('$mainURL/user_info/?token=$token&Student_No=$userId');
      Map data = jsonDecode(response.body);
      StudentInfoModel info;
      info = StudentInfoModel.fromJson(data);
      return info;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<List<ScheduleSubjectModel>> getStudentDaySchedual(
      String token, String userId, int day) async {
    String mainURL = "http://portal.gtseries.net/School_API/";

    try {
      Response response = await get(
          '$mainURL/schedule/?token=$token&Student_No=$userId&Day_No=$day');
      List data = jsonDecode(response.body);

      List<ScheduleSubjectModel> oneDaySchedual = [];

      for (dynamic oneSubject in data) {
        oneDaySchedual.add(ScheduleSubjectModel.fromJson(oneSubject));
      }

      // List<ScheduleSubjectModel> oneDaySchedual = [
      //   null,
      //   null,
      //   null,
      //   null,
      //   null,
      //   null,
      //   null
      // ];

      // for (dynamic oneSubject in data) {
      //   ScheduleSubjectModel oneDaySchedualTest =
      //       ScheduleSubjectModel.fromJson(oneSubject);
      //   int classPeriod = int.parse(oneDaySchedualTest.classPeriod);
      //   oneDaySchedual
      //       .replaceRange(classPeriod - 1, classPeriod, [oneDaySchedualTest]);
      // }

      return oneDaySchedual;
    } catch (e) {
      //handel exception later
      return null;
    }
  }

  @override
  Future<List<List<ScheduleSubjectModel>>> getStudentWeekSchedual(
      String token, String userId) async {
    //http://portal.gtseries.net/School_API/schedule/?token=8469796b8c3f8f51553b431f6c4f743d&Student_No=20160010&Day_No=3

    try {
      List<List<ScheduleSubjectModel>> weekSchedual = [];

      weekSchedual.add(await getStudentDaySchedual(token, userId, 1));
      weekSchedual.add(await getStudentDaySchedual(token, userId, 2));
      weekSchedual.add(await getStudentDaySchedual(token, userId, 3));
      weekSchedual.add(await getStudentDaySchedual(token, userId, 4));
      weekSchedual.add(await getStudentDaySchedual(token, userId, 5));
      weekSchedual.add(await getStudentDaySchedual(token, userId, 6));
      weekSchedual.add(await getStudentDaySchedual(token, userId, 7));

      return weekSchedual;
    } catch (e) {
      //handel Exception later
      return null;
    }
  }

  @override
  Future<List<StudentBehaviourModel>> getStudentBehaviour(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response =
          await get('$mainURL/behaviors/?token=$token&Student_No=$userId');
      List data = jsonDecode(response.body);
      List<StudentBehaviourModel> list = [];

      for (dynamic behaviour in data) {
        list.add(StudentBehaviourModel.fromJson(behaviour));
      }

      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<List<StudentAbsenceModel>> getStudentAbsence(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response =
          await get('$mainURL/attendance/?token=$token&Student_No=$userId');
      List data = jsonDecode(response.body);
      List<StudentAbsenceModel> list = [];

      for (dynamic absence in data) {
        list.add(StudentAbsenceModel.fromJson(absence));
      }

      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<List<StudentPaymentModel>> getStudentPayment(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response =
          await get('$mainURL/payments/?token=$token&Student_No=$userId');
      List data = jsonDecode(response.body);
      List<StudentPaymentModel> list = [];

      for (dynamic payment in data) {
        list.add(StudentPaymentModel.fromJson(payment));
      }

      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<List<DailyMarksModel>> getStudentDailyMarks(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API";
    try {
      print("heeeeeeeeeeeeeeeeeeeeeeeeeeeeeloooo");
      Response response = await get(
          '$mainURL/daily_marks_all/?token=$token&Student_No=$userId');
      List data = jsonDecode(response.body);
      List<DailyMarksModel> list = [];

      for (dynamic dailyMarks in data) {
        list.add(DailyMarksModel.fromJson(dailyMarks));
      }

      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<CurrentYearAndWeekModel> getCurerntWeekAndYear(String token) async {
    String mainURL = "http://portal.gtseries.net/School_API";
    try {
      Response response =
          await get('$mainURL/current_week_and_year/?token=$token');
      Map data = jsonDecode(response.body);
      return CurrentYearAndWeekModel.fromJson(data);
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<StudentClassPeriodModel> getStudentClassPeriod(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API";
    try {
      Response response =
          await get('$mainURL/class_period/?token=$token&Student_No=$userId');
      List data = jsonDecode(response.body);
      return StudentClassPeriodModel.fromJson(data[0]);
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<List<StudentHomeworkAndExams>> getStudentHomeWorksAndExams(
      String token,
      String classNo,
      String sectionNo,
      String dayDate,
      String classPeriod) async {
    String mainURL = "http://portal.gtseries.net/School_API";
    try {
      Response response = await get(
          '$mainURL/homeworks_and_exams/?token=$token&Class_No=$classNo&Section_No=$sectionNo&Day_Date=$dayDate&Class_Period=$classPeriod');

      List data = jsonDecode(response.body);
      List<StudentHomeworkAndExams> list = [];

      for (dynamic homeWroksAndExams in data) {
        list.add(StudentHomeworkAndExams.fromJson(homeWroksAndExams));
      }

      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<List<StudentSubjectsModel>> getStudentSubjects(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API";
    try {
      Response response = await get(
          '$mainURL/student_subjects/?token=$token&Student_No=$userId');

      List data = jsonDecode(response.body);
      List<StudentSubjectsModel> list = [];

      for (dynamic subjects in data) {
        list.add(StudentSubjectsModel.fromJson(subjects));
      }

      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<List<DaysOfWeekModel>> getWeekDays(
      String token, String weekNum, String year) async {
    String mainURL = "http://portal.gtseries.net/School_API";
    try {
      Response response = await get(
          '$mainURL/week_days/?token=$token&week_no=$weekNum&year=$year');

      List data = jsonDecode(response.body);
      List<DaysOfWeekModel> list = [];

      for (dynamic days in data) {
        list.add(DaysOfWeekModel.fromJson(days));
      }

      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<List<List<StudentHomeworkAndExams>>> getStudentDayHomeWrokAndExams(
      String token,
      String classNo,
      String sectionNo,
      String dayDate,
      String numberOfPeriods) async {
    try {
      List<List<StudentHomeworkAndExams>> oneDayExam = [];

      for (int i = 0; i < int.parse(numberOfPeriods); i++) {
        oneDayExam.add(await getStudentHomeWorksAndExams(
            token, classNo, sectionNo, dayDate, (i + 1).toString()));
      }

      return oneDayExam;
    } catch (e) {
      //handel Exception later
      return null;
    }
  }

  @override
  Future<List<List<List<StudentHomeworkAndExams>>>>
      getStudentWeekHomeWroksAndExams(
          String token,
          String classNo,
          String sectionNo,
          String numberOfPeriods,
          List<DaysOfWeekModel> daysOfWeek) async {
    try {
      List<List<List<StudentHomeworkAndExams>>> oneWeekExams = [];

      for (int i = 0; i < 7; i++) {
        oneWeekExams.add(await getStudentDayHomeWrokAndExams(
            token, classNo, sectionNo, daysOfWeek[i].date, numberOfPeriods));
      }
      return oneWeekExams;
    } catch (e) {
      //handel Exception later
      return null;
    }
  }

  @override
  Future<List<StudentLearningMaterialModel>> getStudentLearningMaterial(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API";
    try {
      Response response = await get(
          '$mainURL/Students_Learning_Material/?token=$token&Student_No=$userId');

      List data = jsonDecode(response.body);
      List<StudentLearningMaterialModel> list = [];

      for (dynamic learn in data) {
        list.add(StudentLearningMaterialModel.fromJson(learn));
      }

      return list;
    } catch (e) {
      //handel excpetion later

      return null;
    }
  }

  @override
  Future<List<StudentLateModel>> getStudentLate(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response =
          await get('$mainURL/student_late/?token=$token&Student_No=$userId');
      List data = jsonDecode(response.body);
      List<StudentLateModel> list = [];
      for (dynamic absence in data) {
        list.add(StudentLateModel.fromJson(absence));
      }
      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<List<StudentHealthModel>> getStudentHealth(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response =
          await get('$mainURL/student_health/?token=$token&Student_No=$userId');
      List data = jsonDecode(response.body);
      List<StudentHealthModel> list = [];
      for (dynamic absence in data) {
        list.add(StudentHealthModel.fromJson(absence));
      }
      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future<List<ChatListModel>> getStudentChatList(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response =
          await get('$mainURL/chat_index/?token=$token&Student_No=$userId');
      List data = jsonDecode(response.body);
      List<ChatListModel> list = [];
      for (dynamic chatlist in data) {
        list.add(ChatListModel.fromJson(chatlist));
      }
      return list;
    } catch (e) {
      //handel excpetion later
      print(e);
      return null;
    }
  }

  @override
  Future<List<ChatModel>> getChatListChat(
      String token, String userId, String chatRoomId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response = await get(
          '$mainURL/fetch_chat/?token=$token&Student_No=$userId&Chat_Room_Id=$chatRoomId');
      List data = jsonDecode(response.body);
      List<ChatModel> list = [];
      for (dynamic chat in data) {
        list.add(ChatModel.fromJson(chat));
      }
      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }

  @override
  Future sendChatMessaeg(
      String token, String userId, String chatRoomId, String message) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      //to send chat you need to send a get requset with the message to the server
      // ignore: unused_local_variable
      Response response = await get(
          '$mainURL/send_message/?token=$token&Student_No=$userId&Chat_Room_Id=$chatRoomId&Message=$message');
    } catch (e) {
      //usually there should not be any error unless its from the servr
      print(e.toString());
    }
  }

  @override
  Future<List<StudentExamModel>> getStudentExamsList(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response =
          await get('$mainURL/student_exams/?token=$token&Student_No=$userId');
      List data = jsonDecode(response.body);
      List<StudentExamModel> list = [];
      for (dynamic examList in data) {
        list.add(StudentExamModel.fromJson(examList));
      }
      print(data);
      return list;
    } catch (e) {
      //handel excpetion later
      print(e);
      return null;
    }
  }

  @override
  Future<List<ExamQuestionReviewModel>> enterStudentExamReview(
      String token, String userId, int examId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response = await get(
          '$mainURL/show_student_exam_review/?token=$token&Student_No=$userId&Exam_Seq=$examId');

      List data = jsonDecode(response.body);
      List<ExamQuestionReviewModel> list = [];
      for (dynamic examList in data) {
        list.add(ExamQuestionReviewModel.fromJson(examList));
      }
      print(data);
      return list;
    } catch (e) {
      //handel excpetion later
      print(e);
      return null;
    }
  }

  @override
  Future<List<ExamQuestionReviewModel>> getStudentExamReviewQuestion(
      String token, String userId, int examId, int questionSeq) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response = await get(
          '$mainURL/show_selected_question_review/?token=$token&Student_No=$userId&Exam_Seq=$examId&Question_Seq=$questionSeq');
      List data = jsonDecode(response.body);
      List<ExamQuestionReviewModel> list = [];
      for (dynamic examList in data) {
        list.add(ExamQuestionReviewModel.fromJson(examList));
      }
      print(data);
      return list;
    } catch (e) {
      //handel excpetion later
      print(e);
      return null;
    }
  }

  @override
  Future<List<ExamQuestionAnswerModel>> showSelectedQuestion(
      String token, String userId, int examId, int questionSeq) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response = await get(
          '$mainURL/show_selected_question/?token=$token&Student_No=$userId&Exam_Seq=$examId&Question_Seq=$questionSeq');
      List data = jsonDecode(response.body);
      List<ExamQuestionAnswerModel> list = [];
      for (dynamic examList in data) {
        list.add(ExamQuestionAnswerModel.fromJson(examList));
      }
      print(data);
      return list;
    } catch (e) {
      //handel excpetion later
      print(e);
      return null;
    }
  }

  @override
  Future<List<ExamQuestionAnswerModel>> showStudentExam(
      String token, String userId, int examId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response = await get(
          '$mainURL/show_student_exam/?token=$token&Student_No=$userId&Exam_Seq=$examId');

      List data = jsonDecode(response.body);
      List<ExamQuestionAnswerModel> list = [];
      for (dynamic examList in data) {
        list.add(ExamQuestionAnswerModel.fromJson(examList));
      }
      print(data);
      return list;
    } catch (e) {
      //handel excpetion later
      print(e);
      return null;
    }
  }

  @override
  Future<String> submitQuestionAnswer(String token, String userId, int examId,
      int questionSeq, String selectedAnswer, String isEnd, File file) async {
    String mainURL = "http://portal.gtseries.net/School_API/";

    print(
        "$token + $userId  + $examId + $questionSeq + $selectedAnswer + $isEnd ");

    if (file == null) {
      //No file is attached make normal request
      try {
        Response response = await get(
            '$mainURL/submit_question_answer/?token=$token&Student_No=$userId&Exam_Seq=$examId&Question_Seq=$questionSeq&Selected_Answer=$selectedAnswer&Is_End=$isEnd');

        String data = response.body;
        print("data is" + data.toString());

        return data;
      } catch (e) {
        //handel excpetion later
        print("error is " + e.toString());
        return null;
      }
    } else {
      //File is attached make multipart request to upload the file
      try {
        var request = MultipartRequest(
          'POST',
          Uri.parse("$mainURL/submit_question_answer_text"),
        );

        Map<String, String> headers;

        //create headers
        headers = {"Content-type": "multipart/form-data"};

        request.files.add(
          MultipartFile(
            'File_Url',
            file.readAsBytes().asStream(),
            file.lengthSync(),
            filename: basename(file.path),
            //contentType: MediaType('image', 'jpeg'),
          ),
        );

        //add file
        request.fields['token'] = token;
        request.fields['Student_No'] = userId;
        request.fields['Exam_Seq'] = examId.toString();
        request.fields['Question_Seq'] = questionSeq.toString();
        request.fields['Selected_Answer'] = selectedAnswer;
        request.fields['Is_End'] = isEnd;

        //add hedaer
        request.headers.addAll(headers);

        final response = await request.send();
        final String respStr = await response.stream.bytesToString();
        print("tes");
        print(respStr);

        return respStr;
      } catch (e) {
        print(e.toString());
        return null;
      }
    }
  }

  @override
  Future<List<ZoomLinkModel>> getZoomLinks(String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response =
          await get('$mainURL/zoom_meetings/?token=$token&Student_No=$userId');

      List data = jsonDecode(response.body);
      List<ZoomLinkModel> list = [];
      for (dynamic examList in data) {
        list.add(ZoomLinkModel.fromJson(examList));
      }
      print(data);
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<StudentsHomeworkMaterialModel>> getStudentHomeworkMaterial(
      String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response = await get(
          '$mainURL/Students_Homework_Material/?token=$token&Student_No=$userId');

      List data = jsonDecode(response.body);
      List<StudentsHomeworkMaterialModel> list = [];
      for (dynamic examList in data) {
        list.add(StudentsHomeworkMaterialModel.fromJson(examList));
      }
      print(data);
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<bool> submitHomeWork(
      String token, String studentNumber, String seq, List<File> files) async {
    int fileSeq = await getCurrentFileSeq(token, studentNumber);
    bool uploaded = await uploadFiles(token, fileSeq, files);
    String url =
        "http://portal.gtseries.net/School_Api/addstudents_learning_material_file";

    print(uploaded);
    if (uploaded) {
      try {
        Response response = await post(
          url,
          body: jsonEncode(<String, dynamic>{
            'token': token,
            'Current_Homework_Seq': seq,
            'Current_File_Temp_Seq': fileSeq,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );

        //check if response succeeded
        dynamic data = response.body;
        print("data is $data");
        if (data == "success")
          return true;
        else
          return false;
      } catch (e) {
        print(e);
        return false;
      }
    } else
      return false;
  }

  Future<int> getCurrentFileSeq(String token, String studentNumber) async {
    String mainUrl =
        "http://portal.gtseries.net/School_Api/last_temp_file_seq/?token=$token&Student_No=$studentNumber";
    try {
      Response response = await get(
          '$mainUrl//last_temp_file_seq/?token=$token&Student_No=$studentNumber');

      Map data = jsonDecode(response.body);

      print("getCurrentFileSeq $data ");
      return data["Current_File_Temp_Seq"];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> uploadFiles(
      String token, int currentSeq, List<File> files) async {
    String mainUrl = "http://portal.gtseries.net/School_Api/save_temp_files";
    try {
      var request = MultipartRequest(
        'POST',
        Uri.parse(mainUrl),
      );

      Map<String, String> headers;

      //create headers
      headers = {"Content-type": "multipart/form-data"};

      for (int i = 0; i < files.length; i++) {
        //create file
        request.files.add(
          MultipartFile(
            'myfile[]',
            files[i].readAsBytes().asStream(),
            files[i].lengthSync(),
            filename: basename(files[i].path),
            //contentType: MediaType('image', 'jpeg'),
          ),
        );
      }

      //add file
      request.fields['token'] = token;
      request.fields['File_Current_Seq'] = currentSeq.toString();

      //({'token': token, 'File_Current_Seq': currentSeq});

      //add hedaer
      request.headers.addAll(headers);

      final response = await request.send();
      final respStr = await response.stream.bytesToString();

      print(respStr);
      //asume its true
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<List<StudentHomeworkMaterialSubmission>>
      getStudentHomeworkMaterialSubmissions(
          String token, String userId, String seq) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response = await get(
          '$mainURL/Students_Homework_Files/?token=$token&Student_No=$userId&Seq=$seq');
      List data = jsonDecode(response.body);
      List<StudentHomeworkMaterialSubmission> list = [];
      for (dynamic examList in data) {
        list.add(StudentHomeworkMaterialSubmission.fromJson(examList));
      }
      print(data);
      return list;
    } catch (e) {
      //handel excpetion later
      print(e);
      return null;
    }
  }

  @override
  Future<List<Message>> getStudentMessages(
      String token, String userId, String filter) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response = await get(
          '$mainURL/message_inbox/?token=$token&Student_No=$userId&Is_Read=$filter');
      List data = jsonDecode(response.body);
      List<Message> list = [];
      for (dynamic message in data) {
        list.add(Message.fromJson(message));
      }
      return list;
    } catch (e) {
      //handel excpetion later
      print(e.toString());
      return null;
    }
  }

  @override
  Future<MessageDetail> getStudentMessageDetail(
      String token, String userId, String messageNo) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
    try {
      Response response = await get(
          '$mainURL/view_message/?token=$token&Student_No=$userId&msg_no=$messageNo');
      List<dynamic> data = jsonDecode(response.body);
      print(data);
      MessageDetail message = MessageDetail.fromJson(data[0]);
      print(message);
      return message;
    } catch (e) {
      //handel excpetion later
      print(e.toString());
      return null;
    }
  }
}
