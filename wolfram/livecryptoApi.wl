(* ====================================== *)
(* liveCryptoAPI.wl: Pull live crypto data *)
(* ====================================== *)

cryptoData = URLRead[
    "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd"
] // ImportString[#, "JSON"] &;

cryptoTable = {
  {"Asset", "USD Price"},
  {"BTC", cryptoData["bitcoin", "usd"]},
  {"ETH", cryptoData["ethereum", "usd"]}
};

(* Export live prices to Excel for aura.xlsl *)
Export["wolfram/crypto_prices.xlsx", cryptoTable, "XLSX"]

Print["Live crypto prices fetched and exported!"]
