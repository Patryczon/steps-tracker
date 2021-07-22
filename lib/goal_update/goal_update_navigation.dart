import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:superloop/goal_update/goal_update_screen.dart';

abstract class GoalUpdateNavigation {
  void showGoalUpdate(BuildContext context);

  void hideGoalUpdate(BuildContext context);
}

class NavigatorGoalUpdate extends GoalUpdateNavigation {
  @override
  void hideGoalUpdate(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void showGoalUpdate(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: const GoalUpdateScreen()),
    );
  }
}
