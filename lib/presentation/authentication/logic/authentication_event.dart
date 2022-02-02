part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class SendOtpEvent extends AuthenticationEvent {
  final PhoneNumber phoneNumber;

  const SendOtpEvent({
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [phoneNumber];
}

class ReSendOtpEvent extends AuthenticationEvent {
  final PhoneNumber phoneNumber;

  const ReSendOtpEvent({
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [phoneNumber];
}

class VerifyOtpEvent extends AuthenticationEvent {
  final OtpCode otpCode;
  final String verificationId;

  const VerifyOtpEvent({
    required this.verificationId,
    required this.otpCode,
  });

  @override
  List<Object?> get props => [otpCode, verificationId];
}

class OtpSentEvent extends AuthenticationEvent {
  final String verificationId;

  const OtpSentEvent({required this.verificationId});

  @override
  List<Object?> get props => [verificationId];
}

class OtpVerifyingEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class ExceptionEvent extends AuthenticationEvent {
  final Exception exception;

  const ExceptionEvent({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class PhoneCodeAutoRetrievalTimeoutEvent extends AuthenticationEvent {
  final String verificationId;

  const PhoneCodeAutoRetrievalTimeoutEvent({required this.verificationId});

  @override
  List<Object?> get props => [verificationId];
}
