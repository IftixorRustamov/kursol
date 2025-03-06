import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kursol/core/routes/route_paths.dart' show RoutePaths;

import '../../../../../../core/common/constants/constants_export.dart';
import '../../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../../core/utils/utils_export.dart';
import '../widgets/build_date_field.dart';
import '../widgets/build_text_field.dart';

class FillProfilePage extends StatefulWidget {
  const FillProfilePage({super.key});

  @override
  State<FillProfilePage> createState() => _FillProfilePageState();
}

class _FillProfilePageState extends State<FillProfilePage> {
  TextEditingController _dateController = TextEditingController();
  String? selectedGender;
  List<String> genders = ['Male', 'Female', 'Other'];
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Image picker error: $e");
    }
  }

  void showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: Icon(IconlyLight.camera),
            title: Text('Take a Photo'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(IconlyLight.image),
            title: Text('Choose from Gallery'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.go(RoutePaths.signup);
        },
        titleText: AppStrings.fillYourProfile,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: appH(20),
            children: [
              SizedBox(height: 20),
              Stack(
                children: [
                  CircleAvatar(
                    radius: appH(70),
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : AssetImage("assets/images/empty_profile.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: showImagePickerOptions,
                      child: Icon(
                        IconlyBold.editSquare,
                        color: AppColors.primary(),
                        size: appH(30),
                      ),
                    ),
                  ),
                ],
              ),
              buildTextField("Full Name"),
              buildTextField("Nickname"),
              buildDateField(_dateController, context),
              buildTextField("Email", suffixIcon: IconlyLight.message),
              IntlPhoneField(
                showDropdownIcon: false,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: AppTextStyles.urbanist.regular(
                    color: AppColors.greyScale.grey500,
                    fontSize: 14,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  filled: true,
                  fillColor: AppColors.greyScale.grey50,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
                style: AppTextStyles.urbanist.semiBold(
                  color: AppColors.greyScale.grey900,
                  fontSize: 14,
                ),
                initialCountryCode: 'US',
              ),
              _buildGenderDropdown(),
              DefaultButtonWg(
                  title: AppStrings.profileContinue,
                  onPressed: () {
                    context.go(RoutePaths.createNewPin);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.greyScale.grey50,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          hintText: "Gender",
          hintStyle: AppTextStyles.urbanist.regular(
            color: AppColors.greyScale.grey500,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        value: selectedGender,
        alignment: AlignmentDirectional.center,
        dropdownColor: AppColors.greyScale.grey50,
        icon:
            Icon(Icons.keyboard_arrow_down, color: AppColors.greyScale.grey600),
        items: genders.map((String gender) {
          return DropdownMenuItem<String>(
            value: gender,
            child: Text(
              gender,
              style: AppTextStyles.urbanist.semiBold(
                color: AppColors.greyScale.grey900,
                fontSize: 14,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedGender = newValue;
          });
        },
      ),
    );
  }
}
