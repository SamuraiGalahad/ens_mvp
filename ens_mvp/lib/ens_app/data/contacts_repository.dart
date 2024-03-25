import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'model/contacts_model.dart';

class ContactsRepository {
  static SharedPreferences? prefs;

  Future<void> addContacts(List<Contacts> contacts) async {
    prefs = await SharedPreferences.getInstance();
    List<Contacts> prev = await readContactsPrefs();

    for (Contacts newContact in contacts) {
      for (Contacts oldContacts in prev) {
        if (newContact.address == oldContacts.address) {
          oldContacts = newContact;
        }
      }
    }

    prev.addAll(contacts);

    String likedJson = jsonEncode(prev);

    await prefs!.setString('contacts', likedJson);
  }

  Future<List<Contacts>> readContactsPrefs() async {
    prefs = await SharedPreferences.getInstance();
    try {
      String? contacts = prefs?.getString('contacts');
      if (contacts != null) {
        List<dynamic> newsData = jsonDecode(contacts);
        List<Contacts> newsList =
        newsData.map((data) => Contacts.fromJson(data)).toList();
        return newsList;
      }
    } catch (error) {
      print('Error getting contacts from SharedPreferences: $error');
      return [];
    }
    return [];
  }
}