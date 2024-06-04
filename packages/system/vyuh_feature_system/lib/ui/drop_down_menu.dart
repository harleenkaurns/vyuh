import 'package:flutter/material.dart';

class DropDownMenu<T> extends StatelessWidget {
  final FormFieldSetter<T>? onSaved;

  // FormField Validator
  final FormFieldValidator<T>? validator;

  final String? label;

  final String? hintText;

  final T? value;

  final bool isRequired;

  final List<T> items;

  final ValueChanged<T?>? onChanged;

  final Function(T) getValue;

  final bool isExpanded;

  final bool autoFocus;

  final FocusNode? focusNode;

  const DropDownMenu({
    super.key,
    this.onChanged,
    this.onSaved,
    this.label,
    this.hintText = '',
    this.isRequired = true,
    this.isExpanded = true,
    this.validator,
    required this.items,
    required this.getValue,
    this.value,
    this.autoFocus = false,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            children: [
              DropdownButtonFormField<T>(
                items: items.map<DropdownMenuItem<T>>((data) {
                  return DropdownMenuItem<T>(
                    value: data,
                    child: Text(
                      '${getValue(data)}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      softWrap: true,
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  contentPadding: EdgeInsets.zero,
                  errorStyle: Theme.of(context).textTheme.titleMedium,
                  labelText: label,
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                validator: validator,
                focusNode: focusNode,
                autofocus: autoFocus,
                onChanged: onChanged,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                value: value,
                isExpanded: isExpanded,
                focusColor: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
