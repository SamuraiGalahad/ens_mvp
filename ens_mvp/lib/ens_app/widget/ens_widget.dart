import 'dart:async';

import 'package:ens_mvp/ens_app/bloc/contacts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

import '../data/model/contacts_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controllerPeople, _controllerMessage;
  String? _message, body;
  List<Contacts> people = [];
  bool sendDirect = false;
  List<Contacts> contacts = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _controllerPeople = TextEditingController();
    _controllerMessage = TextEditingController();
  }

  Future<void> _sendSMS() async {
    _contactsBloc.add(AddContactsEvent(contacts: people));
    await Future.delayed(Duration(seconds: 1));
    _contactsBloc.add(SendMessageEvent());
  }

  final _contactsBloc = ContactsBloc();

  Widget _phoneTile(String name) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
                top: BorderSide(color: Colors.grey.shade300),
                left: BorderSide(color: Colors.grey.shade300),
                right: BorderSide(color: Colors.grey.shade300),
              )),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => setState(() => people.remove(name)),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    name,
                    textScaleFactor: 1,
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    //return BlocBuilder(builder: builder)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ENS'),
        ),
        body: ListView(
          children: <Widget>[
            if (people.isEmpty)
              const SizedBox(height: 0)
            else
              SizedBox(
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(people.length, (int index) {
                      return _phoneTile(people[index].address);
                    }),
                  ),
                ),
              ),
            ListTile(
              leading: const Icon(Icons.people),
              title: TextField(
                controller: _controllerPeople,
                decoration:
                const InputDecoration(labelText: 'Add Phone Number'),
                keyboardType: TextInputType.number,
                onChanged: (String value) => setState(() {}),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: _controllerPeople.text.isEmpty
                    ? null
                    : () =>
                    setState(() {
                      String message = _controllerMessage.text;
                      if (message.isEmpty) {
                        message = "0";
                      }
                      people.add(Contacts(
                          address: _controllerPeople.text.toString(),
                          command: _controllerMessage.text.toString()));
                      _controllerPeople.clear();
                    }),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.message),
              title: TextField(
                decoration: const InputDecoration(labelText: 'Add Message'),
                controller: _controllerMessage,
                onChanged: (String value) => setState(() {}),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                          (states) =>
                      Theme
                          .of(context)
                          .colorScheme
                          .secondary),
                  padding: MaterialStateProperty.resolveWith(
                          (states) => const EdgeInsets.symmetric(vertical: 16)),
                ),
                onPressed: () {
                  _send();
                },
                child: Text(
                  'SEND',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayMedium,
                ),
              ),
            ),
            Visibility(
              visible: _message != null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        _message ?? 'No Data',
                        maxLines: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _send() {
    if (people.isEmpty) {
      setState(() => _message = 'At Least 1 Person or Message Required');
    } else {
      _sendSMS();
    }
  }
}
