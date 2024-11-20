workspace {

    model {
        !identifiers hierarchical
        properties {
            "structurizr.groupSeparator" "/"
        }

        group "Generieke diensten" {
            prs = softwareSystem "Pseudoniem Referentie Service" {
                tags "Generieke Functiemodules"
            }
            ads = softwareSystem "Adresboek" {
                tags "Generieke Functiemodules"
                description "Selective Supplier"
            }

            ads_synchronisatie = softwareSystem "Adresboek Synchronisatie" {
                tags "Generieke Functiemodules"
                tags "Update Consumer"
            }

            nvi = softwareSystem "NVI" {
                tags "Generieke Functiemodules"

                localize = container "Lokalisatie API"
                update = container "Actualisatie API"
            }

            centrale_adressen_lijst = softwareSystem "Centrale Adressenlijst" {
                tags "Generieke Functiemodules"
            }
        }

        zorgverlener = person "Zorgverlener"
        group "Opvrager" {
            epd = softwareSystem "EPD" {
                tags "Zorgapplicatie"
                timelineModule = container "Tijdlijnmodule"
            }
            

            lrs = softwareSystem "Lokalisatie Register Service" {
                tags "Referentie Implementatie"
                api = container "LRS API"
            }
        }

        group "Leverende partij A" {
            lmr_a = softwareSystem "Lokalisatie Metadata Register A" {
                tags "Zorgapplicatie"
            }
            us_a = softwareSystem "Adresseringsgegevens A" {
                tags "Zorgapplicatie"
                description "Update Supplier"
            }
        }

        group "Leverende partij B" {
            lmr_b = softwareSystem "Lokalisatie Metadata Register B" {
                tags "Zorgapplicatie"
            }
            us_b = softwareSystem "Adresseringsgegevens B" {
                tags "Zorgapplicatie"
                description "Update Supplier"
            }
        }


        # Lokalisatie
        lmr_a -> nvi "Update lokalisatiegegevens"
        lmr_b -> nvi "Update lokalisatiegegevens"
        zorgverlener -> epd
        zorgverlener -> epd "Vind zorggegevens provider eindpunten"

        nvi -> prs "Vraag NRI pseudoniem aan"
        lmr_a -> prs
        lmr_b -> prs

        lrs.api -> prs "Vraag pseudoniem aan"
        lrs.api -> nvi "Lokaliseer gezondheidsgegevens met pseudoniem"
        lrs.api -> ads "Vind eindpunten [FHIR mCSD ITI-90]"
        lrs.api -> lmr_a "Haal metadata op [FHIR]"
        lrs.api -> lmr_b "Haal metadata op [FHIR]"

        epd -> nvi.localize "Lokaliseer gezondheidsgegevens met pseudoniem"
        epd -> nvi.update "Update lokalisatiegegevens"
        epd -> ads "Vind eindpunten [ITI-90]"
        epd -> lmr_a "Haal metadata op [FHIR]"
        epd -> lmr_b "Haal metadata op [FHIR]"
        epd -> prs "Vraag pseudoniem aan"
        epd -> lrs "Vraag tijdlijn aan"


        # Adressering
        ads_synchronisatie -> centrale_adressen_lijst "Haal centrale adressenlijst op"
        ads_synchronisatie -> ads "Actualiseer entiteiten"
        ads_synchronisatie -> us_a "Verzamel entiteiten"
        ads_synchronisatie -> us_b "Verzamel entiteiten"
    }

    views {
        terminology {
            person "Persoon"
            softwareSystem "Systeem"
            container "Container"
            component "Component"
            deploymentNode "Implementatieknooppunt"
            infrastructureNode "Infrastructuur"
            relationship "Relatie"
        }
        

        systemLandscape "generieke-functie-lokalisatie" {
            title "Generieke functie lokalisatie"
            include "epd" "prs" "ads" "nvi" "lmr_a" "lmr_b"
            exclude "lmr_a -> prs" "lmr_b -> prs" "lmr_a -> nvi" "lmr_b -> nvi"
        }

        systemLandscape "generieke-functie-adressering" {
            title "Generieke functie adressering"
            include "epd" "ads" "ads_synchronisatie" "us_a" "us_b" "centrale_adressen_lijst"
        }

        styles {
            element Element {
                stroke "#000000"

                properties {
                    plantuml.shadow true
                }
            }
            element "Zorgapplicatie" {
                background "#8fcae7"
                color "#000000"
            }

            element "Generieke Functiemodules" {
                background "#f9e11e"
                color "#000000"
            }

            element "Referentie Implementatie" {
                background "#275937"
                color "#ffffff"
            }

            element "Bronsystemen" {
                background "#f092cd"
                color "#000000"
            }
        }
    }
}
