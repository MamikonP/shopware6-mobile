import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/number_extension.dart';

class OutlineDropDownField extends StatefulWidget {
  const OutlineDropDownField({
    super.key,
    required this.options,
    required this.label,
    this.hintText = '',
    this.validator,
    this.onChanged,
  });

  final List<String> options;
  final String label;
  final String hintText;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChanged;

  @override
  State<OutlineDropDownField> createState() => _OutlineDropDownFieldState();
}

class _OutlineDropDownFieldState extends State<OutlineDropDownField> {
  late final ValueNotifier<String> _controllerNotifier;

  @override
  void initState() {
    super.initState();
    _controllerNotifier = ValueNotifier('');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        DropdownButtonHideUnderline(
          child: ValueListenableBuilder(
            valueListenable: _controllerNotifier,
            builder: (context, value, child) =>
                DropdownButtonFormField2<String>(
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              menuItemStyleData: MenuItemStyleData(
                padding: kMedium.all,
                selectedMenuItemBuilder: (context, child) => Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: context.themeOf.primary,
                    ),
                    child
                  ],
                ),
              ),
              dropdownStyleData: const DropdownStyleData(
                padding: EdgeInsets.zero,
              ),
              value: value.isEmpty ? null : value,
              onChanged: (String? newValue) {
                onFieldUpdated(newValue);
              },
              iconStyleData: IconStyleData(
                icon: const Icon(Icons.keyboard_arrow_down_sharp),
                iconEnabledColor: context.themeOf.secondary,
                openMenuIcon: const Icon(Icons.keyboard_arrow_up_sharp),
              ),
              selectedItemBuilder: (context) {
                return widget.options.map(
                  (item) {
                    return Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(item, style: context.themeOf.bodyText1),
                    );
                  },
                ).toList();
              },
              items: widget.options
                  .toSet()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  key: ValueKey(value),
                  child: Text(value.isNotEmpty ? value : '',
                      style: context.themeOf.bodyText1),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: context.themeOf.borderColor,
                  ),
                ),
              ),
              isExpanded: true,
            ),
          ),
        ),
      ],
    );
  }

  void onFieldUpdated(String? value) {
    _controllerNotifier.value = value ?? '';
    widget.onChanged?.call(value);
  }
}
