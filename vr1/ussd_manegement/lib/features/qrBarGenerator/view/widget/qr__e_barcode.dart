import 'package:App_de_registo_de_dados/constants/sizes.dart';
import 'package:App_de_registo_de_dados/constants/strings.dart';
import 'package:App_de_registo_de_dados/features/qrBarGenerator/controller/qr_bar_controller.dart';
import 'package:App_de_registo_de_dados/features/qrBarGenerator/view/widget/pdf_cartao.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screenshot/screenshot.dart';

class BarcodeEQrCode extends StatelessWidget {
  const BarcodeEQrCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QrBarController());
    controller.qrCodeChanger();
    controller.imagens();
    controller.captureqr();
    capture();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: PrettyQrView(
                qrImage: controller.qrCode!,
                decoration: const PrettyQrDecoration(),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Obx(() => BarcodeWidget(
                  barcode: controller.barcode,
                  data: controller.data,
                  errorBuilder: (context, error) => Center(child: Text(error)),
                )),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        SizedBox(
          width: TSizes.buttonwidth,
          height: TSizes.buttonHeight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Colors.transparent),
            ),
            onPressed: () async {
              final pdfFile = await PdfApi.generateImage();
                  
              PdfApi.openFile(pdfFile);
            },
            child: const Text(TStrings.imprimir),
          ),
        ),
      ],
    );
  }

  void capture() async {
    final screenshotController = ScreenshotController();
    final QrBarController meuController = Get.find();
    meuController.imagemBarCode =
        await screenshotController.captureFromWidget(Material(
      child: BarcodeWidget(
        height: 150,
        width: 250,
        barcode: Barcode.code128(),
        data: meuController.data,
        errorBuilder: (context, error) => Center(child: Text(error)),
      ),
    ));
  }
}
