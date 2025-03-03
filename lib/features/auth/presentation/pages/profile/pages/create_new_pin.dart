import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/routes/route_paths.dart';

import '../../../../../../core/common/constants/constants_export.dart';
import '../../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../../core/utils/utils_export.dart';

class CreateNewPin extends StatefulWidget {
  const CreateNewPin({super.key});

  @override
  State<CreateNewPin> createState() => _CreateNewPinState();
}

class _CreateNewPinState extends State<CreateNewPin> {
  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onKeyPress(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
  }

  void _onBackspace(int index) {
    if (index > 0 && controllers[index].text.isEmpty) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.go(RoutePaths.fillYourProfile);
        },
        titleText: AppStrings.createNewPin,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: appH(80),
          children: [
            Text(
              AppStrings.addPinNumber,
              textAlign: TextAlign.center,
              style: AppTextStyles.urbanist
                  .regular(color: AppColors.greyScale.grey900, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: appW(83),
                      height: appH(63),
                      decoration: BoxDecoration(
                        color: focusNodes[index].hasFocus
                            ? AppColors.primary.blue100
                            : AppColors.greyScale.grey50,
                        borderRadius: BorderRadius.circular(appH(12)),
                        border: Border.all(
                          color: focusNodes[index].hasFocus
                              ? AppColors.primary.blue500
                              : AppColors.greyScale.grey200,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: TextField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: AppTextStyles.urbanist.bold(
                            color: AppColors.greyScale.grey900, fontSize: 24),
                        decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _onKeyPress(value, index);
                            _onBackspace(index);
                          });
                        },
                      ),
                    ),
                    if (controllers[index].text.isNotEmpty)
                      Text(
                        '⚫',
                        style: AppTextStyles.urbanist.bold(
                            color: AppColors.greyScale.grey900, fontSize: 24),
                      ),
                  ],
                );
              }),
            ),
            DefaultButtonWg(
                title: AppStrings.profileContinue,
                onPressed: () {
                  context.go(RoutePaths.fingerPrint);
                }),
          ],
        ),
      ),
    );
  }
}
