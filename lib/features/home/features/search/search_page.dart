import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kursol/features/home/features/search/search_result_body.dart';
import 'package:kursol/features/home/features/search/search_history_body.dart';
import 'package:kursol/features/home/features/widgets/rating_button.dart';
import '../../../../core/common/constants/colors/app_colors.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../core/utils/textstyles/urbanist_textstyles.dart';
import '../widgets/category_button_widget.dart';

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
  String selectedCategory = "All";
  String selectedRating = "All";
  RangeValues _currentRangeValues = const RangeValues(40, 80);

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
      body:
          _query.isEmpty
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryButton(
                          category: 'All',
                          label: '🔥 All',
                          onSelected: (category) {
                            setModalState(() {
                              selectedCategory = category;
                            });
                          },
                          selectedCategory: selectedCategory,
                        ),
                        CategoryButton(
                          category: '3D Design',
                          label: '💡 3D Design',
                          onSelected: (category) {
                            setModalState(() {
                              selectedCategory = category;
                            });
                          },
                          selectedCategory: selectedCategory,
                        ),
                        CategoryButton(
                          category: 'Business',
                          label: '💰 Business',
                          onSelected: (category) {
                            setModalState(() {
                              selectedCategory = category;
                            });
                          },
                          selectedCategory: selectedCategory,
                        ),
                        CategoryButton(
                          category: 'Design',
                          label: '🎨 Design',
                          onSelected: (category) {
                            setModalState(() {
                              selectedCategory = category;
                            });
                          },
                          selectedCategory: selectedCategory,
                        ),
                      ],
                    ),
                  ),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RatingButton(
                          category: 'All',
                          label: 'All',
                          onSelected: (category) {
                            setModalState(() {
                              selectedRating = category;
                            });
                          },
                          selectedCategory: selectedRating,
                        ),
                        RatingButton(
                          category: '5',
                          label: '5',
                          onSelected: (category) {
                            setModalState(() {
                              selectedRating = category;
                            });
                          },
                          selectedCategory: selectedRating,
                        ),
                        RatingButton(
                          category: '4',
                          label: '4',
                          onSelected: (category) {
                            setModalState(() {
                              selectedRating = category;
                            });
                          },
                          selectedCategory: selectedRating,
                        ),
                        RatingButton(
                          category: '3',
                          label: '3',
                          onSelected: (category) {
                            setModalState(() {
                              selectedRating = category;
                            });
                          },
                          selectedCategory: selectedRating,
                        ),
                        RatingButton(
                          category: '2',
                          label: '2',
                          onSelected: (category) {
                            setModalState(() {
                              selectedRating = category;
                            });
                          },
                          selectedCategory: selectedRating,
                        ),
                        RatingButton(
                          category: '1',
                          label: '1',
                          onSelected: (category) {
                            setModalState(() {
                              selectedRating = category;
                            });
                          },
                          selectedCategory: selectedRating,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: appH(10)),
                  Divider(thickness: 1, color: AppColors.greyScale.grey200),
                  SizedBox(height: appH(10)),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setModalState(() {
                              selectedCategory = "All";
                              selectedRating = 'All';
                              _currentRangeValues = RangeValues(1, 100);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary.blue100,
                            padding: EdgeInsets.symmetric(horizontal: appW(30)),
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
                            padding: EdgeInsets.symmetric(horizontal: appW(30)),
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
            );
          },
        );
      },
    );
  }
}
