import 'package:equatable/equatable.dart';

class ServerFailure extends Equatable {
  String message;

  ServerFailure(this.message);

  @override
  List<Object?> get props => [
    message,
  ];
}