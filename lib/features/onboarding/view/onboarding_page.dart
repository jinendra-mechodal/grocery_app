import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/icons/onboard_svg1.svg',
      'title': 'Smooth Interface',
      'description': 'Slide to get other feature access easily'
    },
    {
      'image': 'assets/icons/onboard_svg2.svg',
      'title': 'Calculate Everything',
      'description': 'Get perfect data with any type of EMI with just one interface'
    },
    {
      'image': 'assets/icons/onboard_svg3.svg',
      'title': 'Thank You',
      'description': 'Your one time use case also gives us hope that we can make it more accessible.\nThank you for using our application 🙏'
    },
  ];


  PageController pageController = PageController();
  int currentPage = 0;

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void navigateToLogin() {
    // Add your navigation logic here
    // Example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void nextPage() {
    if (currentPage < onboardingData.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      navigateToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              itemCount: onboardingData.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // This is for image
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child:SvgPicture.asset(onboardingData[index]['image']!,height: screenHeight * 0.46,width: screenWidth * 0.9,),
                    ),
                    SizedBox(height: 30),
                    // This is for title
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        onboardingData[index]['title']!,
                      ),
                    ),
                    // This is for description
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        onboardingData[index]['description']!,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(onboardingData.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    height: 10.0,
                    width: currentPage == index ? 10.0 : 10.0,
                    decoration: BoxDecoration(
                      color: currentPage == index ? Colors.green : Color(0xff949090),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // This Is For Button
                  if (currentPage == onboardingData.length - 1)
                    InkWell(
                      onTap: () {
                        // Get.to(Home());
                      },
                      child: Center(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), color: Colors.green),
                          child: Center(
                            child: Text(
                              "CONTINUE",
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
