import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:flutter_app/widgets/custom_button_icon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                  Expanded(
                      child: Container(
                    height: 45,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        labelText: "Search..",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style:
                          TextStyle(fontSize: 15, color: AppColors.typography),
                    ),
                  )),
                ],
              ),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.spaceAround,
              children: [
                CustomButtonIcon(
                    icon: Icons.discount,
                    colorButton: AppColors.orange,
                    onTap: () {},
                    label: "Discount"),
                CustomButtonIcon(
                    icon: Icons.broadcast_on_personal_outlined,
                    colorButton: AppColors.primary,
                    onTap: () {},
                    label: "Credit"),
                CustomButtonIcon(
                    icon: Icons.payment,
                    colorButton: AppColors.secondary,
                    onTap: () {},
                    label: "Payment"),
                CustomButtonIcon(
                    icon: Icons.phone_android_sharp,
                    colorButton: AppColors.other,
                    onTap: () {},
                    label: "TopUp"),
                CustomButtonIcon(
                    icon: Icons.payments_rounded,
                    colorButton: AppColors.other1,
                    onTap: () {},
                    label: "Voucher"),
                CustomButtonIcon(
                    icon: Icons.paypal_outlined,
                    colorButton: AppColors.other2,
                    onTap: () {},
                    label: "Bill"),
                CustomButtonIcon(
                    icon: Icons.monetization_on_outlined,
                    colorButton: AppColors.other3,
                    onTap: () {},
                    label: "Claim"),
                CustomButtonIcon(
                    icon: Icons.games,
                    colorButton: AppColors.purple,
                    onTap: () {},
                    label: "Games"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.label,
  });

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
      ),
    );
  }
}
