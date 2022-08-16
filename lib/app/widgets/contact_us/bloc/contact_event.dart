part of 'contact_bloc.dart';

abstract class ContactEvent {}

class SendData extends ContactEvent {
  final String lastName;
  final String firstName;
  final String email;
  final String mobile;
  final String msgTitle;
  final String msgType;
  final String msgDesc;
  final String attachment;

  SendData(this.lastName, this.firstName, this.email, this.mobile,
      this.msgTitle, this.msgType, this.msgDesc, this.attachment);
}
