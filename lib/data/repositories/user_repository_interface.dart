import 'package:aitrip/models/user/user.dart';

abstract class UserRepositoryInterface {
  Future<List<User>> getUsersInfo();
}
