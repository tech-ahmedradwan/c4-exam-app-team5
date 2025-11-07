import 'package:equatable/equatable.dart';

class BaseState<T> extends Equatable {
  const BaseState({this.isLoading = false, this.errorMessage, this.data});
  final bool isLoading;
  final String? errorMessage;
  final T? data;

  bool get hasError => errorMessage != null;
  bool get hasData => data != null;

  BaseState<T> copyWith({bool? isLoading, String? errorMessage, T? data}) {
    return BaseState<T>(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }

  BaseState<T> clearError() {
    return BaseState<T>(isLoading: isLoading, errorMessage: null, data: data);
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, data];
}

// enum Status { success, loading, initial, error }

// class BaseState<T> extends Equatable {
//   // loading
//   const BaseState.loading()
//     : status = Status.loading,
//       data = null,
//       exception = null;

//   // success
//   const BaseState.success({this.data})
//     : status = Status.success,
//       exception = null;

//   // error
//   const BaseState.error({this.data, this.exception}) : status = Status.error;

//   // initial
//   const BaseState.initial()
//     : status = Status.initial,
//       data = null,
//       exception = null;

//   final Status status;
//   final T? data;
//   final Exception? exception;

//   @override
//   List<Object?> get props => [status, data, exception];
// }
