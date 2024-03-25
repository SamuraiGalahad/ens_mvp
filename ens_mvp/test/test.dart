import 'package:ens_mvp/ens_app/data/ssh_sender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test SSH", () async {
    SSHModule module = SSHModule(
    );
    module.sendRequest('echo "this is a line" > file.txt');
  });

}