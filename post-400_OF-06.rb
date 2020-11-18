#!/usr/bin/env ruby
require "uri"
require "net/http"
require 'json'

url = URI("https://dev-api.haulmer.com/v2/dte/document")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

# body = "{ \"response\": [ \"XML\", \"PDF\", \"TIMBRE\", \"LOGO\", \"FOLIO\", \"RESOLUCION\" ], \"dte\": { \"Encabezado\": { \"IdDoc\": { \"TipoDTE\": 33, \"Folio\": 0, \"FchEmis\": \"2018-11-22\", \"TpoTranCompra\": 1, \"TpoTranVenta\": 1, \"FmaPago\": 2 }, \"Emisor\": { \"RUTEmisor\": \"76795561-8\", \"RznSoc\": \"HAULMER SPA\", \"GiroEmis\": \"VENTA AL POR MENOR EN EMPRESAS DE VENTA A DISTANCIA VÍA INTERNET; COMERCIO ELEC\", \"Acteco\": 479100, \"DirOrigen\": \"ARTURO PRAT 527   CURICO\", \"CmnaOrigen\": \"Curicó\", \"CdgSIISucur\": \"81303347\" }, \"Receptor\": { \"RUTRecep\": \"76430498-5\", \"RznSocRecep\": \"HOSTY SPA\", \"GiroRecep\": \"EMPRESAS DE SERVICIOS INTEGRALES DE INFO\", \"Contacto\": \"+56 9 69195057\", \"DirRecep\": \"Arturo Prat 527 3 piso oficina 1\", \"CmnaRecep\": \"CURICÓ\" }, \"Totales\": { \"MntNeto\": 100, \"TasaIVA\": \"19\", \"IVA\": 19, \"MntTotal\": 119 } }, \"Detalle\": [ { \"NroLinDet\": 1, \"NmbItem\": \"TRANSPORTE DE CARGA\", \"DscItem\": \"Envío Emision por Postman Manual o Automatica\", \"QtyItem\": 1, \"PrcItem\": 100, \"MontoItem\": 100 } ] } }"

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
        "TipoDTE": 33,
        "Folio": 0,
        "FchEmis": "2018-11-22",
        "TpoTranCompra": 1,
        "TpoTranVenta": 1,
        "FmaPago": 2
      },
      "Emisor": {
        "RUTEmisor": "76795561-8",
        "RznSoc": "HAULMER SPA",
        "GiroEmis": "VENTA AL POR MENOR EN EMPRESAS DE VENTA A DISTANCIA VÍA INTERNET; COMERCIO ELEC",
        "Acteco": 479100,
        "DirOrigen": "ARTURO PRAT 527   CURICO",
        "CmnaOrigen": "Curicó",
        "CdgSIISucur": "81303347"
      },
      "Receptor": {
        "RUTRecep": "76430498-5",
        "RznSocRecep": "HOSTY SPA",
        "GiroRecep": "EMPRESAS DE SERVICIOS INTEGRALES DE INFO",
        "Contacto": "+56 9 69195057",
        "DirRecep": "Arturo Prat 527 3 piso oficina 1",
        "CmnaRecep": "CURICÓ"
      },
      "Totales": {
        "MntNeto": 100,
        "TasaIVA": "19",
        "IVA": 19,
        "MntTotal": 119
      }
    },
    "Detalle": [
      {
        "NroLinDet": 1,
        "NmbItem": "TRANSPORTE DE CARGA",
        "DscItem": "Envío Emision por Postman Manual o Automatica",
        "QtyItem": 1,
        "PrcItem": 100,
        "MontoItem": 100
      }
    ]
  }
}

request = Net::HTTP::Post.new(url)
request["apikey"] = "928e15a2d14d4a6292345f04960f4bd3"
request["Idempotency-Key"] = "key"
request.body = body.to_json

response = https.request(request)
puts response.read_body

# puts JSON.parse(body).to_s.gsub("=>", ":")
