import 'package:mustafa0_1/Data/DataSources/remoteData/ParentRemoteDataSoruce.dart';
import 'package:mustafa0_1/Data/models/ParentModels/ParentChildrenModels.dart';
import 'package:mustafa0_1/Domain/repositories/parentRepository.dart';

class ParentRepositoryImp implements ParentRepository {
  
  ParentRemoteDataSource parentRemoteDataSource;

  ParentRepositoryImp(this.parentRemoteDataSource);

  @override
  Future<List<ParentChildrenModel>> getParentChildrens(String token, String userId) async {
    return await parentRemoteDataSource.getParentChildrens(token, userId);
  }

  


}
