#!/usr/bin/env ruby
require "uri"
require "net/http"
require 'json'

url = URI("https://dev-api.haulmer.com/v2/dte/document")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["apikey"] = "928e15a2d14d4a6292345f04960f4bd3"

# body = "{\"response\":[\"PDF\",\"FOLIO\"],\"dte\":{\"Encabezado\":{\"IdDoc\":{\"TipoDTE\":33,\"Folio\":0,\"FchEmis\":\"2019-03-18\",\"TpoTranCompra\":\"1\",\"TpoTranVenta\":\"1\",\"FmaPago\":\"2\"},\"Emisor\":{\"RUTEmisor\":\"76795561-8\",\"RznSoc\":\"HAULMER SPA\",\"GiroEmis\":\"VENTA AL POR MENOR POR CORREO, POR INTERNET Y VIA TELEFONICA\",\"Acteco\":\"479100\",\"DirOrigen\":\"ARTURO PRAT 527   CURICO\",\"CmnaOrigen\":\"Curicó\",\"Telefono\":\"0 0\",\"CdgSIISucur\":\"81303347\"},\"Receptor\":{\"RUTRecep\":\"76430498-5\",\"RznSocRecep\":\"HOSTY SPA\",\"GiroRecep\":\"ACTIVIDADES DE CONSULTORIA DE INFORMATIC\",\"DirRecep\":\"ARTURO PRAT 527 3 pis OF 1\",\"CmnaRecep\":\"Curicó\"},\"Totales\":{\"MntNeto\":2000,\"TasaIVA\":\"19\",\"IVA\":380,\"MntTotal\":2380,\"MontoPeriodo\":2380,\"VlrPagar\":2380}},\"Detalle\":[{\"NroLinDet\":1,\"NmbItem\":\"item\",\"QtyItem\":1,\"PrcItem\":2000,\"MontoItem\":2000}]}}\n"

body = {
  "response": [
    "PDF",
    "FOLIO"
  ],
  "dte": {
    "Encabezado": {
      "IdDoc": {
        "TipoDTE": 33,
        "Folio": 0,
        "FchEmis": "2019-03-18",
        "TpoTranCompra": "1",
        "TpoTranVenta": "1",
        "FmaPago": "2"
      },
      "Emisor": {
        "RUTEmisor": "76795561-8",
        "RznSoc": "HAULMER SPA",
        "GiroEmis": "VENTA AL POR MENOR POR CORREO, POR INTERNET Y VIA TELEFONICA",
        "Acteco": "479100",
        "DirOrigen": "ARTURO PRAT 527   CURICO",
        "CmnaOrigen": "Curicó",
        "Telefono": "0 0",
        "CdgSIISucur": "81303347"
      },
      "Receptor": {
        "RUTRecep": "76430498-5",
        "RznSocRecep": "HOSTY SPA",
        "GiroRecep": "ACTIVIDADES DE CONSULTORIA DE INFORMATIC",
        "DirRecep": "ARTURO PRAT 527 3 pis OF 1",
        "CmnaRecep": "Curicó"
      },
      "Totales": {
        "MntNeto": 2000,
        "TasaIVA": "19",
        "IVA": 380,
        "MntTotal": 2380,
        "MontoPeriodo": 2380,
        "VlrPagar": 2380
      }
    },
    "Detalle": [
      {
        "NroLinDet": 1,
        "NmbItem": "item",
        "QtyItem": 1,
        "PrcItem": 2000,
        "MontoItem": 2000
      }
    ]
  }
}

request.body = body.to_json

response = https.request(request)
puts response.read_body

# puts JSON.parse(body).to_s.gsub("=>", ":")