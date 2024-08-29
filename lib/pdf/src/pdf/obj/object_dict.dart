/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import '../format/dict.dart';
import '../format/name.dart';
import '../format/stream.dart';
import 'object.dart';

/// Object with a PdfDict used in the PDF file
@Deprecated('Use PdfObject<PdfDict> instead')
class PdfObjectDict extends PdfObject<PdfDict> {
  /// This is usually called by extensors to this class, and sets the
  /// Pdf Object Type
  PdfObjectDict(
    super.pdfDocument, {
    String? type,
    super.objgen,
    super.objser,
  }) : super(params: PdfDict()) {
    if (type != null) {
      params['/Type'] = PdfName(type);
    }
  }

  @override
  void writeContent(PdfStream s) {
    if (params.isNotEmpty) {
      params.output(this, s, settings.verbose ? 0 : null);
      s.putByte(0x0a);
    }
  }
}
