import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String greeting = getGreeting();
    IconData iconData = getIconData();

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: Colors.white,
                  size: 100.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  '$greeting Shruthi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 20.0),
                RoundedContainerWithBulbAndFanIcons(),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: LivingRoomCard()),
                    SizedBox(width: 10.0),
                    Expanded(child: BedroomCard()),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: LivingRoomScheduleCard(),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: AnotherCardView(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        shrinkWrap: true,
      ),
    );
  }



  String getGreeting() {
    var hour = DateTime
        .now()
        .hour;
    if (hour < 5) {
      return 'Good Night,';
    } else if (hour < 12) {
      return 'Good Morning,';
    } else if (hour < 17) {
      return 'Good Afternoon,';
    } else if (hour < 20) {
      return 'Good Evening,';
    } else {
      return 'Good Night,';
    }
  }

  IconData getIconData() {
    var hour = DateTime
        .now()
        .hour;
    return (hour < 18) ? Icons.wb_sunny : Icons.nightlight_round;
  }

}


class LivingRoomScheduleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: SchedulesCard(),
      ),
    );
  }
}

class AnotherCardView extends StatelessWidget {
  Widget buildKitchenContainer(String label, IconData icon) {

    return Container(

      child: Row(
        children: [
          Icon(icon),
          Text(label),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return CardView(
      title: 'Kitchen',
      editButtonLabel: 'Edit',
      containersColumn1: [
        _buildKitchenContainer('Socket 1', Icons.power),
        _buildKitchenContainer('Socket 2', Icons.power),
      ],
      containersColumn2: [
        _buildKitchenContainer('Socket 3', Icons.power),
        _buildKitchenContainer('Lamp 1', Icons.lightbulb_outline),
      ],
      onEditPressed: () {

      },
    );
  }

  Widget _buildKitchenContainer(String label, IconData icon) {

    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.black,

        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(
              icon,
              color: Colors.black, // Set the icon color
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),

        ],
      ),
    );
  }
}


class EditBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.alarm, size: 50.0, color: Colors.blue),
            SizedBox(height: 10.0),
            Text('Lights/lr1'),

          ],
        ),
      ),
    );
  }
}



class RoundedContainerWithBulbAndFanIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 120.0,
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonWithCircle(
            Icons.lightbulb_outline,
            'ab1-lights',
            Colors.black,
            Colors.grey[800]!,
          ),
          _buildButtonWithCircle(
            Icons.settings,
            'lr1-lights-fan',
            Colors.black,
            Colors.grey[800]!,
          ),
          _buildButtonWithCircle(
            Icons.ac_unit,
            'Fan',
            Colors.black,
            Colors.grey[800]!,
          ),
          _buildButtonWithCircle(
            Icons.lightbulb_outline,
            'lights',
            Colors.black,
            Colors.grey[800]!,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '+',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '-',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonWithCircle(
      IconData icon, String label, Color iconColor, Color buttonColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Colors.grey[800],
            padding: EdgeInsets.all(12.0),
            side: BorderSide(color: Colors.black, width: 2.0),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 24.0,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


class CardDesignBelowContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LivingRoomCard(),
        SizedBox(height: 10.0),
        SchedulesCard(),
        SizedBox(height: 10.0),
        BedroomCard(),
      ],
    );
  }
}
class SchedulesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
        child: Container(
          width: 300.0,
          child: CardView(
            title: 'Schedules',
            editButtonLabel: 'Edit',
            onEditPressed: () {
              _showScheduleEditBox(context);
            },
            containersColumn1: [
              buildScheduleContainer('Schedule 1', Icons.access_time),
              buildScheduleContainer('Schedule 2', Icons.access_time),

            ],
            containersColumn2: [
              buildScheduleContainer('Schedule 3', Icons.access_time),
              buildScheduleContainer('Schedule 4', Icons.access_time),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildScheduleContainer(String labelText, IconData iconData) {
    return Container(
      width: 120.0,
      height: 60.0,
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildIcon(iconData, circleColor: Colors.grey),
            SizedBox(width: 8.0),
            Text(
              labelText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIcon(IconData iconData, {Color circleColor = Colors.black12}) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
      child: Icon(
        iconData,
        color: Colors.black87,
        size: 12.0,
      ),
    );
  }

  void _showScheduleEditBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScheduleEditBox();
      },
    );
  }
}

class ScheduleEditBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200.0,
        child: Material(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildEditOption(context, 'Lights/lr1', Icons.lightbulb_outline),
                SizedBox(height: 10.0),
                buildEditOption(context, 'Fan1/lr1', Icons.ac_unit),
                SizedBox(height: 10.0),
                buildEditOption(context, 'Lights1/ar1', Icons.lightbulb_outline),
                SizedBox(height: 10.0),
                buildEditOption(context, 'Fan1/ar1', Icons.ac_unit),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEditOption(BuildContext context, String label, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (label == 'Lights1/ar1') {
          _handleLights1EditOption(context);
        } else if (label == 'Fan1/lr1') {
          _handleFan1EditOption(context);
        } else if (label == 'Fan1/ar1') {
          _handleFan1AREditOption(context);
        } else if (label == 'Lights/lr1') {
          _handleLightsLR1EditOption(context);
        } else {
          // Handle other edit options
        }
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20.0,
          ),
          SizedBox(width: 10.0),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _handleLights1EditOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScheduleEditDialogLights1();
      },
    );
  }

  void _handleFan1EditOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScheduleEditDialogFan1();
      },
    );
  }

  void _handleFan1AREditOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScheduleEditDialogFan1AR();
      },
    );
  }

  void _handleLightsLR1EditOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScheduleEditDialogLightsLR1();
      },
    );
  }
}

class ScheduleEditDialogLights1 extends StatefulWidget {
  @override
  _ScheduleEditDialogLights1State createState() =>
      _ScheduleEditDialogLights1State();
}
class _ScheduleEditDialogLights1State extends State<ScheduleEditDialogLights1> {
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  String labelText = 'Lights1/ar1'; // Default label text

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.alarm, size: 50.0, color: Colors.blue),
            SizedBox(height: 10.0),
            Text(labelText),
            SizedBox(height: 10.0),
            buildTimePicker(
              labelText: 'Start Time',
              selectedTime: selectedStartTime,
              onTimeChanged: (newTime) {
                setState(() {
                  selectedStartTime = newTime;
                });
              },
            ),
            SizedBox(height: 10.0),
            buildTimePicker(
              labelText: 'End Time',
              selectedTime: selectedEndTime,
              onTimeChanged: (newTime) {
                setState(() {
                  selectedEndTime = newTime;
                });
              },
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle saving the selected times for Lights1/ar1
                print('Selected Start Time: $selectedStartTime');
                print('Selected End Time: $selectedEndTime');
                // Implement alarm functionality for Lights1/ar1 here
                _scheduleAlarmForLights1AR1(selectedStartTime, selectedEndTime);

                // Update the label text
                setState(() {
                  labelText =
                  'Lights1/ar1 - ${selectedStartTime.format(context)} to ${selectedEndTime.format(context)}';
                });

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimePicker({
    required String labelText,
    required TimeOfDay selectedTime,
    required Function(TimeOfDay) onTimeChanged,
  }) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime,
        );

        if (pickedTime != null && pickedTime != selectedTime) {
          onTimeChanged(pickedTime);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_time, color: Colors.blue),
            SizedBox(width: 8.0),
            Text(
              '$labelText: ${selectedTime.format(context)}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scheduleAlarmForLights1AR1(
      TimeOfDay selectedStartTime, TimeOfDay selectedEndTime) {

  }
}


class ScheduleEditDialogFan1 extends StatefulWidget {
  @override
  _ScheduleEditDialogFan1State createState() =>
      _ScheduleEditDialogFan1State();
}

class _ScheduleEditDialogFan1State
    extends State<ScheduleEditDialogFan1> {
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.ac_unit, size: 50.0, color: Colors.blue),
            SizedBox(height: 10.0),
            Text('Fan1/lr1'),
            SizedBox(height: 10.0),
            buildTimePicker(
              labelText: 'Start Time',
              selectedTime: selectedStartTime,
              onTimeChanged: (newTime) {
                setState(() {
                  selectedStartTime = newTime;
                });
              },
            ),
            SizedBox(height: 10.0),
            buildTimePicker(
              labelText: 'End Time',
              selectedTime: selectedEndTime,
              onTimeChanged: (newTime) {
                setState(() {
                  selectedEndTime = newTime;
                });
              },
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {

                print('Selected Start Time: $selectedStartTime');
                print('Selected End Time: $selectedEndTime');

                _scheduleAlarmForFan1LR1(selectedStartTime, selectedEndTime);

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimePicker({
    required String labelText,
    required TimeOfDay selectedTime,
    required Function(TimeOfDay) onTimeChanged,
  }) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime,
        );

        if (pickedTime != null && pickedTime != selectedTime) {
          onTimeChanged(pickedTime);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_time, color: Colors.blue),
            SizedBox(width: 8.0),
            Text(
              '$labelText: ${selectedTime.format(context)}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scheduleAlarmForFan1LR1(
      TimeOfDay selectedStartTime, TimeOfDay selectedEndTime) {

  }
}

class ScheduleEditDialogFan1AR extends StatefulWidget {
  @override
  _ScheduleEditDialogFan1ARState createState() =>
      _ScheduleEditDialogFan1ARState();
}

class _ScheduleEditDialogFan1ARState
    extends State<ScheduleEditDialogFan1AR> {
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.ac_unit, size: 50.0, color: Colors.blue),
            SizedBox(height: 10.0),
            Text('Fan1/ar1'),
            SizedBox(height: 10.0),
            buildTimePicker(
              labelText: 'Start Time',
              selectedTime: selectedStartTime,
              onTimeChanged: (newTime) {
                setState(() {
                  selectedStartTime = newTime;
                });
              },
            ),
            SizedBox(height: 10.0),
            buildTimePicker(
              labelText: 'End Time',
              selectedTime: selectedEndTime,
              onTimeChanged: (newTime) {
                setState(() {
                  selectedEndTime = newTime;
                });
              },
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle saving the selected times for Fan1/ar1
                print('Selected Start Time: $selectedStartTime');
                print('Selected End Time: $selectedEndTime');
                // Implement alarm functionality for Fan1/ar1 here
                _scheduleAlarmForFan1AR1(selectedStartTime, selectedEndTime);

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimePicker({
    required String labelText,
    required TimeOfDay selectedTime,
    required Function(TimeOfDay) onTimeChanged,
  }) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime,
        );

        if (pickedTime != null && pickedTime != selectedTime) {
          onTimeChanged(pickedTime);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_time, color: Colors.blue),
            SizedBox(width: 8.0),
            Text(
              '$labelText: ${selectedTime.format(context)}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scheduleAlarmForFan1AR1(
      TimeOfDay selectedStartTime, TimeOfDay selectedEndTime) {

  }
}

class ScheduleEditDialogLightsLR1 extends StatefulWidget {
  @override
  _ScheduleEditDialogLightsLR1State createState() =>
      _ScheduleEditDialogLightsLR1State();
}

class _ScheduleEditDialogLightsLR1State
    extends State<ScheduleEditDialogLightsLR1> {
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.alarm, size: 50.0, color: Colors.blue),
            SizedBox(height: 10.0),
            Text('Lights/lr1'),
            SizedBox(height: 10.0),
            buildTimePicker(
              labelText: 'Start Time',
              selectedTime: selectedStartTime,
              onTimeChanged: (newTime) {
                setState(() {
                  selectedStartTime = newTime;
                });
              },
            ),
            SizedBox(height: 10.0),
            buildTimePicker(
              labelText: 'End Time',
              selectedTime: selectedEndTime,
              onTimeChanged: (newTime) {
                setState(() {
                  selectedEndTime = newTime;
                });
              },
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle saving the selected times for Lights/lr1
                print('Selected Start Time: $selectedStartTime');
                print('Selected End Time: $selectedEndTime');
                // Implement alarm functionality for Lights/lr1 here
                _scheduleAlarmForLightsLR1(selectedStartTime, selectedEndTime);

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimePicker({
    required String labelText,
    required TimeOfDay selectedTime,
    required Function(TimeOfDay) onTimeChanged,
  }) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime,
        );

        if (pickedTime != null && pickedTime != selectedTime) {
          onTimeChanged(pickedTime);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_time, color: Colors.blue),
            SizedBox(width: 8.0),
            Text(
              '$labelText: ${selectedTime.format(context)}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scheduleAlarmForLightsLR1(
      TimeOfDay selectedStartTime, TimeOfDay selectedEndTime) {

  }
}
void _handleScheduleEditOption(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return EditBox();
    },
  );
}


class ScheduleEditDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.alarm, size: 50.0, color: Colors.blue),
            SizedBox(height: 10.0),
            Text('Lights/lr1'),
            SizedBox(height: 10.0),
            Icon(Icons.alarm, size: 50.0, color: Colors.blue),
            SizedBox(height: 10.0),
            Text('Fan1/lr1'),
            // Add more items as needed
          ],
        ),
      ),
    );
  }
}



class LivingRoomCard extends StatefulWidget {
  @override
  _LivingRoomCardState createState() => _LivingRoomCardState();
}

class _LivingRoomCardState extends State<LivingRoomCard> {
  int fanPercentage = 0;
  bool isLamp1On = false;
  bool isLamp2On = false;
  bool isLamp3On = false;
  bool isLamp4On = false;
  bool isSocket1On = false;
  bool isLamp5On = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
        child: CardView(
          title: 'Living Room',
          editButtonLabel: 'Edit',
          containersColumn1: [
            _buildRoundedBoxWithIconAndText('Lamp1', Icons.lightbulb_outline, isLamp1On),
            _buildRoundedBoxWithIconAndText('Lamp2', Icons.lightbulb_outline, isLamp2On),
            _buildRoundedBoxWithIconAndText('Lamp3', Icons.lightbulb_outline, isLamp3On),
            _buildRoundedBoxWithIconAndText('Lamp4', Icons.lightbulb_outline, isLamp4On),
            // Add more containers as needed
          ],
          containersColumn2: [
            _buildRoundedBoxWithFanAndControls('Fan 1'),
            _buildRoundedBoxWithIconAndText('Socket 1', Icons.power, isSocket1On),
            _buildRoundedBoxWithIconAndText('Lamp5', Icons.lightbulb_outline, isLamp5On),
            // Add more containers as needed
          ],
          onEditPressed: () {},
        ),
      ),
    );
  }

  Widget _buildRoundedBoxWithIconAndText(String labelText, IconData iconData, bool isOn) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (labelText) {
            case 'Lamp1':
              isLamp1On = !isLamp1On;
              break;
            case 'Lamp2':
              isLamp2On = !isLamp2On;
              break;
            case 'Lamp3':
              isLamp3On = !isLamp3On;
              break;
            case 'Lamp4':
              isLamp4On = !isLamp4On;
              break;
            case 'Socket 1':
              isSocket1On = !isSocket1On;
              break;
            case 'Lamp5':
              isLamp5On = !isLamp5On;
              break;
          // Add more cases for additional containers
          }
        });
      },
      child: Container(
        width: 120.0,
        height: 60.0,
        margin: EdgeInsets.only(right: 2.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,  // Align items in the center
            children: [
              _buildIcon(iconData, circleColor: isOn ? Colors.blue : Colors.grey),  // Use blue color when in 'on' state
              SizedBox(width: 8.0),  // Adjusted spacing between icon and text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,  // Align text in the center
                children: [
                  Text(
                    labelText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    isOn ? '~on' : '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildRoundedBoxWithFanAndControls(String labelText) {
    return Container(
      width: 150.0,
      height: 90.0,
      margin: EdgeInsets.only(left: 2.0, right: 2.0, bottom: 4.0),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCircleIcon(
                  Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(Icons.ac_unit, color: Colors.black87, size: 20.0),
                  ),
                ),
                SizedBox(width: 2.0),
                Text(
                  labelText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCircleIcon(
                  IconButton(
                    onPressed: () {

                      if (fanPercentage > 0) {
                        setState(() {
                          fanPercentage -= 25;
                        });
                      }
                    },
                    icon: Icon(Icons.remove, color: Colors.black87, size: 14.0),
                  ),
                  circleColor: Colors.grey,
                ),
                SizedBox(width: 2.0),
                Text(
                  '$fanPercentage%',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 2.0),
                _buildCircleIcon(
                  IconButton(
                    onPressed: () {
                      // Handle the '+' button press for Fan 1
                      if (fanPercentage < 100) {
                        setState(() {
                          fanPercentage += 25;
                        });
                      }
                    },
                    icon: Icon(Icons.add, color: Colors.black87, size: 14.0),
                  ),
                  circleColor: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIcon(Widget iconWidget, {Color circleColor = Colors.white}) {
    return Container(
      padding: EdgeInsets.all(0.001),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
      child: iconWidget,
    );
  }

  Widget _buildIcon(IconData iconData, {Color circleColor = Colors.black12}) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
      child: Icon(
        iconData,
        color: Colors.black87,
        size: 12.0,
      ),
    );
  }
}


class BedroomCard extends StatefulWidget {
  @override
  _BedroomCardState createState() => _BedroomCardState();
}

class _BedroomCardState extends State<BedroomCard> {
  List<ItemInfo> bedroomItems = [
    ItemInfo(name: 'Unassigned'),
    ItemInfo(name: 'Unassigned'),
    ItemInfo(name: 'Unassigned'),
    ItemInfo(name: 'Unassigned'),
    ItemInfo(name: 'Unassigned'),
    ItemInfo(name: 'Unassigned'),
  ];

  @override
  Widget build(BuildContext context) {
    return CardView(
      title: 'Bedroom',
      editButtonLabel: 'Edit',
      onEditPressed: () {
        _showEditOptions(context);
      },
      containersColumn1: [
        for (var item in bedroomItems.take(3))
          _buildRoundedBoxWithIconAndText(item.icon, item.name),
      ],
      containersColumn2: [
        for (var item in bedroomItems.skip(3).take(3))
          _buildRoundedBoxWithIconAndText(item.icon, item.name),
      ],
    );
  }

  Widget _buildRoundedBoxWithIconAndText(IconData icon, String labelText) {
    return Container(
      width: 100.0,
      height: 50.0,
      margin: EdgeInsets.only(right: 2.0, bottom: 4.0),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(icon, circleColor: Colors.grey),
            SizedBox(width: 2.0),
            Text(
              labelText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData iconData, {Color circleColor = Colors.black12}) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
      child: Icon(
        iconData,
        color: Colors.black87,
        size: 12.0,
      ),
    );
  }

  void _showEditOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.black,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5, // Adjust the width here
            height: MediaQuery.of(context).size.height * 0.4, // Adjust the height here
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEditOption(context, 'Fan1', Icons.ac_unit),
                  _buildSeparator(),
                  _buildEditOption(context, 'Lamp1', Icons.lightbulb_outline),
                  _buildSeparator(),
                  _buildEditOption(context, 'Socket1', Icons.power),
                  _buildSeparator(),
                  _buildEditOption(context, 'Fan2', Icons.ac_unit),
                  _buildSeparator(),
                  _buildEditOption(context, 'Lamp2', Icons.lightbulb_outline),
                  _buildSeparator(),
                  _buildEditOption(context, 'Socket2', Icons.power),
                  _buildSeparator(),
                  _buildEditOption(context, 'Lamp3', Icons.lightbulb_outline),
                  _buildSeparator(),
                  _buildEditOption(context, 'Lamp4', Icons.lightbulb_outline),
                  _buildSeparator(),
                  // Add more items as needed
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEditOption(BuildContext context, String label, IconData icon) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20.0,
          ),
          SizedBox(width: 10.0),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      onTap: () {
        // Handle the tap on each edit option
        _replaceUnassignedItem(label, icon);
        Navigator.pop(context); // Close the bottom sheet
      },
    );
  }

  Widget _buildSeparator() {
    return Container(
      height: 1.0,
      color: Colors.black,
    );
  }

  void _replaceUnassignedItem(String newItem, IconData newIcon) {
    int unassignedIndex = bedroomItems.indexWhere((item) => item.name == 'Unassigned');

    if (unassignedIndex != -1) {
      setState(() {
        bedroomItems[unassignedIndex].name = newItem;
        bedroomItems[unassignedIndex].icon = newIcon;
      });
    } else {

      int index = bedroomItems.indexWhere((item) => item.name.startsWith(newItem));

      if (index != -1) {

        int count = int.parse(bedroomItems[index].name.split(' ')[1]);
        count++;
        bedroomItems[index].name = '$newItem $count';
      } else {

        bedroomItems.add(ItemInfo(name: '$newItem 1', icon: newIcon));
      }

      setState(() {});
    }
  }

}

class ItemInfo {
  String name;
  IconData icon;

  ItemInfo({required this.name, this.icon = Icons.settings});
}

class CardView extends StatefulWidget {
  final String title;
  final String editButtonLabel;
  final List<Widget> containersColumn1;
  final List<Widget> containersColumn2;
  final VoidCallback onEditPressed;

  CardView({
    required this.title,
    required this.editButtonLabel,
    required this.containersColumn1,
    required this.containersColumn2,
    required this.onEditPressed,
  });

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool isEditPressed = false;

  @override
  Widget build(BuildContext context) {
    int totalContainers =
        widget.containersColumn1.length + widget.containersColumn2.length;

    return Card(
      color: Color(0xFF1E1E1E),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$totalContainers Devices',
                      style: TextStyle(
                        fontSize: 9.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onEditPressed();
                    setState(() {
                      isEditPressed = !isEditPressed;
                    });
                  },
                  child: Text(
                    widget.editButtonLabel,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ...widget.containersColumn1,
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    children: [
                      ...widget.containersColumn2,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





