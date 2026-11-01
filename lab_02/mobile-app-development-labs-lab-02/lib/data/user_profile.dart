/// Дані користувача (статична заглушка).
class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.home,
  });

  final String name;
  final String email;
  final String phone;
  final String home;
}
