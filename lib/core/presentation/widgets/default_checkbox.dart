import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DefaultCheckbox extends HookWidget {
  const DefaultCheckbox({
    super.key,
    required this.initialChecked,
    required this.onChanged,
    this.tristate = false,
  });
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
  final bool initialChecked;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final isChecked = useState<bool?>(initialChecked);

    return Checkbox(
      value: isChecked.value,
      onChanged: (value) {
        isChecked.value = value;
        onChanged?.call(value);
      },
      tristate: tristate,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      activeColor: colorScheme.primary,
      side: BorderSide(color: colorScheme.primary, width: 1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.size4)),
      ),
    );
  }
}
