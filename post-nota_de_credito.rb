#!/usr/bin/env ruby
require "uri"
require "net/http"
require 'json'
require 'date'

url = URI("https://dev-api.haulmer.com/v2/dte/document")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

# body = "{\"response\":[\"XML\",\"PDF\",\"TIMBRE\",\"LOGO\",\"FOLIO\",\"RESOLUCION\"],\"dte\":{\"Encabezado\":{\"IdDoc\":{\"TipoDTE\":61,\"Folio\":0,\"FchEmis\":\"{{DateToday}}\",\"TpoTranVenta\":\"1\",\"FmaPago\":\"2\"},\"Emisor\":{\"RUTEmisor\":\"76795561-8\",\"RznSoc\":\"HAULMERSPA\",\"GiroEmis\":\"VENTAALPORMENORENEMPRESASDEVENTAADISTANCIAVÍAINTERNET;COMERCIOELEC\",\"Acteco\":479100,\"DirOrigen\":\"ARTUROPRAT527CURICO\",\"CmnaOrigen\":\"Curicó\",\"Telefono\":\"00\",\"CdgSIISucur\":\"81303347\"},\"Receptor\":{\"RUTRecep\":\"76430498-5\",\"RznSocRecep\":\"HOSTYSPA\",\"GiroRecep\":\"EMPRESASDESERVICIOSINTEGRALESDEINFO\",\"Contacto\":\"+56969195057\",\"DirRecep\":\"ArturoPrat5273pisooficina1\",\"CmnaRecep\":\"CURICÓ\"},\"Totales\":{\"MntNeto\":1500,\"TasaIVA\":\"19\",\"IVA\":285,\"MntTotal\":1785,\"MontoPeriodo\":1785,\"VlrPagar\":1785}},\"Detalle\":[{\"NroLinDet\":1,\"NmbItem\":\"item1\",\"QtyItem\":1,\"PrcItem\":1500,\"MontoItem\":1500}],\"Referencia\":[{\"NroLinRef\":1,\"TpoDocRef\":\"33\",\"FolioRef\":\"106\",\"FchRef\":\"2018-08-16\",\"CodRef\":\"3\"}]}}"

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
        "TipoDTE": 61,
        "Folio": 0,
        "FchEmis": "#{Date.today}",
        "TpoTranVenta": "1",
        "FmaPago": "2"
      },
      "Emisor": {
        "RUTEmisor": "76795561-8",
        "RznSoc": "HAULMERSPA",
        "GiroEmis": "VENTAALPORMENORENEMPRESASDEVENTAADISTANCIAVÍAINTERNET;COMERCIOELEC",
        "Acteco": 479100,
        "DirOrigen": "ARTUROPRAT527CURICO",
        "CmnaOrigen": "Curicó",
        "Telefono": "00",
        "CdgSIISucur": "81303347"
      },
      "Receptor": {
        "RUTRecep": "76430498-5",
        "RznSocRecep": "HOSTYSPA",
        "GiroRecep": "EMPRESASDESERVICIOSINTEGRALESDEINFO",
        "Contacto": "+56969195057",
        "DirRecep": "ArturoPrat5273pisooficina1",
        "CmnaRecep": "CURICÓ"
      },
      "Totales": {
        "MntNeto": 1500,
        "TasaIVA": "19",
        "IVA": 285,
        "MntTotal": 1785,
        "MontoPeriodo": 1785,
        "VlrPagar": 1785
      }
    },
    "Detalle": [
      {
        "NroLinDet": 1,
        "NmbItem": "item1",
        "QtyItem": 1,
        "PrcItem": 1500,
        "MontoItem": 1500
      }
    ],
    "Referencia": [
      {
        "NroLinRef": 1,
        "TpoDocRef": "33",
        "FolioRef": "106",
        "FchRef": "2018-08-16",
        "CodRef": "3"
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