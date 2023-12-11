// import 'dart:typed_data';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pretty_qr_code/pretty_qr_code.dart';
// import 'package:barcode_widget/barcode_widget.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// final pdf = pw.Document();

// Future<Uint8List> generatePdf(String studentName, String studentId, String qrCodeData, String barcodeData) async {
//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.Page(
//       build: (context) {
//         return pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.center,
//           children: [
//             pw.Text('Student Information', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 10),
//             pw.Text('Name: $studentName'),
//             pw.Text('Student ID: $studentId'),
//             pw.SizedBox(height: 20),
//             pw.Text('QR Code:'),
//             pw.Container(
//               width: 100,
//               height: 100,
//               child: pw.Image(qrCodeImage(qrCodeData) as pw.ImageProvider),
//             ),
//             pw.SizedBox(height: 20),
//             pw.Text('Barcode:'),
//             pw.BarcodeWidget(
//               data: barcodeData,
//               width: 200,
//               height: 50,
//               barcode: pw.Barcode.code128(),
//             ),
//           ],
//         );
//       },
//     ),
//   );

//   return pdf.save();
// }

// pw.Widget qrCodeImage(String qrCodeData) {
//   final image = PrettyQrImage(
//     data: qrCodeData,
//     typeNumber: 8,
//     errorCorrectLevel: QrErrorCorrectLevel.H,
//   );

//   final imageData = image.toByteData(format: PdfImageFormat.png);
//   final pdfImage = PdfImage(pdf.document, image: imageData, width: 100, height: 100);

//   return pw.Image(pdfImage as pw.ImageProvider, width: 100, height: 100);
// }


// // Usage
// onPressed: () async {
//   Uint8List pdfBytes = await generatePdf(
//     'John Doe', // Replace with actual student information
//     '12345',
//     'QR Code Data', // Replace with actual QR code data
//     'Barcode Data', // Replace with actual barcode data
//   );

//   // Use a package like 'printing' to print the PDF
//   // Example: await Printing.layoutPdf(onLayout: (format) async => pdfBytes);

//   // You can also save the PDF to a file or send it to a printer
//   // Example: File('student_card.pdf').writeAsBytes(pdfBytes);
// },
