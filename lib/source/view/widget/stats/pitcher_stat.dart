import 'package:abo/app_common.dart';
import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PitcherStat extends ConsumerWidget {
  const PitcherStat({
    super.key,
    required this.playerInfo,
  });

  final PlayerModel playerInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Team.fromID(playerInfo.teamId).logo,
            ),
            Gap.w4,
            Text(playerInfo.name, style: context.textStyleH20b.copyWith(color: context.colorP10)),
            Gap.w4,
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(playerInfo.birthDate.toServerDate()),
            Gap.w4,
            Text(playerInfo.position),
            Gap.w4,
            Text(playerInfo.hand),
          ],
        ),
        Gap.h32,
        // Text('2023 시즌', style: context.textStyleT14r.copyWith(color: context.colorP10)),
        // const Row(
        //   children: [],
        // ),
        // Container(
        //   color: Team.fromID(playerInfo.teamId).color,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             'G',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             '이닝',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             'ERA',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             'FIP',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //     ],
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.game.toString()))),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(child: Text(asyncValue.inning.toString())),
        //     ),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.era.toString()))),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(child: Text(asyncValue.fip.toString())),
        //     ),
        //   ],
        // ),
        // Container(
        //   color: Team.fromID(playerInfo.teamId).color,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             'W',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             'L',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             'SV',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             'HLD',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //     ],
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.win.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.lost.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.save.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.hold.toString()))),
        //   ],
        // ),
        // Container(
        //   color: Team.fromID(playerInfo.teamId).color,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             'WAR',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             'K/9',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //       SizedBox(
        //           width: (context.sizeWidth - 64) / 4,
        //           child: Center(
        //               child: Text(
        //             'BB/9',
        //             style: context.textStyleB14r.copyWith(
        //               color: context.colorN100,
        //             ),
        //           ))),
        //       SizedBox(
        //         width: (context.sizeWidth - 64) / 4,
        //       ),
        //     ],
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(
        //         child: Text(asyncValue.war.toString()),
        //       ),
        //     ),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(
        //         child: Text(asyncValue.k9.toString()),
        //       ),
        //     ),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(
        //         child: Text(asyncValue.bb9.toString()),
        //       ),
        //     ),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
