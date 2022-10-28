import 'package:flutter/material.dart';
import 'package:shapeup/models/daily_diet_model.dart';
import 'package:shapeup/services/database_service.dart';

class DailyDietPlanPage extends StatelessWidget {
  const DailyDietPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<String>>(
          stream: DatabaseService().dailyDietInfo,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        snapshot.data![index],
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
