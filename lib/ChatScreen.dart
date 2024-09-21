import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

// void main() {
//   runApp(const ChatApp());
// }
//
// class ChatApp extends StatelessWidget {
//   const ChatApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chikitsak.AI',
//       home: ChatScreen(),
//     );
//   }
// }

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [];

  void _handleSubmitted(String text) async {
    _textController.clear();
    setState(() {
      _messages.insert(0, ChatMessage(text: text, isUserMessage: true));
    });

    final botResponse = await getBotResponse(text);

    if (botResponse != null) {
      setState(() {
        _messages.insert(
            0, ChatMessage(text: botResponse, isUserMessage: false));
      });
    } else {
      // Handle error or display a message indicating no response
    }
  }

  Future<String?> getBotResponse(String message) async {
    message = message.toLowerCase();

    if (message.contains('hello') ||
        message.contains('hi') ||
        message.contains('hey')) {
      return 'Hello! Chikitsak here';
    } else if (message.contains('how are you')) {
      return 'I\'m an AI assistant, so I don\'t have feelings, but thank you for asking!';
    } else if (message.contains('who are you')) {
      return 'I\'m a AI which will guide you regarding your health';
    } else if (message.contains('what can you do')) {
      return 'I can provide information and answer questions on various medical topics. Feel free to ask me anything!';
    } else {
      return getApiResponse(message);
    }
    return null;
  }

  Future<String?> getApiResponse(String message) async {
    final Dio dio = Dio();
    try {
      final response =
          await dio.get('http://localhost:8000/?question=$message');
      return response.data;
    } on DioException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chikitsak.AI'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
              // itemBuilder: (, index) => _messages[index],
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: IconTheme(
              data: const IconThemeData(color: Color(0xFF07f3de)),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        // onSubmitted: _handleSubmitted,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Type something...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () =>
                          _handleSubmitted(_textController.text.trim()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({super.key, required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: isUserMessage
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            isUserMessage ? 'You' : 'CA',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(text),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16.0),
                        child: CircleAvatar(
                          child: Text(isUserMessage ? 'You' : 'CA'),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: CircleAvatar(
                          child: Text(isUserMessage ? 'You' : 'CA'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            isUserMessage ? 'You' : 'CA',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(text),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
//,overflow: TextOverflow.ellipsis,maxLines: 5,r
