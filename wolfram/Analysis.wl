(* ====================================== *)
(* analysis.wl: Generate, process, export *)
(* ====================================== *)

(* Generate sample data *)
data = Table[
   {"Row " <> ToString[i], RandomInteger[{1, 100}], RandomReal[]},
   {i, 1, 20}
];

(* Export to Excel for aura.xlsl usage *)
Export["wolfram/aura_analysis.xlsx", <|
   "Sheet1" -> Prepend[data, {"Name", "Score", "Value"}]
|>, "XLSX"]

Print["Spreadsheet exported successfully!"]
