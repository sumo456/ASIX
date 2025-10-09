# ICA1-C038-RA1-PR3: Anàlisi Forense d'un Pendrive

## Objectius

- Identificar fitxers visibles i esborrats dins la imatge del pendrive.
- Recuperar i analitzar metadades dels arxius trobats.
- Localitzar possibles credencials i evidències relacionades amb un correu sospitós.
- Redactar un informe forense breu amb les conclusions obtingudes.

## Context de l'Anàlisi Forense

Un treballador ha trobat un pendrive anònim a la sala de reunions d’una empresa i l’ha entregat al responsable de seguretat. Hi ha sospites que el dispositiu pot contenir informació confidencial, incloent-hi documents esborrats relacionats amb clients i contrasenyes. L’equip de ciberseguretat ha de realitzar una anàlisi forense inicial del pendrive utilitzant **Autopsy**.

## Tasques a Realitzar

### 1. Preparació del Cas

1. **Obertura d'Autopsy**:
   - Inicieu l'eina Autopsy i creeu un nou cas seleccionant **New Case**.
   - Assigneu el nom: `Pendrive_Cas_NomCognom`.

2. **Addició de la imatge**:
   - Afegiu la imatge del pendrive: [pendrive_cas.img](https://drive.google.com/file/d/1aj8nazl9g1-ye8Zm9qWSE4ZnVcPRKkjm/view?usp=sharing).

### 2. Exploració Inicial

1. **Revisió de fitxers visibles**:
   - Analitzeu la llista de fitxers visibles al sistema de fitxers del pendrive.

2. **Anàlisi de fitxers esborrats**:
   - Comproveu la secció **Deleted Files** i anoteu els noms i característiques dels arxius esborrats.

3. **Cerca amb paraules clau**:
   - Utilitzeu l’eina **Keyword Search** amb els termes següents: `password`, `contract`, `invoice`, `client`, `confidencial`.

4. **Anàlisi de la línia temporal**:
   - Examineu la **Timeline** per identificar dates de creació o modificació sospitoses.

### 3. Recuperació i Exportació d’Evidències

1. **Exportació de fitxers rellevants**:
   - Identifiqueu i exporteu fitxers significatius, com ara contractes, correus electrònics, fitxers de text amb contrasenyes o imatges.

2. **Documentació de metadades**:
   - Anoteu la ruta completa dels fitxers dins la imatge i les seves metadades (autor, dates de creació/modificació, programari associat).

3. **Organització de les evidències**:
   - Deseu els fitxers exportats en una carpeta anomenada `Evidencies_GrupX`.

4. **Captures de pantalla**:
   - Realitzeu captures de pantalla de les evidències més rellevants, com ara texts amb contrasenyes, metadades de contractes o capçaleres de correus electrònics.

### 4. Informe Forense Breu

1. **Redacció de l’informe**:
   - Elaboreu un document d’**una pàgina** que inclogui:
     - **Resum del cas**: Descripció del que s’ha analitzat i el motiu.
     - **Evidències trobades**: Llista dels fitxers, amb les seves rutes i metadades.
     - **Interpretació inicial**: Conclusions preliminars sobre el que sembla haver passat.
     - **Accions recomanades**: Propostes per a una investigació més profunda en un entorn real.

2. **Format i entrega**:
   - Guardeu l’informe com a `Informe_Forense_NomCognom.pdf`.

## Requisits d’Entrega

- **Memòria de la pràctica**:
  - Documenteu tots els passos realitzats, incloent-hi:
    - Captures de pantalla amb el vostre nom i la data visibles.
    - Explicacions detallades de cada pas.
    - Instruccions utilitzades, amb paràmetres i fitxers d’entrada.
    - Modificacions fetes a fitxers de configuració, si n’hi ha.
  - Assegureu-vos que la memòria no superi els **10 MB**.

- **Entrega**:
  - Pugeu la memòria al Moodle en el format especificat.