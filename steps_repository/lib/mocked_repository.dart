import 'dart:async';

import 'package:steps_repository/calories_repository.dart';
import 'package:steps_repository/steps_repository.dart';

class MockedRepository implements CaloriesRepository, StepsRepository {
  MockedRepository() {
    //MOCK CHANGES OF VALUES
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _mockedCalories += 5;
      _mockedSteps += 10;
      _mockedCaloriesStreamController.sink.add(_mockedCalories);
      _mockedStepsStreamController.sink.add(_mockedSteps);
    });
  }

  final StreamController<int> _mockedCaloriesStreamController =
      StreamController.broadcast();
  final StreamController<int> _mockedStepsStreamController =
      StreamController.broadcast();
  var _mockedCalories = 0;
  var _mockedSteps = 100;

  @override
  Stream<int> getBurnedCaloriesStream() =>
      _mockedCaloriesStreamController.stream;

  @override
  Stream<int> getStepsCountStream() => _mockedStepsStreamController.stream;

  @override
  Future<int> getBurnedCalories() => Future.value(_mockedCalories);

  @override
  Future<int> getStepsCount() => Future.value(_mockedSteps);
}
