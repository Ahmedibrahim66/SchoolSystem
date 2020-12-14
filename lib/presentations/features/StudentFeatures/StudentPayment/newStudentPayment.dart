import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustafa0_1/Domain/entities/studentEntities/student_payment_entity.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/NavigationDrawer/navigationDrawer.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/StudentPayment/bloc/student_payment_bloc.dart';

class NewStudentPayment extends StatefulWidget {
  @override
  _NewStudentPaymentState createState() => _NewStudentPaymentState();
}

class _NewStudentPaymentState extends State<NewStudentPayment> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentPaymentBloc, StudentPaymentState>(
        builder: (context, state) {
      changeStatusBarColor();
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                BlocProvider.of<StudentPaymentBloc>(context)
                    .add(FetchStudentPayment());
              },
              child: Icon(Icons.refresh)),
          elevation: 0,
          backgroundColor: AppThemeData().primaryColor,
          centerTitle: true,
          title: Text(
            "GT Series",
            style: AppThemeData().lexendDecaText.copyWith(color: Colors.white),
          ),
        ),
        endDrawer: StudentNavigationDrawer(),
        backgroundColor: AppThemeData().primaryColor,
        body: body(state),
      );
    });
  }

  Widget body(StudentPaymentState state) {
    if (state is StudentPaymentEmpty) {
      BlocProvider.of<StudentPaymentBloc>(context).add(FetchStudentPayment());
    }
    if (state is StudentPaymentLoaded) {
      return paymentBody(state);
    }
    if (state is StudentPaymentError) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[900],
        child: Text("فشل في الاتصال"),
      );
    }

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 56,
        child: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 80.0,
          ),
        ));
  }

  Widget paymentBody(StudentPaymentLoaded state) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 100,
                child: SvgPicture.asset(
                    "assets/StudentPaymentAssets/paymentWallet.svg")),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 4,
                child: FittedBox(
                    child: Text(
                  "الأقساط",
                  style:
                      AppThemeData().tajwalText.copyWith(color: Colors.white),
                ))),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return noteItem(state.list[index]);
                  }),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Container noteItem(StudentPaymentEntity list) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppThemeData().thirdColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "رقم الحساب : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${list.accountNo}",
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "الديون : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${list.debtFees}",
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.red, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "أقساط : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.feesAmount,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.red, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "تسجيل : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.initAmount,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.red, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "باص : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.bussFees,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.red, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "كتب : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.bookFees,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.red, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "تأمين : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.insuranceFees,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.red, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "مدفوع : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.paidAmount,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.greenAccent, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "نوع الأعفاء : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.exemptionType,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.greenAccent, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "الأعفاء : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.exemptionAmount,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.greenAccent, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "الرصيد : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.balance,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.greenAccent[100], fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                    Text(
                    "ملاحظات : ",
                    style: AppThemeData()
                        .tajwalText
                        .copyWith(color: Colors.white, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.centerRight,
                    child: Text(
                      list.remark == null ||  list.remark == "" ?  "لا يوجد" : list.remark ,
                      textAlign: TextAlign.right,
                      style: AppThemeData()
                          .tajwalText
                          .copyWith(color: Colors.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 50,
                  height: 40,
                  child: SvgPicture.asset(
                      "assets/StudentPaymentAssets/money.svg"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  changeStatusBarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppThemeData().primaryColor);
  }
}
