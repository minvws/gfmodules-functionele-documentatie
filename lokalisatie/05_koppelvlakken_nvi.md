# Koppelvlakken NVI

De NVI heeft twee koppelvlakken:

1. Opzoeken
2. Registreren

Dit document beschrijft beide koppelvlakken in termen van interactie en data.
Het verwijst ook naar de technische details (API specificaties) voor beide
koppelvlakken.

## Opzoeken

Een zoekvraag voor de NVI dient de volgende gegevens te bevatten:

1. Autorisatie
    - Identificatie van de zorgverlener
    - Identificatie van de zorgaanbieder
2. Lokalisatievraag
    - Beoogde uitwisseling
    - Patiëntidentificatie

> **Opmerking:** Het autorisatiegedeelte is nog niet uitgewerkt. Dit wacht op
> besluitvorming uit de I&A werkgroep.`


### Lokalisatievraag

De lokalisatievraag bestaat uit de beoogde uitwisseling (beeld, medicatie, etc.)
en identificatie van de patiënt. Elke uitwisseling krijgt een code die gebruikt
kan worden in de lokalisatievraag.

> **Opmerking:** Er is nog geen codelijst voor de uitwisselingen vastgesteld.

Voor de identificatie van de patiënt zal binnen de NVI gebruik gemaakt worden
van een pseudoniem. Dit pseudoniem is uniek voor de NVI. Om de NVI te bevragen,
zal daarom een *token* voor de patiënt opgehaald moeten worden bij het
pseudoniemen systeem.

### Resultaat van lokalisatievraag

Het resultaat van een lokalisatievraag is een lijst (mogelijk leeg) met daarin
de relevante gegevens.

## Registreren

Voordat data via het opzoeken gevonden kan worden, dient deze eerst
geregistreerd te worden. Dit kan via het aanroepen van de registratiefunctie op
de NVI. Voor deze functie zijn de volgende gegevens nodig:

1. Autorisatie
    - Identificatie van de zorgaanbieder
2. Registratiegegevens
    - Uitwisseling
    - Patiëntidentificatie
3. Type operatie (registreren / verwijderen)

De gegevens uit de identificatie worden gebruikt voor toegangsverlening en
registratie.

> **Opmerking:** Zie de opmerkingen bij opzoeken voor openstaande onderwerpen.

Voor de registratie van de organisatie wordt op dit moment uitgegaan van het URA
als ID. Dit is voorlopig gekozen in afwachting van een definitieve keuze uit de
requirements en architectuur werkgroepen.