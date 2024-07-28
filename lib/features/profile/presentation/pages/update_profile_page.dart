import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/drop_down_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/data/models/media_model.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/time_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/utilities/app_validator.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:hitbitz/features/cv/presentation/bloc/cv_bloc.dart';
import 'package:hitbitz/features/media_service/presentation/widgets/image_setter_form.dart';
import 'package:hitbitz/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:hitbitz/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hitbitz/router/app_routes.dart';

class UpdateProfileArgs {
  final String? fullName;
  final DateTime? birthDate;
  final int? categoryId;
  final MediaModel? image;

  const UpdateProfileArgs({
    this.fullName,
    this.birthDate,
    this.categoryId,
    this.image,
  });
}

class UpdateProfilePage extends StatefulWidget {
  final UpdateProfileArgs args;

  const UpdateProfilePage({super.key, required this.args});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  late final ValueNotifier<File?> _listenableImage;
  late final TextEditingController _fullNameController;
  late final TextEditingController _birthDateController;
  late final ValueNotifier<int?> _category;

  late DateTime? _selectedDate;
  String? _imageName;

  late final ProfileCubit _cubit;

  @override
  void initState() {
    _listenableImage = ValueNotifier(null);
    _fullNameController = TextEditingController(text: widget.args.fullName);
    _birthDateController = TextEditingController(text: widget.args.birthDate?.formatDate());
    _selectedDate = null;
    _cubit = di<ProfileCubit>();
    di<CvBloc>().add(GetCategoriesForCV());
    _category = ValueNotifier(null);

    super.initState();
  }

  @override
  void dispose() {
    _listenableImage.dispose();
    _fullNameController.dispose();
    _birthDateController.dispose();
    _category.dispose();
    // _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: _listener,
        child: Form(
          child: Scaffold(
            appBar: AppBar(title: const TextWidget(AppStrings.updateProfile)),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: ImageSetterForm(
                      title: AppStrings.pickImage,
                      cropperRatio: CropperRatio.square,
                      mediaModelNotifier: ValueNotifier(widget.args.image),
                      onPickingFinished: (p0) => _listenableImage.value = p0,
                      onRemove: () => _listenableImage.value = null,
                      onSuccess: (name) => _imageName = name,
                    ),
                  ),
                  const Gap(20),
                  AuthTextField(
                    label: AppStrings.fullName,
                    textInputType: TextInputType.name,
                    prefixIcon: const FaIcon(FontAwesomeIcons.user),
                    controller: _fullNameController,
                    validator: AppValidator.name,
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate ?? DateTime(2014),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2014),
                      );

                      if (newDate == null) return;
                      setState(() {
                        _selectedDate = newDate;
                        _birthDateController.text = newDate.toIso8601String().substring(0, 10);
                      });
                    },
                    child: AuthTextField(
                      label: AppStrings.dateOfBirth,
                      controller: _birthDateController,
                      enabled: false,
                      prefixIcon: const FaIcon(FontAwesomeIcons.calendar),
                      validator: AppValidator.required,
                    ),
                  ),
                  const Gap(10),
                  BlocProvider.value(
                    value: di<CvBloc>(),
                    child: BlocBuilder<CvBloc, CvState>(
                      bloc: di<CvBloc>(),
                      builder: (context, state) {
                        return state.indexCategories == CubitStatus.success
                            ? DropDownWidget(
                                label: 'Select Your Preferred Category/Major',
                                listenableValue: _category,
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
                                child: const Text('Try Again'),
                                onPressed: () {
                                  di<CvBloc>().add(GetCategoriesForCV());
                                });
                      },
                    ),
                  ),
                ],
              ).wrapPadding(AppPadding.pagePadding),
            ),
            bottomNavigationBar: Builder(
              builder: (context) => ButtonWidget(
                width: context.width,
                onPressed: () {
                  if (Form.of(context).validate()) {
                    _cubit.updateProfile(UpdateProfileParams(
                      fullName: _fullNameController.text,
                      birthDate: _selectedDate,
                      profileImage: _imageName,
                    ));
                  }
                },
                foregroundColor: context.colorScheme.onPrimary,
                backgroundColor: context.colorScheme.primary,
                text: AppStrings.done,
              ).hero('auth-button'),
            ).wrapPadding(AppPadding.pagePadding),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, ProfileState state) {
    if (state.updateStatus == CubitStatus.loading) {
      Toaster.showLoading();
    } else if (state.updateStatus == CubitStatus.failure) {
      Toaster.showError(context: context, message: state.failure?.message);
    } else if (state.updateStatus == CubitStatus.success) {
      Toaster.showSuccess(context: context, message: AppStrings.signedInSuccessfully);
      Future.delayed(const Duration(milliseconds: 300)).whenComplete(() => context.goNamed(AppRoutes.main));
    }
  }
}
