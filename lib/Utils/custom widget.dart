import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'colors.dart';
import 'constant.dart';

Widget text({
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
  double? height,
  int? maxLines,
  double? width,
  String? font,
  TextOverflow? overflow,
  Color? fontcolor,
}) {
  return SizedBox(
    width: width,
    child: Text(
      textAlign: textAlign,
      title,
      overflow: overflow ,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      ),
    ),
  );
}


Widget textInter({
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  FontWeight? fontWeightStyle,
  TextAlign? textAlign,
  Color? color,
  double? height,
  int? maxLines,
  double? width,
  String? font,
  TextOverflow? overflow,
  TextDecoration? textDecoration,
  Color? decorationColor,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: width,
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          textStyle: TextStyle(fontWeight: fontWeightStyle ?? FontWeight.bold),
          color: color ?? AppColors.black,
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: decorationColor ?? Colors.transparent,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    ),
  );
}

Widget textinter({
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
  double? height,
  int? maxLines,
  double? width,
  String? font,
  TextOverflow? overflow,
}) {
  return SizedBox(
    width: width,
    child: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.black,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    ),
  );
}

Widget textOpen({
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
  double? height,
  int? maxLines,
  double? width,
  String? font,
  TextOverflow? overflow,
}) {
  return SizedBox(
    width: width,
    child: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.black,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    ),
  );
}

Widget image({required String image, double? height, double? width}) {
  return Image.asset(
    "assets/images/${image}",
    height: height ?? 10,
    width: width ?? 10,
    fit: BoxFit.fill,
  );
}

Widget button({
  required bool isLoading,
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  VoidCallback? onTap,
  double? width,
  double? height,
  Color? color,
  bool? gradient = false,
  bool? gradient1 = false,
  EdgeInsetsGeometry? margin,
  double elevation = 4.0,
  double? radius, // Add elevation parameter// Add elevation parameter
  Color? bordercolor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 1, // Set the elevation for the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          radius ?? 10,
        ), // Match the container's border radius
      ),
      margin: margin ?? const EdgeInsets.only(left: 0, top: 0, right: 0),
      child: Container(
        height: height ?? 50,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.orangeColor,
          border: Border.all(color: AppColors.continueBorder),
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        child: Center(
          child:
          !isLoading
              ? text(
            title: title,
            fontSize: fontSize ?? 14,

            fontWeight: FontWeight.w700,
            color: color ?? AppColors.white,
          )
              : SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: AppColors.continueBorder,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buttonwithicon({
  required bool isLoading,
  required String title,
  required String image, // Made image required
  IconData? icon, // Added icon parameter
  double? fontSize,
  FontWeight? fontWeight,
  VoidCallback? onTap,
  double? width,
  double? height,
  Color? color,
  bool? gradient = false,
  bool? gradient1 = false,
  EdgeInsetsGeometry? margin,
  double elevation = 4.0,
  double? radius,
  Color? bordercolor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: elevation, // Set the elevation for the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 100),
      ),

      child: Container(
        height: height ?? 45,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: bordercolor ?? AppColors.continueBorder),
          borderRadius: BorderRadius.circular(radius ?? 100),
        ),
        child: Center(
          child:
          !isLoading
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Image widget
                Image.asset(
                  image,
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 20),
                text(
                  title: title,
                  fontSize: fontSize ?? 15,
                  fontWeight: fontWeight ?? FontWeight.w700,
                  color: AppColors.darkBlue,
                ),
              ],
            ),
          )
              : const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: AppColors.continueBorder,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buttonWithLightBackGround({
  required bool isLoading,
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  VoidCallback? onTap,
  double? width,
  double? height,
  Color? color,
  Color? buttontextcolor,
  bool? gradient = false,
  bool? gradient1 = false,
  EdgeInsetsGeometry? margin,
  double elevation = 4.0,
  double? radius,
  Color? fontcolor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 1, // Set the elevation for the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          radius ?? 100,
        ), // Match the container's border radius
      ),
      margin: margin ?? const EdgeInsets.only(left: 0.0, top: 0, right: 0),
      child: Container(
        height: height ?? 50,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          border: Border.all(color: AppColors.darkBlue),
          borderRadius: BorderRadius.circular(radius ?? 100),
        ),
        child: Center(
          child:
          !isLoading
              ? text(
            fontcolor: buttontextcolor,
            title: title,
            fontSize: fontSize ?? 15,
            font: 'BROTHERFONT',
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          )
              : const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: CupertinoColors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buttonWithBackground({
  required bool isLoading,
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  VoidCallback? onTap,
  double? width,
  double? height,
  Color? color,
  Color? loaderColor,
  EdgeInsetsGeometry? margin,
  double? elevation,
  double? radius,

  Color? fontcolor,
  Color? backgroundcolor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 1,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          radius ?? 100,
        ), // Match the container's border radius
      ),
      margin: margin ?? const EdgeInsets.only(left: 0.0, top: 0, right: 0),
      child: Container(
        height: height ?? 50,
        width: width,
        decoration: BoxDecoration(
          color: backgroundcolor ?? AppColors.darkBlue,
          //color: AppColors.darkbrown,
          // border: Border.all(color: Color(0xff580E3F)),
          // gradient: const LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomRight,
          //   colors: [Color(0xffFDB323), Color(0xffD96F0A)],
          // ),
          borderRadius: BorderRadius.circular(radius ?? 100),
        ),
        child: Center(
          child:
          !isLoading
              ? text(
            title: title,
            fontSize: fontSize ?? 16,

            fontWeight: FontWeight.w700,
            color: color ?? fontcolor,
          )
              : SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color:loaderColor ?? AppColors.darkBlue,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buttonWithBackground1({
  required bool isLoading,
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  VoidCallback? onTap,
  double? width,
  double? height,
  Color? color,
  bool? gradient = true,
  bool? gradient1 = true,
  EdgeInsetsGeometry? margin,
  double elevation = 2.0,
  double? radius, // Add elevation parameter
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 1, // Set the elevation for the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          radius ?? 100,
        ), // Match the container's border radius
      ),
      margin: margin ?? const EdgeInsets.only(left: 0.0, top: 0, right: 0),
      child: Container(
        padding: EdgeInsets.zero,
        height: height ?? 50,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.continueBorder,
          // border: Border.all(color: Color(0xff580E3F)),
          // gradient: const LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomRight,
          //   colors: [Color(0xffFDB323), Color(0xffD96F0A)],
          // ),
          borderRadius: BorderRadius.circular(radius ?? 100),
        ),
        child: Center(
          child:
          !isLoading
              ? text(
            title: title,
            fontSize: fontSize ?? 16,
            font: 'chivo',
            fontWeight: FontWeight.w700,
            color: Color(0xfffffffF),
          )
              : const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: CupertinoColors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget sizeBox({double? height, double? width}) {
  return SizedBox(width: width ?? 10, height: height ?? 20);
}

// helloformfiled
Widget editText({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? prefixIcon,
  Widget? suffixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
}) {
  return Container(
    margin: margin ?? EdgeInsets.zero,
    decoration: BoxDecoration(
      color: backgroundColor ?? AppColors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(100),
    ),
    child: SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.words,
        enableInteractiveSelection: enableInteractiveSelection,
        maxLength: maxLength,
        readOnly: readOnly,

        autofocus: false,
        enabled: enabled,
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,

        style: TextStyle(
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? Colors.black,
          fontFamily: fontFamily,
        ),
        onTap: onTap,
        onChanged: onValueChanged,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelStyle: TextStyle(

            fontSize: 12,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(

            fontSize: 14,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w400,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            vertical: paddingSize ?? 15,
            horizontal: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: borderColor ?? Colors.grey,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.8,
              color: borderColor ?? Colors.grey,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(4),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(4),
            borderSide: BorderSide(color: borderColor ?? Colors.grey),
          ),
          filled: backgroundColor != null,
          fillColor: backgroundColor,
          counterText: "", // Hide the maxLength counter
        ),
      ),
    ),
  );
}
Widget formField({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? prefixIcon,
  Widget? suffixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
}) {
  return Container(
    margin: margin ?? EdgeInsets.zero,
    decoration: BoxDecoration(
      color: backgroundColor ?? AppColors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(100),
    ),
    child: SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.words,
        enableInteractiveSelection: enableInteractiveSelection,
        maxLength: maxLength,
        readOnly: readOnly,

        autofocus: false,
        enabled: enabled,
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,

        style: TextStyle(
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? Colors.black,
          fontFamily: fontFamily,
        ),
        onTap: onTap,
        onChanged: onValueChanged,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelStyle: TextStyle(

            fontSize: 12,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
            fontSize: 14,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w400,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            vertical: paddingSize ?? 15,
            horizontal: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: borderColor ?? Color(0xffB493221A),
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(100),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.8,
              color: borderColor ?? Color(0xffB493221A).withOpacity(0.1),
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(100),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(100),
            borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
          ),
          filled: backgroundColor != null,
          fillColor: backgroundColor,
          counterText: "", // Hide the maxLength counter
        ),
      ),
    ),
  );
}

Widget emailFormField({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? prefixIcon,
  Widget? suffixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
}) {
  return Container(
    margin: margin ?? EdgeInsets.zero,
    decoration: BoxDecoration(
      color: backgroundColor ?? AppColors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(100),
    ),
    child: SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        controller: controller,
        enableInteractiveSelection: enableInteractiveSelection,
        maxLength: maxLength,
        readOnly: readOnly,
        textCapitalization: TextCapitalization.none,
        autofocus: false,
        enabled: enabled,
        keyboardType: inputType,
        inputFormatters: [
          // Allow only letters a-z
          // FilteringTextInputFormatter.allow(RegExp('[a-z]')),
          // Force lowercase
          TextInputFormatter.withFunction((oldValue, newValue) {
            return newValue.copyWith(
              text: newValue.text.toLowerCase(),
              selection: newValue.selection,
            );
          }),
        ],

        // inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? Colors.black,
          fontFamily: fontFamily,
        ),
        onTap: onTap,
        onChanged: onValueChanged,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelStyle: TextStyle(

            fontSize: 12,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(

            fontSize: 14,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w400,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            vertical: paddingSize ?? 15,
            horizontal: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: borderColor ?? Color(0xffB493221A),
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(100),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.8,
              color: borderColor ?? Color(0xffB493221A).withOpacity(0.1),
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(100),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(100),
            borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
          ),
          filled: backgroundColor != null,
          fillColor: backgroundColor,
          counterText: "", // Hide the maxLength counter
        ),
        // decoration: InputDecoration(
        //   labelText: labelText,
        //   hintText: hintText,
        //   prefixIcon: prefixIcon,
        //   suffixIcon: suffixIcon,
        //   labelStyle: TextStyle(
        //     fontFamily: 'opensans',
        //     fontSize: 12,
        //     color: AppColors.black,
        //     fontWeight: FontWeight.w400,
        //   ),
        //   hintStyle: TextStyle(
        //     fontFamily: 'opensans',
        //     fontSize: 14,
        //     color: AppColors.lightgrey,
        //     fontWeight: FontWeight.w400,
        //   ),
        //   floatingLabelBehavior: FloatingLabelBehavior.always,
        //   contentPadding: EdgeInsets.symmetric(
        //     vertical: paddingSize ?? 15,
        //     horizontal: 15,
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: borderColor ?? AppColors.darkbrown),
        //     borderRadius: borderRadius ?? BorderRadius.circular(100),
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: borderColor ?? AppColors.darkbrown),
        //     borderRadius: borderRadius ?? BorderRadius.circular(100),
        //   ),
        //   border: OutlineInputBorder(
        //     borderRadius: borderRadius ?? BorderRadius.circular(100),
        //     borderSide: BorderSide(color: borderColor ?? AppColors.darkbrown),
        //   ),
        //   filled: backgroundColor != null,
        //   fillColor: backgroundColor,
        //   counterText: "", // Hide the maxLength counter
        // ),
      ),
    ),
  );
}

Widget paymentField({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? prefixIcon,
  Widget? suffixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
}) {
  return Container(
    margin: margin ?? EdgeInsets.zero,
    decoration: BoxDecoration(
      color: backgroundColor ?? Color(0xffF7F7F7),
      borderRadius: borderRadius ?? BorderRadius.circular(10),
    ),
    child: SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.words,
        enableInteractiveSelection: enableInteractiveSelection,
        maxLength: maxLength,
        readOnly: readOnly,
        autofocus: false,
        enabled: enabled,
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? Colors.black,
          fontFamily: fontFamily,
        ),
        onTap: onTap,
        onChanged: onValueChanged,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelStyle: TextStyle(
            fontFamily: 'opensans',
            fontSize: 12,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
            fontFamily: 'opensans',
            fontSize: 14,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            vertical: paddingSize ?? 15,
            horizontal: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Color(0xffF7F7F7)),
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Color(0xffF7F7F7)),
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor ?? Color(0xffF7F7F7)),
          ),
          filled: backgroundColor != null,
          fillColor: backgroundColor,
          counterText: "", // Hide the maxLength counter
        ),
      ),
    ),
  );
}

Widget Field({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? prefixIcon,
  Widget? suffixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
}) {
  return Container(
    margin: margin ?? EdgeInsets.zero,
    decoration: BoxDecoration(
      color: backgroundColor ?? AppColors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(100),
    ),
    child: SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.words,
        enableInteractiveSelection: enableInteractiveSelection,
        maxLength: maxLength,
        readOnly: readOnly,
        autofocus: false,
        enabled: enabled,
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? Colors.black,
          fontFamily: fontFamily,
        ),
        onTap: onTap,
        onChanged: onValueChanged,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelStyle: TextStyle(
            fontFamily: 'opensans',
            fontSize: 14,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
            fontFamily: 'opensans',
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            vertical: paddingSize ?? 15,
            horizontal: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
            borderRadius: borderRadius ?? BorderRadius.circular(100),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
            borderRadius: borderRadius ?? BorderRadius.circular(100),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(100),
            borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
          ),
          filled: backgroundColor != null,
          fillColor: backgroundColor,
          counterText: "", // Hide the maxLength counter
        ),
      ),
    ),
  );
}

Widget textForgot({
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
  double? height,
  int? maxLines,
  double? width,
  String? font,
  TextOverflow? overflow,
  Function(int)? onTap,
}) {
  return SizedBox(
    width: width,
    child: GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap(0); // Pass the integer value, modify as needed
        }
      },
      child: Text(
        title,
        style: TextStyle(
          fontFamily: font ?? 'chivo',
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? AppColors.black,
          height: height,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    ),
  );
}

showToast({BuildContext? context, required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );
}

Widget textSearch({
  TextEditingController? controller,
  String? hintText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
  int? maxlength,
  Color? backColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? font,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged, // Changed to ValueChanged<String>
  Widget? prefix, // Widget for prefix (Icon or Image)
}) {
  return Container(
    width: width,
    height: height ?? 45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: AppColors.white,
    ),
    child: Center(
      child: TextFormField(
        enableInteractiveSelection: enableInteractiveSelection,
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        maxLines: 1,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(maxlength),
          ...?inputFormatters,
        ],
        enabled: enabled,
        keyboardType: inputType ?? TextInputType.text,
        textInputAction: TextInputAction.done,
        style: TextStyle(
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? AppColors.black,
        ),
        onChanged: (String value) {
          if (onValueChanged != null) {
            onValueChanged(value); // Call the onValueChanged callback
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          isDense: true,
          hintStyle: TextStyle(
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.w400,
            color: AppColors.continueBorder,
          ),
          contentPadding: const EdgeInsets.only(top: 13.0, left: 20),

          // Adjust vertical padding
          suffixIcon:
          prefix != null
              ? Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: prefix,
          )
              : Icon(Icons.search, size: 30, color: AppColors.continueBorder),
        ),
      ),
    ),
  );
}

Widget textSearch1({
  TextEditingController? controller,
  String? hintText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
  int? maxlength,
  Color? backColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? font,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onChanged,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  return Container(
    width: width,
    height: height ?? 45,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xffD7D7D7)),
      borderRadius: BorderRadius.circular(25),
      color: AppColors.white,
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.5),
      //     spreadRadius: 2,
      //     blurRadius: 5,
      //     offset: const Offset(3, 2),
      //   ),
      // ],
    ),
    child: Center(
      child: TextFormField(
        enableInteractiveSelection: enableInteractiveSelection,
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        maxLines: 1,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(maxlength),
          ...?inputFormatters,
        ],
        enabled: enabled,
        keyboardType: inputType ?? TextInputType.text,
        textInputAction: TextInputAction.done,
        style: TextStyle(

          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? AppColors.black,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          isDense: true,
          hintStyle: TextStyle(
            fontSize: fontSize ?? 12,
            fontWeight: fontWeight ?? FontWeight.w400,
            color: const Color(0xff707070),
          ),
          contentPadding: const EdgeInsets.only(top: 10.0, left: 0),
          // Removed default icon when null
        ),
      ),
    ),
  );
}

Widget sendMessage({
  TextEditingController? controller,
  String? hintText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
  int? maxlength,
  Color? backColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? font,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged, // Changed to ValueChanged<String>
  Widget? prefix,
  Widget? prefixIcon,
  Widget? suffixIcon, // Widget for prefix (Icon or Image)
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: width,
        height: height ?? 45,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(25),
          color: AppColors.white,
        ),
        child: Center(
          child: TextFormField(
            enableInteractiveSelection: enableInteractiveSelection,
            controller: controller,
            readOnly: readOnly,
            maxLines: 1,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(maxlength),
              ...?inputFormatters,
            ],
            enabled: enabled,
            keyboardType: inputType ?? TextInputType.text,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: color ?? AppColors.black,
            ),
            onChanged: (String value) {
              if (onValueChanged != null) {
                onValueChanged(value); // Call the onValueChanged callback
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              isDense: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: AppColors.continueBorder,
              ),
              contentPadding: const EdgeInsets.only(top: 13.0, left: 20),
              // Adjust vertical padding
            ),
          ),
        ),
      ),
    ),
  );
}

Widget textButton1({
  required bool isLoading,
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
  double? height,
  int? maxLines,
  double? width,
  String? font,
  TextDecoration? decoration,
  TextOverflow? overflow,
  Function(int)? onTap,
}) {
  return SizedBox(
    width: width,
    child: GestureDetector(
      onTap: () {
        if (!isLoading && onTap != null) {
          onTap(0); // Prevent tap when loading
        }
      },
      child:
      !isLoading
          ? Text(
        title,
        style: TextStyle(
          decorationColor: color ?? Colors.black,
          decorationThickness: fontWeight == FontWeight.bold ? 2 : 2,
          fontFamily: font ?? 'chivo',
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? Colors.black,
          height: height,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      )
          : SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2, // Matches thickness
          color: AppColors.continueBorder, // Use button color
        ),
      ),
    ),
  );
}

Widget ratingField({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? prefixIcon,
  Widget? suffixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    margin: margin ?? EdgeInsets.zero,
    child: SizedBox(
      height: 100,
      width: width ?? double.infinity,
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.words,
        enableInteractiveSelection: enableInteractiveSelection,
        maxLength: maxLength,
        readOnly: readOnly,
        autofocus: false,
        enabled: enabled,
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? Colors.black,
          fontFamily: fontFamily,
        ),
        onTap: onTap,
        onChanged: onValueChanged,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelStyle: TextStyle(
            fontFamily: 'opensans',
            fontSize: 12,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
            fontFamily: 'opensans',
            fontSize: 14,
            color: AppColors.continueBorder,
            fontWeight: FontWeight.w400,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            vertical: paddingSize ?? 15,
            horizontal: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
            borderRadius: borderRadius ?? BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
            borderRadius: borderRadius ?? BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(20),
            borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
          ),
          filled: backgroundColor != null,
          fillColor: backgroundColor,
          counterText: "", // Hide the maxLength counter
        ),
      ),
    ),
  );
}

Widget textRatingField({
  TextEditingController? controller,
  String? hintText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
  int? maxlength,
  Color? backColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? font,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged, // Changed to ValueChanged<String>
  Widget? prefix, // Widget for prefix (Icon or Image)
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
    child: Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        width: width,
        height: height ?? 100,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFAFAFA)),
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffFAFAFA),
        ),
        child: Center(
          child: TextFormField(
            enableInteractiveSelection: enableInteractiveSelection,
            controller: controller,
            readOnly: readOnly,
            maxLines: 4,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(maxlength),
              ...?inputFormatters,
            ],
            enabled: enabled,
            keyboardType: inputType ?? TextInputType.text,
            textInputAction: TextInputAction.done,
            style: GoogleFonts.inter(
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: color ?? AppColors.black,
            ),
            onChanged: (String value) {
              if (onValueChanged != null) {
                onValueChanged(value); // Call the onValueChanged callback
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 5,
              ),
              // Adjust vertical padding
              prefixIcon:
              prefix != null
                  ? Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: prefix,
              )
                  : null,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget appBarwithtext({
  required BuildContext context,
  required String title,
  double? height,
  double? width,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  bool? IconApp = true,
  VoidCallback? onTap,
  EdgeInsetsGeometry? padding,
  double? customsizedboxwidth,
}) {
  return AppBar(
    shadowColor: Colors.transparent,
    backgroundColor: AppColors.white,
    leading: Padding(
      padding: const EdgeInsets.all(18),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset("assets/images/back.png", height: 10, width: 10),
      ),
    ),
    title: text(
      title: title,
      fontSize: 18,
      fontWeight: FontWeight.w900,
      color: AppColors.darkBlue,
    ),
    centerTitle: true,
  );
}

Widget Imageee({required String image, double? height, double? width}) {
  return Image.asset(
    "assets/images/${image}",
    fit: BoxFit.fill,
    height: height ?? 12,
    width: width ?? 12,
  );
}

Widget customsizedbox({double? height, double? width}) {
  return SizedBox(height: height, width: width);
}

Widget Appbarwithicon({
  required String title,
  double? fontsize,
  FontWeight? fontweight,
  Color? fontcolor,
  void Function()? onTap,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: AppColors.white,

    title: text(
      title: title,
      fontSize: fontsize,
      fontWeight: fontweight,
      fontcolor: fontcolor,
    ),
    leading: Padding(
      padding: const EdgeInsets.fromLTRB(5, 18, 18, 18),
      child: InkWell(
        onTap:
        onTap ??
                () {
              Navigator.pop(context);
            },
        child: Image.asset("assets/images/back.png", height: 10, width: 10),
      ),
    ),

    centerTitle: true,
    actions: [
      GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Notification1()),
          // );
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16,bottom: 10), // Adjust padding if needed
          child: Stack(
            children: [
              Image.asset(
                "assets/images/sun.png", // Your sun image
                height: 30, // Adjust height
                width: 30, // Adjust width
              ),
              new Positioned(
                // draw a red marble
                top: 0.0,
                right: 0.0,
                child: new Icon(
                  Icons.brightness_1,
                  size: 15.0,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget Darkbluecontainer({
  required String title,
  double? height,
  double? width,
}) {
  return Container(
    alignment: Alignment.center,
    height: height ?? 52,
    width: width,
    color: AppColors.darkBlue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: text(
            title: title,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            fontcolor: AppColors.white,
          ),
        ),
      ],
    ),
  );
}

// Widget formField({
//   TextEditingController? controller,
//   String? hintText,
//   String? labelText,
//   double? width,
//   double? height,
//   double? fontSize,
//   FontWeight? fontWeight,
//   TextAlign? textAlign,
//   Color? textColor,
//   int? maxLength,
//   Color? backgroundColor,
//   double? paddingSize,
//   bool readOnly = false,
//   bool? enableInteractiveSelection,
//   TextInputType? inputType,
//   String? fontFamily,
//   EdgeInsetsGeometry? margin,
//   List<TextInputFormatter>? inputFormatters,
//   bool enabled = true,
//   VoidCallback? onTap,
//   ValueChanged<String>? onValueChanged,
//   Widget? prefixIcon,
//   Widget? suffixIcon,
//   Color? borderColor,
//   BorderRadius? borderRadius,
//   FormFieldValidator<String>? validator,
//   bool obscureText = false,
//
// }) {
//   return Container(
//
//     margin: margin ?? EdgeInsets.zero,
//     decoration: BoxDecoration(
//       color: backgroundColor ?? AppColors.white,
//       borderRadius: borderRadius ?? BorderRadius.circular(100),
//     ),
//     child: SizedBox(
//
//       width: width ?? double.infinity,
//       child: TextFormField(
//         controller: controller,
//         textCapitalization: TextCapitalization.words,
//         enableInteractiveSelection: enableInteractiveSelection,
//         maxLength: maxLength,
//         readOnly: readOnly,
//         autofocus: false,
//         enabled: enabled,
//         keyboardType: inputType,
//         inputFormatters: inputFormatters,
//         textAlign: textAlign ?? TextAlign.start,
//
//         style: TextStyle(
//           fontSize: fontSize ?? 14.0,
//           fontWeight: fontWeight ?? FontWeight.normal,
//           color: textColor ?? Colors.black,
//           fontFamily: fontFamily,
//         ),
//         onTap: onTap,
//         onChanged: onValueChanged,
//         obscureText: obscureText,
//         validator: validator,
//         decoration: InputDecoration(
//           labelText: labelText,
//           hintText: hintText,
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//           labelStyle: TextStyle(
//             fontFamily: BROTHERFONT,
//             fontSize: 12,
//             color: AppColors.black,
//             fontWeight: FontWeight.w400,
//           ),
//           hintStyle: TextStyle(
//             fontFamily: BROTHERFONT,
//             fontSize: 14,
//             color: AppColors.lightgrey,
//             fontWeight: FontWeight.w400,
//           ),
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           contentPadding: EdgeInsets.symmetric(
//             vertical: paddingSize ?? 15,
//             horizontal: 15,
//           ),
//           focusedBorder: OutlineInputBorder(
//
//             borderSide: BorderSide(
//               width: 0.5,
//               color: borderColor ?? Color(0xffB493221A),
//             ),
//             borderRadius: borderRadius ?? BorderRadius.circular(100),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               width: 0.8,
//               color: borderColor ?? Color(0xffB493221A).withOpacity(0.1),
//             ),
//             borderRadius: borderRadius ?? BorderRadius.circular(100),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: borderRadius ?? BorderRadius.circular(100),
//             borderSide: BorderSide(
//               color: borderColor ?? AppColors.darkbrown,
//             ),
//           ),
//           filled: backgroundColor != null,
//           fillColor: backgroundColor,
//           counterText: "", // Hide the maxLength counter
//         ),
//       ),
//     ),
//   );
// }

Widget Messagefield({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? suffixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
  String? imagePath, // Image to be placed at the top-left
  double iconSize = 30.0, // Default icon size
  double topPadding = 8.0, // Customizable top padding for image
  double leftPadding = 8.0, // Customizable left padding for image
}) {
  return Container(
    margin: margin ?? EdgeInsets.zero,
    decoration: BoxDecoration(
      color: backgroundColor ?? AppColors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        // Top-left image
        if (imagePath != null)
          Positioned(
            top: 15, // Position at top
            left: 10, // Position at left
            child: Image.asset(imagePath, height: iconSize, width: iconSize),
          ),

        // TextField with padding to avoid overlapping with the image
        TextFormField(
          controller: controller,
          textCapitalization: TextCapitalization.sentences,
          enableInteractiveSelection: enableInteractiveSelection,
          maxLength: maxLength,
          readOnly: readOnly,
          autofocus: false,
          enabled: enabled,
          keyboardType: inputType ?? TextInputType.multiline,
          inputFormatters: inputFormatters,
          textAlign: textAlign ?? TextAlign.start,
          maxLines: null,
          minLines: 4,
          style: TextStyle(
            fontSize: fontSize ?? 14.0,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: textColor ?? Colors.black,
            fontFamily: fontFamily,
          ),
          onTap: onTap,
          onChanged: onValueChanged,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            suffixIcon: suffixIcon,

            // Custom Positioned Prefix Icon
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 15,
              ), // Adjust top and left padding
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 45, // Ensures enough space for the icon
              minHeight: 40,
            ),

            labelStyle: TextStyle(
              fontSize: 12,
              color: AppColors.black,
              fontWeight: FontWeight.w400,

            ),
            hintStyle: TextStyle(
              fontSize: 14,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w400,

            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,

            // contentPadding: EdgeInsets.only(
            //   top: 25, // Pushes text down
            //   left: 45, // Pushes text to the right to avoid overlap with icon
            //   right: 15,
            // ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
                color: borderColor ?? Color(0xffB493221A),
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.8,
                color: borderColor ?? Color(0xffB493221A).withOpacity(0.1),
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
            ),
            filled: backgroundColor != null,
            fillColor: backgroundColor,
            counterText: "", // Hide maxLength counter
          ),
        ),
      ],
    ),
  );
}

Widget rowelementbutton({
  required String title,
  double? fontSize,
  FontWeight? fontWeight,
  VoidCallback? onTap,
  double? width,
  double? height,
  Color? color,
  bool? gradient = true,
  bool? gradient1 = true,
  EdgeInsetsGeometry? margin,
  double elevation = 2.0,
  required String imagepath,
  double? radius, // Add elevation parameter
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 1, // Set the elevation for the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          radius ?? 100,
        ), // Match the container's border radius
      ),
      margin: margin ?? const EdgeInsets.only(left: 0.0, top: 0, right: 0),
      child: Container(
        padding: EdgeInsets.zero,
        height: height ?? 50,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          // border: Border.all(color: Color(0xff580E3F)),
          // gradient: const LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomRight,
          //   colors: [Color(0xffFDB323), Color(0xffD96F0A)],
          // ),
          borderRadius: BorderRadius.circular(radius ?? 100),
        ),
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(imagepath),
              ),

              text(
                title: title,
                fontSize: fontSize ?? 16,
                font: 'chivo',
                fontWeight: FontWeight.w700,
                color: Color(0xfffffffF),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget Custombuttonwhite({
  double? height,
  double? width,
  double? fontsize,
  FontWeight? fontweight,
  Color? color,
  Color? fontcolor,
  Color? shadowColor,
  Color? surfaceTintColor,
  double? elevation,
  ShapeBorder? shape,
  EdgeInsetsGeometry? margin,
  Clip? clipBehavior,
  Widget? child,
  bool semanticContainer = true,
  void Function()? onTap,
  TextEditingController? controller,
}) {
  return Container(
    height: height ?? 50, // Default height to prevent layout issues
    width: width, // Default width
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
        ),
      ],
    ),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisSize: MainAxisSize.min, // Prevent Row from expanding
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              border: InputBorder.none, // Remove default border
            ),
          ),
        ),
        SizedBox(width: 10), // Space between field and image
        Image.asset(
          "assets/images/media.png",
          width: 24, // Set a specific width
          height: 24, // Set a specific height
        ),
      ],
    ),
  );
}

Widget Messagewithoutemailfield({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  TextInputAction? textInputAction,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  ValueChanged<String>? onDone,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? suffixIcon,
  Widget? prefixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
  String? imagePath,
  double iconSize = 30.0,
  double topPadding = 8.0,
  double leftPadding = 8.0,
}) {
  return Container(
    height: height ?? 45, // Reduced height
    margin: margin ?? EdgeInsets.zero,
    decoration: BoxDecoration(
      color: backgroundColor ?? AppColors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(10),
    ),
    child: TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      enableInteractiveSelection: enableInteractiveSelection,
      maxLength: maxLength,
      readOnly: readOnly,
      textInputAction: textInputAction,
      autofocus: false,
      enabled: enabled,
      keyboardType: inputType ?? TextInputType.multiline,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      minLines: 1,
      maxLines: 1, // Reduced lines to keep it compact
      style: TextStyle(
        fontSize: fontSize ?? 12.0, // Slightly reduced font size
        fontWeight: fontWeight ?? FontWeight.normal,
        color: textColor ?? Colors.black,
        fontFamily: fontFamily,
      ),
      onTap: onTap,
      onChanged: onValueChanged,
      obscureText: obscureText,
      onFieldSubmitted: onDone,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,

        prefixIconConstraints: BoxConstraints(minWidth: 35, minHeight: 25),
        labelStyle: TextStyle(
          fontSize: 12,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          fontSize: 12,
          color: AppColors.greyColor,
          fontWeight: FontWeight.w400,

        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: borderColor ?? Color(0xffB493221A),
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: borderColor ?? Color(0xffB493221A).withOpacity(0.1),
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
        ),
        filled: backgroundColor != null,
        fillColor: backgroundColor,
        counterText: "", // Hide maxLength counter
      ),
    ),
  );
}

Widget DescriptionData({
  required String titleHint,
  String?
  descriptionText, // Instead of using controller, we pass the description as plain text
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
  double? height,
  int? maxLines,
  double? width,
  String? font,
  required BuildContext context,
  TextOverflow? overflow,
}) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title of the section
        sizeBox(height: 10),

        // Description container that expands with content
        Container(
          width:
          width ??
              double.infinity, // Ensure it takes full width or custom width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xFFF2F2F2),
            border: Border.all(color: AppColors.continueBorder),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  descriptionText ??
                      titleHint, // Display description or hint if no description
                  style: TextStyle(
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    color: color ?? AppColors.continueBorder,
                  ),
                  textAlign: textAlign ?? TextAlign.start, // Default alignment
                  overflow:
                  overflow ??
                      TextOverflow.visible, // Allow wrapping without ellipsis
                  softWrap: true, // Enable text wrapping
                ),
              ],
            ),
          ),
        ),
        sizeBox(height: 10),
      ],
    ),
  );
}

Widget canceltripformfield({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? suffixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
}) {
  return Container(
    margin: margin ?? EdgeInsets.zero,
    decoration: BoxDecoration(
      color: backgroundColor ?? AppColors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(10),
    ),
    child: TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      maxLength: maxLength,
      readOnly: readOnly,
      autofocus: false,
      enabled: enabled,
      keyboardType: inputType ?? TextInputType.multiline,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: null,
      minLines: 4,
      style: TextStyle(
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: textColor ?? Colors.black,
        fontFamily: fontFamily,
      ),
      onTap: onTap,
      onChanged: onValueChanged,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        // Removed prefixIcon padding to avoid extra space
        labelStyle: TextStyle(
          fontSize: 12,
          color: AppColors.black,
          fontWeight: FontWeight.w400,

        ),
        hintStyle: TextStyle(
          fontSize: 14,
          color: AppColors.greyColor,
          fontWeight: FontWeight.w400,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: borderColor ?? Color(0xffB493221A),
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: borderColor ?? Color(0xffB493221A).withOpacity(0.1),
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor ?? AppColors.continueBorder),
        ),
        filled: backgroundColor != null,
        fillColor: backgroundColor,
        counterText: "", // Hide maxLength counter
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ), // Added minimal padding
      ),
    ),
  );
}

Widget Messagefield1({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? suffixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
  String? imagePath, // Image to be placed at the top-left
  double iconSize = 30.0, // Default icon size
}) {
  return Container(
    margin: margin ?? EdgeInsets.zero,
    decoration: BoxDecoration(
      color: backgroundColor ?? Colors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        // Top-left image (if needed)
        if (imagePath != null)
          Positioned(
            top: 10,
            left: 10,
            child: Image.asset(imagePath, height: iconSize, width: iconSize),
          ),

        Padding(
          padding: EdgeInsets.all(0), // Ensure no extra padding
          child: TextFormField(
            controller: controller,
            textCapitalization: TextCapitalization.sentences,
            enableInteractiveSelection: enableInteractiveSelection,
            maxLength: maxLength,
            readOnly: readOnly,
            enabled: enabled,
            keyboardType: inputType ?? TextInputType.multiline,
            inputFormatters: inputFormatters,
            textAlign: textAlign ?? TextAlign.start,
            maxLines: null,
            minLines: 4,
            style: TextStyle(
              fontSize: fontSize ?? 14.0,
              fontWeight: fontWeight ?? FontWeight.normal,
              color: textColor ?? Colors.black,
              fontFamily: fontFamily,
            ),
            onTap: onTap,
            onChanged: onValueChanged,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              suffixIcon: suffixIcon,
              labelStyle: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: fontFamily,
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: fontFamily,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ), // Minimal padding
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: borderColor ?? Colors.brown,
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                  color: borderColor ?? Colors.brown.withOpacity(0.1),
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(color: borderColor ?? Colors.brown),
              ),
              filled: backgroundColor != null,
              fillColor: backgroundColor,
              counterText: "", // Hide maxLength counter
            ),
          ),
        ),
      ],
    ),
  );
}

Widget ratingmessageformfield({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  double? width,
  double? height,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLength,
  Color? backgroundColor,
  double? paddingSize,
  bool readOnly = false,
  bool? enableInteractiveSelection,
  TextInputType? inputType,
  String? fontFamily,
  EdgeInsetsGeometry? margin,
  List<TextInputFormatter>? inputFormatters,
  bool enabled = true,
  VoidCallback? onTap,
  ValueChanged<String>? onValueChanged,
  Widget? suffixIcon,
  Color? borderColor,
  BorderRadius? borderRadius,
  FormFieldValidator<String>? validator,
  bool obscureText = false,
  String? imagePath, // Image at the top-left
  double iconSize = 30.0, // Default icon size
  double topPadding = 8.0, // Top padding for image
  double leftPadding = 8.0, // Left padding for image
}) {
  return Container(
    margin: margin ?? EdgeInsets.zero, // Ensure no external margin
    decoration: BoxDecoration(
      color: backgroundColor ?? AppColors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        // Top-left image
        if (imagePath != null)
          Positioned(
            top: 15,
            left: 10,
            child: Image.asset(imagePath, height: iconSize, width: iconSize),
          ),

        // TextField without extra space
        Padding(
          padding: EdgeInsets.zero, // Remove unwanted padding
          child: TextFormField(
            controller: controller,
            textCapitalization: TextCapitalization.sentences,
            enableInteractiveSelection: enableInteractiveSelection,
            maxLength: maxLength,
            readOnly: readOnly,
            autofocus: false,
            enabled: enabled,
            keyboardType: inputType ?? TextInputType.multiline,
            inputFormatters: inputFormatters,
            textAlign: textAlign ?? TextAlign.start,
            maxLines: null,
            minLines: 4,
            style: TextStyle(
              fontSize: fontSize ?? 14.0,
              fontWeight: fontWeight ?? FontWeight.normal,
              color: textColor ?? Colors.black,
              fontFamily: fontFamily,
            ),
            onTap: onTap,
            onChanged: onValueChanged,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              suffixIcon: suffixIcon,

              // Removed `prefixIcon` padding
              prefixIcon: null,

              // Removed constraints that could push text
              prefixIconConstraints: null,

              labelStyle: TextStyle(
                fontSize: 12,
                color: AppColors.black,
                fontWeight: FontWeight.w400,

              ),
              hintStyle: TextStyle(
                fontSize: 14,
                color: AppColors.greyColor,
                fontWeight: FontWeight.w400,

              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,

              // Updated `contentPadding` to remove extra space
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: borderColor ?? Color(0xffB493221A),
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                  color: borderColor ?? Color(0xffB493221A).withOpacity(0.1),
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: borderColor ?? AppColors.continueBorder,
                ),
              ),
              filled: backgroundColor != null,
              fillColor: backgroundColor,
              counterText: "", // Hide maxLength counter
            ),
          ),
        ),
      ],
    ),
  );
}

Widget cachednetworkimagesss({
  required String url,
  double? imageheight,
  double? imagewidth,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder:
        (context, imageProvider) => Container(
      height: imageheight,
      width: imagewidth,
      decoration: BoxDecoration(
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

Widget customgridviewbuilder({
  required String amminitytitle,
  double? fontsize,
  FontWeight? fontweight,
  Color? fontcolor,
  required int itecount,
}) {
  return GridView.builder(
    shrinkWrap: true,

    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number of columns
      crossAxisSpacing: 5, // Horizontal space between tiles
      mainAxisSpacing: 5, // Vertical space between tiles
      childAspectRatio: 5, // Width / Height ratio
    ),
    itemCount: itecount, // Total number of items
    itemBuilder: (context, index) {
      return textinter(
        title: amminitytitle,
        fontSize: fontsize,
        fontWeight: fontweight,
        color: fontcolor, // fixed typo here
      );
    },
  );
}


Widget getTextwrapped(
    {required String data,
      required double fontSize,
      required Color color,
      TextAlign? textAlign,
      int? maxLines,
      required double dividevalue,
      required BuildContext context,
      TextOverflow? textOverflow,
      TextDecoration? decoration,
      FontWeight? fontweight}) {
  return SizedBox(
    width: MediaQuery.of(context!).size.width / dividevalue,
    child: Text(
      data,
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: TextStyle(
          decoration: decoration,
          fontSize: fontSize,
          fontFamily: "taviraj",
          color: color,
          fontWeight: fontweight ?? FontWeight.w500),
      textAlign: textAlign,
    ),
  );
}