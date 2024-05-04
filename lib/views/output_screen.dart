import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/cubit/check_cancellation_cubit.dart';
import '../core/cubit/check_cancellation_state.dart';
import '../core/themes/colors.dart';
import '../core/themes/text_styles.dart';
import '../core/widgets/app_text_button.dart';
import 'input_screen.dart';

class OutputScreen extends StatelessWidget {
   OutputScreen({super.key});

   final bool iscancelled =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Results")),
      body: BlocBuilder<CheckCancellationCubit, CheckCancellationStates>(
        builder: (context, state) {
          if (state is CheckCancellatioLoading) {
            return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.blue,
                ));
          } else if (state is CheckCancellatioError) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else if (state is CheckCancellatioSuccess) {

            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Results :',
                        style: AppTextStyles.font15BlueW600.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20.h),

                      iscancelled
                          ? const WillBeCancelled()
                          : const WillNotBeCancelled(),
                      SizedBox(height: 70.h),
                      AppTextButton(
                          buttonText: 'Back to previous screen',
                          textStyle: AppTextStyles.font15BlueW600
                              .copyWith(color: ColorsManager.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  InputScreen()),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

// ***************************************************************************************************************
class WillNotBeCancelled extends StatelessWidget {
  const WillNotBeCancelled({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Your client is unlikely to cancel this order ✅',
            style: AppTextStyles.font11RedW600
                .copyWith(fontSize: 14.sp, color: Colors.green)),
        SizedBox(height: 20.h),
        Text(
          'Follow these steps to make a good impression and protect your rights while building a great client relationship : ',
          style: AppTextStyles.font15BlueW600
              .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 15.h),
        Text(
          '• Offer exclusive discounts or special pricing for loyal clients, such as dedicated discounts, happy hour pricing, or tailored promotions.',
          style: AppTextStyles.font15GrayW400.copyWith(fontSize: 13.sp),
        ),
        SizedBox(height: 10.h),
        Text(
          '• Provide enhanced services for clients, such as free delivery or priority pick-up. This can be particularly valuable for clients who frequently order takeout or delivery.',
          style: AppTextStyles.font15GrayW400.copyWith(fontSize: 13.sp),
        ),
        SizedBox(height: 10.h),
        Text(
          '• Send personalized thank you notes or small tokens of appreciation to loyal clients. This gesture shows that you value their support and goes a long way in building strong relationships.',
          style: AppTextStyles.font15GrayW400.copyWith(fontSize: 13.sp),
        ),
        SizedBox(height: 10.h),
        Text(
          '• Offer incentives to loyal clients to provide feedback or complete surveys, demonstrating value for their opinions and valuable insights.',
          style: AppTextStyles.font15GrayW400.copyWith(fontSize: 13.sp),
        ),
      ],
    );
  }
}

// ***************************************************************************************************************
class WillBeCancelled extends StatelessWidget {
  const WillBeCancelled({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Your client is likely to cancel this order ❗️',
            style: AppTextStyles.font11RedW600.copyWith(fontSize: 14.sp)),
        SizedBox(height: 20.h),
        Text(
          'Here are some steps you can take to preserve your rights and limit losses if the client cancels the order :',
          style: AppTextStyles.font15BlueW600
              .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 15.h),
        Text(
          '• Ensure clear cancellation and refund policies are in place, clearly outlining any penalties or charges.',
          style: AppTextStyles.font15GrayW400.copyWith(fontSize: 13.sp),
        ),
        SizedBox(height: 10.h),
        Text(
          '• Implementing a waiting list or requiring prepayment can reduce the likelihood of last-minute cancellations and ensure customer commitment.',
          style: AppTextStyles.font15GrayW400.copyWith(fontSize: 13.sp),
        ),
        SizedBox(height: 10.h),
        Text(
          '• Maintain open communication with clients who cancel orders to address concerns and maintain a positive customer relationship. If early cancellations occur, consider reselling or repurposing items.',
          style: AppTextStyles.font15GrayW400.copyWith(fontSize: 13.sp),
        ),
        SizedBox(height: 10.h),
        Text(
          '• If cancellations occur early, explore reselling or repurposing the items to minimize waste and financial loss. ',
          style: AppTextStyles.font15GrayW400.copyWith(fontSize: 13.sp),
        ),
      ],
    );
  }
}