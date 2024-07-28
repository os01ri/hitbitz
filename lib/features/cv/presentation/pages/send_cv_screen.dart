import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/drop_down_widget.dart';
import 'package:hitbitz/core/components/text_field_widget.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/utilities/app_validator.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/cv/domain/usecases/send_cv_usecase.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/config/cubit_status.dart';
import '../bloc/cv_bloc.dart';

class SendCvScreen extends StatefulWidget {
  const SendCvScreen({super.key});

  @override
  State<SendCvScreen> createState() => _SendCvScreenState();
}

class _SendCvScreenState extends State<SendCvScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  final ValueNotifier<int?> category = ValueNotifier(null);
  final ValueNotifier<bool> categoryOrRoadmap = ValueNotifier(false);
  final ValueNotifier<int?> roadmap = ValueNotifier(null);
  var filePathController = TextEditingController();

  @override
  void initState() {
    super.initState();
    di<CvBloc>().add(GetRoadmapsForCV());
    di<CvBloc>().add(GetCategoriesForCV());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.applyForVolunteer),
        centerTitle: true,
      ),
      body: BlocListener<CvBloc, CvState>(
        bloc: di<CvBloc>(),
        listener: (context, state) {
          if (state.cvStatus == CubitStatus.loading) {
            Toaster.showLoading();
          } else {
            if (state.cvStatus == CubitStatus.failure) {
              Toaster.showError(context: context, message: AppStrings.somethingWentWrong);
            } else if (state.cvStatus == CubitStatus.success) {
              Toaster.showSuccess(context: context, message: AppStrings.formSentSuccessfully);
              context.pop();
            }
            Toaster.closeLoading();
          }
        },
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                children: [
                  50.verticalSpace,
                  TextFieldWidget(
                    controller: emailController,
                    label: AppStrings.email,
                    hint: 'youremail@example.com',
                    validator: (value) {
                      return AppValidator.email(value);
                    },
                  ),
                  20.verticalSpace,
                  TextFieldWidget(
                    controller: usernameController,
                    label: AppStrings.username,
                    hint: 'username1234',
                    validator: (p0) {
                      return AppValidator.required(p0);
                    },
                  ),
                  20.verticalSpace,
                  TextFieldWidget(
                    label: AppStrings.fullName,
                    hint: 'Osama Rida',
                    validator: (p0) {
                      return AppValidator.name(p0);
                    },
                    controller: fullNameController,
                  ),
                  20.verticalSpace,
                  ValueListenableBuilder(
                      valueListenable: categoryOrRoadmap,
                      builder: (context, value, _) {
                        return Column(
                          children: [
                            TextFieldWidget(
                              controller: filePathController,
                              enabled: false,
                              hint: AppStrings.selectCVPngFile,
                              validator: AppValidator.required,
                            ).onTap(() async {
                              ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
                                if (value != null) {
                                  filePathController.text = value.path;
                                }
                              });
                            }),
                            Row(
                              children: [
                                const Text(AppStrings.category),
                                Radio.adaptive(
                                    value: false,
                                    groupValue: value,
                                    onChanged: (c) {
                                      categoryOrRoadmap.value = c!;
                                    }),
                                const Text(AppStrings.roadmap),
                                Radio.adaptive(
                                    value: true,
                                    groupValue: value,
                                    onChanged: (c) {
                                      categoryOrRoadmap.value = c!;
                                    }),
                              ],
                            ),
                            20.verticalSpace,
                            value
                                ? BlocBuilder<CvBloc, CvState>(
                                    bloc: di<CvBloc>(),
                                    builder: (context, state) {
                                      return state.indexRoadmaps == CubitStatus.success
                                          ? DropDownWidget(
                                              listenableValue: roadmap,
                                              items: state.roadmaps.map((e) {
                                                return DropdownMenuItem(
                                                  value: e.id!,
                                                  child: Text(e.name!),
                                                );
                                              }).toList(),
                                            )
                                          : ElevatedButton(
                                              child: const Text(AppStrings.tryAgain),
                                              onPressed: () {
                                                di<CvBloc>().add(GetRoadmapsForCV());
                                              });
                                    },
                                  )
                                : BlocBuilder<CvBloc, CvState>(
                                    bloc: di<CvBloc>(),
                                    builder: (context, state) {
                                      return state.indexCategories == CubitStatus.success
                                          ? DropDownWidget(
                                              listenableValue: category,
                                              items: state.categories.map((e) {
                                                return DropdownMenuItem(
                                                  value: e.id!,
                                                  child: Text(
                                                    e.name!,
                                                  ),
                                                );
                                              }).toList(),
                                            )
                                          : ElevatedButton(
                                              child: const Text(AppStrings.tryAgain),
                                              onPressed: () {
                                                di<CvBloc>().add(GetCategoriesForCV());
                                              });
                                    },
                                  ),
                            20.verticalSpace,
                            ButtonWidget(
                              width: 1.sw,
                              text: AppStrings.send,
                              backgroundColor: context.colorScheme.primary,
                              foregroundColor: context.colorScheme.onPrimary,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  di<CvBloc>().add(SendCvEvent(
                                      params: SendCvParams(
                                    email: emailController.text,
                                    username: usernameController.text,
                                    fullName: fullNameController.text,
                                    cv: File(filePathController.text),
                                    categoryId: category.value,
                                    roadmapId: roadmap.value,
                                  )));
                                } else {
                                  Toaster.showWarning(context: context, warningMessage: AppStrings.pleaseCheckAllRequiredFields);
                                }
                              },
                            )
                          ],
                        );
                      }),
                ],
              ),
            )),
      ),
    );
  }
}
