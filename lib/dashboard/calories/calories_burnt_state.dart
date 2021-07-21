import 'package:equatable/equatable.dart';

abstract class CaloriesBurntState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CaloriesBurntDataNotLoaded extends CaloriesBurntState {}

class CaloriesBurntDataLoaded extends CaloriesBurntState {
  CaloriesBurntDataLoaded(this.caloriesBurnt);

  final int caloriesBurnt;

  @override
  int get hashCode => caloriesBurnt;

  @override
  bool operator ==(Object other) {
    return hashCode == other.hashCode;
  }
}
