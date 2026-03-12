# Pseudoniemen

## Inleiding

Communicatie _over_ een patiënt gebeurt binnen de zorg op basis van het BSN.
Hiermee kunnen burgers eenduidig worden geïdentificeerd. Het nadeel van het BSN
is dat dit, vanwege het identificerende karakter, een privacy gevoelig gegeven
is.

Enkele diensten die de Generieke Functies mogelijk maken hebben geen directe
noodzaak het BSN te verwerken. Deze kunnen, mits het mogelijk is om tussen
systemen over een burger te communiceren, ook een andere identificatie code
gebruiken.

Als privacy verhogende maatregel wordt daarom, waar mogelijk en logisch, binnen
de architectuur gewerkt met een alternatief voor het BSN: het dienst specifieke
pseudoniem. Kenmerken van deze opzet zijn:

- een pseudoniem dat uniek is voor elke organisatie
- organisaties krijgen geen van de uitgegeven pseudoniemen bij andere
  organisaties

## Afkortingen en Begrippen

- **BSN**: Burgerservicenummer
- **Pseudoniem**: Een voor een dienst specifieke code die een burger
  identificeert
- **Token**: Uitwisselingsteken voor communicatie tussen systemen

## Gebruikscasussen

De onderstaande gebruikscasussen beschrijven de interactie patronen met de
pseudoniemen.

### Communiceren met andere dienst via pseudoniem

Het pseudoniemen systeem maakt het voor twee systemen mogelijk om te
communiceren over een burger zonder het BSN met elkaar uit te wisselen. Deze
gebruikscasus beschrijft hoe het pseudoniemen systeem deze rol vervult:

1. Een zorgsysteem zet het BSN van een patiënt om in een token voor
   uitwisseling.
2. Dit uitwisselingstoken wordt in communicatie met een ontvangend systeem
   gebruikt.
3. Het ontvangende systeem zet het uitwisselingstoken om in een voor dit systeem
   uniek pseudoniem.
4. Het ontvangende systeem gebruikt dit pseudoniem voor identificatie van de
   burger in de eigen administratie.

## Architectuur

> **Opmerking:** De definitieve invulling van het systeem voor pseudoniemen
> wordt momenteel nog bepaald. De huidige demo-implementatie toont slechts een
> mogelijke richting en dient enkel om aan te geven dat een pseudoniemen systeem
> zou kunnen functioneren.

## Koppelvlakken

> **Opmerking:** Dit volgt na besluitvorming over de invulling van het
> pseudoniemen systeem.
