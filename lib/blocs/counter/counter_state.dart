part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;

  CounterState({required this.counter});

  factory CounterState.initial() {
    return CounterState(counter: 0);
  }

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}
