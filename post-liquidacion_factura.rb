#!/usr/bin/env ruby
require "uri"
require "net/http"
require 'json'
require 'date'

url = URI("https://dev-api.haulmer.com/v2/dte/document")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

# body = "{\"response\":[\"XML\",\"PDF\",\"TIMBRE\",\"LOGO\",\"FOLIO\",\"RESOLUCION\"],\"dte\":{\"Encabezado\":{\"IdDoc\":{\"TipoDTE\":43,\"Folio\":0,\"FchEmis\":\"{{DateToday}}\",\"TpoTranCompra\":\"1\",\"TpoTranVenta\":\"1\",\"FmaPago\":\"2\"},\"Emisor\":{\"RUTEmisor\":\"76795561-8\",\"RznSoc\":\"HAULMERSPA\",\"GiroEmis\":\"VENTAALPORMENORENEMPRESASDEVENTAADISTANCIAVÍAINTERNET;COMERCIOELEC\",\"Acteco\":479100,\"DirOrigen\":\"ARTUROPRAT527CURICO\",\"CmnaOrigen\":\"Curicó\",\"Telefono\":\"00\",\"CdgSIISucur\":\"81303347\"},\"Receptor\":{\"RUTRecep\":\"76430498-5\",\"RznSocRecep\":\"HOSTYSPA\",\"GiroRecep\":\"EMPRESASDESERVICIOSINTEGRALESDEINFO\",\"DirRecep\":\"ARTUROPRAT5273pisOF1\",\"CmnaRecep\":\"Curicó\",\"Contacto\":\"null\"},\"Totales\":{\"MntNeto\":2000,\"TasaIVA\":\"19\",\"IVA\":380,\"MntTotal\":2380,\"MontoPeriodo\":2380,\"VlrPagar\":2380}},\"Detalle\":[{\"NroLinDet\":1,\"TpoDocLiq\":\"33\",\"NmbItem\":\"item\",\"QtyItem\":1,\"PrcItem\":2000,\"MontoItem\":2000}]}}"

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
        "TipoDTE": 43,
        "Folio": 0,
        "FchEmis": "#{Date.today}",
        "TpoTranCompra": "1",
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
        "DirRecep": "ARTUROPRAT5273pisOF1",
        "CmnaRecep": "Curicó",
        "Contacto": "null"
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
        "TpoDocLiq": "33",
        "NmbItem": "item",
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