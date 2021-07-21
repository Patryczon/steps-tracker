import 'package:equatable/equatable.dart';

abstract class CaloriesBurntEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBurntCalories extends CaloriesBurntEvent {}

class CaloriesBurntChanged extends CaloriesBurntEvent {
  CaloriesBurntChanged(this.calories);

  final int calories;

  @override
  List<Object?> get props => [calories];
}
