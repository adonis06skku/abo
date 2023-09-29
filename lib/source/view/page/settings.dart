import 'package:abo/common/loadable_content.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/source/view/controller/settings_controller.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '설정',
          style: context.textStyleH20b.copyWith(color: context.colorP10),
        ),
      ),
      body: LoadableContent(
        asyncValue: asyncValue,
        content: (asyncValue) {
          return Column(
            children: [
          FilledButton(onPressed: () => notifier.signOut(), child: Text('로그아웃')),
            ],
          );
        }
      ),
    );
  }
}