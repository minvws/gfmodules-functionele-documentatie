# Toestemming

Binnen de proeftuin omgeving is er voor de generieke functie Toestemming een stub implementatie beschikbaar.

Deze stub implementatie demonstreert de functionaliteit van een toestemmingsvoorziening,
waarbij burgers hun toestemmingen kunnen beheren en zorgverleners of it systemen van zorgverleners
deze toestemmingen kunnen opvragen voor autorisatiedoeleinden.

De online toestemmingsvoorziening wordt binnen de proeftuin gebruikt door de NVI.

[//]: # (TODO: Dit wordt momenteel aangepast van NVI naar LMR. )

## Overzicht van services

### Online Toestemmingsvoorziening Portaal
**URL**: [https://otv-web.proeftuin.gf.irealisatie.nl](https://otv-web.proeftuin.gf.irealisatie.nl)

Het Toestemmingsvoorziening Portaal is een stub implementatie van een webportaal waar burgers hun zorgtoestemmingen kunnen beheren.
Dit portaal simuleert deze functionaliteit voor demonstratie- en testdoeleinden binnen de proeftuin omgeving.

In dit portaal zou een burger normaal met DigiD inloggen, voor deze proeftuin is er een simpele mock login waarbij je fictief BSN invoert.
Hierna kan de burger de kiezen welke zorgaanbieders medische gegevens mogen beschikbaar stellen aan andere zorgverleners.

Het portaal maakt gebruikt van de Pseudoniem Referentie Service Stub om een pseudoniem op te halen voor het fictief ingelogde BSN.
Ook maakt het gebruik van de adresseringsdienst om een lijst van zorgaanbieders op te halen.

Door het wijzigigen van toestemmingen in het portaal, wijzigt ook de data die zichtbaar is in de "Viewer" applicatie.

[//]: # (TODO: Mogelijk linkjes naar de specifieke service pagina toevoegen?)

### Online Toestemmingsvoorziening Stub
**URL**: [https://otv-stub.proeftuin.gf.irealisatie.nl](https://otv-stub.proeftuin.gf.irealisatie.nl)

[//]: # (TODO: Link naar OpenAPI specificatie toevoegen?)

De Online Toestemmingsvoorziening Stub is een API waar toestemmingen van burgers kunnen worden opgevraagd door it systemen van zorgverleners.

Deze API wordt in de proeftuin gebruikt door de NVI om te controleren of een zorgverlener toestemming heeft om medische gegevens op te vragen voor een specifieke patiënt en gevraagde gegevens.

## API Documentatie

### Toestemming Stub API Endpoints

[//]: # (TODO: Zie OpenAPI specificatie voor volledige documentatie?)

#### Toestemming Opvragen
```
POST /permission
Content-Type: application/json

Request Body:
{
  "resource": {
    "pseudonym": "12345-abcde-67890-fghij",
    "org_ura": "12345678",
    "org_category": "V1"
  },
  "subject": {
    "org_ura": "87654321"
  }
}

Response: true | false
```

**Parameters:**
- **resource.pseudonym** (verplicht): Het pseudoniem van de persoon voor wie toestemming wordt opgevraagd
- **resource.org_ura** (verplicht): URA nummer van de organisatie die de gegevens beheert
- **resource.org_category** (optioneel): Categorie van de organisatie die de gegevens beheert
- **subject.org_ura** (verplicht): URA nummer van de organisatie die toegang vraagt

**Response:**
- `true`: Toestemming is verleend
- `false`: Toestemming is niet verleend

## Testscenario's

### Scenario 1: Nieuwe Toestemming
1. Login op het Toestemmingsvoorziening Portaal
2. Doe A
5. Klik op "Opslaan"
6. Valideer dat toestemming API nu true teruggeeft voor vraag X

### Scenario 2: Toestemming Intrekken
1. Bekijk bestaande toestemmingen in het portaal
2. Klik bij X op "Nee"
3. Klik op "Opslaan"
5. Valideer dat toestemming API nu false teruggeeft voor vraag X
