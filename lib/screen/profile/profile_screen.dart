import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/providers/profile_provider.dart';
import 'package:flutter_app/screen/login/login_screen.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:flutter_app/widgets/custom_button_icon.dart';
import 'package:flutter_app/widgets/cutom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? token;

  void initState() {
    super.initState();
    getProfile();
  }

  Future<void> getProfile() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    await authProvider.getToken();
    token = await authProvider.token;

    if (token != null) {
      await profileProvider.getProfile(token!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
        body: Consumer<ProfileProvider>(builder: (context, data, child) {
      return data.isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          profileProvider.data['avatar'] ?? ''),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  profileProvider.data['name'],
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.typography),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  profileProvider.data['role'],
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.typography),
                                ),
                              ],
                            )
                          ],
                        )),
                        InkWell(
                          onTap: () {},
                          child: Transform.translate(
                            offset: Offset(0, -20),
                            child: Icon(Icons.settings),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Order',
                          style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.typography),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'See My Order',
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.typography),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: AppColors.typography,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: [
                      CustomButtonIcon(
                          icon: Icons.payment,
                          colorButton: AppColors.other1,
                          onTap: () {},
                          label: "Select Payment"),
                      CustomButtonIcon(
                          icon: Icons.wifi_protected_setup_sharp,
                          colorButton: AppColors.other1,
                          onTap: () {},
                          label: "Process"),
                      CustomButtonIcon(
                          icon: Icons.delivery_dining_outlined,
                          colorButton: AppColors.other1,
                          onTap: () {},
                          label: "Delivery"),
                      CustomButtonIcon(
                          icon: Icons.cancel_outlined,
                          colorButton: AppColors.other1,
                          onTap: () {},
                          label: "Cancel"),
                      CustomButtonIcon(
                          icon: Icons.star,
                          colorButton: AppColors.other1,
                          onTap: () {},
                          label: "Rating"),
                      CustomButtonIcon(
                          icon: Icons.reviews,
                          colorButton: AppColors.other1,
                          onTap: () {},
                          label: "My Review"),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: CustomButton(
                        text: "Sign Out",
                        fontSize: 16,
                        textColor: Colors.white,
                        buttonColor: AppColors.primary,
                        onPressed: () {}),
                  )
                ],
              ),
            ));
    }));
  }
}
