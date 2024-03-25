part of 'contacts_bloc.dart';

@immutable
abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsSendState extends ContactsState {
  final String result;

  ContactsSendState(this.result);
}

