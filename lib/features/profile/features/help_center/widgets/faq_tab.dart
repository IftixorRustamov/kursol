import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/features/profile/features/help_center/widgets/help_center_container_wg.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/constants/strings/strings.dart';
import '../../../../../core/common/widgets/custom_choice_chip_wg.dart';
import '../../../../../core/utils/textstyles/app_textstyles.dart';

class FaqTab extends StatefulWidget {
  const FaqTab({super.key});

  @override
  State<FaqTab> createState() => _FaqTabState();
}

class _FaqTabState extends State<FaqTab> {
  int selectedIndex = 0;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  final List<String> options = [
    AppStrings.general,
    AppStrings.account,
    AppStrings.course,
    AppStrings.payment,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: appH(24),
      children: [
        SizedBox(
          height: appH(40),
          child: ListView.builder(
            itemCount: options.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) => CustomChoiceChipWg(
                  index: index,
                  label: options[index],
                  selectedIndex: selectedIndex,
                  onSelected: (selected) {
                    setState(() {
                      selectedIndex = selected ? index : selectedIndex;
                    });
                  },
                ),
          ),
        ),
        Container(
          height: appH(56),
          padding: EdgeInsets.symmetric(horizontal: appW(16)),
          decoration: BoxDecoration(
            color:
                _isFocused
                    ? const Color(0xffEFF3FF)
                    : AppColors.greyScale.grey100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:
                  _isFocused
                      ? AppColors.primary.blue500
                      : AppColors.greyScale.grey100,
              width: 2,
            ),
          ),
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            decoration: InputDecoration(
              icon: Icon(
                IconlyLight.search,
                size: appH(20),
                color: AppColors.greyScale.grey400,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyLight.filter,
                  size: 20,
                  color: AppColors.primary.blue500,
                ),
              ),
              hintText: "Search",
              hintStyle: AppTextStyles.urbanist.medium(
                color: AppColors.greyScale.grey400,
                fontSize: 14,
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.transparent,
            ),
            onTap: () {
              setState(() {
                _isFocused = true;
              });
            },
            onSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
        HelpCenterContainerWg(title: "What is Elera?", onPressed: () {}),
        HelpCenterContainerWg(title: "How to create Elera?", onPressed: () {}),
        HelpCenterContainerWg(
          title: "Can I create my own course?",
          onPressed: () {},
        ),
        HelpCenterContainerWg(title: "Is Elera free to use?", onPressed: () {}),
        HelpCenterContainerWg(
          title: "How to make offer on Elera?",
          onPressed: () {},
        ),
      ],
    );
  }
}
