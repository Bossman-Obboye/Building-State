import 'package:flutter/material.dart';

class StateMan extends StatefulWidget {
  const StateMan({super.key});

  @override
  State<StateMan> createState() => _StateManState();
}

final ageController = TextEditingController();
String eligibilityNote = 'You are.....';
const String qualified = 'You are eligible to register';
const String notQualified = 'You are not eligible to register';
bool eligibility = false;
final _formKey = GlobalKey<FormState>();

class _StateManState extends State<StateMan> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eligibility Test'),
        backgroundColor: Colors.blue[500],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.06,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: eligibility ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.contains(RegExp(r'[^0-9]'))) {
                    return 'Invalid input, Please check';
                  } else if (value.isEmpty) {
                    return 'This field can\' be empty!';
                  } else {
                    return null;
                  }
                },
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: "Enter your age",
                  hintText: '32',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(Colors.blue[500]),
                fixedSize: MaterialStateProperty.all(
                  Size(size.width * 0.35, size.height * 0.06),
                ),
              ),
              onPressed: () {
                String age = ageController.text;
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    switch (int.parse(age)) {
                      case < 16:
                        eligibilityNote = notQualified;
                        eligibility = false;
                        break;
                      case >= 16:
                        eligibilityNote = qualified;
                        eligibility = true;
                        break;
                      default:
                        {/*Do Nothing*/}
                    }
                  }
                });
              },
              child: const Text(
                "Check",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              eligibilityNote,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        )),
      ),
    );
  }
}
