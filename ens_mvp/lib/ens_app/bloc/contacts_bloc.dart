import 'package:bloc/bloc.dart';
import 'package:ens_mvp/ens_app/data/contacts_repository.dart';
import 'package:ens_mvp/ens_app/data/sms_sender.dart';
import 'package:ens_mvp/ens_app/data/ssh_sender.dart';
import 'package:ens_mvp/ens_app/data/telegram_sender.dart';
import 'package:meta/meta.dart';

import '../data/model/contacts_model.dart';

part 'contacts_event.dart';

part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  SMSModule smsModule = SMSModule();
  SSHModule sshModule = SSHModule();
  TelegramModule telegramModule = TelegramModule();
  ContactsRepository contactsRepository = ContactsRepository();

  ContactsBloc() : super(ContactsInitial()) {
    on<SendMessageEvent>((event, emit) async {
      print("Here");
      List<Contacts> contacts = await contactsRepository.readContactsPrefs();

      String resultString = "";

      for (Contacts contact in contacts) {
        try {
          if ((contact.address.startsWith("+7") ||
                  contact.address.startsWith("8")) &&
              contact.address.length == 11) {
            String message = contact.command;
            if (contact.command.isEmpty) {
              message = "Zero message";
            }
            smsModule.sendsSMS(
                message: message,
                recipients: [contact.address],
                sendDirect: true);
          } else if ((contact.address.contains("@"))) {
            final splitted = contact.address.split("@");

            String login = splitted[0];

            String address = splitted[1];

            String password = "sshPassword";

            sshModule.sendRequest(login, password, address, contact.command);
          } else {
            telegramModule.sendRequest(contact.address, contact.command);
          }
        } catch (e) {
          resultString += e.toString();
        }
      }

      emit(ContactsSendState(resultString));
    });
    on<AddContactsEvent>((event, emit) async {
      await contactsRepository.addContacts(event.contacts);
    });
  }
}
