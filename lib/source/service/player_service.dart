import 'package:abo/common/cache/simple_cache.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/source/domain/batter_stat_model.dart';
import 'package:abo/source/domain/pitcher_stat_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerService implements IService {
  PlayerService._privateConstructor() {
    _allPlayerList = SimpleCache<List<PlayerModel>>();
    _pitcherList = SimpleCache<List<PlayerModel>>();
    _batterList = SimpleCache<List<PlayerModel>>();
  }

  static final PlayerService _instance = PlayerService._privateConstructor();

  static PlayerService get instance => _instance;

  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  late final SimpleCache<List<PlayerModel>> _allPlayerList;

  late final SimpleCache<List<PlayerModel>> _pitcherList;
  late final SimpleCache<List<PlayerModel>> _batterList;

  late final SimpleCache<List<PitcherStatModel>> _pitcherStatList;
  late final SimpleCache<List<BatterStatModel>> _batterStatList;

  Future<Result<List<PlayerModel>>> getAllPlayerList() async {
    return Result.guardFuture(() async {
      return await _allPlayerList.getAsync(create: () async {
        final pitcher = await fireStore
            .collection('player')
            .doc('info')
            .collection('pitcher')
            .get();
        final pitcherData = pitcher.docs;

        final list = <PlayerModel>[];

        for (var element in pitcherData) {
          list.add(PlayerModel.fromJson(element.data(), true));
        }

        final batter = await fireStore
            .collection('player')
            .doc('info')
            .collection('batter')
            .get();
        final batterData = batter.docs;

        for (var element in batterData) {
          list.add(PlayerModel.fromJson(element.data(), false));
        }

        return list;
      });
    });
  }

  Future<Result<List<PlayerModel>>> getPitcherList() async {
    return Result.guardFuture(() async {
      return await _pitcherList.getAsync(create: () async {
        final result = await fireStore
            .collection('player')
            .doc('info')
            .collection('pitcher')
            .get();
        final data = result.docs;

        final list = <PlayerModel>[];

        for (var element in data) {
          list.add(PlayerModel.fromJson(element.data(), true));
        }

        return list;
      });
    });
  }

  Future<Result<PitcherStatModel>> getPitcherStat(
      PlayerModel playerModel) async {
    return Result.guardFuture(() async {
      final result = await _pitcherStatList.getAsync(create: () async {
        final result = await fireStore
            .collection('player')
            .doc('info')
            .collection('pitcher_stat')
            .get();

        final data = result.docs;

        final list = <PitcherStatModel>[];

        for (var element in data) {
          list.add(PitcherStatModel.fromJson(element.data()));
        }

        return list;
      });

      return result.firstWhere((element) => element.id == playerModel.id);
    });
  }

  Future<Result<List<PlayerModel>>> getBatterList() async {
    return Result.guardFuture(() async {
      return await _batterList.getAsync(create: () async {
        final result = await fireStore
            .collection('player')
            .doc('info')
            .collection('batter')
            .get();
        final data = result.docs;

        final list = <PlayerModel>[];

        for (var element in data) {
          list.add(PlayerModel.fromJson(element.data(), false));
        }

        return list;
      });
    });
  }

  Future<Result<BatterStatModel>> getBatterStat(PlayerModel playerModel) async {
    return Result.guardFuture(() async {
      final result = await _batterStatList.getAsync(create: () async {
        final result = await fireStore
            .collection('player')
            .doc('info')
            .collection('batter_stat')
            .get();

        final data = result.docs;

        final list = <BatterStatModel>[];

        for (var element in data) {
          list.add(BatterStatModel.fromJson(element.data()));
        }

        return list;
      });

      return result.firstWhere((element) => element.id == playerModel.id);
    });
  }

  @override
  void clearCache() {
    _allPlayerList.clear();
    _pitcherList.clear();
    _batterList.clear();
  }
}