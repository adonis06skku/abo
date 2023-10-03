import 'package:abo/common/logger/logger.dart';
import 'package:abo/source/domain/pitcher_stat_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/service/player_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pitcher_stat_controller.g.dart';

@riverpod
class PitcherStatController extends _$PitcherStatController {
  @override
  FutureOr<PitcherStatModel> build(PlayerModel playerModel) async {
    return await getStat(playerModel);
  }

  Future<PitcherStatModel> getStat(PlayerModel playerModel) async {
    final result = await PlayerService.instance.getPitcherStat(playerModel);
    return result.requireValue;
  }
}
