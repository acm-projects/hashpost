import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hashpost/ui/theme/theme_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slide_popup_dialog/slide_dialog.dart' as slideDialog;
import 'base_model.dart';
import '../services/services.dart';
import 'package:hashpost/locator.dart';


class HomeModel extends BaseModel {

  Api _api = locator<Api>();

  // for test purposes
  List<String> posts;
  String buttonText = "Load";
  // bool get loggedIn => (user != null) ? true : false;

  showDialog(BuildContext context) {
    List<Color> gradientColors = [
      HashPostTheme.primaryColorOne,
      HashPostTheme.primaryColorTwo
    ];
    slideDialog.SlideDialog(
      backgroundColor: Theme.of(context).accentColor,
      pillColor: Theme.of(context).primaryColor,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalGrid: true,
            getDrawingHorizontalGridLine: (value) {
              return const FlLine(
                color: Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalGridLine: (value) {
              return const FlLine(
                color: Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              textStyle: TextStyle(
                  color: const Color(0xff68737d),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 2:
                    return 'MAR';
                  case 5:
                    return 'JUN';
                  case 8:
                    return 'SEP';
                }
                return '';
              },
              margin: 8,
            ),
            leftTitles: SideTitles(
              showTitles: true,
              textStyle: TextStyle(
                color: const Color(0xff67727d),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 1:
                    return '10k';
                  case 3:
                    return '30k';
                  case 5:
                    return '50k';
                }
                return '';
              },
              reservedSize: 28,
              margin: 12,
            ),
          ),
          borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 3),
                  FlSpot(2.6, 2),
                  FlSpot(4.9, 5),
                  FlSpot(6.8, 3.1),
                  FlSpot(8, 4),
                  FlSpot(9.5, 3),
                  FlSpot(11, 4),
                ],
                isCurved: true,
                colors: gradientColors,
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: const FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  colors:
                      gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                ),
              ),
            ],
        )
      ),
    );
  }

  void setButtonText(String text) {
    updateState(ViewState.Busy);
    buttonText = text;
    updateState(ViewState.Idle);
  }

  Future<List<String>> fetchStrings() async {
    updateState(ViewState.Busy);
    updateState(ViewState.Idle);
    return ["Works", "Works"];
  }

  // use camera
  Future<Image> fetchImageUsingCamera() async {
    updateState(ViewState.Busy);
    var file = await ImagePicker.pickImage(source: ImageSource.camera);
    var image;
    if(file != null) {
      image = Image.file(file);
    }
    updateState(ViewState.Idle);
    return image;
  }

  // get from camera roll
  Future<Image> fetchImageUsingCameraRoll() async {
    updateState(ViewState.Busy);
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    var image;
    if(file != null) {
      image = Image.file(file);
    }
    updateState(ViewState.Idle);
    return image;
  }

  // fetch image from instagram
  Future<String> fetchImageUsingInstagram() async {
    // stuff
  }
}