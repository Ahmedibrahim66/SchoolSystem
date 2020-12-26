import 'package:mustafa0_1/Data/models/StudentModels/BehaviourModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/DailyMarksModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/ScheduleSubjectModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentAbsenceModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentHealthModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentInfoModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentLateModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/StudentLearningMaterialModel.dart';
import 'package:mustafa0_1/Data/models/StudentModels/Student_payment_model.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_absence_entity.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_behaviour_entity.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_daily_marks_entity.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_health_entity.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_info_entity.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_late_entity.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_learning_material.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_payment_entity.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_schedule_entity.dart';


class StudentDataMapper {
  static StudentInfoEntity infoMapper(StudentInfoModel studentInfoModel) {
    return StudentInfoEntity(
        fullName: studentInfoModel.fullName,
        studnetNo: studentInfoModel.studnetNo,
        birthDate: studentInfoModel.birthDate,
        currentClass: studentInfoModel.currentClass,
        gender: studentInfoModel.gender,
        motherEmail: studentInfoModel.motherEmail,
        idCardNo: studentInfoModel.idCardNo,
        motherName: studentInfoModel.motherName,
        motherPhone: studentInfoModel.motherPhone,
        parentEmail: studentInfoModel.parentEmail,
        parentMobile: studentInfoModel.parentMobile,
        parentName: studentInfoModel.parentName,
        remarks: studentInfoModel.remarks,
        studEmail: studentInfoModel.studEmail,
        studentHomeTel: studentInfoModel.studentHomeTel,
        studentMobile: studentInfoModel.studentMobile);
  }

  static List scheduleMapper(List<List<ScheduleSubjectModel>> weekSchedual) {
    var schedual = [];
    int i = 0;
    var daysOfWeek = [
      "الأحد",
      "الأثنين",
      "الثلاثاء",
      "الأربعاء",
      "الخميس",
      "الجمعة",
      "السبت"
    ];
    for (List<ScheduleSubjectModel> scheduleSubject in weekSchedual) {
      schedual.add({
        'day': '${daysOfWeek[i]}',
        'classes': {
          'الحصة الأولى': scheduleSubject[0] == null
              ? "فراغ"
              : '${scheduleSubject[0].subjectDesc}',
          'الحصة الثانية': scheduleSubject[1] == null
              ? "فراغ"
              : '${scheduleSubject[1].subjectDesc}',
          'الحصة الثالثة': scheduleSubject[2] == null
              ? "فراغ"
              : '${scheduleSubject[2].subjectDesc}',
          'الحصة الرابعة': scheduleSubject[3] == null
              ? "فراغ"
              : '${scheduleSubject[3].subjectDesc}',
          'الحصة الخامسة': scheduleSubject[4] == null
              ? "فراغ"
              : '${scheduleSubject[4].subjectDesc}',
          'الحصة السادسة': scheduleSubject[5] == null
              ? "فراغ"
              : '${scheduleSubject[5].subjectDesc}',
          'الحصة السابعة': scheduleSubject[6] == null
              ? "فراغ"
              : '${scheduleSubject[6].subjectDesc}'
        }
      });
      i++;
    }
    return schedual;

    // return ScheduleSubjectEntity(
    //  classPeriod: scheduleSubjectModel.classPeriod,
    //  employeeNo: scheduleSubjectModel.employeeNo,
    //  sectionNo: scheduleSubjectModel.sectionNo,
    //  subjectDesc: scheduleSubjectModel.subjectDesc
    //  );
  }

  static List<List<ScheduleSubjectEntity>> scheduleMapper2(
      List<List<ScheduleSubjectModel>> weekSchedual, String classesPeriod) {
    int numberOfClasses = int.parse(classesPeriod);
  
    List<List<ScheduleSubjectEntity>> weekList = [];

    for (List<ScheduleSubjectModel> list in weekSchedual) {
      List<ScheduleSubjectEntity> oneDay = [];
      int j = 0;
      if (list.isNotEmpty)
        for (int i = 0; i < numberOfClasses; i++) {
          if (i != (int.parse(list[j].classPeriod) - 1)) {
            oneDay.add(ScheduleSubjectEntity());
          } else {
            oneDay.add(ScheduleSubjectEntity(
                classPeriod: list[j].classPeriod,
                employeeNo: list[j].employeeNo,
                sectionNo: list[j].sectionNo,
                subjectDesc: list[j].subjectDesc,
                classNo: list[j].classNo
                
                ));
            if (j == list.length-1) {
            } else {
              j++;
            }
          }
        }
      weekList.add(oneDay);
    }


    return weekList;
  }

  static List<StudentBehaviourEntity> behaviourMapper(
      List<StudentBehaviourModel> studentBehList) {
    List<StudentBehaviourEntity> list = [];

    for (StudentBehaviourModel beh in studentBehList) {
      list.add(StudentBehaviourEntity(
        alertDesc: beh.alertDesc,
        behDate: beh.behDate,
        behDesc: beh.behDesc,
        behSeq: beh.behSeq,
        points: beh.points,
        procDesc: beh.procDesc,
        remarks: beh.remarks,
        semester: beh.semester,
        studYear: beh.studYear,
        studentNo: beh.studentNo,
      ));
    }

    return list;
  }

  static List<StudentAbsenceEntity> absenceMapper(
      List<StudentAbsenceModel> studentAbsenceList) {
    List<StudentAbsenceEntity> list = [];

    for (StudentAbsenceModel abs in studentAbsenceList) {
      list.add(StudentAbsenceEntity(
          absenceDate: abs.absenceDate,
          absenceDesc: abs.absenceDesc,
          absenceSeq: abs.absenceSeq,
          isAccepted: abs.isAccepted,
          remarks: abs.remarks));
    }

    return list;
  }

  static List<StudentPaymentEntity> paymentMapper(
      List<StudentPaymentModel> studentAbsenceList) {
    List<StudentPaymentEntity> list = [];

    for (StudentPaymentModel pay in studentAbsenceList) {
      list.add(StudentPaymentEntity(
        accountNo: pay.accountNo,
        balance: pay.balance,
        bookFees: pay.bookFees,
        bussFees: pay.bussFees,
        debtFees: pay.debtFees,
        exemptionAmount: pay.exemptionAmount,
        exemptionType: pay.exemptionType,
        feesAmount: pay.feesAmount,
        initAmount: pay.initAmount,
        insuranceFees: pay.insuranceFees,
        paidAmount: pay.paidAmount,
        remark: pay.remark,
      ));
    }

    return list;
  }

  static List<DailyMarksEntity> dailyMarksMaper(
      List<DailyMarksModel> studentDailyMarks) {
    List<DailyMarksEntity> list = [];

    for (DailyMarksModel daymark in studentDailyMarks) {
      list.add(DailyMarksEntity(
        examDesc: daymark.examDesc,
        examNo: daymark.examNo,
        grade: daymark.grade,
        maxGrade: daymark.maxGrade,
        remarks: daymark.remarks,
        subjectDesc: daymark.subjectDesc,
        date: daymark.dateModel.date.substring(0, 10),
      ));
    }

    return list;
  }


   static List<StudentLateEntity> lateMapper(
      List<StudentLateModel> studentLateList) {
    List<StudentLateEntity> list = [];

    for (StudentLateModel abs in studentLateList) {
      list.add(StudentLateEntity(
          lateDate: abs.lateDate,
          lateDesc: abs.lateDesc,
          lateSeq: abs.lateSeq,
          isAccepted: abs.isAccepted,
          remarks: abs.remarks));
    }

    return list;
  }

 static List<StudentHealthEntity> healthMapper(
      List<StudentHealthModel> studentHealthList) {
    List<StudentHealthEntity> list = [];

    for (StudentHealthModel abs in studentHealthList) {
      list.add(StudentHealthEntity(
          healthDate: abs.healthDate,
          healthDesc:  abs.healthDesc,
          hlActionDesc: abs.hlActionDesc,
          studYear : abs.studYear,
          remarks: abs.remarks));
    }

    return list;
  }


}
