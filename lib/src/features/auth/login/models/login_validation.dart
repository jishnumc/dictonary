sealed class ValidationResult {
  const ValidationResult();
}

final class Valid extends ValidationResult {
  const Valid();
}

final class Invalid extends ValidationResult {
  final String message;
  const Invalid(this.message);
}
