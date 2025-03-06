import 'package:flutter/cupertino.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';

import '../../payment/widgets/profile_payment_card_wg.dart';

class ContactUsTab extends StatelessWidget {
  const ContactUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: appH(24),
      children: [
        ProfilePaymentCardWg(
          image: "assets/icons/headphones.png",
          text: "Customer Service",
        ),
        ProfilePaymentCardWg(
          image: "assets/icons/whatsapp.png",
          text: "WhatsApp",
        ),
        ProfilePaymentCardWg(
          image: "assets/icons/internet.png",
          text: "Website",
        ),
        ProfilePaymentCardWg(
          image: "assets/icons/facebook.png",
          text: "Facebook",
        ),
        ProfilePaymentCardWg(
          image: "assets/icons/twitter.png",
          text: "Twitter",
        ),
        ProfilePaymentCardWg(
          image: "assets/icons/instagram.png",
          text: "Instagram",
        ),
      ],
    );
  }
}
