import 'package:mustafa0_1/Data/DataSources/remoteData/authentication_remote_data_source.dart';
import 'package:mustafa0_1/Domain/repositories/authenticationRepository.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  AuthenticationRemoteDataSoruce authenticationRemoteDataSoruce;

  AuthenticationRepositoryImp(this.authenticationRemoteDataSoruce);

  @override
  Future<String> authenticate(
      String userName, String password, String userType) async {
    return await authenticationRemoteDataSoruce.authenticate(
        userName, password, userType);
  }
}
