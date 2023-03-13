import 'package:elaajapp/data/repository/popular_doctors_repo.dart';
import 'package:elaajapp/models/doctors_model.dart';
import 'package:get/get.dart';

class PopularDoctorController extends GetxController {
  final PopularDoctorRepo popularDoctorRepo;
  PopularDoctorController({required this.popularDoctorRepo});
  List<dynamic> _popularDoctorList = [];
  List<dynamic> get popularDoctorList => _popularDoctorList;

  Future<void> getDoctorList() async {
    Response response = await popularDoctorRepo.getPopularDoctorList();
    if (response.statusCode == 200) {
      _popularDoctorList = [];
      _popularDoctorList.addAll(Doctors.fromJson(response.body));
      update();
    } else {}
    
    
    
    
    import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatelessWidget {
  const BookingPage ({Key? key}) : super(key: key);

@override 
State<BookingPage> createState() => _BookingState();
}
class _BookingPageState extends State<BookingPage>{
  //declaration 
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now()
int? _currentIndex;
bool _isWeekend = false;
bool _dateSelected = false;
bool _timeSelected = false;
@override
Widget build(BuildContext context)  {
  Config().init(context);
  return Scaffold(
    appBar: CustomAppBar(
      appTitle:'Appointment',
      icon: const Falcon(Icons.arrow_back_ios),
    ),
    body: CustomerScrollView(
      silvers: <Widget>[
        SilverToBoxAdapter(
          child: Column(
            children: <Widget>[
             TableCalendar()
             const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Center(
               child: Text(
                'Select Consultation Time',
                style: TextTyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )
               )
              )
              )
            ]
          )
        )
        isWeekend ? 
        SilverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 30),
              alignment: Alignment.center,
              child: const Text(
                'weekend is not available, please select another date',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
          ),
        ) 
        : SilverGrid(
          delegate: SilverChildBuilderDelegate((context,index){
            return InkWell(
              splashColor: Colors.transparent,
              onTap:(){}
            );
          }),
         gridDelegate: gridDelegate,
         )
      ],
    ),
  );
}

//table calendar 
Widget _tableCalendar() {
  return TableCalendar(
    focusedDay: _focusDay,
    firstday: DateTime.now(),
    lastDay: DateTime(2023, 12, 31),
    calendarFormat: _format,
    currentDay: _currentDay,
    rowHeight: 48,
    calendarStyle: const CalendarStyle(
  todayDecoration: BoxDecoration(color: Config.primaryColor, shape: BoxShape.circle)
  ),
  availableCalendarFormats: const {
    CalendarFormat.month:'Month',
  },
  onFormatChanged: (format) {
    setState((){
      _format = format;
    });
  },
  onDaySelected: ((selectedDay, focusedDay){
    setState(() {
      _currentDay = selectedDay;
      _fucusDay = focusedDay;
      _dateSelected = true;

      //check if weekend is selected
      if(selectedDay.weekday == 6 || selectedDay.weekday == 7){
        _isWeekend = true;
        _timeSelected = false;
        _currentIndex = null;
        } else{
          _isWeekend = false;
        }
    })
  })
  );
