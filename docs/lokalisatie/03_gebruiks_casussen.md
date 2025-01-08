# Gebruikscasussen

De onderstaande gebruikscasussen beschrijven beheer, registratie van data en
opzoekmogelijkheden.

## Lokalisatieproces

De generieke functie lokalisatie geeft antwoord op de vraag waar zorggegevens
van een patiënt gevonden kunnen worden. Om dit te kunnen doen is een centrale
index nodig. Deze gebruikscasus beschrijft hoe de NVI deze rol vervult:

1. Een zorgverlener is op zoek naar medische gegevens van een patiënt.
2. Deze vraagt het EPD om deze te lokaliseren.
3. Het EPD vraagt de NVI welke zorgaanbieders data van de patiënt hebben.
4. De NVI controleert de autorisaties en toestemming.
5. Indien akkoord, geeft de NVI aan waar deze data te vinden is.

In aanvulling hierop zal binnen het lokalisatie proces ook de volgende stappen plaatsvinden:

1. Het EPD haalt bij de verschillende LMR de tijdlijngegevens op.
2. In het EPD worden de gegevens gecombineerd en gepresenteerd.

Het onderstaande diagram geeft een vereenvoudigd overzicht van het lokalisatieproces.

```{mermaid}
sequenceDiagram
    actor Zorgverlener
    participant EPD
    participant NVI
    participant LMR1
    participant LMR2

    Zorgverlener->>EPD: Zoek medische gegevens van patiënt
    EPD->>NVI: Welke zorgaanbieders hebben data van de patiënt?
    NVI->>NVI: Controleer autorisaties en toestemming
    NVI-->>EPD: Locaties van zorgdata
    EPD->>LMR1: Vraag tijdlijn data van patiënt
    EPD->>LMR2: Vraag tijdlijn data van patiënt
    LMR1-->>EPD: Tijdlijn data van patiënt
    LMR2-->>EPD: Tijdlijn data van patiënt
    EPD-->>EPD: Combineer data tot tijdlijn
    EPD-->>Zorgverlener: Tijdlijn
```

## Zorgdata registratie

1. Een zorgverlener maakt of past een dossier aan.
2. Het LMR ontvangt deze dossier bijwerking.
3. Het LMR registreert de beschikbaarheid van het dossier bij de NVI.

```{mermaid}
sequenceDiagram
    actor Zorgverlener
    participant EPD
    participant LMR
    participant NVI

    Zorgverlener->>EPD: Maak of pas dossier aan
    EPD->>LMR: Registreer metadata
    LMR->>NVI: Registreer beschikbaarheid van dossier
```
