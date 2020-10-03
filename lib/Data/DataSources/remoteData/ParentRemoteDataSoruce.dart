import 'dart:convert';
import 'package:http/http.dart';
import 'package:mustafa0_1/Data/models/ParentModels/ParentChildrenModels.dart';
import 'package:mustafa0_1/Domain/repositories/parentRepository.dart';



class ParentRemoteDataSource implements ParentRepository {


  @override
  Future<List<ParentChildrenModel>> getParentChildrens(String token, String userId) async {
    String mainURL = "http://portal.gtseries.net/School_API/";
   try {
      Response response =
          await get('$mainURL/parent_childrens/?token=$token&Parent_No=$userId');
      List data = jsonDecode(response.body);
      List<ParentChildrenModel> list = [];

      for (dynamic child in data) {
        list.add(ParentChildrenModel.fromJson(child));
      }

      return list;
    } catch (e) {
      //handel excpetion later
      return null;
    }
  }
  

}
