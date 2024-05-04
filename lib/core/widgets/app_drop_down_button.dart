import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/colors.dart';
import '../themes/text_styles.dart';

class AppDropDownButton extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final Function(String?) onItemSelected;

  const AppDropDownButton({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  AppDropDownButtonState createState() => AppDropDownButtonState();
}

class AppDropDownButtonState extends State<AppDropDownButton> {
  String? _selectedItem;
  late List<String> _mutableItems;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
    _mutableItems = List.from(widget.items);
    if (!_mutableItems.contains(widget.selectedItem)) {
      setState(() {
        _mutableItems.insert(0, widget.selectedItem!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.blue),
          borderRadius: BorderRadius.circular(13.r),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
              widget.onItemSelected(newValue);
            },
            items: _mutableItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text('${widget.selectedItem}'),
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            style: AppTextStyles.font15GrayW400.copyWith(fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
