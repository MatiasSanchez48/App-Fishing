import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final TextEditingController _controllerDate = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    DateTime initialDate = _selectedDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controllerDate.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  final TextEditingController _controllerTime = TextEditingController();
  TimeOfDay? _selectedDateTime;

  Future<void> _pickTime() async {
    final initialTime = _selectedDateTime ?? TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked != null) {
      setState(() {
        _selectedDateTime = picked;
        _controllerTime.text = picked.format(context); // muestra en AM/PM
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {},
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: 'Name event',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: 'Fecha',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                controller: _controllerDate,
                readOnly: true,
                onTap: _pickDate,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.access_time, color: Colors.grey),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: 'Time',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                controller: _controllerTime,
                readOnly: true,
                onTap: _pickTime,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: 'Location',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                keyboardType: TextInputType.text,
                // controller: _controllerTime,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: 'Location',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                keyboardType: TextInputType.text,
                maxLines: 5,
                // controller: _controllerTime,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline, color: Colors.grey),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: 'Maximum participants',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                keyboardType: TextInputType.number,
                maxLines: 5,
                // controller: _controllerTime,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
