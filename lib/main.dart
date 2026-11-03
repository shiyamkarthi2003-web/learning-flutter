import 'package:flutter/material.dart';

void main() {
  runApp(const FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B3D),
          surface: Colors.white,
        ),
        fontFamily: 'Arial',
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _ink = Color(0xFF32343E);
  static const _muted = Color(0xFFA0A5BA);
  static const _card = Color(0xFFF6F8FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 26, 24, 29),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 55,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 24),
                    _buildProfile(),
                    const SizedBox(height: 32),
                    _buildGroup([
                      _ProfileRow(
                        label: 'Personal Info',
                        icon: Icons.person_outline,
                        color: const Color(0xFFFF5B35),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const PersonalInfoScreen(),
                            ),
                          );
                        },
                      ),
                      _ProfileRow(
                        label: 'Addresses',
                        icon: Icons.map_outlined,
                        color: const Color(0xFF645BFF),
                      ),
                    ]),
                    const SizedBox(height: 20),
                    _buildGroup([
                      _ProfileRow(
                        label: 'Cart',
                        icon: Icons.shopping_bag_outlined,
                        color: const Color(0xFF4DA9FF),
                      ),
                      _ProfileRow(
                        label: 'Favourite',
                        icon: Icons.favorite_border,
                        color: const Color(0xFFD94AFF),
                      ),
                      _ProfileRow(
                        label: 'Notifications',
                        icon: Icons.notifications_none,
                        color: const Color(0xFFFF9800),
                      ),
                      _ProfileRow(
                        label: 'Payment Method',
                        icon: Icons.credit_card_outlined,
                        color: const Color(0xFF4DA9FF),
                      ),
                    ]),
                    const SizedBox(height: 20),
                    _buildGroup([
                      _ProfileRow(
                        label: 'FAQs',
                        icon: Icons.help_outline,
                        color: const Color(0xFFFF5B35),
                      ),
                      _ProfileRow(
                        label: 'User Reviews',
                        icon: Icons.grid_view_outlined,
                        color: const Color(0xFF35D8D2),
                      ),
                      _ProfileRow(
                        label: 'Settings',
                        icon: Icons.settings_outlined,
                        color: const Color(0xFF665BFF),
                      ),
                    ]),
                    const SizedBox(height: 20),
                    _buildGroup([
                      _ProfileRow(
                        label: 'Log Out',
                        icon: Icons.logout,
                        color: const Color(0xFFFF5B35),
                      ),
                    ]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: _HeaderButton(icon: Icons.arrow_back_ios_new, label: 'Back'),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 61),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Color(0xFF181C2E),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _HeaderButton(
              icon: Icons.more_horiz,
              label: 'More options',
              onTap: () => _showMessage(context, 'More options'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          const CircleAvatar(radius: 50, backgroundColor: Color(0xFFFFC4AC)),
          const SizedBox(width: 32),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Vishal Khadok',
                style: TextStyle(
                  color: _ink,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'I love fast food',
                style: TextStyle(
                  color: _muted,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGroup(List<_ProfileRow> rows) {
    return Container(
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(mainAxisSize: MainAxisSize.min, children: rows),
    );
  }
}

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  static const _ink = Color(0xFF32343E);
  static const _muted = Color(0xFF6B6E82);
  static const _card = Color(0xFFF6F8FA);

  final _nameController = TextEditingController(text: 'Vishal Khadok');
  final _emailController = TextEditingController(text: 'hello@halallab.co');
  final _phoneController = TextEditingController(text: '408-841-0926');
  bool _isEditing = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 26, 24, 29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildProfile(),
              const SizedBox(height: 32),
              _buildDetailsCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 45,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: _HeaderButton(icon: Icons.arrow_back_ios_new, label: 'Back'),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 61),
              child: Text(
                'Personal Info',
                style: TextStyle(
                  color: Color(0xFF181C2E),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => setState(() => _isEditing = !_isEditing),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFFF7622),
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                _isEditing ? 'DONE' : 'EDIT',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          const CircleAvatar(radius: 50, backgroundColor: Color(0xFFFFC4AC)),
          const SizedBox(width: 32),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _nameController.text,
                style: const TextStyle(
                  color: Color(0xFF181C2E),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'I love fast food',
                style: TextStyle(
                  color: Color(0xFFA0A5BA),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildDetailRow(
            label: 'Full Name',
            controller: _nameController,
            icon: Icons.person_outline,
            color: const Color(0xFFFF5B35),
          ),
          _buildDetailRow(
            label: 'Email',
            controller: _emailController,
            icon: Icons.mail_outline,
            color: const Color(0xFF645BFF),
            keyboardType: TextInputType.emailAddress,
          ),
          _buildDetailRow(
            label: 'Phone Number',
            controller: _phoneController,
            icon: Icons.phone_outlined,
            color: const Color(0xFF4DA9FF),
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required Color color,
    TextInputType? keyboardType,
  }) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 19, color: color),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _isEditing
                  ? TextField(
                      controller: controller,
                      keyboardType: keyboardType,
                      style: const TextStyle(color: _muted, fontSize: 14),
                      decoration: InputDecoration(
                        labelText: label.toUpperCase(),
                        labelStyle: const TextStyle(
                          color: _ink,
                          fontSize: 12,
                          letterSpacing: 0.4,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label.toUpperCase(),
                          style: const TextStyle(
                            color: _ink,
                            fontSize: 13,
                            letterSpacing: 0.4,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          controller.text,
                          style: const TextStyle(color: _muted, fontSize: 14),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({
    required this.label,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: InkWell(
        onTap: onTap ?? () => _showMessage(context, label),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 19, color: color),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: ProfileScreen._ink,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF7C8293),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFEEF1F5),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap:
            onTap ??
            () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            },
        child: SizedBox(
          width: 45,
          height: 45,
          child: Icon(icon, size: 19, color: const Color(0xFF181C2E)),
        ),
      ),
    );
  }
}

void _showMessage(BuildContext context, String label) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text('$label selected'),
        duration: const Duration(seconds: 1),
      ),
    );
}
