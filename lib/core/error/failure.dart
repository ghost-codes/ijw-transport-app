import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  const Failure([this.properties = const []]);
  final List properties;

  @override
  List<Object> get props => [properties];
}

class OperationFailure extends Failure {

  OperationFailure({
    this.message = 'Operation Failure',
    this.wrapped,
    this.response,
  }) : super([message, wrapped, response]);
  final String message;
  final Object? wrapped;

  final Object? response;

  @override
  String toString() => "${wrapped != null ? 'wrapped($wrapped)->' : ''}msg($message)";
}

class UnknownOperationFailure extends OperationFailure {
  UnknownOperationFailure(wrapped) : super(message: 'Something went wrong', wrapped: wrapped);
}

class ServerOperationFailure extends OperationFailure {
  ServerOperationFailure({
    message = 'Server Failure',
    wrapped,
    response,
  }) : super(message: message, wrapped: wrapped, response: response);
}

class CacheOperationFailure extends OperationFailure {
  CacheOperationFailure({message = 'Cache Failure', wrapped})
      : super(message: message, wrapped: wrapped);
}
