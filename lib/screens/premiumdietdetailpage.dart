import 'package:flutter/material.dart';
import 'package:shapeup/screens/daily_diet_plan_page.dart';
import '../models/diet_model.dart';

class PremiumDietDetailPage extends StatelessWidget {
  final DietModel dietModel;
  const PremiumDietDetailPage({Key? key, required this.dietModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dietModel.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                dietModel.imageURL,
                height: 180,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                dietModel.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                dietModel.caution,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Duration: ${dietModel.duration}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Difficulty: ${dietModel.difficulty}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Commitment: ${dietModel.commitment}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Choose this plan if:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) => Padding(
              //     padding: const EdgeInsets.only(bottom: 8.0),
              //     child: Text(
              //       '- ${dietModel.planCondition[index]}',
              //       style: const TextStyle(
              //         fontSize: 16,
              //       ),
              //     ),
              //   ),
              //   itemCount: dietModel.planCondition.length,
              // ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DailyDietPlanPage()));
                  },
                  child: const Text('Start Plan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
