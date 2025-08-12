abstract class Validators {
  static bool nameValidation(String name) {
    // يتحقق أن الاسم ليس فارغًا ويحتوي على أحرف فقط وطوله لا يقل عن 2
    return name.trim().isNotEmpty && RegExp(r"^[a-zA-Z\u0600-\u06FF\s]{2,}$").hasMatch(name);
  }

  static bool emailValidation(String email) {
    // يتحقق من أن البريد الإلكتروني بصيغة صحيحة
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }

  static bool passwordValidation(String password) {
    // يتحقق من أن كلمة المرور تحتوي على 8 أحرف على الأقل من حروف أو أرقام
    return RegExp(r'^[a-zA-Z0-9]{8,}$').hasMatch(password);
  }

  static bool phoneValidation(String phone) {
    // يدعم الأرقام التي تبدأ بـ "+" أو "00" أو تبدأ مباشرة بمفتاح الدولة وأرقام
    return RegExp(r'^(\+|00)?[1-9][0-9]{6,14}$').hasMatch(phone);
  }
}
