<?php
class pdfMaker{
    function __construct(){
        //if(file_exists($_SERVER['DOCUMENT_ROOT']."receipt/$no.pdf"))
        //    $this->getPdf($no);
        //else
        //    $this->createpdf($no,$title,$amt,$prticipant,$paper,$date);
    }
    function createpdf($no,$title,$amt,$prticipant,$paper,$date){
        if(file_exists($_SERVER['DOCUMENT_ROOT']."receipt/$no.pdf")){
            $this->getPdf($no);
            return;
        }
        // create new PDF document
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, 'A4', true, 'UTF-8', false);
        // set document information
        //$pdf->SetCreator(PDF_CREATOR);
        $pdf->SetTitle('WOCC2021 Receipt');


        $pdf->setPrintHeader(false);
        $pdf->setPrintFooter(false);
        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
       
        // set margins
        // 版面配置 > 邊界
        // $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        $pdf->SetMargins(0, 0, 0,true);

        // 頁首上方與頁面頂端的距離
        $pdf->SetHeaderMargin(0);
        // 頁尾上方與頁面底端的距離
        $pdf->SetFooterMargin(0);
        $pdf->SetAutoPageBreak(TRUE, 0);
        // 自動分頁
        //$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

        // set image scale factor

        $pdf->AddPage('','A4');
        
        //draw template img
        //$img = 'https://images.unsplash.com/photo-1630329410813-4b8923fd3d9d?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=400&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYzMjkyOTQwMg&ixlib=rb-1.2.1&q=80&w=600';
        $img=$_SERVER['DOCUMENT_ROOT'].'template/template.jpg';
        $x=0; $y=0; $w=210 ; $h=297 ; 
        
        $pdf->Image($img, $x,$y, $w, $h, 'JPG', '', '', true, 72, '', false, false, 0, FALSE, false, false);
        //
        //fill in text
        TCPDF_FONTS::addTTFfont($_SERVER['DOCUMENT_ROOT'].'TW.ttf', 'TrueTypeUnicode');
        $pdf->SetFont('TW', '',14);

        $pdf->Text(171, 54.7, $no);
        $pdf->SetFont('TW', '',10);
        $pdf->Text(160, 62.5, '統一編號：76308063');
        $pdf->SetFont('TW', '',14);
        $pdf->Text(51, 78, $title);
        $pdf->Text(74, 85.7, $amt);
        $pdf->MultiCell(127.5, 0, $prticipant, 1, 'L', 1, 0,67, 116.7);
        $pdf->MultiCell(127.5, 0, $paper, 1, 'L', 1, 0,67, 137);
        //TCPDF_FONTS::addTTFfont('calibri.ttf', 'TrueTypeUnicode', '', 96);
        $pdf->SetFont('TW', '',10);

        $pdf->Text(171, 265, $date);
        
        
        // ---------------------------------------------------------

        // Close and output PDF document
        // This method has several options, check the source code documentation for more information.
        // 下載 PDF 的檔案名稱 (不可取中文名，即使有也會自動省略中文名)

        $pdf->Output($_SERVER['DOCUMENT_ROOT']."receipt/$no.pdf", 'FI');
        //$pdf->Output($_SERVER['DOCUMENT_ROOT']."receipt/$no.pdf", 'I');
    }
    function getPdf($no){
        $file = $_SERVER['DOCUMENT_ROOT']."receipt/$no.pdf";
        $filename = "$no.pdf";
        // Header content type
        header('Content-type: application/pdf');
        
        header('Content-Disposition: inline; filename="' . $filename . '"');
        
        header('Content-Transfer-Encoding: binary');
        
        header('Accept-Ranges: bytes');

        @readfile($file);
        /*
        $file = fopen($_SERVER['DOCUMENT_ROOT']."receipt/$no.pdf", "r");
        while (!feof($file)) {
            $value = fgets($file);
            echo $value;
        }
        fclose($file);
        */
    }
}