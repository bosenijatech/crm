// import 'package:flutter/material.dart';

// import '../constant/app_color.dart';


// class CustomRoundedTextField extends StatelessWidget {
//   CustomRoundedTextField({
//     Key? key,
//     this.title,
//     this.width,
//     this.margin,
//     this.labelText,
//     this.suffixIcon,
//     this.obscureText,
//     this.type,
//     this.control,
//     this.errMsg,
//     this.onChanged,
//     this.validator,
//     this.readOnly,
//     this.focusNode,
//     this.inputFormaters,
//     this.initialValue,
//     this.lines,
//     this.onTap,
//     this.borderSideColor,
//     this.enableBorderColor,
//     this.focusBorderColor,
//     this.labelColor,
//     this.labelStyleFs,
//     this.height,
//     this.verticalMargin,
//   }) : super(key: key);

//   final String? title;
//   final double? width;
//   final String? labelText;
//   final Widget? suffixIcon;
//   final Color? borderSideColor;
//   final Color? enableBorderColor;
//   final Color? focusBorderColor;
//   final Color? labelColor;
//   final double? labelStyleFs;

//   var margin;
//   var control;
//   var initialValue;
//   var type;
//   var errMsg;
//   var obscureText;
//   var onChanged;
//   var validator;
//   final bool? readOnly;
//   var focusNode;
//   var inputFormaters;
//   var lines;
//   final double? height;
//   final double? verticalMargin;
//   final Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       margin: margin ?? EdgeInsets.symmetric(horizontal: 0),
//       width: width ?? 201,
//       child: TextFormField(
//         onTap: onTap,
//         initialValue: initialValue,
//         textAlign: type == null ? TextAlign.start : TextAlign.end,
//         controller: control,
//         obscureText: obscureText == true
//             ? obscureText
//                 ? true
//                 : false
//             : false,
//         keyboardType: type,
//         inputFormatters: inputFormaters,
//         maxLines: lines ?? 1,
//         validator: validator,
//         readOnly: readOnly ?? false,
//         onChanged: onChanged,
//         focusNode: focusNode,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: verticalMargin??0),
//           hintText: title,
//           labelText: labelText,
//           suffixIcon: suffixIcon,
//           iconColor: AppColor.primary,
//           floatingLabelStyle: TextStyle(fontSize: 16, color: AppColor.primary),
//           hintStyle: TextStyle(fontSize: labelStyleFs ?? 16, color: labelColor ?? AppColor.darker),
//           labelStyle: TextStyle(fontSize: labelStyleFs ?? 16.0, color: labelColor ?? AppColor.grey),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: BorderSide(width: 1.5, color: borderSideColor ?? AppColor.grey),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: BorderSide(width: 1.5, color: enableBorderColor ?? AppColor.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: BorderSide(width: 1.5, color: focusBorderColor ?? AppColor.primary),
//           ),
//             errorText: errMsg,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For inputFormatters
import '../constant/app_color.dart';

class CustomRoundedTextField extends StatelessWidget {
  CustomRoundedTextField({
    Key? key,
    this.title,
    this.width,
    this.margin,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    
    this.obscureText = false,
    this.type,
    this.control,
    this.errMsg,
    this.onChanged,
    this.validator,
    this.readOnly = false,
    this.focusNode,
    this.inputFormaters,
    this.initialValue,
    this.lines,
    this.onTap,
    this.borderSideColor,
    this.enableBorderColor,
    this.focusBorderColor,
    this.labelColor,
    this.labelStyleFs,
    this.height,
    this.verticalMargin,
  }) : super(key: key);

  final String? title;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderSideColor;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final Color? labelColor;
  final double? labelStyleFs;
  final TextEditingController? control;
  final String? initialValue;
  final TextInputType? type;
  final String? errMsg;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool readOnly;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormaters;
  final int? lines;
  final double? height;
  final double? verticalMargin;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
      width: width ?? 201,
      child: TextFormField(
        onTap: onTap,
        initialValue: control == null ? initialValue : null,
        controller: control,
        obscureText: obscureText,
        keyboardType: type ?? TextInputType.text,
        inputFormatters: inputFormaters,
        maxLines: lines ?? 1,
        validator: validator,
        readOnly: readOnly,
        onChanged: onChanged,
        focusNode: focusNode,
        textAlign: type == TextInputType.number || type == TextInputType.numberWithOptions() ? TextAlign.start : TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: verticalMargin ?? 0),
          hintText: title,
          labelText: labelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          iconColor: AppColor.primary,
          floatingLabelStyle: TextStyle(fontSize: 16, color: AppColor.primary),
          hintStyle: TextStyle(fontSize: labelStyleFs ?? 16, color: labelColor ?? AppColor.darker),
          labelStyle: TextStyle(fontSize: labelStyleFs ?? 16.0, color: labelColor ?? AppColor.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 1.5, color: borderSideColor ?? AppColor.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 1.5, color: enableBorderColor ?? AppColor.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 1.5, color: focusBorderColor ?? AppColor.primary),
          ),
          errorText: errMsg,
        ),
      ),
    );
  }
}
