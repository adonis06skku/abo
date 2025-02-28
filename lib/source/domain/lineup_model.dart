import 'package:abo/source/domain/player_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lineup_model.freezed.dart';
part 'lineup_model.g.dart';

@Freezed()
class LineupModel with _$LineupModel {
  factory LineupModel({
    PlayerModel? catcher,
    PlayerModel? firstBase,
    PlayerModel? secondBase,
    PlayerModel? thirdBase,
    PlayerModel? shortStop,
    PlayerModel? leftField,
    PlayerModel? centerField,
    PlayerModel? rightField,
    PlayerModel? designated,
    PlayerModel? startPitcher,
    PlayerModel? reliefPitcher1,
    PlayerModel? reliefPitcher2,
    PlayerModel? setupPitcher,
    PlayerModel? closingPitcher,
  }) = _LineupModel;

  factory LineupModel.fromJson(Map<String, dynamic> json) => _$LineupModelFromJson(json);

  factory LineupModel.empty() => LineupModel();
}

extension LineupModelExtension on LineupModel {
  bool get isEmpty =>
      catcher == null ||
      firstBase == null ||
      secondBase == null ||
      thirdBase == null ||
      shortStop == null ||
      leftField == null ||
      centerField == null ||
      rightField == null ||
      designated == null ||
      startPitcher == null ||
      reliefPitcher1 == null ||
      reliefPitcher2 == null ||
      setupPitcher == null ||
      closingPitcher == null;
}
