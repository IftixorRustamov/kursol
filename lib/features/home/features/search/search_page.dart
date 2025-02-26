import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/features/home/features/search/search_result_body.dart';
import 'package:kursol/features/home/features/search/search_history_body.dart';
import '../../../../core/common/constants/colors/app_colors.dart';
import '../../../../core/common/widgets/custom_choice_chip_wg.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../core/utils/textstyles/urbanist_textstyles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;
  String _query = "";
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  int selectedIndex = 0;

  final List<String> options = [
    '🔥 All',
    '💡 3D Design',
    '💰 Business',
    '🎨 Design',
  ];

  int selectedRatingIndex = 0;

  final List<String> optionsRating = [
    'All',
    '5',
    '4',
    '3',
    '2',
    '1',
  ];

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String query) {
    setState(() {
      _query = query;
      _isFocused = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.greyScale.grey50,
        automaticallyImplyLeading: false,
        title: Container(
          height: appH(53),
          decoration: BoxDecoration(
            color: _isFocused
                ? const Color(0xffEFF3FF)
                : AppColors.greyScale.grey100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isFocused
                  ? AppColors.primary.blue500
                  : AppColors.greyScale.grey100,
              width: 2,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: appW(16)),
          child: Row(
            children: [
              Icon(
                IconlyLight.search,
                size: appH(20),
                color: AppColors.greyScale.grey400,
              ),
              SizedBox(width: appW(12)),
              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: UrbanistTextStyles().medium(
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
                    _onSearchSubmitted(value);
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  _modalBottomSheetFilter();
                },
                icon: Icon(
                  IconlyLight.filter,
                  size: 20,
                  color: AppColors.primary.blue500,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _query.isEmpty
          ? SearchHistoryBody()
          : SearchResultBody(query: _query),
    );
  }

  void _modalBottomSheetFilter() {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: appH(581),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: appH(15)),
                    Center(
                      child: Text(
                        "Filter",
                        style: UrbanistTextStyles().bold(
                          color: AppColors.greyScale.grey900,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: appH(15)),
                    Divider(thickness: 1, color: AppColors.greyScale.grey200),
                    Text(
                      'Category',
                      style: UrbanistTextStyles().bold(
                        color: AppColors.greyScale.grey900,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: appH(15)),
                    // ! Category check bar
                    SizedBox(
                      height: appH(40),
                      child: ListView.builder(
                        itemCount: options.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CustomChoiceChipWg(
                          index: index,
                          label: options[index],
                          selectedIndex: selectedIndex,
                          onSelected: (selected) {
                            setModalState(() {
                              selectedIndex = selected ? index : selectedIndex;
                            });
                          },
                        ),
                      ),
                    ),
                    // ! Category check bar
                    SizedBox(height: appH(15)),
                    Text(
                      'Price',
                      style: UrbanistTextStyles().bold(
                        color: AppColors.greyScale.grey900,
                        fontSize: 20,
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        showValueIndicator: ShowValueIndicator.always,
                        valueIndicatorColor: AppColors.primary.blue500,
                        valueIndicatorTextStyle: TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                      child: RangeSlider(
                        values: _currentRangeValues,
                        max: 100,
                        activeColor: AppColors.primary.blue500,
                        inactiveColor: AppColors.greyScale.grey200,
                        labels: RangeLabels(
                          '\$${_currentRangeValues.start.round()}',
                          '\$${_currentRangeValues.end.round()}',
                        ),
                        onChanged: (RangeValues values) {
                          setModalState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ),

                    // SizedBox(height: appH(10)),
                    Text(
                      'Rating',
                      style: UrbanistTextStyles().bold(
                        color: AppColors.greyScale.grey900,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: appH(15)),
                    //! Rating check bar
                    SizedBox(
                      height: appH(40),
                      child: ListView.builder(
                        itemCount: optionsRating.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CustomChoiceChipWg(
                          showIcon: true,
                          index: index,
                          label: optionsRating[index],
                          selectedIndex: selectedRatingIndex,
                          onSelected: (selected) {
                            setModalState(() {
                              selectedRatingIndex =
                                  selected ? index : selectedRatingIndex;
                            });
                          },
                        ),
                      ),
                    ),
                    //! Rating check bar
                    SizedBox(height: appH(10)),
                    Divider(thickness: 1, color: AppColors.greyScale.grey200),
                    SizedBox(height: appH(10)),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setModalState(() {
                                selectedIndex = 0;
                                selectedRatingIndex = 0;
                                _currentRangeValues = RangeValues(1, 100);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary.blue100,
                              padding:
                                  EdgeInsets.symmetric(horizontal: appW(30)),
                              minimumSize: const Size(0, 58),
                            ),
                            child: Text(
                              "Reset",
                              style: UrbanistTextStyles().bold(
                                color: AppColors.primary.blue500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: appW(10)),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary.blue500,
                              padding:
                                  EdgeInsets.symmetric(horizontal: appW(30)),
                              minimumSize: const Size(0, 58),
                            ),
                            child: Text(
                              "Filter",
                              style: UrbanistTextStyles().bold(
                                color: AppColors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
