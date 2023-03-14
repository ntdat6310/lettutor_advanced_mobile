import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/data/fake_data.dart';
import 'package:lettutor_advanced_mobile/ui/pages/schedule_history/components/schedule_history_card.dart';
import 'package:lettutor_advanced_mobile/ui/widgets/custom_appbar.dart';

import '../../../data/models/schedule_history.dart';
import '../../widgets/custom_search_bar.dart';

class ScheduleHistoryPage extends StatelessWidget {
  ScheduleHistoryPage({Key? key}) : super(key: key);

  final List<ScheduleHistory> histories = FakeData().getScheduleHistories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Schedule History",
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomSearchBar(
                      onChanged: (value) {
                        print(value);
                      },
                      searchHint: 'Enter tutor\'s name'),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                        histories.length,
                        (index) => ScheduleHistoryCard(
                              history: histories[index],
                            )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
