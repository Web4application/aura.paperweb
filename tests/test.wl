(* ====================================== *)
(* tests.wl: Verify data integrity & format *)
(* ====================================== *)

(* Load main data *)
dataset = Import["wolfram/aura_analysis.xlsx", "Data"][[1]];

(* Test 1: Headers are strings *)
headerTest = AllTrue[First[dataset], StringQ];

(* Test 2: Scores are numeric *)
scoreTest = AllTrue[Rest[dataset][[All, 2]], NumberQ];

(* Test 3: Values are real numbers *)
valueTest = AllTrue[Rest[dataset][[All, 3]], NumberQ];

If[headerTest && scoreTest && valueTest,
  Print["All tests passed ✅"],
  Print["Data check failed ❌"]
]
