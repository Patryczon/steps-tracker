import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:steps_repository/goal/steps_goal_repository.dart';

class LocalStepsGoalRepository extends StepsGoalRepository {
  LocalStepsGoalRepository(this._localStorage);

  StreamController<int> _stepsGoalStreamController =
      StreamController.broadcast();
  final SharedPreferences _localStorage;
  static const String STEPS_GOAL_KEY = "stepsGoal";

  @override
  Stream<int?> getStepsGoalStream() => _stepsGoalStreamController.stream;

  @override
  Future<int> updateStepsGoal(int stepsGoal) => _localStorage
      .setInt(STEPS_GOAL_KEY, stepsGoal)
      .then((value) => _stepsGoalStreamController.add(stepsGoal))
      .then((value) => stepsGoal);

  @override
  Future<int?> getStepsGoal() async => _localStorage.getInt(STEPS_GOAL_KEY);
}
