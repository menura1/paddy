import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paddy/all_screens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();

  bool last = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff39AEA9),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Flexible(
                flex: 9,
                child: Container(
                  color: const Color(0xff39AEA9),
                  child: PageView(
                    controller: controller,
                    children: [
                      page1(
                          title: "Welcome to Paddy!",
                          des:
                              "Identify leaf diseases and find remedies for them within minutes.",
                          imgPath: "images/ob1.png"),
                      page1(
                          title: "Works Offline.",
                          des:
                              "No internet? No worries. Paddy can identify leaf diseases completely offline. ",
                          imgPath: "images/ob2.png"),
                      page1(
                          title: "Broad compatibility.",
                          des:
                              "Paddy works with 25+ most common leaf diseases on more than 10 major plants. ",
                          imgPath: "images/ob3.png")
                    ],
                    onPageChanged: (index) {
                      setState(() {
                        if (index == 2) {
                          last = true;
                        } else {
                          last = false;
                        }
                      });
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: const Color(0xff39AEA9),
                    child: !last
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LogInScreen()));
                                },
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SmoothPageIndicator(
                                controller: controller,
                                count: 3,
                                effect: const ExpandingDotsEffect(
                                    dotColor: Colors.white60,
                                    activeDotColor: Colors.white,
                                    dotHeight: 10,
                                    dotWidth: 10),
                                onDotClicked: (index) {
                                  controller.animateToPage(index,
                                      duration:
                                          const Duration(microseconds: 500),
                                      curve: Curves.easeIn);
                                },
                              ),
                              InkWell(
                                  onTap: () {
                                    controller.nextPage(
                                        duration:
                                            const Duration(microseconds: 2000),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Next',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      )
                                    ],
                                  ))
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              alignment: Alignment.center,
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget page1(
      {required String title, required String des, required String imgPath}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      color: const Color(0xff39AEA9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 220, width: 220, child: Image.asset(imgPath)),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            des,
            style:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
