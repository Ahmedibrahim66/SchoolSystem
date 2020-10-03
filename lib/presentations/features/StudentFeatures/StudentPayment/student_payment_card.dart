import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:mustafa0_1/Domain/entities/student_payment_entity.dart';

class StudentPaymentCard extends StatelessWidget {
  final StudentPaymentEntity studentPaymentEntity;

  StudentPaymentCard(this.studentPaymentEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ExpansionCard(
        title: Container(
          color: Colors.grey[850],
          child: Column(
            children: <Widget>[
              Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'رقم الحساب',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Text(
                        studentPaymentEntity.accountNo,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        height: 15.0,
                        color: Colors.white12,
                        thickness: 1.3,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 55),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[700],
              child: Column(
                children: <Widget>[
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric( horizontal: 15),
                        subtitle: Text(
                          'ديون',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          studentPaymentEntity.debtFees,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent[200],
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Divider(
                    height: 10,
                    color: Colors.grey[900],
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric( horizontal: 15),
                        title: Text(
                          studentPaymentEntity.feesAmount,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent[200],
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'أقساط',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Divider(
                    height: 10,
                    color: Colors.grey[900],
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric( horizontal: 15),
                        title: Text(
                          studentPaymentEntity.initAmount,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent[200],
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'تسجيل',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Divider(
                    height: 10,
                    color: Colors.grey[900],
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric( horizontal: 15),
                        title: Text(
                          studentPaymentEntity.bussFees,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent[200],
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'باص',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Divider(
                    height: 10,
                    color: Colors.grey[900],
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric( horizontal: 15),
                        title: Text(
                          studentPaymentEntity.bookFees,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent[200],
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'كتب',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Divider(
                    height: 10,
                    color: Colors.grey[900],
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric( horizontal: 15),
                        title: Text(
                          studentPaymentEntity.insuranceFees,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent[200],
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'تأمينات',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Divider(
                    height: 10,
                    color: Colors.grey[900],
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric( horizontal: 15),
                        title: Text(
                          studentPaymentEntity.paidAmount,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[300],
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'مدفوع',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Divider(
                    height: 10,
                    color: Colors.grey[900],
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric( horizontal: 15),
                        title: Text(
                          studentPaymentEntity.exemptionType,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[300],
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'نوع الاعفاء',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Divider(
                    height: 10,
                    color: Colors.grey[900],
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric( horizontal: 15),
                        title: Text(
                          studentPaymentEntity.balance,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'الرصيد',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                        Divider(
                    height: 10,
                    color: Colors.grey[900],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
