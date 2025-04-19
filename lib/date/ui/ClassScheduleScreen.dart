import 'package:flutter/material.dart';

class ClassScheduleScreen extends StatefulWidget {
  const ClassScheduleScreen({super.key});

  @override
  State<ClassScheduleScreen> createState() => _ClassScheduleScreenState();
}

class _ClassScheduleScreenState extends State<ClassScheduleScreen> {
  // List of Map to store the schedule data
  final List<Map<String, dynamic>> scheduleData = [
    {
      'time': '10 AM',
      'subject': 'Applied Mathematics',
      'teacher': 'Mr. Tripathy',
      'timeRange': '10:00-10:45',
      'progressValue': 0.8,
      'progressColor': Colors.red,
      'isRecess': false,
    },
    {
      'time': '11 AM',
      'subject': 'Engineering Materials',
      'teacher': 'Mr. Tripathy',
      'timeRange': '10:45-11:30',
      'progressValue': 0.6,
      'progressColor': Colors.green,
      'isRecess': false,
    },
    {
      'time': '12 AM',
      'subject': 'Mechanics of Solids',
      'teacher': 'Mr. Tripathy',
      'timeRange': '11:30-12:15',
      'progressValue': 0.4,
      'progressColor': Colors.amber,
      'isRecess': false,
    },
    {
      'time': '01 PM',
      'subject': 'Computer Aided Drafting',
      'teacher': 'Mr. Tripathy',
      'timeRange': '12:15-1:00',
      'progressValue': 0.3,
      'progressColor': Colors.blue,
      'isRecess': false,
    },
    {
      'time': '',
      'subject': 'RECESS',
      'teacher': '',
      'timeRange': '',
      'progressValue': 0.0,
      'progressColor': Colors.redAccent,
      'isRecess': true,
    },
    {
      'time': '02 PM',
      'subject': 'Thermal Engineering',
      'teacher': 'Mr. Tripathy',
      'timeRange': '01:45-2:30',
      'progressValue': 0.5,
      'progressColor': Colors.redAccent,
      'isRecess': false,
    },
    {
      'time': '03 PM',
      'subject': 'Workshop Technology',
      'teacher': 'Mr. Tripathy',
      'timeRange': '02:30-3:15',
      'progressValue': 0.7,
      'progressColor': Colors.amber,
      'isRecess': false,
    },
    {
      'time': '04 PM',
      'subject': 'Workshop Technology',
      'teacher': 'Mr. Tripathy',
      'timeRange': '03:15-4:00',
      'progressValue': 0.7,
      'progressColor': Colors.amber,
      'isRecess': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: scheduleData.length,
        itemBuilder: (context, index) {
          final item = scheduleData[index];

          if (item['isRecess']) {
            return _buildRecessCard(item);
          } else {
            return _buildClassCard(item);
          }
        },
      ),
    );
  }

  Widget _buildClassCard(Map<String, dynamic> classData) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time column
          Container(
            width: 60,
            padding: const EdgeInsets.only(left: 12, top: 16),
            child:
                classData['time'] == '10 AM'
                    ? Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        classData['time'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    )
                    : classData['time'] == '11 AM'
                    ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        classData['time'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    )
                    : classData['time'] == '12 AM'
                    ? Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                        classData['time'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    )
                    : classData['time'] == '01 PM'
                    ? Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Text(
                        classData['time'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    )
                    : classData['time'] == '02 PM'
                    ? Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        classData['time'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    )
                    : classData['time'] == '03 PM'
                    ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        classData['time'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    )
                    : classData['time'] == '04 PM'
                    ? Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Text(
                        classData['time'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    )
                    : const SizedBox(),
          ),

          // Main content column
          Expanded(
            child: Card(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              classData['subject'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[400],
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              classData['teacher'],
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 12,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  classData['timeRange'],
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                       
                      ],
                    ),
                  ),
                  Container(
                    height: 12,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: LinearProgressIndicator(
                        value: classData['progressValue'],
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          classData['progressColor'],
                        ),
                        minHeight: 6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

         
        ],
      ),
    );
  }

  Widget _buildRecessCard(Map<String, dynamic> recessData) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEF5350),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 40,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'R',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            'E',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            'C',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            'E',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            'S',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            'S',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
