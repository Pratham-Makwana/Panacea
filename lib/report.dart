import 'package:cikitsakai/summar.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCQ Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MCQPage(),
    );
  }
}

class MCQPage extends StatefulWidget {
  const MCQPage({super.key});

  @override
  _MCQPageState createState() => _MCQPageState();
}

class _MCQPageState extends State<MCQPage> {
  bool? fever;
  bool? cold;
  bool? cough;
  bool? bodyPain;
  String? symptomDuration;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MCQ Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Do you have fever?',
              style: TextStyle(fontSize: 16.0),
            ),
            CheckboxListTile(
              title: const Text('Yes'),
              value: fever ?? false,
              tristate: false,
              onChanged: (value) {
                setState(() {
                  fever = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('No'),
              value: fever == false,
              tristate: false,
              onChanged: (value) {
                setState(() {
                  fever = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Do you have cold?',
              style: TextStyle(fontSize: 16.0),
            ),
            CheckboxListTile(
              title: const Text('Yes'),
              value: cold,
              onChanged: (value) {
                setState(() {
                  cold = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('No'),
              value: !cold!,
              onChanged: (value) {
                setState(() {
                  cold = !value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Do you have cough?',
              style: TextStyle(fontSize: 16.0),
            ),
            CheckboxListTile(
              title: const Text('Yes'),
              value: cough,
              onChanged: (value) {
                setState(() {
                  cough = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('No'),
              value: !cough!,
              onChanged: (value) {
                setState(() {
                  cough = !value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Do you have body pain?',
              style: TextStyle(fontSize: 16.0),
            ),
            CheckboxListTile(
              title: const Text('Yes'),
              value: bodyPain,
              onChanged: (value) {
                setState(() {
                  bodyPain = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('No'),
              value: !bodyPain!,
              onChanged: (value) {
                setState(() {
                  bodyPain = !value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'From how many days do you have these symptoms?',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  symptomDuration = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                submitAnswers(context);
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void submitAnswers(BuildContext context) {
    var answers = <String>[];
    answers.add('Do you have fever? ${fever == true ? 'fever' : 'No'}');
    answers.add('Do you have cold? ${cold == true ? 'cold' : 'No'}');
    answers.add('Do you have cough? ${cough == true ? 'cough' : 'No'}');
    answers.add(
        'Do you have body pain? ${bodyPain == true ? 'bodypain' : 'No'}');
    answers.add('From how many days do you have these symptoms? ${symptomDuration ?? ''}');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SummaryPage(answers: answers),
      ),
    );
  }
}