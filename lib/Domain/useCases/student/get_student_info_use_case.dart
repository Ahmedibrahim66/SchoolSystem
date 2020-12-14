
import 'package:mustafa0_1/Data/models/StudentModels/StudentInfoModel.dart';
import 'package:mustafa0_1/Domain/repositories/studentRepository.dart';

class GetStudentInfo{

  final StudentRepository repository;

  GetStudentInfo(this.repository);

  //check use case class
  Future <StudentInfoModel> getStudentInfo({
     String token,  String userId
  }) async {
    return await repository.getStudentInfo(token, userId);
  }

}