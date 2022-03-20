import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
                const Text(
                  "FAQs",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildQuestion(
                    question: "What is the purpose of the Paddy app?",
                    answer:
                        "Paddy app is used to identify diseases associated with the leaves of the plants."),
                buildQuestion(
                    question:
                        "What platforms are supported by this mobile app?",
                    answer:
                        "Paddy mobile app is available for Android & IOS platforms."),
                buildQuestion(
                    question: "How can I get the app to my phone?",
                    answer:
                        "Android users can download the app through playstore and iphone users can download through the apple store."),
                buildQuestion(
                    question: "Is this app free of charge?",
                    answer:
                        "Yes, our mobile app is completely free to download and use."),
                buildQuestion(
                    question: "How to use this app?",
                    answer:
                        "First you must create a new account by completing the signing up process and then you can upload the photograph of the defected leaf through the gallery or directly through your mobile camera."),
                buildQuestion(
                    question: "Does this app work with all plants?",
                    answer:
                        "No, this app only works with a limited number of plants."),
                buildQuestion(
                    question: "What are plants that work with this app?",
                    answer:
                        "Paddy app works with Apple, Cherry, Corn, Grape, Orange, Peach, BellPepper, Potato, Squash, Strawberry & Tomato."),
                buildQuestion(
                    question: "What do I need in order to create an account?",
                    answer:
                        "You’ll need a phone number and an email address for the signing up process."),
                buildQuestion(
                    question: "Is it possible to use this app offline?",
                    answer:
                        "Yes, you can use Paddy app without and internet connection")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuestion({required String question, required String answer}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              answer,
              style: TextStyle(
                  fontSize: 16, color: Colors.black87.withOpacity(0.6)),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 0,
            )
          ],
        ),
      ),
    );
  }
}
