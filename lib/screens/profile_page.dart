import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLargeScreen =
        MediaQuery.of(context).size.width > AppConstants.mobileBreakpoint;

    final double avatarRadius = isLargeScreen ? 70 : 50;
    final double nameFontSize = isLargeScreen ? AppConstants.fontXXLarge + 2 : AppConstants.fontXLarge + 2;
    final double emailFontSize = isLargeScreen ? AppConstants.fontMedium : AppConstants.fontSmall;
    final double logoutButtonFontSize = isLargeScreen ? AppConstants.fontMedium : AppConstants.fontSmall;
    final double buttonHorizontalPadding = isLargeScreen ? 30 : 20;
    final double buttonVerticalPadding = isLargeScreen ? 15 : 12;
    final double mainPadding = isLargeScreen ? AppConstants.paddingLarge : AppConstants.paddingMedium;
    final double elementSpacing = AppConstants.paddingSmall;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: isLargeScreen ? AppConstants.fontXLarge : AppConstants.fontLarge,
            fontWeight: FontWeight.bold,
            color: theme.appBarTheme.titleTextStyle?.color ?? Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor ?? colorScheme.primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(mainPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: avatarRadius,
                backgroundColor: colorScheme.secondary,
                child: Text(
                  'JD',
                  style: TextStyle(
                    fontSize: avatarRadius * 0.7,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
              ),
              SizedBox(height: elementSpacing),

              Text(
                'Jane Doe',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: nameFontSize,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.titleLarge?.color ?? colorScheme.onSurface,
                ),
              ),
              SizedBox(height: elementSpacing / 2),

              Text(
                'jane.doe@example.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: emailFontSize,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: isLargeScreen ? AppConstants.paddingMedium * 1.5 : AppConstants.paddingMedium),

              ElevatedButton(
                onPressed: () {
                  print('Logout tapped');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonHorizontalPadding,
                    vertical: buttonVerticalPadding,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: logoutButtonFontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}