class TExceptions implements Exception {
  final String message;

  const TExceptions([this.message = 'An unknown exception occured.']);

  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('Email already exist.');
      case 'invalid-email':
        return const TExceptions('Email is not valid or badly formatted.');
      case 'weak-password':
        return const TExceptions('Please enter a stronger password.');
      case 'user-disabled':
        return const TExceptions('This user has been disabled. Please contact support for help.');
      case 'user-not-found':
        return const TExceptions('Invalid details. Please create an account');
      case 'wrong-password':
        return const TExceptions('Incorrect password. Please try again.');
      default:
        return const TExceptions();
    }
  }
}