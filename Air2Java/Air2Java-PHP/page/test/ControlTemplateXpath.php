<?php
$doc = new DOMDocument;
$doc->preserveWhiteSpace = false;
$doc->Load('view.html');
$titlenode = $doc->createTextNode("Like this");
$xpath = new DOMXPath($doc);
$xpath->registerNamespace("h","http://www.w3.org/1999/xhtml");
$query="//h:*[@data-xp='title']/comment()";
$entries = $xpath->query($query);
foreach ($entries as $entry) { $entry->parentNode->replaceChild($titlenode, $entry); }
echo $doc->saveXML();
?>

<?php
//
//// Facade
//
//$doc = new DOMDocument;
//$doc->preserveWhiteSpace = true;
//$doc->loadHTMLFile('page/index.html');
//$xpath = new DOMXPath($doc);
//$xpath->registerNamespace("h","http://www.w3.org/1999/xhtml");
//
//$queryConnexion="//*[@id='connexion']"; //*[@id="connexion"]
//
//$entries = $xpath->query($queryConnexion);
//
//$docConnex = new DOMDocument;
//$docConnex->preserveWhiteSpace = false;
//$docConnex->loadHTMLFile('page/connexion.html');
//$connexpath = new DOMXPath($docConnex);
//$connexpath->registerNamespace("h","http://www.w3.org/1999/xhtml");
//
//
//$connexentries = $connexpath->query("/");
//
//foreach ($connexentries as $conentry) { $connexentry = $conentry ; }
//
//$connexentry = $docConnex->getElementById("connexion");
//
//$entry = $doc->getElementById("connexion");
//
//var_dump($entry);
//var_dump($connexentry);
//
////foreach ($entries as $entry) {
////$entry->parentNode->replaceChild($connexentry,$entry);
//// }
//
//$connexentry = $doc->importNode($connexentry, TRUE);
//
//$entry->parentNode->replaceChild(
//                $connexentry
//                , $entry);
//
//echo $doc->saveXML();
//
////
////$doc = new DOMDocument;
////$doc->preserveWhiteSpace = false;
////$doc->Load('page/test/view.html');
////$titlenode = $doc->createTextNode("Like this");
////$xpath = new DOMXPath($doc);
////$xpath->registerNamespace("h","http://www.w3.org/1999/xhtml");
////$query="//h:*[@data-xp='title']/comment()";
////$entries = $xpath->query($query);
////foreach ($entries as $entry) { $entry->parentNode->replaceChild($titlenode, $entry); }
////echo $doc->saveXML();

?>