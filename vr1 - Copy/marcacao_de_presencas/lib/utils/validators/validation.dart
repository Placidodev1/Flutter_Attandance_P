

class TValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email necessario';
    }

    // Regular expression para validacao de Email
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Email invalido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password necessario';
    }
    // verifica tamanho minimo da password
    if (value.length < 6) {
      return ' A password tem de ter no minimo 6 caracteres';
    }

    // verifica uppercase letras
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password deve conter ao menos 1 letra maiuscula';
    }

    // verifica numeros
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password deve conter ao menos 1 numero';
    }

    // verifica   caracteres especiais
    if (!value.contains(RegExp(r'^[a-zA-Z0-9@#$%^&*]+$'))) {
      return 'Password deve conter ao menos 1 caracter especial';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return ' Numero de telefone necessario';
    }

    // Regular expration para validar um numero de 9 digitos
    final phoneRegExp = RegExp(r'^\d{9}$');

    if (!phoneRegExp.hasMatch(value)) {
      return ' Telefone invalido (9 digitos  necessarios)';
    }
    return null;
  }
  
}
