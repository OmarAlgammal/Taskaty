import 'package:equatable/equatable.dart';

class ServerMessageModel extends Equatable {
  int? status;
  String message;

  ServerMessageModel({this.status, required this.message});

  factory ServerMessageModel.fromJson(Map<String, dynamic> map) =>
      ServerMessageModel(
        status: map['status'],
        message: map['message'],
      );

  @override
  List<Object?> get props => [
    status,
    message,
  ];
}