import 'package:aitrip/models/Users/user_info/user.dart';

abstract class UserRepositoryInterface {
  Future<List<User>> getUsersInfo();
}
