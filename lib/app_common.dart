import 'package:abo/common/data/result.dart';
import 'package:abo/common/loading/loading_provider.dart';
import 'package:abo/common/toast/toast.dart';
import 'package:abo/gen/assets.gen.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod/riverpod.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});

extension RefEx on Ref {
  AppRouter get _route => read(appRouterProvider);

  void showToast(dynamic message) {
    AboToast.instance.showToast(_route.navigatorKey.currentContext, message,
        toastBuilder: (BuildContext context, String message) {
      return _PaToastWidget(message: message);
    });
  }

  Future runInTryCatch<T>({
    required Future<T> Function() future,
    bool showErrorToast = true,
    bool showErrorDialog = false,
    Function? onPostError,
  }) async {
    try {
      return await future();
    } catch (error, _) {
      if (showErrorToast) {
        showToast(error);
      }
      // else if (showErrorDialog) {
      //   await showConfirmDialog(error.toString());
      // }
      onPostError?.call();
    }
  }

  Future<Result<T>> runInProgress<T>(
    Future<Result<T>> Function() future, {
    String? message,
    bool showErrorToast = false,
    bool showErrorDialog = false,
  }) async {
    Result<T> result;
    if (exists(loadingNotifierProvider) != true) {
      result = await future();
    } else {
      try {
        read(loadingNotifierProvider.notifier).loading(message);
        result = await future();
      } finally {
        read(loadingNotifierProvider.notifier).hide();
      }
    }
    if (result.hasError && (showErrorToast || showErrorDialog)) {
      if (showErrorToast) {
        showToast(result.error);
      }
      // else if (showErrorDialog) {
      //   showConfirmDialog(result.error!.toString());
      // }
    }
    return result;
  }
//
// Future<void> showConfirmDialog(String message, {String? title, Widget? icon, String? buttonText}) {
//   return Dialogs.confirmDialog(message, title: title, icon: icon, buttonText: buttonText)
//       .show(route.navigatorKey.currentContext);
// }
//
// Future<bool?> showDeleteCancelDialog(String message, {String? title, Widget? icon}) {
//   return Dialogs.customDialog(
//     message,
//     noText: AppString.cancel,
//     yesText: AppString.delete,
//     title: title,
//     icon: icon,
//   ).show(route.navigatorKey.currentContext);
// }
//
// Future<bool?> showDialog(String message,
//     {required String noText, required String yesText, String? title, Widget? icon}) {
//   return Dialogs.customDialog(
//     message,
//     noText: noText,
//     yesText: yesText,
//     title: title,
//     icon: icon,
//   ).show(route.navigatorKey.currentContext);
// }
//
// Future<void> showConfirmBottomSheet(dynamic message) {
//   if (route.navigatorKey.currentContext == null || route.navigatorKey.currentContext!.mounted != true) {
//     return Future.value(null);
//   }
//   return route.navigatorKey.currentContext!.showConfirmBottomSheet(message);
// }
//
// Future<bool?> showDeleteCancelBottomSheet(String message, {String? title, Widget? body}) {
//   if (route.navigatorKey.currentContext == null || route.navigatorKey.currentContext!.mounted != true) {
//     return Future.value(null);
//   }
//   return route.navigatorKey.currentContext!.showDeleteCancelBottomSheet(message, title: title, body: body);
// }
//
// Future<bool?> showBottomSheet({
//   required BottomSheetButtonType buttonType,
//   required String yesText,
//   required String noText,
//   String? message,
//   String? title,
//   Widget? body,
//   double? maxHeight,
// }) {
//   if (route.navigatorKey.currentContext == null || route.navigatorKey.currentContext!.mounted != true) {
//     return Future.value(null);
//   }
//   return route.navigatorKey.currentContext!.showBottomSheet(
//     buttonType: buttonType,
//     yesText: yesText,
//     noText: noText,
//     message: message,
//     title: title,
//     body: body,
//     maxHeight: maxHeight,
//   );
// }
}

class _PaToastWidget extends StatelessWidget {
  const _PaToastWidget({
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: context.colorN20.withOpacity(0.9),
      ),
      child: Text(
        message.toString(),
        style: context.textStyleT14r.copyWith(color: context.colorN100),
      ),
    );
  }
}

extension TeamExtension on Team {
  Color get color => switch (this) {
        Team.Kiwoom => AppColors.light().tcKiwoom,
        Team.Hanwha => AppColors.light().tcHanwha,
        Team.Lotte => AppColors.light().tcLotte,
        Team.Doosan => AppColors.light().tcDoosan,
        Team.Samsung => AppColors.light().tcSamsung,
        Team.LG => AppColors.light().tcLG,
        Team.Kia => AppColors.light().tcKia,
        Team.KT => AppColors.light().tcKT,
        Team.SSG => AppColors.light().tcSSG,
        Team.NC => AppColors.light().tcNC,
      };

  SvgPicture get logo => switch (this) {
        Team.Kiwoom => Assets.images.kiwoom.svg(),
        Team.Hanwha => Assets.images.hanwha.svg(),
        Team.Lotte => Assets.images.lotte.svg(),
        Team.Doosan => Assets.images.doosan.svg(),
        Team.Samsung => Assets.images.samsung.svg(),
        Team.LG => Assets.images.lg.svg(),
        Team.Kia => Assets.images.kia.svg(),
        Team.KT => Assets.images.kt.svg(),
        Team.SSG => Assets.images.ssg.svg(),
        Team.NC => Assets.images.nc.svg(),
      };
}
