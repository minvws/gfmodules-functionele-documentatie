# Algemeen

## Inleiding

De documentatie beschrijft in globaal functionele en technische termen hoe de
onderstaande generieke functies worden gerealiseerd:

- [Adressering](./adressering/index.md)
- [Lokalisatie](./lokalisatie/index.md)

Tevens beschrijft de documentatie de rol van additionele systemen zoals het
[pseudoniemen systeem](./pseudoniemen/index.md).

**Disclaimer:** Alle hier beschreven documentatie is provisioneel en kan op
basis van ontwikkelingen in werkgroepen en daarbuiten wijzigen. De informatie
wordt verstrekt "zoals deze is" zonder enige expliciete of impliciete garanties.
Gebruik van de informatie is op eigen risico en de auteurs zijn niet
aansprakelijk voor eventuele fouten of omissies in de inhoud.

## Techische conceptuele uitwerking

De in deze documentatie beschreven systemen zijn voor een deel uitgewerkt in
technische concepten. Deze hebben als doelstelling een conceptuele implementatie
te zijn van de keuzes die gemaakt worden binnen de generieke functie
werkgroepen. In sommige gevallen zullen de implementaties voor of achter lopen
op de besluitvorming. Indien een implementatie voorloopt is dit gedaan zodat de
werkgroep van een praktische implementatie kan leren.

Alle uitwerkingen zijn te vinden op GitHub:

<https://github.com/minvws/gfmodules-coordination>

## Afkortingen en Begrippen

Deze pagina bevat een overzicht van alle afkortingen en begrippen die worden
gebruikt in de documentatie van de Generieke Functies. Voor specifieke termen
per module, zie ook:

- [Adressering - Afkortingen en Begrippen](./adressering/index.md#termen)
- [Lokalisatie - Afkortingen en Begrippen](./lokalisatie/index.md#termen)
- [Pseudoniemen - Afkortingen en Begrippen](./pseudoniemen/index.md#termen)

### Algemene afkortingen en begrippen

- **API**: Application Programming Interface
- **BSN**: Burgerservicenummer
- **EPD**: Elektronisch Patiëntendossier
- **FHIR**: 'Fast Healthcare Interoperability Resources' internationale
  standaard voor het uitwisselen van gegevens in de zorg
- **FHIR mCSD**: Mobile Care Services Discovery. mCSD-profiel voor FHIR
  ondersteunt een federatief systeem voor het vinden van adresgegevens van
  zorgorganisaties.
- **I&A**: Identificatie & Authenticatie
- **IHE**: Integrating the Healthcare Enterprise
- **ITI-90**: IHE ITI-90 Find Matching Care Services transactie voor het
  opzoeken van care services
- **ITI-91**: IHE ITI-91 Request Care Services Updates transactie voor het
  opvragen van updates
- **LMR**: Lokalisatie Metadata Register
- **LRZa**: Landelijk Register Zorgaanbieders
- **mCSD**: The Mobile Care Services Discovery (mCSD), Profiel dat RESTful
  queries op gerelateerde zorgdiensten ondersteunt.
  [Zie mCSD documentation](https://build.fhir.org/ig/IHE/ITI.mCSD/)
- **NEN**: Stichting Koninklijk Nederlands Normalisatie Instituut
- **NVI**: Nationale VerwijsIndex
- **NVS**: Nationale Visie en Strategie voor het GezondheidsinformatieStelsel
- **POC**: Proof of Concept
- **PRS**: Pseudoniemen Referentie Service
- **REST API**: Representational State Transfer API, is een set regels voor het
  verzenden van gegevens tussen een client en server.

### Begrippen

- **Pseudoniem**: Een voor een dienst specifieke code die een burger
  identificeert
- **Token**: Uitwisselingstoken voor communicatie tussen systemen
- **Zorgaanbieder**: Instelling of organisatie die zorg aanbiedt.
