import 'package:black_coffer/domain/exceptions/empty_err.dart';
import 'package:black_coffer/domain/exceptions/length_err.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class PhoneNumber extends Equatable {
  final String phone;

  const PhoneNumber({
    required this.phone,
  });

  bool get validate {
    if (phone.isNotEmpty) {
      if (phone.length == 10) {
        return true;
      } else {
        throw LengthException(
            message: "Length must be 10 without Country-code");
      }
    } else {
      throw EmptyValueException(message: "Phone cann't be Empty");
    }
  }

  @override
  List<Object?> get props => [phone];
}
