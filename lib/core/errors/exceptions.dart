import '../network/server_message_model.dart';

class ServerException implements Exception{

  ServerMessageModel serverMessageModel;

  ServerException(this.serverMessageModel);

}