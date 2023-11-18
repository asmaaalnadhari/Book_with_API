import 'package:dio/dio.dart';

abstract class Failure{
  final String errorMessage;

 const Failure(this.errorMessage);
}
class ServerFailure extends Failure{
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!,dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.unknown:
        if(dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');

      default:
        return ServerFailure('OOps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode , dynamic response){
    if(statusCode==400 || statusCode ==401 ||statusCode==403)
    {
      return ServerFailure(response['error']['message']);
    }
    else  if(statusCode==400) {
      return ServerFailure('Your request not found');
    }

    else  if(statusCode==500) {
      return ServerFailure('Internet Server error,please try later');
    }
    else
      {
    return ServerFailure('Oops,Theres was an error');
      }
  }
}