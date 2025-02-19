# Architectuur

De architectuur voor lokalisatie bestaat uit / maakt gebruik van de volgende
onderdelen:

- Nationale Verwijs Index (NVI)
- Lokalisatie Metadata Register (LMR)
- Pseudoniemen referentie service (PRS)
- De generieke functie adressering

Het onderstaande diagram geeft een overzicht van de betrokken systemen bij
lokalisatie:

![Overzicht van de betrokken systemen bij lokalisatie](../afbeeldingen/structurizr-generieke-functie-lokalisatie.svg)

## NVI

De Nationale Verwijs Index (NVI) beantwoordt de vraag waar er data over een
patient is. Dit is een centrale index die de volgende gegevens bevat:

- enkel bij de NVI bekend pseudoniem van de patiënt
- identificatie code van zorgaanbieder
- zorgcontext (bijvoorbeeld de uitwisseling)

Ook biedt het systeem filtermogelijkheden om het antwoord te beperken tot de
specifieke uitwisseling. Dit voorkomt dat een arts meer informatie krijgt dan
nodig is voor de behandeling.

## LMR

Het lokalisatie metadata register (LMR) is een specificatie voor een bronsysteem
wat de gegevens levert die nodig zijn voor het opbouwen van de tijdlijn.
Technisch betekent dit een systeem wat via FHIR te bevragen valt. Aanvullend
zijn er specificaties over de FHIR resources die aanwezig geacht worden en de
velden die daarbij beschikbaar gesteld dienen te worden.

In de architectuur wordt ervan uit gegaan dat er binnen de zorg
FHIR-implementaties in gebruik zijn die geschikt zijn voor de LMR rol. Het is
echter ook mogelijk om een apart systeem hiervoor te (laten) inrichten.

## PRS

Als privacy verhogende maatregel zal de NVI zelf geen BSN verwerken. Om toch een
lokalisatie vraag te kunnen beantwoorden zal er gewerkt worden met een
pseudoniem. De pseudoniemen referentie service (PRS) heeft als taak dit
pseudoniem te maken.

## Adressering

Een van de stappen in het lokalisatie proces is het vinden van de LMR endpoints
op basis van het organisatie ID. Hiervoor zal gebruik gemaakt worden van de
adresseringsfunctie.
