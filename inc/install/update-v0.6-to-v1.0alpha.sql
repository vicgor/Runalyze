UPDATE `runalyze_plugin` SET `config` = 'last_wk_num|int=10|Anzahl f&uuml;r letzte Wettk&auml;mpfe main_distance|int=10|Hauptdistanz (wird als Diagramm dargestellt) pb_distances|array=1, 3, 5, 10, 21.1, 42.2|Distanzen f&uuml;r Bestzeit-Vergleich (kommagetrennt) fun_ids|array=|IDs der Spa&szlig;-Wettk&auml;mpfe (nicht per Hand editieren!)' WHERE `runalyze_plugin`.`key`="RunalyzePluginStat_Wettkampf";
UPDATE `runalyze_plugin` SET `config` = 'show_trainingpaces|bool=true|Empfohlene Trainingstempi anzeigen' WHERE `runalyze_plugin`.`key`="RunalyzePluginPanel_Rechenspiele";

INSERT INTO `runalyze_plugin` (`id`, `key`, `type`, `filename`, `name`, `description`, `config`, `active`, `order`) VALUES
(19, 'RunalyzePluginTool_MultiEditor', 'tool', 'class.RunalyzePluginTool_MultiEditor.php', 'Multi-Editor', 'Bearbeitung von mehreren Trainings gleichzeitig.', 'sportid|bool=true|Sportart bearbeiten\ns|bool=true|Dauer bearbeiten\ndistance|bool=true|Distanz bearbeiten\nis_track|bool=false|Bahn bearbeiten\npulse|bool=true|Puls &oslash;/max bearbeiten\nkcal|bool=true|Kalorien bearbeiten\nabc|bool=false|Lauf-ABC bearbeiten\ncomment|bool=true|Bemerkung bearbeiten\nroute|bool=true|Strecke bearbeiten\nelevation|bool=false|hm bearbeiten\npartner|bool=false|Trainingspartner bearbeiten\ntemperature|bool=false|Temperatur bearbeiten\nweather|bool=false|Wetter bearbeiten\nclothes|bool=false|Kleidung bearbeiten\nsplits|bool=false|Zwischenzeiten bearbeiten\n', 1, 99),
(20, 'RunalyzePluginTool_AnalyzeVDOT', 'tool', 'class.RunalyzePluginTool_AnalyzeVDOT.php', 'VDOT analysieren', 'Den VDOT im Zusammenhang mit Wettkampfergebnissen analysieren', '', 1, 99);

UPDATE `runalyze_plugin` SET `config` = 'show_trainingpaces|bool=true|Empfohlene Trainingstempi anzeigen\n' WHERE `key`="RunalyzePluginPanel_Rechenspiele";