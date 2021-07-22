import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:steps_repository/goal/steps_goal_repository.dart';

class LocalStepsGoalRepository extends StepsGoalRepository {
  LocalStepsGoalRepository(this._localStorage);

  final StreamController<int> _stepsGoalStreamController =
      StreamController.broadcast();
  final SharedPreferences _localStorage;
  static const String stepsGoalKey = 'stepsGoal';

  @override
  Stream<int?> getStepsGoalStream() => _stepsGoalStreamController.stream;

  @override
  Future<int> updateStepsGoal(int stepsGoal) => _localStorage
      .setInt(stepsGoalKey, stepsGoal)
      .then((value) => _stepsGoalStreamController.add(stepsGoal))
      .then((value) => stepsGoal);

  @override
  Future<int?> getStepsGoal() async => _localStorage.getInt(stepsGoalKey);
}
