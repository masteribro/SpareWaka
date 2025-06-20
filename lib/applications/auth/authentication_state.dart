abstract class AuthenticationState {}

class AuthenticationStateUninitialized extends AuthenticationState {}

class AuthenticationStateLoading extends AuthenticationState {
  final bool isGoogle;

  AuthenticationStateLoading({this.isGoogle = false});

  @override
  String toString() {
    return 'AuthenticationStateLoading{isGoogle: $isGoogle}';
  }
}