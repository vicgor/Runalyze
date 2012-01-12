<?php
/**
 * Draw splits for a given training
 * Call:   include Plot.Training.splits.php
 */

$Plot = new Plot("splits_".$_GET['id'], 480, 190);

if (!is_numeric($_GET['id']))
	$Plot->raiseError('Es ist kein Training angegeben.');

$Training = new Training($_GET['id']);

if ($Training->hasSplitsData()) {
	$demandedPace = Helper::DescriptionToDemandedPace($Training->get('comment'));
	$achievedPace = array_sum($Training->getSplitsPacesArray()) / count($Training->getSplitsPacesArray());
}

$Labels = $Training->getSplitsDistancesArray();
$Data   = $Training->getSplitsPacesArray();

foreach ($Data as $key => $val) {
	$Labels[$key] = array($key, $Labels[$key].' km');
	$Data[$key] = $val*1000;
}

$min = min($Data); $min = floor($min/30000)*30000;
$max = max($Data); $max = ceil($max/30000)*30000;

$Plot = new Plot("splits_".$_GET['id'], 480, 190);
$Plot->Data[] = array('label' => 'Zwischenzeiten', 'data' => $Data);

$Plot->setYAxisTimeFormat('%M:%S');
$Plot->setXLabels($Labels);
$Plot->showBars(true);

$Plot->setYLimits(1, $min, $max, false);
$Plot->setYTicks(1, null);

$Plot->hideLegend();
$Plot->setTitle('Zwischenzeiten', 'right');
$Plot->setTitle($Training->getPlotTitle(), 'left');

if ($demandedPace > 0)
	$Plot->addThreshold("y", $demandedPace*1000, 'rgb(180,0,0)');
if ($achievedPace > 0)
	$Plot->addThreshold("y", $achievedPace*1000, 'rgb(0,180,0)');

$Plot->outputJavaScript();
?>