part of 'contacts_bloc.dart';

@immutable
sealed class ContactsEvent {}

final class AddContactsEvent extends ContactsEvent {
  final List<Contacts> contacts;
  AddContactsEvent({required this.contacts});
}

final class LoadContactsEvent extends ContactsEvent {}

final class SendMessageEvent extends ContactsEvent {}
