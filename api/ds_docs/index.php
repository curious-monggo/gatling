<?php
//http://traveljolly.com/api/ds_docs/
require '../base.php';

function Post() {

    try {

        webhook_listener();
        //returnResponse("http://traveljolly.com/api/activation_codes/".$payload["guid"], false);
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
}
function webhook_listener() {
    // Process the incoming webhook data. See the DocuSign Connect guide
    // for more information
    //
    // Strategy: examine the data to pull out the envelope_id and time_generated fields.
    // Then store the entire xml on our local file system using those fields.
    //
    // If the envelope status=="Completed" then store the files as doc1.pdf, doc2.pdf, etc
    //
    // This function could also enter the data into a dbms, add it to a queue, etc.
    // Note that the total processing time of this function must be less than
    // 100 seconds to ensure that DocuSign's request to your app doesn't time out.
    // Tip: aim for no more than a couple of seconds! Use a separate queuing service
    // if need be.

    $data = file_get_contents('php://input');
    $xml = simplexml_load_string ($data, "SimpleXMLElement", LIBXML_PARSEHUGE);
    $envelope_id = (string)$xml->EnvelopeStatus->EnvelopeID;
    $time_generated = (string)$xml->EnvelopeStatus->TimeGenerated;

    // Store the file. Create directories as needed
    // Some systems might still not like files or directories to start with numbers.
    // So we prefix the envelope ids with E and the timestamps with T

    // $files_dir = getcwd() . '/' . $this->xml_file_dir;

    // if(! is_dir($files_dir)) {
    //     mkdir ($files_dir, 0755);
    // }
    // $envelope_dir = $files_dir . "E" . $envelope_id;
    // if(! is_dir($envelope_dir)) {
    //     mkdir ($envelope_dir, 0755);
    // }

    // $filename = $envelope_dir . "/T" . 
    //     str_replace (':' , '_' , $time_generated) . ".xml"; // substitute _ for : for windows-land

    // $ok = file_put_contents ($filename, $data);
    // if ($ok === false) {
    //     // Couldn't write the file! Alert the humans!
    //     error_log ("!!!!!! PROBLEM DocuSign Webhook: Couldn't store $filename !");
    //     exit (1);
    // }

    // // log the event
    // error_log ("DocuSign Webhook: created $filename");
    //echo "Email:".$xml->EnvelopeStatus->Status;
    //echo "Email:".$xml->EnvelopeStatus->RecipientStatuses->RecipientStatus->Email;
   // echo "FormData:".$xml->EnvelopeStatus->RecipientStatuses->RecipientStatus->FormData->xfdf->fields[0]->field[0]->value;
    if ((string)$xml->EnvelopeStatus->Status === "Completed") {
        // Loop through the DocumentPDFs element, storing each document.
        // foreach ($xml->DocumentPDFs->DocumentPDF as $pdf) {
        //    $filename = $this->doc_prefix . (string)$pdf->DocumentID . '.pdf';
        //     $full_filename = $envelope_dir . "/" . $filename;
        //     file_put_contents($full_filename, base64_decode ( (string)$pdf->PDFBytes ));
        // }
        //echo "Completed:".$xml->EnvelopeStatus->Status;
        //echo "Email:".$xml->EnvelopeStatus->Email;
        //echo "Email:".$xml->EnvelopeStatus->RecipientStatuses->RecipientStatus->Email;
        $contactResult = GetContactByEmail($xml->EnvelopeStatus->RecipientStatuses->RecipientStatus->Email);
        if ($contactResult[0]["Id"] != "") {
            //now update contact record with document signed
            $postArray = array();
            $postArray["_DocuSignSigned"] = "1";
            updateContact($contactResult[0]["Id"], $postArray);
        }
    }

}
function status_item($xml){
    //  summary info about the notification
    $result = [];

    // iterate through the recipients
    $recipients = [];
    foreach ($xml->EnvelopeStatus->RecipientStatuses->children() as $Recipient) {
        $recipients[] = [
            "type" => (string)$Recipient->Type,
            "email" => (string)$Recipient->Email,
            "user_name" => (string)$Recipient->UserName,
            "routing_order" => (string)$Recipient->RoutingOrder,
            "sent_timestamp" => (string)$Recipient->Sent,
            "delivered_timestamp" => (string)$Recipient->Delivered,
            "signed_timestamp" => (string)$Recipient->Signed,
            "status" => (string)$Recipient->Status
        ];
    }
    $documents = [];
    $envelope_id = (string)$xml->EnvelopeStatus->EnvelopeID;
    // iterate through the documents if the envelope is Completed
    if ((string)$xml->EnvelopeStatus->Status === "Completed") {
        // Loop through the DocumentPDFs element, noting each document.
        foreach ($xml->DocumentPDFs->DocumentPDF as $pdf) {
            $doc_filename = $this->doc_prefix . (string)$pdf->DocumentID . '.pdf';
            $documents[] = [
                "document_ID" => (string)$pdf->DocumentID,
                "document_type" => (string)$pdf->DocumentType,
                "name" => (string)$pdf->Name,
                "url" => $files_dir_url . 'E' . $envelope_id . '/' . $doc_filename];
        }
    }

    $result = [
        "envelope_id" => $envelope_id,
        "xml_url" => $files_dir_url . 'E' . $envelope_id . '/' . $filename,
        "time_generated" => (string)$xml->EnvelopeStatus->TimeGenerated,
        "subject" => (string)$xml->EnvelopeStatus->Subject,
        "sender_user_name" => (string)$xml->EnvelopeStatus->UserName,
        "sender_email" => (string)$xml->EnvelopeStatus->Email,
        "envelope_status" => (string)$xml->EnvelopeStatus->Status,
        "envelope_sent_timestamp" => (string)$xml->EnvelopeStatus->Sent,
        "envelope_created_timestamp" => (string)$xml->EnvelopeStatus->Created,
        "envelope_delivered_timestamp" => (string)$xml->EnvelopeStatus->Delivered,
        "envelope_signed_timestamp" => (string)$xml->EnvelopeStatus->Signed,
        "envelope_completed_timestamp" => (string)$xml->EnvelopeStatus->Completed,
        "timezone" => (string)$xml->TimeZone,
        "timezone_offset" => (string)$xml->TimeZoneOffset,
        "recipients" => $recipients,
        "documents" => $documents];
    return $result;
}
function GetContactByEmail($emailaddress) {
    $url = "https://traveljolly.com/api/contacts/?Email=" . $emailaddress;
        $opts = array(
            'http'=>array(
            'method'=>"GET",
            'header' => "Authorization: fc0eb8ab9c9c40469c560468bdc2621b"                 
            )
        );
        $context = stream_context_create($opts);
        $json = file_get_contents($url, false, $context);
        //$json = file_get_contents($url);
        $result = json_decode($json, true);
        return $result;
}
function updateContact($contactId, $postArray) {
    $postData = json_encode($postArray);
    //echo "postData:".print_r($postData);
    //return;
    $opts = array('http' =>
        array(
            'method'  => "PUT",
            'header' => "Authorization: fc0eb8ab9c9c40469c560468bdc2621b\r\n" . "Content-Type: application/json\r\n",
            'content' => $postData
        )
    );

    $url = "https://traveljolly.com/api/contacts/" . $contactId;
    $context = stream_context_create($opts);
    $json = file_get_contents($url, false, $context);
}
function Put() {

    ouputHeader("405", "Method Not Allowed");
}
function Get() {

    ouputHeader("405", "Method Not Allowed");
}
function Delete() {

    ouputHeader("405", "Method Not Allowed");
}

?>