import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:get/get.dart';

String? validator(String? value, String type, int min, int max) {
  if (value == null || value.trim().isEmpty) {
    return KeyLanguage.empty.tr;
  } else {
    value = value.trim();

    if (ConstantKey.usernameValidator == type) {
      if (!GetUtils.isUsername(value)) {
        return KeyLanguage.invalidUsername.tr;
      }
    } else if (ConstantKey.emailValidator == type) {
      if (!GetUtils.isEmail(value)) {
        return KeyLanguage.invalidEmail.tr;
      }
    } else if (ConstantKey.passwordValidator == type) {
      if (GetUtils.isNum(value)) {
        if (value.length < min) {
          return KeyLanguage.lessMin.tr + ConstantScale.minPassword.toString();
        }
        if (value.length > max) {
          return KeyLanguage.greaterMax.tr +
              ConstantScale.maxPassword.toString();
        }
      } else {
        return KeyLanguage.invalidPassword.tr;
      }
    } else if (ConstantKey.phoneValidator == type) {
      if (!GetUtils.isPhoneNumber(value)) {
        return KeyLanguage.invalidPhone.tr;
      }
    } else if (ConstantKey.ageValidator == type) {
      if (!GetUtils.isNum(value)) {
        return KeyLanguage.enterNumber.tr;
      }
      int age = int.tryParse(value) ?? 0;
      if (age < min) {
        return KeyLanguage.lessMin.tr + min.toString();
      }
      if (age > max) {
        return KeyLanguage.greaterMax.tr + max.toString();
      }
    }
    return null;
  }
}

String? validatorGeneral(String? value) {
  if (value == null || value.trim().isEmpty) {
    return KeyLanguage.empty.tr;
  }
  return null;
}

String? validatorDigital(String? value) {
  if (value == null || value.trim().isEmpty) {
    return KeyLanguage.empty.tr;
  } else {
    final trimmedValue = value.trim();
    if (num.tryParse(trimmedValue) == null) {
      return KeyLanguage.enterNumber.tr;
    }
  }
  return null;
}

String? validatorDigitalWithNull(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  } else {
    final trimmedValue = value.trim();
    if (num.tryParse(trimmedValue) == null) {
      return KeyLanguage.enterNumber.tr;
    }
  }
  return null;
}
