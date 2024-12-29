import 'package:bookly_application/features/you/presentation/widgets/profile_view_body.dart';
import 'package:flutter/cupertino.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return const ProfileViewBody();
  }
}
