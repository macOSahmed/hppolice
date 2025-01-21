import 'package:flutter/material.dart';
import 'package:himcops/layout/backgroundlayout.dart';
import 'package:himcops/layout/buttonstyle.dart';
import 'package:himcops/layout/formlayout.dart';
import 'package:himcops/layout/headingstyle.dart';

class PoliceForgetPasswordPage extends StatefulWidget {
  const PoliceForgetPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PoliceForgetPasswordPageState createState() =>
      _PoliceForgetPasswordPageState();
}

class _PoliceForgetPasswordPageState extends State<PoliceForgetPasswordPage> {
  final TextEditingController loginIdController = TextEditingController();
  final TextEditingController securityQuestionOneController =
      TextEditingController();
  final TextEditingController securityAnswerOneController =
      TextEditingController();
  final TextEditingController securityQuestionTwoController =
      TextEditingController();
  final TextEditingController securityAnswerTwoController =
      TextEditingController();
  //final _formKey = GlobalKey<FormState>();

  void validateLogin() {
    String loginId = loginIdController.text;
    String securityQuestionOne = securityQuestionOneController.text;
    String securityAnswerOne = securityAnswerOneController.text;
    String securityQuestionTwo = securityQuestionTwoController.text;
    String securityAnswerTwo = securityAnswerTwoController.text;

    if (loginId.isEmpty || loginId.length >= 20) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid Login ID/Username'),
        ),
      );
      return;
    }

    if (securityQuestionOne.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid question'),
        ),
      );
      return;
    }

    if (securityAnswerOne.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid answer'),
        ),
      );
      return;
    }

    if (securityQuestionTwo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid question'),
        ),
      );
      return;
    }

    if (securityAnswerTwo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid answer'),
        ),
      );
      return;
    }
    Navigator.pushNamed(context, 'forgetpassword/presetpassword');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // if need background images or color

          const BackgroundPage(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset/images/hp_logo.png',
                    height: 150,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Himachal Pradesh',
                    style: AppTextStyles.headingStyle
                  ),
                  const Text(
                    'Police Service',
                    style: AppTextStyles.headingStyle
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: myBoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              'Forget Password',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: loginIdController,
                              decoration: InputDecoration(
                                labelText: 'Login Id/Username',
                                prefixIcon: const Icon(Icons.login),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: securityQuestionOneController,
                              decoration: InputDecoration(
                                labelText: 'Secuirity Question1',
                                prefixIcon: const Icon(Icons.question_mark),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: securityAnswerOneController,
                              decoration: InputDecoration(
                                labelText: 'Security Answer1',
                                prefixIcon: const Icon(Icons.question_answer),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            //need to be dropdown
                            TextField(
                              controller: securityQuestionTwoController,
                              decoration: InputDecoration(
                                labelText: 'Secuirity Question2',
                                prefixIcon: const Icon(Icons.question_mark),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: securityAnswerTwoController,
                              decoration: InputDecoration(
                                labelText: 'Secuirity Answer2',
                                prefixIcon: const Icon(Icons.question_answer),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: validateLogin,
                              style: AppButtonStyles.elevatedButtonStyle,
                              child: const Text(
                                'NEXT',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
