import 'package:equatable/equatable.dart';

class TimerState extends Equatable {
  const TimerState.initial()
    : remainingSeconds = 0,
      isRunning = false,
      isCompleted = false;

  const TimerState({
    required this.remainingSeconds,
    required this.isRunning,
    required this.isCompleted,
  });

  final int remainingSeconds;
  final bool isRunning;
  final bool isCompleted;

  TimerState copyWith({
    int? remainingSeconds,
    bool? isRunning,
    bool? isCompleted,
  }) {
    return TimerState(
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isRunning: isRunning ?? this.isRunning,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [remainingSeconds, isRunning, isCompleted];
}
