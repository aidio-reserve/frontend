import 'package:aitrip/models/user.dart';

abstract class UserRepositoryInterface {
  Future<List<User>> getUsersInfo();
}
