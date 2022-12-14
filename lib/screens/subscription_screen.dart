import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:shapeup/models/subscription_model.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  List<SubscriptionModel> subscriptionPlans = [
    SubscriptionModel(
        title: 'NPR 80.00 per 1 month', price: 80.00, isSelected: false),
    SubscriptionModel(
        title: 'NPR 235.00 per 3 months', price: 235.00, isSelected: false),
    SubscriptionModel(
        title: 'NPR 440.00 per 6 months', price: 440.00, isSelected: false),
    SubscriptionModel(
        title: 'NPR 850.00 per 12 months', price: 850.00, isSelected: false),
  ];

  int? selectedIndex;

  List<String> includedList = [
    'Ad-free',
    'Planned diet',
    'Workout suggestions from tranier',
  ];

  getAmt() {
    if (selectedIndex != null) {
      return (subscriptionPlans[selectedIndex!].price * 100).toInt();
    }
    return null; //returns the amount to be payed in paisa
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subscription',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white60,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.teal.shade100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Lets Go Pro',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.only(bottom: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subscriptionPlans.length,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 0.0,
                color: Colors.white70.withOpacity(0.3),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: CheckboxListTile(
                  value: subscriptionPlans[index].isSelected,
                  onChanged: (val) {
                    for (var element in subscriptionPlans) {
                      setState(() {
                        element.isSelected = false;
                      });
                    }
                    setState(() {
                      subscriptionPlans[index].isSelected = true;
                      selectedIndex = index;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  visualDensity: const VisualDensity(vertical: -3),
                  contentPadding: const EdgeInsets.only(left: 8, right: 10),
                  title: Text(
                    subscriptionPlans[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text('Renew in -- month'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Whats Included',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  ListView.builder(
                    itemCount: includedList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        includedList[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 10),
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      minVerticalPadding: 0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(top: 20, bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  final amount = getAmt();
                  if (amount == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Please selected a plan to continue.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                    return;
                  }
                  KhaltiScope.of(context).pay(
                    config: PaymentConfig(
                      amount: getAmt(),
                      productIdentity: 'dells-sssssg5-g5510-2021',
                      productName: 'Product Name',
                    ),
                    preferences: [
                      PaymentPreference.khalti,
                    ],
                    onSuccess: (su) {
                      const successsnackBar = SnackBar(
                        content: Text('Payment Successful'),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(successsnackBar);
                    },
                    onFailure: (fa) {
                      const failedsnackBar = SnackBar(
                        content: Text('Payment Failed'),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(failedsnackBar);
                    },
                    onCancel: () {
                      const cancelsnackBar = SnackBar(
                        content: Text('Payment Cancelled'),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(cancelsnackBar);
                    },
                  );
                },
                child: const Text(
                  'Upgrade to Premium',
                  style: const TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffe6e7ec)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
