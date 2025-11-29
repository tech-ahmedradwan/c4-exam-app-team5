import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_routes/app_routes.dart';
import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/styles/assets.gen.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_toast_widget.dart';
import '../../../data/models/user_info_response/user.dart';
import '../../view_models/profile_cubit/profile_cubit.dart';
import '../../view_models/profile_cubit/profile_events.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody>
    with AppValidators, ShowToasts {
  late final GlobalKey<FormState> _formKey;
  late TextEditingController _nameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late UserProfileDto _initialUserProfile;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitUpdate() {
    if (_formKey.currentState?.validate() ?? false) {
      final userProfile = UserProfileDto(
        username: _nameController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
      );

      if (userProfile == _initialUserProfile) {
        // No changes made
        infoToast(context, title: AppStrings.noProfileChangesMessage);
        return;
      }

      context.read<ProfileCubit>().doIntent(
        UpdateUserProfile(userProfile: userProfile),
      );
    } else {
      // Form is not valid
      errorToast(context, title: AppStrings.invalidFormMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();

        if (state.userProfileState.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else if (state.userProfileState.hasError) {
          return Column(
            children: [
              Icon(Icons.error, size: AppSizes.h48, color: Colors.red),
              SizedBox(height: AppSizes.h8),
              Text(
                state.userProfileState.errorMessage ?? 'An error occurred',
                style: AppTextStyles.kBlack20SemiBold(),
              ),
            ],
          );
        } else {
          _initialUserProfile = cubit.initialUserProfile;
          _nameController.text = _initialUserProfile.username ?? '';
          _firstNameController.text = _initialUserProfile.firstName ?? '';
          _lastNameController.text = _initialUserProfile.lastName ?? '';
          _emailController.text = _initialUserProfile.email ?? '';
          _phoneController.text = _initialUserProfile.phone ?? '';

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.h16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.h24),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppSizes.r81),
                          child: CircleAvatar(
                            radius: AppSizes.r81,
                            child: Assets.images.profile.image(),
                          ),
                        ),
                        FloatingActionButton.small(
                          onPressed: () {},
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: AppSizes.h20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      spacing: AppSizes.h24,
                      children: [
                        TextFormField(
                          validator: validateUserName,
                          controller: _nameController,

                          decoration: const InputDecoration(
                            labelText: AppStrings.usernameLabel,
                          ),
                        ),
                        Row(
                          spacing: AppSizes.w16,
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: validateFirstName,
                                controller: _firstNameController,

                                decoration: const InputDecoration(
                                  labelText: AppStrings.firstNameLabel,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: validateLastName,
                                controller: _lastNameController,
                                decoration: const InputDecoration(
                                  labelText: AppStrings.lastNameLabel,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          validator: validateEmail,
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: AppStrings.emailLabel,
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          obscuringCharacter: '★',
                          readOnly: true,
                          initialValue: AppStrings.password,
                          style: AppTextStyles.kLightBlack12SemiBold(),
                          decoration: InputDecoration(
                            labelText: AppStrings.passwordLabel,

                            suffix: GestureDetector(
                              onTap: () {
                                // Handle change password action
                                context.pushNamed(
                                  AppRoutes.changePasswordRoute,
                                );
                              },
                              child: Text(
                                AppStrings.change,
                                style: AppTextStyles.kBlue12SemiBold(),
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: validatePhoneNumber,
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            labelText: AppStrings.phoneNumberLabel,
                          ),
                        ),

                        ElevatedButton(
                          onPressed: _submitUpdate,
                          child: const Text(AppStrings.update),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
      listener: (context, state) {
        if (state.updateProfileState.hasError) {
          errorToast(
            context,
            title: state.updateProfileState.errorMessage ?? 'An error occurred',
          );
        }
        if (state.updateProfileState.hasData) {
          successToast(context, title: AppStrings.profileUpdateSuccessMessage);
        }
        if (state.updateProfileState.isLoading) {
          EasyLoading.show(status: AppStrings.loading);
        } else {
          EasyLoading.dismiss();
          // Optionally, show a loading indicator or disable inputs
        }
      },
    );
  }
}
