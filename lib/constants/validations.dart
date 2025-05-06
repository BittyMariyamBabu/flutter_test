/// Validates a password string.
///
/// Returns an error message if the password is null or empty.
/// Otherwise, returns `null` indicating the password is valid.
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty';
  }
  return null; // Password is valid
}

/// Validates a username string.
///
/// Returns an error message if the username is null or empty.
/// Otherwise, returns `null` indicating the username is valid.
String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username cannot be empty';
  }
  return null; // Username is valid
}

