import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int counterA = 0;
  int counterB = 0;
  void incrementA({required int points}) {
    counterA += points;
    emit(CounterAIncrementState());
  }

  void incrementB({required int points}) {
    counterB += points;
    emit(CounterBIncrementState());
  }

  void reset() {
    counterA = 0;
    counterB = 0;
    emit(CounterResetState());
  }
}
