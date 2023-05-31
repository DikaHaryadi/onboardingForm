import 'package:donorindonesia/pages/homepage.dart';
import 'package:donorindonesia/utility/data_pendaftaran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  // controllers page
  final PageController _controller = PageController();

  // kalo udah di akhir page atau belom
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Pendaftaran Akun',
            style: TextStyle(
                fontFamily: 'Intels',
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 16.sp)),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  // pageview nya
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          onLastPage = (index == -1);
                        });
                      },
                      children: const [
                        DataPendaftaran1(),
                        DataPendaftaran2(),
                        DataPendaftaran3()
                      ],
                    ),
                  ),
                  // dots indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // skip
                      GestureDetector(
                          onTap: () {
                            _controller.previousPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            'Before',
                            style: TextStyle(
                                color: Colors.grey
                                    .withOpacity(0.7)
                                    .withOpacity(0.7),
                                fontFamily: 'Poppins',
                                fontSize: 14.sp),
                          )),

                      // dots indicator
                      SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          onDotClicked: (index) {
                            _controller.animateToPage(index,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInBack);
                          }),

                      // next or kelar
                      onLastPage
                          ? GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return const HomePage();
                                  },
                                ));
                              },
                              child: Text(
                                'Done',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.7),
                                    fontFamily: 'Poppins',
                                    fontSize: 14.sp),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.7),
                                    fontFamily: 'Poppins',
                                    fontSize: 14.sp),
                              ))
                    ],
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
