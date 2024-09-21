import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DoctorProfile.dart';



void main() {
  runApp(const MaterialApp(
    home: DoctorAI(),
  ));
}

class DoctorAI extends StatefulWidget {
  const DoctorAI({super.key});

  @override
  _DoctorAIState createState() => _DoctorAIState();
}

class _DoctorAIState extends State<DoctorAI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScreenshotController screenshotController = ScreenshotController();
  bool hasBreathingProblem = false;
  bool hasFever = false;
  bool hasCold = false;
  bool hasCough = false;
  String symptomDuration = '';

  void navigateToSummaryScreen(BuildContext context, String summary) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SummaryScreen(summary: summary),
      ),
    );
  }
  void handleSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create the form data string
      String formData = '';
      if (hasBreathingProblem) {
        formData += 'Breathing Problem: Yes\n';
      } else {
        formData += 'Breathing Problem: No\n';
      }
      if (hasFever) {
        formData += 'Fever: Yes\n';
      } else {
        formData += 'Fever: No\n';
      }
      if (hasCold) {
        formData += 'Cold: Yes\n';
      } else {
        formData += 'Cold: No\n';
      }
      if (hasCough) {
        formData += 'Cough: Yes\n';
      } else {
        formData += 'Cough: No\n';
      }
      formData += 'Symptom Duration: $symptomDuration days\n';

      // Navigate to the summary screen
      navigateToSummaryScreen(context, formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Do you have any breathing problem?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: hasBreathingProblem,
                  onChanged: (value) {
                    setState(() {
                      hasBreathingProblem = value!;
                    });
                  },
                ),
                const Text(
                  'Do you have a fever?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: hasFever,
                  onChanged: (value) {
                    setState(() {
                      hasFever = value!;
                    });
                  },
                ),
                const Text(
                  'Do you have a cold?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: hasCold,
                  onChanged: (value) {
                    setState(() {
                      hasCold = value!;
                    });
                  },
                ),
                const Text(
                  'Do you have a cough?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: hasCough,
                  onChanged: (value) {
                    setState(() {
                      hasCough = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Symptom Duration (in days)',
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    symptomDuration = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the symptom duration.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    handleSubmit(context);
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 16.0),
                Screenshot(
                  controller: screenshotController,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class SummaryScreen extends StatelessWidget {
  final String summary;

  const SummaryScreen({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/pc.png',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8.0),
            const Text('Report by Chikitsak.AI'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Summary:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(summary),
            const SizedBox(height: 16.0),
            const Text(
              'Precautions:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            if (summary.contains('Fever: Yes'))
              const Text('Fever: Take prescribed medication and rest.'),
            if (summary.contains('Cold: Yes'))
              const Text('Cold: Keep yourself warm and drink plenty of fluids.'),
            if (summary.contains('Cough: Yes'))
              const Text('Cough: Cover your mouth and nose while coughing.'),
            if (summary.contains('Breathing Problem: Yes'))
              const Text('Breathing Problem: Avoid exposure to pollutants and allergens.'),
            // Add more if conditions for other symptoms and their respective precautions
            const SizedBox(height: 16.0),
            const Text(
              'Note: This report is AI-generated and should not replace professional medical advice. Please consult your doctor for proper diagnosis and treatment.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the DoctorAI screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DoctorProfile()),
                );
              },
              child: const Text('CONTACT DOCTOR'),
            ),
          ],
        ),
      ),
    );
  }
}