part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  CounterState({this.counter = 0});

  factory CounterState.initial() {
    return CounterState();
  }

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  @override
  List<Object> get props => [counter];
}
