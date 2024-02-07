import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    Key? key,
    this.controller,
    this.isPassword = false,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.textInputType,
    this.onSubmitied,
    this.validator,
    this.textInputAction,
    this.suffixIcon,
    this.enabled = true,
    this.maxLength,
    this.autovalidateMode,
    this.prefixIcon,
    this.contentPadding,
    this.fillColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.height = 52,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool isPassword;
  final bool autofocus;
  final String? labelText;
  final String? hintText;
  final TextInputType? textInputType;
  final Function(String value)? onSubmitied;
  final Function(String value)? validator;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? enabled;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final BorderRadiusGeometry borderRadius;
  final double height;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  String errorText = '';
  bool isFocus = false;
  bool isError = false;
  bool hidePass = false;
  bool isFirst = true;
  void Function(dynamic)? checkError;

  @override
  void initState() {
    hidePass = widget.isPassword;
    isFocus = widget.autofocus;
    checkError = (value) {
      if (widget.validator != null) {
        if (widget.validator!(value).isNotEmpty) {
          isError = true;
          errorText = widget.validator!(value);
        } else {
          isError = false;
          errorText = widget.validator!(value);
        }
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.fillColor ?? Colors.white,
          borderRadius: widget.borderRadius,
          border: widget.fillColor != null
              ? null
              : Border.all(
                  color: isError
                      ? Colors.red
                      : (isFocus
                          ? AppColors.getColor(ColorKey.primary70)
                          : Colors.grey[300]!)),
          boxShadow: [
            if (isFocus && widget.fillColor == null)
              BoxShadow(
                color: AppColors.getColor(ColorKey.primary30),
                offset: const Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 5,
              ),
          ],
        ),
        child: FocusScope(
          onFocusChange: (focus) {
            if (!isFirst) checkError!(widget.controller?.text);
            if (!focus) setState(() => isFocus = false);
            isFirst = false;
          },
          child: TextFormField(
            key: widget.key,
            onTap: () => setState(() => isFocus = true),
            onTapOutside: (event) {
              setState(() => isFocus = false);
              FocusManager.instance.primaryFocus?.unfocus();
            },
            autofocus: widget.autofocus,
            controller: widget.controller,
            obscureText: hidePass,
            keyboardType: widget.textInputType ?? TextInputType.text,
            onFieldSubmitted: widget.onSubmitied,
            enabled: widget.enabled,
            maxLength: widget.maxLength,
            onChanged: widget.autovalidateMode != AutovalidateMode.disabled
                ? checkError
                : null,
            autovalidateMode:
                widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              isDense: widget.labelText == null,
              contentPadding: widget.contentPadding ??
                  (widget.labelText == null
                      ? const EdgeInsets.fromLTRB(16, 10, 16, 0)
                      : const EdgeInsets.fromLTRB(16, 4, 16, 8)),
              border: InputBorder.none,
              floatingLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AssetColors.inkLighter,
              ),
              counterText: "",
              labelText: widget.labelText,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AssetColors.inkLighter,
              ),
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(top: 13, right: 5),
                      child: widget.prefixIcon,
                    ),
              hintText: widget.hintText,
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: widget.suffixIcon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(top: 13, right: 5),
                      child: widget.suffixIcon,
                    ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: isError ? true : false,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            errorText,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AssetColors.redBase,
            ),
          ),
        ),
      ),
    ]);
  }
}
