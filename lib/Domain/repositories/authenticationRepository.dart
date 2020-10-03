

abstract class AuthenticationRepository {

  Future<String> authenticate(String userName, String password, String userType);
 
}