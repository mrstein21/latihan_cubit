import 'package:basic_flutter/mixins/constant/text_style.dart';
import 'package:flutter/material.dart';

import 'color.dart';
import 'constant.dart';

final kInputDefaultBorderRound = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: kColorBlack),
);
final kInputDisabledBorderRound = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: kColorMuted),
);
final kInputErrorBorderRound = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Colors.red),
);


InputDecoration get kInputPrimary => InputDecoration(
  hintStyle: kTextAveRom14.copyWith(color: kColorMuted),
  errorStyle: kTextAveRom12.copyWith(color: Colors.red),
  isDense: true,
  isCollapsed: true,
  errorBorder: kInputErrorBorderRound,
  focusedErrorBorder: kInputErrorBorderRound.copyWith(
    borderSide: const BorderSide(color: Colors.red, width: 1.5),
  ),
  focusedBorder: kInputDefaultBorderRound.copyWith(
    borderSide: const BorderSide(color: kColorPrimary, width: 1.5),
  ),
  contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2,vertical: kDefaultPadding/2),
  enabledBorder: kInputDefaultBorderRound,
  disabledBorder: kInputDisabledBorderRound,
  border: kInputDefaultBorderRound,
);