import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:steps_repository/goal/steps_goal_repository.dart';
import 'package:superloop/goal_update/input/goal_input_cubit.dart';
import 'package:superloop/goal_update/update/goal_update_bloc.dart';

import 'update/goal_update_event.dart';

class GoalUpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(24),
        child: SafeArea(
          bottom: true,
          top: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => GetIt.instance
                      .get<GoalUpdateBloc>()
                      .add(CloseGoalUpdate()),
                  child: Text(
                    'Close',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Enter your daily step goal',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  controller: TextEditingController(
                      text: GetIt.instance
                          .get<GoalInputCubit>()
                          .state
                          .toString()),
                  textAlign: TextAlign.center,
                  onChanged: (value) => GetIt.instance
                      .get<GoalInputCubit>()
                      .emit(int.tryParse(value) ??
                          StepsGoalRepository.defaultStepsCount),
                  textInputAction: TextInputAction.done,
                  style: Theme.of(context).textTheme.headline2,
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: false,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              TextButton(
                  onPressed: () => GetIt.instance.get<GoalUpdateBloc>().add(
                      UpdateGoal(GetIt.instance.get<GoalInputCubit>().state)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 64),
                    child: Text('Save',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white, fontSize: 20)),
                  ))
            ],
          ),
        ),
      );
}
