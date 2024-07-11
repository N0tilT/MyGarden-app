import 'package:email_validator/email_validator.dart';

String? studendaEmailValidator(String? email) =>
    email != null && !EmailValidator.validate(email)
        ? "Введён некорректный email"
        : null;
