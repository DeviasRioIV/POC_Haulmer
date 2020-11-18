#!/usr/bin/env ruby
require "uri"
require "net/http"
require 'json'

url = URI("https://dev-api.haulmer.com/v2/dte/document")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["apikey"] = "928e15a2d14d4a6292345f04960f4bd3"

# body = "{ \"response\":[ \"XML\", \"PDF\", \"TIMBRE\", \"LOGO\", \"FOLIO\", \"RESOLUCION\" ], \"dte\":{ \"Encabezado\":{ \"IdDoc\":{ \"TipoDTE\":52, \"Folio\":0, \"FchEmis\":\"2018-08-16\", \"TipoDespacho\":\"2\", \"IndTraslado\":\"3\", \"TpoTranVenta\":\"1\", \"FmaPago\":\"1\" }, \"Emisor\":{ \"RUTEmisor\":\"76795561-8\", \"RznSoc\":\"HAULMERSPA\", \"GiroEmis\":\"VENTA AL POR MENOR EN EMPRESAS DE VENTA A DISTANCIA VÍA INTERNET; COMERCIO ELEC\", \"Acteco\":479100, \"GuiaExport\":{ \"CdgTraslado\":\"3\" }, \"DirOrigen\":\"ARTURO PRAT 527 CURICO\", \"CmnaOrigen\":\"Curicó\", \"CdgSIISucur\":\"81303347\" }, \"Receptor\":{ \"RUTRecep\":\"76430498-5\", \"RznSocRecep\":\"HOSTYSPA\", \"GiroRecep\":\"EMPRESAS DE SERVICIOS INTEGRALES DE INFO\", \"DirRecep\":\"ARTURO PRAT 5273 pis OF1\", \"CmnaRecep\":\"Curicó\" }, \"Transporte\":{ \"DirDest\":\"Arturo Prat 527\", \"CmnaDest\":\"Curicó\", \"CiudadDest\":\"Curicó\" }, \"Totales\":{ \"MntNeto\":2000, \"TasaIVA\":\"19\", \"IVA\":380, \"MntTotal\":2380, \"MontoPeriodo\":2380, \"VlrPagar\":2380 } }, \"Detalle\":[ { \"NroLinDet\":1, \"NmbItem\":\"item despacho\", \"QtyItem\":1, \"PrcItem\":2000, \"MontoItem\":2000 } ] } }"

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
        "TipoDTE": 52,
        "Folio": 0,
        "FchEmis": "2018-08-16",
        "TipoDespacho": "2",
        "IndTraslado": "3",
        "TpoTranVenta": "1",
        "FmaPago": "1"
      },
      "Emisor": {
        "RUTEmisor": "76795561-8",
        "RznSoc": "HAULMERSPA",
        "GiroEmis": "VENTA AL POR MENOR EN EMPRESAS DE VENTA A DISTANCIA VÍA INTERNET; COMERCIO ELEC",
        "Acteco": 479100,
        "GuiaExport": {
          "CdgTraslado": "3"
        },
        "DirOrigen": "ARTURO PRAT 527 CURICO",
        "CmnaOrigen": "Curicó",
        "CdgSIISucur": "81303347"
      },
      "Receptor": {
        "RUTRecep": "76430498-5",
        "RznSocRecep": "HOSTYSPA",
        "GiroRecep": "EMPRESAS DE SERVICIOS INTEGRALES DE INFO",
        "DirRecep": "ARTURO PRAT 5273 pis OF1",
        "CmnaRecep": "Curicó"
      },
      "Transporte": {
        "DirDest": "Arturo Prat 527",
        "CmnaDest": "Curicó",
        "CiudadDest": "Curicó"
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
        "NmbItem": "item despacho",
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