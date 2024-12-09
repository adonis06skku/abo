import 'package:abo/common/converter/datetime_converter.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

@Freezed()
class GameModel with _$GameModel {
  factory GameModel({
    required int gameId,
    @DateJsonConverter() required DateTime datetime,
    required GameInfoModel home,
    required GameInfoModel away,
  }) = _GameModel;

  factory GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);
}

@Freezed()
class GameInfoModel with _$GameInfoModel {
  factory GameInfoModel({
    required UserModel user,
    required int score,
    required List<PlayerModel> players,
  }) = _GameInfoModel;

  factory GameInfoModel.fromJson(Map<String, dynamic> json) => _$GameInfoModelFromJson(json);
}
