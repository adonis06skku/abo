import 'package:abo/source/domain/collection_model.dart';
import 'package:abo/source/domain/lineup_model.dart';
import 'package:abo/source/domain/manager_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'player_api.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class PlayerApi {
  factory PlayerApi(Dio dio) => _PlayerApi(dio);

  @GET('/player/{userId}/roaster')
  Future<CollectionModel<PlayerModel>> getRoaster({
    @Path('userId') required String userId,
  });

  @GET('/player/list')
  Future<CollectionModel<PlayerModel>> getPlayerList({
    @Query('isPitcher') bool? isPitcher,
  });

  @GET('/player/{userId}/lineup')
  Future<LineupModel> getLineUp({
    @Path('userId') required String userId,
  });

  @POST('/player/{userId}/lineup')
  Future<LineupModel> setLineUp({
    @Path('userId') required String userId,
    @Body() required LineupModel lineup,
  });

  @GET('/player/manager/list')
  Future<CollectionModel<ManagerModel>> getManagerList();

  @GET('/player/{userId}/manager')
  Future<ManagerModel> getManager({
    @Path('userId') required String userId,
  });

  @POST('/player/{userId}/manager')
  Future<void> setManager({
    @Path('userId') required String userId,
    @Body() required ManagerModel manager,
  });
}

CollectionModel<PlayerModel> deserializeCollectionModelPlayerModel(Map<String, dynamic> json) =>
    CollectionModel<PlayerModel>.fromJson(json, (fromJsonT) => PlayerModel.fromJson(fromJsonT as Map<String, dynamic>));

LineupModel deserializeLineupModel(Map<String, dynamic> json) => LineupModel.fromJson(json);

CollectionModel<ManagerModel> deserializeCollectionModelManagerModel(Map<String, dynamic> json) =>
    CollectionModel<ManagerModel>.fromJson(
        json, (fromJsonT) => ManagerModel.fromJson(fromJsonT as Map<String, dynamic>));

ManagerModel deserializeManagerModel(Map<String, dynamic> json) => ManagerModel.fromJson(json);
