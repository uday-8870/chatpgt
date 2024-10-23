import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'conversation_provider.dart';

void showProxyDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String newProxy = 'your proxy';
      return AlertDialog(
        title: const Text('Proxy Setting'),
        content: TextField(
          // display the current name of the conversation
          decoration: InputDecoration(
            hintText: Provider.of<ConversationProvider>(context).yourproxy,
          ),
          onChanged: (value) {
            newProxy = value;
          },
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(
                color: Color(0xff55bb8e),
              ),
            ),
            onPressed: () {
              if (newProxy == '') {
                Navigator.pop(context);
                return;
              }
              Provider.of<ConversationProvider>(context, listen: false).yourproxy = newProxy;
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

void showRenameDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String newName = ''; // Replace with your actual API key
      return AlertDialog(
        title: const Text('Rename Conversation'),
        content: TextField(
          // display the current name of the conversation
          decoration: InputDecoration(
            hintText: newName,
          ),
          onChanged: (value) {
            newName = value;
          },
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(
                color: Color(0xff55bb8e),
              ),
            ),
            onPressed: () {
              if (newName == '') {
                Navigator.pop(context);
                return;
              }
              Provider.of<ConversationProvider>(context, listen: false).renameConversation(newName);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}