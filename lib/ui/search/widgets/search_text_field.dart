import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/strings_Manager.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final VoidCallback? onClear;
  const SearchTextField({super.key, required this.controller, this.onSubmitted, this.onClear});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      enableSuggestions: true,
      controller: widget.controller,
      onTapUpOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onSubmitted: widget.onSubmitted,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: REdgeInsetsDirectional.only(start: 16),
          child: SvgPicture.asset(
            AssetsManager.search,
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 24.sh,
          maxWidth: 24.sh,
        ),
        suffixIcon: Padding(
          padding: REdgeInsetsDirectional.only(end: 16),
          child: InkWell(
            onTap: () {
              widget.controller.clear();
              widget.onClear?.call();
            },
            child: Icon(
              Icons.close_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 24.sh,
          maxWidth: 24.sh,
        ),
        hintText: StringsManager.search,
        hintStyle: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
