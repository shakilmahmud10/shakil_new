import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottomsheet1(),
    );
  }
}

class Bottomsheet1 extends StatelessWidget {
  const Bottomsheet1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3A3A3A),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const CustomBottomSheet1(),
            );
          },
          child: const Text("Show Logout BottomSheet"),
        ),
      ),
    );
  }
}

/// ---------------- REUSABLE BOTTOMSHEET ----------------
class CustomBottomSheet1 extends StatelessWidget {
  const CustomBottomSheet1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Profile image with small circle using Stack
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/300", // For demo only (you may replace with AssetImage)
                ),
              ),
              Positioned(
                bottom: -4,
                right: -4,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF6CB56C),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.logout,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Title text
          const Text(
            "Are you certain you want to log out of your account?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111111),
              height: 1.4,
            ),
          ),

          const SizedBox(height: 12),

          // Subtitle text
          const Text(
            "Once you log out, you will need to sign in again to access your data.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF666666),
              height: 1.4,
            ),
          ),

          const SizedBox(height: 28),

          // Divider line
          const Divider(
            thickness: 1,
            color: Color(0xFFE5E5E5),
          ),
          const SizedBox(height: 12),

          // Cancel + Logout Buttons
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7F1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6CB56C), Color(0xFF6CB56C)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // logout logic here
                    },
                    child: const Text(
                      "Yes, Logout",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}