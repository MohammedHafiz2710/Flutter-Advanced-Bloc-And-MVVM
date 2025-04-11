part of 'counter_cubit.dart';

sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterAIncrementState extends CounterState {}

final class CounterBIncrementState extends CounterState {}

final class CounterResetState extends CounterState {}
