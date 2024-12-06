import 'package:abo/common/cache/simple_cache.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/common/service/main_service.dart';
import 'package:abo/source/domain/auth_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/repository/api/apis.dart';
import 'package:abo/source/repository/game_repository.dart';
import 'package:abo/source/repository/player_repository.dart';

/// this repository only can be called from other repositories
class AuthRepository implements IService {
  AuthRepository._privateConstructor() {
    MainService.instance.registerService(this);
    _userList = SimpleCache<List<UserModel>>();
    _currentUser = SimpleCache<UserModel?>();
  }

  static final AuthRepository _instance = AuthRepository._privateConstructor();

  static AuthRepository get instance => _instance;

  late final SimpleCache<List<UserModel>> _userList;
  late final SimpleCache<UserModel?> _currentUser;

  Future<UserModel?> getCurrentUser() async {
    return _currentUser.value;
  }

  Future<Result<void>> signOut() async {
    return Result.guardFuture(() async {
      await apis.authApi.signOut();
      clearCache();
      return;
    });
  }

  Future<Result<void>> signIn(String email, String password, bool persistence) async {
    return Result.guardFuture(() async {
      final result = await apis.authApi.signIn(auth: AuthModel(email: email, password: password));
      _currentUser.value = result;

      return;
    });
  }

  Future<Result<void>> signUp(String email, String password, String name) async {
    return Result.guardFuture(() async {
      final result = await apis.authApi.signUp(auth: AuthModel(username: name, email: email, password: password));
      _currentUser.value = result;
      return;
    });
  }

  Future<List<UserModel>> getUserList() async {
    final result = await Result.guardFuture(() async {
      return _userList.getAsync(create: () async {
        final result = await apis.authApi.getUserList();
        logger.d(result);
        return result.data;
      });
    });
    return result.valueOrNull ?? [];
  }

  @override
  void clearCache() {
    PlayerRepository.instance.clearCache();
    GameRepository.instance.clearCache();
    _currentUser.clear();
    _userList.clear();
  }
}
