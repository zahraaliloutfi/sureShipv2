import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/themes/colors.dart';
import '../core/themes/text_styles.dart';
import '../core/widgets/app_text_button.dart';
import 'input_screen.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/onboarding.png'),
                  SizedBox(height: 50.h),
                  Text(
                    'Define Your Client !',
                    style: AppTextStyles.font23BlueW700,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Welcome to our app ❤️. Let us tell you more about it :',
                          style: AppTextStyles.font17BlackW500,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '• This app uses machine learning to analyze client data, predicting order cancellations and suggesting solutions to preserve revenue.',
                          style: AppTextStyles.font15GrayW400,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '• It helps in decision-making and ensures strategic choices.',
                          style: AppTextStyles.font15GrayW400,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  AppTextButton(
                    buttonText: 'Get Started',
                    borderRadius: 16.r,
                    backgroundColor: ColorsManager.blue,
                    textStyle: AppTextStyles.font15BlueW600
                        .copyWith(color: ColorsManager.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InputScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
