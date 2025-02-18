# Gebruikscasussen

De onderstaande gebruikscasussen beschrijven beheer, registratie van data en
opzoekmogelijkheden.

## Organisatie informatie vinden

De generieke functie adressering geeft antwoord op de vraag via welke contact
punten informatie uitgewisseld kan worden. Dit kunnen fysieke locaties zijn
(adresgegevens) maar is vooral gericht op het beschikbaar maken van technische
endpoints waarmee software systemen met elkaar kunnen communiceren. De
onderstaande gebruikscasus geeft een globaal beeld van het opzoeken van
gegevens.

1. Een zorgverlener start een gegevensuitwisseling met een andere organisatie.
2. Het EPD zoekt (IHE mCSD Selective Consumer) naar het technische endpoint voor
   de gegevensuitwisseling. Om dit te doen stelt het EPD een vraag aan een
   adresboek (IHE mCSD Selective Supplier).
3. De zoekopdracht wordt door het adresboek uitgevoerd en levert de FHIR
   resources die matchen met de zoekopdracht.
4. Het EPD gebruikt de gevonden informatie om verbinding te maken met het
   systeem van de andere organisatie.

Het onderstaande diagram geeft een vereenvoudigd overzicht van het
adresseringsproces.

```{mermaid}
sequenceDiagram
    actor Zorgverlener
    participant EPD as EPD<br>«Selective Consumer»
    participant Adresboek as Adresboek<br>«Selective Supplier»

    Zorgverlener->>EPD: Start gegevensuitwisseling
    EPD->>Adresboek: Zoek technisch endpoint
    Adresboek->>EPD: Retourneer FHIR resources
    alt Verbinding mogelijk
        EPD->>Externe Systeem: Maak verbinding
    else Toon gegevens
        EPD->>Zorgverlener: Toon gevonden contactgegevens
    end
```

## Registratie van adresgegevens

Zorginstellingen hebben een verantwoordelijkheid om zelf te bepalen welke
contact punten zij ter beschikking stellen. Dit kunnen zij doen door het
publiceren van de contact gegevens via een FHIR endpoint wat het IHE mCSD
profiel ondersteund. In het specifiek is deze endpoint een Update Supplier. Deze
endpoint dient bij het LRZa bekend gemaakt te worden.

1. Een zorginstelling bepaalt welke contactpunten beschikbaar worden gesteld.
2. De zorginstelling publiceert de contactgegevens via een FHIR endpoint (IHE
   mCSD Update Supplier).
3. Het FHIR endpoint wordt bij het LRZa geregistreerd.
4. Adresboek systemen kunnen het LRZa bevragen om bronnen van adresgegevens te vinden.

```{mermaid}
sequenceDiagram
    actor Zorginstelling

    Zorginstelling->>Zorginstelling: Bepaal contactpunten
    Zorginstelling->>FHIR Store: Publiceer contactgegevens
    Zorginstelling->>LRZa: Registreer FHIR endpoint
    Adresboek->>LRZa: Vraag bronnen op
    LRZa-->>Adresboek: Retourneer bronnen
```

## Actualisatie van adresboeken

Op deze wijze kunnen adresboek systemen (Update Consumer & Update Supplier rol)
het LRZa bevragen voor alle bronnen van adresgegevens. Deze maken contact met
het LRZa om de volledige lijst op te halen. Vervolgens controleren ze bij elk
endpoint of er wijzigingen zijn. Indien dat het geval is worden deze wijzigingen
verwerkt.

Het actualiseren van adresgegevens verloopt via de volgende stappen:

1. Het adresboek systeem vraagt aan het LRZa om een lijst van alle bronnen.
2. Voor elke bron controleert het adresboek systeem of er wijzigingen zijn.
3. Als er wijzigingen zijn worden deze opgehaald via het FHIR endpoint.
4. De wijzigingen worden verwerkt in het adresboek systeem.
5. Het adresboek systeem is nu actueel en kan gebruikt worden voor het opzoeken
   van endpoints.
6. Dit proces wordt periodiek herhaald om de actuele stand van zaken te behouden.

```{mermaid}
sequenceDiagram
    participant Adresboek as Adresboek<br>«Update Consumer»
    participant LRZa
    participant Update Supplier as FHIR Store<br>«Update Supplier»

    Adresboek->>LRZa: Vraag lijst van bronnen
    LRZa-->>Adresboek: Retourneer lijst
    loop Voor elke bron
        Adresboek->>Update Supplier: Controleer wijzigingen
        alt Wijzigingen beschikbaar
            Update Supplier-->>Adresboek: Retourneer wijzigingen
            Adresboek->>Adresboek: Verwerk wijzigingen
        end
    end
    Note over Adresboek: Systeem is nu actueel
    Note over Adresboek: Herhaal periodiek
```
