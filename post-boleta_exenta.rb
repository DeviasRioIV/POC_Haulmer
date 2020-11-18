#!/usr/bin/env ruby
require "uri"
require "net/http"
require 'json'
require 'date'

url = URI("https://dev-api.haulmer.com/v2/dte/document")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

# body = "{\"response\":[\"XML\",\"PDF\",\"TIMBRE\",\"LOGO\",\"FOLIO\",\"RESOLUCION\"],\"dte\":{\"Encabezado\":{\"IdDoc\":{\"TipoDTE\":41,\"Folio\":0,\"FchEmis\":\"{{DateToday}}\",\"IndServicio\":\"3\"},\"Emisor\":{\"RUTEmisor\":\"76795561-8\",\"RznSocEmisor\":\"HAULMERSPA\",\"GiroEmisor\":\"VENTAALPORMENORENEMPRESASDEVENTAADISTANCIAVÍAINTERNET;COMERCIOELEC\",\"CdgSIISucur\":\"81303347\",\"DirOrigen\":\"ARTUROPRAT527CURICO\",\"CmnaOrigen\":\"Curicó\"},\"Receptor\":{\"RUTRecep\":\"66666666-6\"},\"Totales\":{\"MntExe\":2000,\"MntTotal\":2000,\"TotalPeriodo\":2000,\"VlrPagar\":2000}},\"Detalle\":[{\"NroLinDet\":1,\"IndExe\":1,\"NmbItem\":\"Itemexento\",\"QtyItem\":1,\"PrcItem\":2000,\"MontoItem\":2000}]}}"

body = {
  "response": [
    "XML",
    "PDF",
    "TIMBRE",
    "LOGO",
    "FOLIO",
    "RESOLUCION"
  ],
  "dte": {
    "Encabezado": {
      "IdDoc": {
        "TipoDTE": 41,
        "Folio": 0,
        "FchEmis": "#{Date.today}",
        "IndServicio": "3"
      },
      "Emisor": {
        "RUTEmisor": "76795561-8",
        "RznSocEmisor": "HAULMERSPA",
        "GiroEmisor": "VENTAALPORMENORENEMPRESASDEVENTAADISTANCIAVÍAINTERNET;COMERCIOELEC",
        "CdgSIISucur": "81303347",
        "DirOrigen": "ARTUROPRAT527CURICO",
        "CmnaOrigen": "Curicó"
      },
      "Receptor": {
        "RUTRecep": "66666666-6"
      },
      "Totales": {
        "MntExe": 2000,
        "MntTotal": 2000,
        "TotalPeriodo": 2000,
        "VlrPagar": 2000
      }
    },
    "Detalle": [
      {
        "NroLinDet": 1,
        "IndExe": 1,
        "NmbItem": "Itemexento",
        "QtyItem": 1,
        "PrcItem": 2000,
        "MontoItem": 2000
      }
    ]
  }
}

request = Net::HTTP::Post.new(url)
request["apikey"] = "928e15a2d14d4a6292345f04960f4bd3"
request.body = body.to_json

response = https.request(request)
puts response.read_body

# puts JSON.parse(body).to_s.gsub("=>", ":")