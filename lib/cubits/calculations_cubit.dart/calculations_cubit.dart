import 'package:expressions/expressions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/calculations_cubit.dart/calculations_cubit_states.dart';

class CalculationsCubit extends Cubit<CalculationsStates> {
  CalculationsCubit() : super(InitialState());
  String inputText = '';
  String outputText = '0';
  void addNumber({required String num}) {
    //add num
    inputText += num;
    try {
      //check if num is dot
      if (num == '.') {
        if (_isLastCharMathOperation(inputText) ||
            inputText[inputText.length - 2] == '.') {
          //if its not valid emit failed state and return
          emit(FailedState(errMsg: "bad entry"));
          return;
        } else {
          //if valid emit success state and return
          emit(SuccessState());
          return;
        }
      }
      //the num is in 0:9
      //calculate equation
      outputText = _evaluateEquation(inputText).toString();
      //emit success state
      emit(SuccessState());
    } catch (e) {
      //if any exception occured emit failed state
      emit(FailedState(errMsg: 'bad entry'));
    }
  }

  void deleteNumber() {
    //check if input text not empty
    if (inputText.isNotEmpty) {
      inputText = inputText.substring(0, inputText.length - 1);
    }
    try {
      //if input text is empty go back to initial state
      if (inputText.isEmpty) {
        outputText = '0';
        emit(InitialState());
      }
      //if last char is math operation calc equation as its not exist and emit success state
      else if (_isLastCharMathOperation(inputText)) {
        outputText =
            _evaluateEquation(inputText.substring(0, inputText.length - 1))
                .toString();
        emit(SuccessState());
      } else {
        //the last char is num so calculate expersion and emit succes state
        outputText = _evaluateEquation(inputText).toString();
        emit(SuccessState());
      }
    } catch (e) {
      //if exception occured emit failed state
      emit(FailedState(errMsg: 'bad entry'));
    }
  }

  void addOperation({required String opertion}) {
    try {
      //handle % operation
      if (opertion == '%') {
        outputText =
            _evaluateEquation((double.parse(outputText) / 100).toString())
                .toString();
        if (outputText.length > 6) {
          outputText = inputText;
          emit(FailedState(errMsg: "% no more allowed"));
          return;
        }
        inputText = outputText;
        emit(SuccessState());
        return;
      }
    } catch (e) {
      FailedState(errMsg: "% not allowed");
      return;
    }

    if (inputText.isEmpty || _isLastCharMathOperation(inputText)) {
      //if added opertion is - don't calculate and emit succes state
      if (opertion == '-') {
        inputText += opertion;
        emit(SuccessState());
        return;
      }
      //user added opertion in first or equation (except '-') ,or added operation beside opertion emit failed state
      outputText = 'bad entry';
      inputText += opertion;

      emit(FailedState(errMsg: 'bad entry'));
    } else {
      //user added opertion in valid place so emit success state
      inputText += opertion;

      emit(SuccessState());
    }
  }

// this method return back to intial state
  void clear() {
    inputText = '';
    outputText = '0';
    emit(InitialState());
  }

// if user clicked equal button this method occured and emit equal button pressed state
  void equalButton() {
    emit(EqualButtonPressedState());
  }

//this method check if last char is math operation or not
  bool _isLastCharMathOperation(String input) {
    // List of allowed mathematical operation characters
    const operations = {'+', '-', '*', '/'};

    // Get the last character of the string
    if (input.isEmpty) {
      return false;
    }
    String lastChar = input[input.length - 1];

    // Check if the last character is in the set of operations
    return operations.contains(lastChar);
  }

//this method calculate expersion
  num _evaluateEquation(String equation) {
    // Parse the expression
    final expression = Expression.parse(equation);

    // Create a context containing the variables and functions
    const evaluator = ExpressionEvaluator();

    // Evaluate the expression
    var result = evaluator.eval(expression, {});

    // Return the result as a double
    result = (result as num).toDouble();
    if (result == result.toInt()) {
      return result.toInt();
    } else {
      return result;
    }
  }
}
