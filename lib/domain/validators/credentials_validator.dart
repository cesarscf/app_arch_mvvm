import 'package:app_arch_mvvm/domain/dtos/credentials.dart';
import 'package:lucid_validation/lucid_validation.dart';

class CredentialsValidator extends LucidValidator<Credentials> {
  CredentialsValidator() {
    ruleFor((user) => user.email, key: 'email') //
        .notEmpty()
        .validEmail();

    ruleFor((user) => user.password, key: 'password') //
        .notEmpty()
        .minLength(8, message: 'Must be at least 8 characters long')
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveNumber()
        .mustHaveSpecialCharacter();
  }
}
