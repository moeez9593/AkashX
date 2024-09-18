import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AppDropDownContainer<T> extends StatelessWidget {
  final String title;
  final List<T> data;
  final DropdownSearchCompareFn<T>? compareFn;
  final DropdownSearchFilterFn<T>? filterFn;
  final DropdownSearchItemAsString<T>? itemAsString;
  final ValueChanged<T?>? onChanged;
  final T? selectedItem;

  const AppDropDownContainer({
    super.key,
    required this.title,
    required this.data,
    this.compareFn,
    this.filterFn,
    this.itemAsString,
    required this.selectedItem,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        showSearchBox: true,
        containerBuilder: (_, child) => Container(
          color: context.colorScheme.primaryContainer,
          child: child,
        ),
        itemBuilder: (_, item, isSelected) => Container(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.primaryContainer,
          // padding: context.sSize.standardPadding(),
          child: Text(
            item != null ? (itemAsString?.call(item) ?? "") : "",
            // style: TextStyles.textLargeGreyNormal.copyWith(
            //   fontSize: context.sSize.standardFontSize(),
            //   color: isSelected ? AppColors.white : null,
            // ),
          ),
        ),
        searchDelay: const Duration(milliseconds: 250),
        searchFieldProps: TextFieldProps(
          // style: TextStyles.textLargeGreyNormal.copyWith(
          //   fontSize: context.sSize.standardFontSize(),
          // ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                // borderSide: BorderSide(color: AppColors.dividerColor),
                ),
          ),
        ),
      ),
      dropdownButtonProps: DropdownButtonProps(
        icon: RotatedBox(
          quarterTurns: 3,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: context.screenHeight * 0.025,
            // color: AppColors.dividerColor,
          ),
        ),
      ),
      items: data,
      compareFn: compareFn,
      filterFn: filterFn,
      itemAsString: itemAsString,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: title,
          // labelStyle: TextStyles.textLargeGreyNormal.copyWith(
          //   fontSize: context.sSize.standardFontSize(),
          // ),
          border: OutlineInputBorder(
            // borderSide: BorderSide(
            //   color: AppColors.dividerColor,
            // ),
            borderRadius: BorderRadius.circular(context.screenHeight * 0.01),
          ),
        ),
      ),
      onChanged: onChanged,
      selectedItem: selectedItem,
      dropdownBuilder: selectedItem != null
          ? ((_, item) => Text(
                (itemAsString?.call(item as T) ?? ""),
                // style: TextStyles.textLargeGreyNormal.copyWith(
                //   fontSize: context.sSize.standardFontSize(),
                // ),
              ))
          : null,
    );
  }
}
