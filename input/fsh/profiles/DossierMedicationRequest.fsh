Profile:  MedicationRequestItDossierPharma
Parent:   MedicationRequest
Id:       MedicationRequest-it-dossierPharma
Title:    "MedicationRequest - Dossier Farmaceutico"
Description: "Profilo MedicationRequest per Dossier Farmaceutico"
//=================================================================

/* === TO DO 
- add vocabulary bindings instead of filtering per coding.system
- 
=== */

* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a>Profilazione della MedicationRequest per il Dossier Farmaceutico</a></div>"
* ^status = #draft
/* == GC: REMOVED 
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains NRE named nre 0..*
* extension[nre] ^min = 0
=== */
* status 1.. MS
* intent = #order (exactly) // do we really need to constraint to order ?
* intent ^short = "order"
//-------------------------
// do we need this elment ?
/* == GC: REMOVED 
* category 1..
* category.coding 1..1
* category.coding.system 1..
* category.coding.system = "https://loinc.org/" (exactly)
* category.coding.code 1..
* category.coding.code = #57833-6 (exactly)
======== */

// maybe better to have medication CodeableConcept
* medicationCodeableConcept
* medicationCodeableConcept.coding ^slicing.discriminator.type = #value
* medicationCodeableConcept.coding ^slicing.discriminator.path = "system"
* medicationCodeableConcept.coding ^slicing.ordered = false
* medicationCodeableConcept.coding ^slicing.rules = #open
* medicationCodeableConcept.coding contains
    ATC 0..1 and AIC 0..1 and
    gruppoEquivalenza 0..1
* medicationCodeableConcept.coding[ATC] ^sliceName = "ATC"
* medicationCodeableConcept.coding[ATC].system 1..
* medicationCodeableConcept.coding[ATC].system = "http://www.whocc.no/atc" (exactly)
* medicationCodeableConcept.coding[ATC].code 1..
* medicationCodeableConcept.coding[ATC].display 1..
* medicationCodeableConcept.coding[AIC].system 1..
* medicationCodeableConcept.coding[AIC].system = "urn:oid:2.16.840.1.113883.2.9.6.1.5" (exactly)
* medicationCodeableConcept.coding[AIC].code 1..
* medicationCodeableConcept.coding[AIC].display 1..
* medicationCodeableConcept.coding[gruppoEquivalenza].system 1..
* medicationCodeableConcept.coding[gruppoEquivalenza].system = "urn:oid:2.16.840.1.113883.2.9.6.1.51" (exactly)
* medicationCodeableConcept.coding[gruppoEquivalenza].code 1..
* medicationCodeableConcept.coding[gruppoEquivalenza].display 1..
* medicationCodeableConcept.text ^short = "Descrizione testuale del farmaco"
* subject MS
* subject only Reference(PatientItBase)
* subject.type 0..
* subject.type = "Patient" (exactly)
* subject.identifier 1..
* subject.identifier.system 1..
* subject.identifier.system = "http://hl7.it/sid/codiceFiscale" (exactly)
* subject.identifier.value 1..
* subject.identifier.value ^short = "Codice Fiscale"
* subject.display 0.. 
* authoredOn 0.. MS
* requester 1.. MS
* requester only Reference(MedicoPrescrittore)
* requester.reference 1..
* recorder only Reference(Practitioner)
* recorder.type 1..
* recorder.type = "Practitioner" (exactly)
* recorder.type ^short = "Medico Sostituto"
* recorder.identifier 1.. MS
* recorder.identifier.system 1..
* recorder.identifier.system = "http://hl7.it/sid/codiceFiscale" (exactly)
* recorder.identifier.value 1..
* reasonCode ..1 MS
* reasonCode.coding ^slicing.description = "Una istanza per eventuale nota AIFA, una istanza per eventuale codice diagnosi"
* reasonCode.coding ^slicing.rules = #open
* reasonCode.coding contains
    notaAIFA 0..1 and
    codiceDiagnosi 0..1
* reasonCode.coding[notaAIFA].system 1..
* reasonCode.coding[notaAIFA].system = "urn:oid:2.16.840.1.113883.2.9.6.1.24" (exactly)
* reasonCode.coding[notaAIFA].code 1..
* reasonCode.coding[notaAIFA].code ^short = "nota AIFA"
* reasonCode.coding[codiceDiagnosi].system 1..
* reasonCode.coding[codiceDiagnosi].system = "http://hl7.org/fhir/sid/icd-9-cm" (exactly)
* reasonCode.coding[codiceDiagnosi].code 1..
* reasonCode.coding[codiceDiagnosi].display 1..
* groupIdentifier 0.. MS // 1.. ?
* groupIdentifier ^short = "Numero Ricetta Elettronica"
* groupIdentifier.system MS // add system
* groupIdentifier.value ^short = "NRE"

* insurance MS
* insurance only Reference($Coverage-it-base)

/* -- commented 
* insurance ^slicing.discriminator.type = #value
* insurance ^slicing.discriminator.path = "identifier.system"
* insurance ^slicing.rules = #open
* insurance contains
    esenzioneNazionale 0..* and
    esenzioneRegionale 0..*
* insurance[esenzioneNazionale].identifier 1..
* insurance[esenzioneNazionale].identifier.system 1..
* insurance[esenzioneNazionale].identifier.system = "urn:oid:2.16.840.1.113883.2.9.6.1.22" (exactly)
* insurance[esenzioneNazionale].identifier.value 1..
* insurance[esenzioneRegionale].identifier 1..
* insurance[esenzioneRegionale].identifier.system 1..
* insurance[esenzioneRegionale].identifier.system ^short = "Deve essere valorizzato con urn:oid:2.16.840.1.113883.2.9.2.[REGIONE].6.22"
* insurance[esenzioneRegionale].identifier.value 1..
--- */

* dispenseRequest 0.. MS
* dispenseRequest.initialFill.quantity 1..
* dispenseRequest.initialFill.duration 1..
* dispenseRequest.quantity 1..

// change to allowedCodeableConcept

* substitution.allowed[x] MS
* substitution.allowed[x] only boolean 
* substitution.reason.coding 1..1
* substitution.reason.coding.system 1..
* substitution.reason.coding.system = "2.16.840.1.113883.2.9.6.1.52" (exactly)
* substitution.reason.coding.code 1..
