class CalculationsStates {}

class InitialState extends CalculationsStates {}

class SuccessState extends CalculationsStates {}

class FailedState extends CalculationsStates {
  final String errMsg;

  FailedState({required this.errMsg});
}

class EqualButtonPressedState extends CalculationsStates {}
