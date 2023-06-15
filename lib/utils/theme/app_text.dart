import 'package:flutter/material.dart';

import 'app_typography.dart';
import 'colors.dart';

class AppText {
  /// bold text
  static Text h1Bold(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h1Bold(textColor: textColor));

  static Text h2Bold(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h2Bold(textColor: textColor));

  static Text h3Bold(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h3Bold(textColor: textColor));

  static Text h4Bold(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h4Bold(textColor: textColor));

  static Text h5Bold(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h5Bold(textColor: textColor));

  static Text h6Bold(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h6Bold(textColor: textColor));

  static Text paragraphBold(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.paragraphBold(textColor: textColor));

  static Text descriptionBold(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.descriptionBold(textColor: textColor));

  static Text captionBold(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.captionBold(textColor: textColor));

  static Text subHeadingBold(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.subHeadingBold(textColor: textColor));

  static Text xsmBold(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.xsmBold(textColor: textColor));

  /// medium text
  static Text h1Medium(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h1Medium(textColor: textColor));

  static Text h2Medium(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h2Medium(textColor: textColor));

  static Text h3Medium(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign, TextOverflow? overflow}) =>
      Text(text,
          textAlign: textAlign,
          overflow: overflow,
          style: AppTypography.h3Medium(textColor: textColor));

  static Text h4Medium(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h4Medium(textColor: textColor));

  static Text h5Medium(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h5Medium(textColor: textColor));

  static Text h6Medium(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h6Medium(textColor: textColor));

  static Text paragraphMedium(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.paragraphMedium(textColor: textColor));

  static Text descriptionMedium(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text,
          textAlign: textAlign, style: AppTypography.descriptionMedium(textColor: textColor));

  static Text captionMedium(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.captionMedium(textColor: textColor));

  static Text subHeadingMedium(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.subHeadingMedium(textColor: textColor));

  static Text xsmMedium(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.xsmMedium(textColor: textColor));

  /// regular text
  static Text h1Regular(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h1Regular(textColor: textColor));

  static Text h2Regular(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h2Regular(textColor: textColor));

  static Text h3Regular(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h3Regular(textColor: textColor));

  static Text h4Regular(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h4Regular(textColor: textColor));

  static Text h5Regular(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h5Regular(textColor: textColor));

  static Text h6Regular(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.h6Regular(textColor: textColor));

  static Text paragraphRegular(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.paragraphRegular(textColor: textColor));

  static Text descriptionRegular(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text,
          textAlign: textAlign, style: AppTypography.descriptionRegular(textColor: textColor));

  static Text captionRegular(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.captionRegular(textColor: textColor));

  static Text subHeadingRegular(String text,
          {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text,
          textAlign: textAlign, style: AppTypography.subHeadingRegular(textColor: textColor));

  static Text xsmRegular(String text, {Color? textColor = AppColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: AppTypography.xsmRegular(textColor: textColor));
}
