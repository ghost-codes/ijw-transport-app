import 'package:flutter/material.dart';
import 'package:ijw_transport_app/utils/theme/app_text.dart';
import 'package:ijw_transport_app/utils/ui/dialog/alert_dialog_route.dart';

import '../../theme/colors.dart';

const _actionsPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 5);
const _contentPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 10);
const _shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(18.0),
  ),
);

class BaseAlert extends StatelessWidget {
  const BaseAlert({
    Key? key,
    this.title,
    this.message,
    this.additionalContent,
    this.imageTitle,
    this.onPositiveButtonClick,
    this.onNegativeButtonClick,
    this.showNegativeButton = false,
    this.showPositiveButton = true,
    this.positiveButtonText = 'Okay',
    this.negativeButtonText = 'Do it later',
    this.contentAlign = TextAlign.center,
    this.showNeutralButton = false,
    this.neutralButtonText = '',
    this.onNeutralButtonClick,
  }) : super(key: key);

  final String? title;
  final String? message;
  final Widget? additionalContent;

  final bool showNegativeButton;
  final bool showPositiveButton;
  final bool showNeutralButton;

  final TextAlign contentAlign;

  final String positiveButtonText;
  final String negativeButtonText;
  final String neutralButtonText;

  final GestureTapCallback? onNegativeButtonClick;
  final GestureTapCallback? onPositiveButtonClick;
  final GestureTapCallback? onNeutralButtonClick;

  final Widget? imageTitle;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return AlertDialog(
      title: buildTitle(context),
      content: buildMessage(context),
      actions: <Widget>[
        Center(
          child: Column(
            children: [
              if (showPositiveButton) ...[
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: onPositiveButtonClick,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      backgroundColor: MaterialStateProperty.all(AppColors.primary),
                    ),
                    child: Text(
                      positiveButtonText,
                      style: themeData.textTheme.titleMedium!.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
              buildShowNegativeButton(context),
              const SizedBox(height: 20),
              if (showNeutralButton) ...[
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: onNeutralButtonClick,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    child: Text(
                      neutralButtonText,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.black,
                            fontSize: 15,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ],
      actionsPadding: _actionsPadding,
      contentPadding: _contentPadding,
      shape: _shape,
    );
  }

  Column? buildTitle(BuildContext context) {
    return Column(
      children: [
        buildTitleImage(context),
        buildTitleSeparator(context),
        buildTitleText(context),
      ],
    );
  }

  Widget? buildMessage(BuildContext context) {
    final themeData = Theme.of(context);

    Widget? messageWidget;
    if (message != null) {
      messageWidget = AppText.descriptionRegular(message!);

      // AppStyledText(
      //   text: message!,
      //   textAlign: contentAlign,
      //   textStyle: themeData.textTheme.bodyMedium!.copyWith(
      //     fontWeight: AppFontWeight.regular,
      //     fontSize: 15,
      //     height: 1.3,
      //   ),
      // );
    }

    if (messageWidget != null && additionalContent != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          messageWidget,
          additionalContent!,
        ],
      );
    } else if (messageWidget != null) {
      return messageWidget;
    } else if (additionalContent != null) {
      return additionalContent;
    }

    return null;
  }

  Widget buildTitleImage(BuildContext context) {
    return imageTitle ?? const SizedBox.shrink();
  }

  Widget buildShowNegativeButton(BuildContext context) {
    return showNegativeButton
        ? InkWell(
            onTap: onNegativeButtonClick,
            child: Text(
              negativeButtonText,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.black,
                    fontSize: 15,
                  ),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget buildTitleSeparator(BuildContext context) {
    return imageTitle != null
        ? const SizedBox(
            height: 20,
          )
        : const SizedBox.shrink();
  }

  Widget buildTitleText(BuildContext context) {
    if (title == null) return const SizedBox.shrink();

    return Column(
      children: [
        Text(
          title!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class ConfirmAlert extends StatelessWidget {
  const ConfirmAlert({
    Key? key,
    this.title,
    this.message,
    this.additionalContent,
    this.positiveButtonText = 'Proceed',
    this.negativeButtonText = 'Cancel',
    required this.onPositiveButtonClick,
    this.onNegativeButtonClick,
    this.imageTitle,
    this.neutralButtonText = '',
    this.onNeutralButtonClick,
  }) : super(key: key);

  final String? title;
  final String? message;
  final String positiveButtonText;
  final String negativeButtonText;
  final String neutralButtonText;

  final void Function(BuildContext context)? onNegativeButtonClick;
  final void Function(BuildContext context) onPositiveButtonClick;
  final void Function(BuildContext context)? onNeutralButtonClick;

  final Widget? imageTitle;
  final Widget? additionalContent;

  @override
  Widget build(BuildContext context) {
    return BaseAlert(
      title: title,
      message: message,
      additionalContent: additionalContent,
      positiveButtonText: positiveButtonText,
      negativeButtonText: negativeButtonText,
      onPositiveButtonClick: () {
        onPositiveButtonClick(context);
      },
      onNegativeButtonClick: () {
        if (onNegativeButtonClick == null) {
          Navigator.of(context).pop(false);
          return;
        }
        onNegativeButtonClick!(context);
      },
      imageTitle: imageTitle,
      showNegativeButton: true,
    );
  }
}

class InfoAlert extends StatelessWidget {
  const InfoAlert({
    Key? key,
    required this.title,
    required this.message,
    this.onPositiveButtonClick,
    this.additionalContent,
    this.positiveButtonText = 'Okay',
    this.messageAlign = TextAlign.center,
  }) : super(key: key);

  final String title;
  final String message;
  final TextAlign messageAlign;

  final Function(BuildContext context)? onPositiveButtonClick;
  final String positiveButtonText;
  final Widget? additionalContent;

  @override
  Widget build(BuildContext context) {
    return BaseAlert(
      title: title,
      message: message,
      contentAlign: messageAlign,
      positiveButtonText: positiveButtonText,
      onPositiveButtonClick: () {
        if (onPositiveButtonClick == null) {
          Navigator.of(context).pop(false);
          return;
        }
        onPositiveButtonClick!(context);
      },
      showNegativeButton: false,
    );
  }
}

class LoadingAlert extends StatelessWidget {
  final String? title;
  final String message;

  const LoadingAlert({super.key, required this.message, this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: const CircularProgressIndicator(),
      ),
      shape: _shape,
      contentPadding: _contentPadding,
      actionsPadding: _actionsPadding,
    );
  }
}

enum NavigationType { REPLACE, PUSH }

Future<T?> showAppDialog<T>(
  BuildContext context,
  Widget dialog, {
  NavigationType navType = NavigationType.PUSH,
  bool barrierClosable = false,
  String? routeName,
}) async {
  final route = AlertDialogueRoute<T>(
    child: dialog,
    closable: barrierClosable,
    routeName: routeName ?? 'AppDialogRoute',
  );

  switch (navType) {
    case NavigationType.REPLACE:
      return await Navigator.of(context).pushReplacement(route);
    default:
      return await Navigator.of(context).push(route);
  }
}

Future showError(
  BuildContext context,
  String error, {
  String title = 'Try again',
}) {
  return showAppDialog(
    context,
    InfoAlert(
      title: title,
      message: error,
    ),
  );
}

Future showSuccess(
  BuildContext context,
  String message, {
  required String title,
}) {
  return showAppDialog(
    context,
    InfoAlert(
      title: title,
      message: message,
    ),
  );
}
