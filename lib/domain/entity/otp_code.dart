import 'package:black_coffer/domain/exceptions/empty_err.dart';
import 'package:black_coffer/domain/exceptions/length_err.dart';
import 'package:equatable/equatable.dart';

class OtpCode extends Equatable {
  final String code;

  const OtpCode({
    required this.code,
  });

  bool get validate {
    if (code.isNotEmpty) {
      if (code.length == 6) {
        return true;
      } else {
        throw LengthException(message: "Otp must be 6 digits");
      }
    } else {
      throw EmptyValueException(message: "Otp cannot be empty");
    }
  }

  @override
  List<Object?> get props => [code];
}
