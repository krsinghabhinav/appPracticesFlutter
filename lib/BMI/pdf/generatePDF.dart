import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../controller/bmiController.dart';

class Generatepdf {

  // --------------------- PDF GENERATOR ---------------------
void generatePDF(Bmicontroller controller) async {
  final pdf = pw.Document();

  final qrData = '''
Name: ${controller.nameController.text}
Age: ${controller.ageController.text}
Gender: ${controller.selectGender.value}
Height: ${controller.heightController.text} cm
Weight: ${controller.weightController.text} kg
BMI: ${controller.bmiValue.value.toStringAsFixed(2)}
Category: ${controller.bmiCategory.value}
Advice: ${controller.bmiAdvice.value}
Date: ${controller.bmiCalculatedDate.value}
''';

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("BMI Report",
                style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 20),
            pw.Text("Name: ${controller.nameController.text}"),
            pw.Text("Age: ${controller.ageController.text}"),
            pw.Text("Gender: ${controller.selectGender.value}"),
            pw.Text("Height: ${controller.heightController.text} cm"),
            pw.Text("Weight: ${controller.weightController.text} kg"),
            pw.Text("BMI: ${controller.bmiValue.value.toStringAsFixed(2)}"),
            pw.Text("Category: ${controller.bmiCategory.value}"),
            pw.Text("Advice: ${controller.bmiAdvice.value}"),
            pw.Text("Date: ${controller.bmiCalculatedDate.value}"),
            pw.SizedBox(height: 20),
            pw.Text("📲 Scan QR Code to see your BMI summary"),
            pw.SizedBox(height: 10),
            pw.Center(
              child: pw.BarcodeWidget(
                barcode: pw.Barcode.qrCode(),
                data: qrData,
                width: 150,
                height: 150,
              ),
            )
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
}
