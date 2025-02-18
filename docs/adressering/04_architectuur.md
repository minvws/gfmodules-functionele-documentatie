# Architectuur

[FHIR mCSD](https://profiles.ihe.net/ITI/mCSD/index.html) is het basismodel voor
de architectuur voor de generieke functie adressering. Binnen mCSD zijn er twee
kenmerkende onderdelen:

1. een definitie van entiteiten
2. uitrol mogelijkheden

Een belangrijk ontwerpprincipe van deze architectuur is de focus op
(relatief)statische adresgegevens. Het adresboek bevat alleen informatie die
niet vaak wijzigt. Concreet betekend dit dat het niet meerdere keren per dag
wordt aangepast. Een voorbeeld hiervan is een FHIR endpoint. Het aantal vrije
bedden is een voorbeeld van het type gegevens wat niet geschikt is voor het
adresboek, deze gegevens wijzigen te snel. Dit betekent dat:

- De generieke functie adressering niet bedoeld is voor real-time gegevensuitwisseling
- Wel kunnen via deze functie technische adressen opgezocht worden
- Met deze technische adressen kunnen vervolgens real-time gegevens worden
  opgevraagd bij de betreffende systemen

Het onderstaande diagram geeft een overzicht van de betrokken systemen:

![Overzicht van de betrokken systemen bij adressering](../afbeeldingen/structurizr-generieke-functie-adressering.svg)

## Entiteiten

M.b.t. het eerste punt, entiteiten, wordt uitgegaan van ondersteuning van
tenminste de volgende entiteiten:

- Organization
- Affiliation
- Endpoint
- Service
- Location
- Facility

> **Opmerking:** de architectuur werkgroep voor adressering werkt aan een
> verdere uitwerking van de entiteiten en de invulling hiervan.

## Uitrol

FHIR mCSD kent verschillende rollen aan de betrokken systemen toe. Dit zijn:

1. Selective Consumer
2. Selective Supplier
3. Update Consumer
4. Update Supplier

De selective consumer en supplier rollen (punt 1 en 2) hebben betrekking op de
opzoekvraag. De consumer is het vragende systeem. De supplier is het antwoord
gevende systeem.

Voor de update consumer en update supplier geldt dat dit rollen zijn ter
ondersteuning van een architectuur waarbij met replicatie van gegevens gewerkt
wordt. In de uitwerking van de generieke functie adressering wordt hier gebruik
van gemaakt.

Bij de uitrol wordt uitgegaan van de volgende onderdelen:

1. Centraal overzicht van leveranciers van adresboekgegevens
2. Leveranciers van adresboek gegevens
3. Adresboek(en)
4. Synchronisatie applicatie(s)

De leveranciers van adresboekgegevens corresponderen met de FHIR mCSD Update
Supplier rol. Het onder punt 3 benoemde adresboek realiseert de Selective
Supplier functionaliteit. Deze doet dat via een eigen opslag die gevuld wordt
middels de in punt 4 benoemde synchronisatie applicatie.

Voor het bepalen van alle leveranciers van adresboek gegevens is een centrale
lijst nodig. Deze wordt gerealiseerd door middel van het in punt 1 genoemde
centrale overzicht.
