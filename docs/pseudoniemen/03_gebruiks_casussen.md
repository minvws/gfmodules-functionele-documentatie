# Gebruikscasussen

De onderstaande gebruikscasussen beschrijven de interactie patronen met de
pseudoniemen.

## Communiceren met andere dienst via pseudoniem

Het pseudoniemen systeem maakt het voor twee systemen om te communiceren over
een burger zonder het BSN met elkaar uit te wisselen. Deze gebruikscasus
beschrijft hoe het pseudoniemen systeem deze rol vervult:

1. Een zorgsysteem zet het BSN van een patiënt om in een token voor uitwisseling.
2. Dit uitwisselingstoken wordt in communicatie met een ontvangend systeem
   gebruikt.
3. Het ontvangende systeem zet het uitwisselingstoken om in een voor dit
   systeem uniek pseudoniem.
4. Het ontvangende systeem gebruikt dit pseudoniem voor identificatie van de
   burger in de eigen administratie.
