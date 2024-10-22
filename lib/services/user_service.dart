import 'package:aitrip/data/repositories/user_repository.dart';
import 'package:aitrip/models/Users/user_info/user.dart';

class UserService {
  const UserService({
    required UserRepository repository,
  }) : _repository = repository;
  final UserRepository _repository;

  Future<List<User>> getUsersInfo() {
    return _repository.getUsersInfo();
  }
}
