abstract class StepsGoalRepository {
  static const int defaultStepsCount = 10000;

  Stream<int?> getStepsGoalStream();
  Future<int?> getStepsGoal();

  Future<int> updateStepsGoal(int stepsGoal);
}
