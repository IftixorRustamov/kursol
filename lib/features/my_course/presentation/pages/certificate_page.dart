import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<void> generateCertificate() async {
  final pdf = pw.Document();

  // Load the image from assets
  final ByteData bytes = await rootBundle.load('assets/images/logo.png');
  final Uint8List byteList = bytes.buffer.asUint8List();

  final image = pw.MemoryImage(byteList);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Image(image, width: 50, height: 50), // Logo
              pw.SizedBox(height: 20),
              pw.Text('Certificate of Completion',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Presented to',
                  style: pw.TextStyle(fontSize: 16, color: PdfColors.grey)),
              pw.SizedBox(height: 5),
              pw.Text('Andrew Ainsley',
                  style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue)),
              pw.SizedBox(height: 10),
              pw.Text('For the successful completion of',
                  style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 5),
              pw.Text('3D Design Illustration Course',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Issued on December 20, 2024',
                  style: pw.TextStyle(fontSize: 14, color: PdfColors.grey)),
              pw.SizedBox(height: 5),
              pw.Text('ID: SK123456789',
                  style: pw.TextStyle(fontSize: 14, color: PdfColors.grey)),
              pw.SizedBox(height: 20),
              pw.Divider(),
              pw.SizedBox(height: 10),
              pw.Text('James Anderson Lawren',
                  style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue)),
              pw.Text('Elera Courses Manager',
                  style: pw.TextStyle(fontSize: 14, color: PdfColors.grey)),
            ],
          ),
        );
      },
    ),
  );

  // Save PDF to device
  final output = await getExternalStorageDirectory();
  final file = File("${output!.path}/certificate.pdf");
  await file.writeAsBytes(await pdf.save());


}
