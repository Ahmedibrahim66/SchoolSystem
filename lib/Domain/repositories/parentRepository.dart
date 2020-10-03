

import 'package:mustafa0_1/Data/models/ParentModels/ParentChildrenModels.dart';

abstract class ParentRepository {

 
  Future<List<ParentChildrenModel>> getParentChildrens(String token, String userId);


}