import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../component/weather_time_symbol.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:a2/w2/weather.dart';
import 'package:a2/w1/location_screen.dart';
class WeatherComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeatherComponentState();
  }
}
class _WeatherComponentState extends State<WeatherComponent> {
@override
void initState(){
    super.initState();
    getLocationData();
  }
void getLocationData() async {
  var weatherData = await WeatherModel().getLocationWeather();

  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return LocationScreen(
      locationWeather: weatherData,
    );
  }));
}
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return ClipRect(
      child: FutureBuilder(
        future: WeatherModel().getLocationWeather(), // Fetch weather data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while fetching data
            return Center(
              child: SpinKitDoubleBounce(
                color: Colors.blue, // Change color according to your preference
                size: 50.0, // Adjust size according to your preference
              ),
            );
          } else if (snapshot.hasError) {
            // Handle error if any
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Once data is fetched successfully, display weather information
            var weatherData = snapshot.data;
            return Stack(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/weather-1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('${weatherData['location']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40))),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('${weatherData['temperature']}°',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 50))),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

