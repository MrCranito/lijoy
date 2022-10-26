abstract class BaseAuthentification {
  Future<String> signInAuth(String email, String password);

  Future<String> signUpAuth(String email, String password);
}

class AuthService implements BaseAuthentification {
  @override
  Future<String> signInAuth(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<String> signUpAuth(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  } 

}