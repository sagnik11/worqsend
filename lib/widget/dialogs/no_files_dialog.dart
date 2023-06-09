import 'package:flutter/material.dart';
import 'package:WorqSend_app/gen/strings.g.dart';
import 'package:WorqSend_app/widget/dialogs/custom_bottom_sheet.dart';
import 'package:routerino/routerino.dart';

class NoFilesDialog extends StatelessWidget {
  const NoFilesDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: t.dialogs.noFiles.title,
      description: t.dialogs.noFiles.content,
      child: Center(
        child: ElevatedButton(
          onPressed: () => context.popUntilRoot(),
          child: Text(t.general.close),
        ),
      ),
    );
  }
}
