

abstract class ExceptionBase {
  final String code;
  final int statuesCode;
  final String message;

  ExceptionBase({
    required this.code,
    required this.statuesCode,
    required this.message,
  });
}


class StatuesCode {
  static const int unknown = 0;
  ///from  1 to 20 : for exceptions that happened local on device.
  static const int noNetwork = 1;
  ///from 20 to 30 : for firebase exceptions.
///
/// from 30 to 50 : for server exceptions.
/// from 50 to 60 : for authentication exceptions



}