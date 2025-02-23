part of 'counter_bloc.dart';

class CounterState {
  int? number;
  CounterState({this.number});
}

final class CounterInitial extends CounterState {
  CounterInitial() : super(number: 0);
}
