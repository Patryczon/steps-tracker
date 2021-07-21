library steps_repository;

export 'calories_repository.dart';
export 'dependency_register.dart';
export 'goal/steps_goal_repository.dart';
export 'steps_repository.dart';

abstract class StepsRepository {
  Stream<int> getStepsCountStream();
  Future<int> getStepsCount();
}
