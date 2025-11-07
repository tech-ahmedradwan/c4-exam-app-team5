import '../../core/errors/failure.dart';

sealed class BaseResponse<T> {
  const BaseResponse();
  R when<R>({
    required R Function(T data) onSuccess,
    required R Function(Failure failure) onError,
  }) {
    return switch (this) {
      SuccessResponse(data: final d) => onSuccess(d),
      ErrorResponse(failure: final f) => onError(f),
    };
  }
}

class SuccessResponse<T> extends BaseResponse<T> {
  const SuccessResponse(this.data);
  final T data;
}

class ErrorResponse<T> extends BaseResponse<T> {
  const ErrorResponse(this.failure);
  final Failure failure;
}
