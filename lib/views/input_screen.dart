import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/cubit/check_cancellation_cubit.dart';
import '../core/themes/colors.dart';
import '../core/themes/text_styles.dart';
import '../core/widgets/app_drop_down_button.dart';
import '../core/widgets/app_text_button.dart';
import '../core/widgets/app_text_field.dart';
import 'output_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});
  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late String gender;
  late String maritalStatus;
  String? occupation;
  String? monthlyIncome;
  String? educationalQualification;
  final ageController = TextEditingController();
  final familySizeController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final pinCodeController = TextEditingController();
  final feedbackController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final Uri _url =
      Uri.parse('https://www.latlong.net/convert-address-to-lat-long.html');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Info'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gender :',
                                style: AppTextStyles.font15BlueW600),
                            SizedBox(height: 10.h),
                            AppDropDownButton(
                              items: const ['Male', 'Female'],
                              selectedItem: 'Male',
                              onItemSelected: (value) {
                                gender = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Marital Status :',
                                style: AppTextStyles.font15BlueW600),
                            SizedBox(height: 10.h),
                            AppDropDownButton(
                              items: const [
                                'Single',
                                'Married',
                                'Prefer not to say'
                              ],
                              selectedItem: 'Single',
                              onItemSelected: (value) {
                                maritalStatus = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text('Occupation :', style: AppTextStyles.font15BlueW600),
                  SizedBox(height: 10.h),
                  AppDropDownButton(
                      items: const [
                        'Employee',
                        'Student',
                        'House wife',
                        'Self Employeed',
                      ],
                      selectedItem: 'Select one',
                      onItemSelected: (value) {
                        occupation = value;
                      }),
                  SizedBox(height: 15.h),
                  Text('Monthly Income :', style: AppTextStyles.font15BlueW600),
                  SizedBox(height: 10.h),
                  AppDropDownButton(
                      items: const [
                        'No Income',
                        'Below Rs.10000',
                        '10001 to 25000',
                        '25001 to 50000',
                        'More than 50000',
                      ],
                      selectedItem: 'Select one',
                      onItemSelected: (value) {
                        monthlyIncome = value;
                      }),
                  SizedBox(height: 15.h),
                  Text('Educational Qualifications :',
                      style: AppTextStyles.font15BlueW600),
                  SizedBox(height: 10.h),
                  AppDropDownButton(
                      items: const [
                        'Uneducated',
                        'School',
                        'Post Graduate',
                        'Graduate',
                        'Ph.D',
                      ],
                      selectedItem: 'Select one',
                      onItemSelected: (value) {
                        educationalQualification = value;
                      }),
                  SizedBox(height: 15.h),
                  Text('Feedback :', style: AppTextStyles.font15BlueW600,),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '• This refers to your clients\' feedback on your organisation.\n• Preferly to write Postive or Negative.',
                    style: AppTextStyles.font15GrayW400.copyWith(
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppTextFormField(
                    onChanged: (value) {
                      setState(() {
                        feedbackController.text = value;
                      });
                    },
                    textInputType: TextInputType.text,
                    controller: feedbackController,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Text('Age :', style: AppTextStyles.font15BlueW600),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: AppTextFormField(
                                textInputType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    ageController.text = value;
                                  });
                                },
                                controller: ageController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Text('Family Size :',
                                style: AppTextStyles.font15BlueW600),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: AppTextFormField(
                                textInputType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    familySizeController.text = value;
                                  });
                                },
                                controller: familySizeController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Text('Latitude :',
                                style: AppTextStyles.font15BlueW600),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: AppTextFormField(
                                textInputType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    latitudeController.text = value;
                                  });
                                },
                                controller: latitudeController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Text('Longitude :',
                                style: AppTextStyles.font15BlueW600),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: AppTextFormField(
                                textInputType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    longitudeController.text = value;
                                  });
                                },
                                controller: longitudeController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '• If you have an address,find long & lat from here :',
                        style: AppTextStyles.font15GrayW400.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                      InkWell(
                        onTap: _launchUrl,
                        child: Text(
                          ' Click Here',
                          style: AppTextStyles.font11RedW600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Text('Postal Code :',
                          style: AppTextStyles.font15BlueW600),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: AppTextFormField(
                          textInputType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              pinCodeController.text = value;
                            });
                          },
                          controller: pinCodeController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  AppTextButton(
                    buttonText: 'Submit',
                    textStyle: AppTextStyles.font15BlueW600
                        .copyWith(color: ColorsManager.white),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final cubit =
                            BlocProvider.of<CheckCancellationCubit>(context);
                        cubit.postData(
                          age: int.parse(ageController.text),
                          gender: gender,
                          educationalQualification: educationalQualification,
                          familySize: int.parse(familySizeController.text),
                          monthlyIncome: monthlyIncome,
                          occupation: occupation,
                          maritalStatus: maritalStatus,
                          latitude: double.parse(latitudeController.text),
                          longitude: double.parse(longitudeController.text),
                          pinCode: int.parse(pinCodeController.text),
                          feedback: feedbackController.text,
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>  OutputScreen(),
                          ),
                        );
                      }
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
