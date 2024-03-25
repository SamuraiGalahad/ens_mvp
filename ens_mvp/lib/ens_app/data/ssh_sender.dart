import 'package:dartssh2/dartssh2.dart';

class SSHModule {
  void sendRequest(String username, String pass, String address,
      String executionCommand) async {
    try {
      final client = SSHClient(
        await SSHSocket.connect(address, 22),
        username: username,
        onPasswordRequest: () => pass,
      );

      final uptime = await client.run(executionCommand);

      print(uptime);

      client.close();
    } catch (e) {
      print(e);
    }
  }
}
