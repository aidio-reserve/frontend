import 'package:aitrip/data/repositories/user_repository.dart';
import 'package:aitrip/models/user.dart';
import 'package:aitrip/services/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = FutureProvider<List<User>>((ref) async {
  final _service = UserService(repository: UserRepository());
  return await _service.getUsersInfo();
});
