import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(number: state.number! + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterState(number: state.number! - 1));
    });
  }
}
