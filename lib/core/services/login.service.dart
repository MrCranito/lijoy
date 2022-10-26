import '../models/user.model.dart';

abstract class BaseLogin {
  Future<User> getUser();
}

class BaseService implements BaseLogin {
  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

}