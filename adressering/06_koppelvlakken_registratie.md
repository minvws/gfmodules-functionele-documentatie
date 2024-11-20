# Koppelvlakken registratie

Voor registratie van adresboek gegevens zijn twee afzonderlijke registratie stappen vereist:

1. registratie van Update Supplier adres
2. leveren van FHIR mCSD entiteiten

> **Opmerking:** Registratie van het Update Supplier adres is wordt nog
> uitgewerkt binnen de architectuur werkgroep.

## Levering van FHIR mCSD entiteiten

Het koppelvlak voor het leveren van FHIR mCSD entiteiten gaat uit van een
standaard FHIR API. [ITI-91](https://profiles.ihe.net/ITI/mCSD/ITI-91.html)
geeft gedetailleerde specificaties over de werking. Kenmerkend is het gebruik
van de [history](http://hl7.org/fhir/R4/http.html#history) in combinatie met de
`since` parameter voor het efficiënt kunnen pollen.

> **Opermking:** De werkgroep architectuur heeft nog geen besluit genomen over
> authenticatie / autorisatie op dit koppelvlak.

