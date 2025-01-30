# TextFieldPalette

## Introduction
`TextFieldPalette` est un package Swift qui fournit une collection de champs de texte personnalisables, y compris `PaletteDatePickerTextField`, un champ de texte avec un sélecteur de date intégré pour une expérience utilisateur fluide. Ce package permet d'incorporer facilement des champs de texte stylisés dans vos applications SwiftUI.

<img src="https://github.com/user-attachments/assets/078dd831-1ca2-466a-a12a-005505cb3d44" alt="Simulator Screenshot - iPhone" width="400"/>

---

## Fonctionnalités

- **PaletteDatePickerTextField** : Un champ de texte avec un sélecteur de date intégré (`UIDatePicker`).
- **Gestion des valeurs optionnelles** : Supporte les dates nulles, facilitant la gestion des champs facultatifs.
- **Restriction de plage de dates** : Définissez une date minimale et une date maximale pour limiter la sélection.

---

## Installation

Pour intégrer `TextFieldPalette` dans votre projet SwiftUI, suivez ces étapes :

1. Ouvrez votre projet dans Xcode.
2. Sélectionnez votre fichier projet dans le Project Navigator.
3. Choisissez votre cible d'application et accédez à l'onglet "Package Dependencies".
4. Cliquez sur le bouton "+" pour ajouter un nouveau package.
5. Entrez l'URL du dépôt : `https://github.com/LACHKAR99ZAKARIA/TextFieldPalette.git`.
6. Sélectionnez la version à installer.

---

## Utilisation

### Importation du package

Avant d'utiliser `TextFieldPalette`, importez-le dans votre vue SwiftUI :

```swift
import TextFieldPalette
```

### Exemple d'utilisation

Voici un exemple simple d'intégration du `PaletteDatePickerTextField` :

```swift
import SwiftUI
import TextFieldPalette

struct DemoView: View {
    @State private var selectedDate: Date? = nil // Date optionnelle

    var body: some View {
        VStack(spacing: 20) {
            PaletteDatePickerTextField(
                selectedDate: $selectedDate,
                placeholder: "Sélectionner une date",
                minDate: Date(),
                maxDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())
            )
            .padding()

            if let date = selectedDate {
                Text("Date sélectionnée : \(date, formatter: dateFormatter)")
                    .padding()
            } else {
                Text("Aucune date sélectionnée")
                    .padding()
            }
        }
        .padding()
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
```

---

## PaletteCustomTextField

`PaletteCustomTextField` permet de créer un champ de texte personnalisé en SwiftUI, incluant un clavier personnalisé.

<img src="https://github.com/user-attachments/assets/7c7dea2b-0091-47a4-9309-7eb118d69392" alt="Custom Text Field" width="400"/>

### Exemple d'utilisation

```swift
PaletteCustomTextField(
    placeholder: "Placeholder",
    text: $text
) {
    LazyVGrid(columns: columns) {
        ForEach(1...9, id: \ .self) { i in
            Text(String(i))
                .padding()
                .onTapGesture {
                    text = String(i)
                }
        }
    }
}
```

---

## Paramètres

### `PaletteDatePickerTextField`
- **`selectedDate`** : Liaison à la date sélectionnée (optionnelle).
- **`placeholder`** : Texte indicatif affiché lorsque aucune date n'est sélectionnée.
- **`minDate`** : Date minimale (optionnelle).
- **`maxDate`** : Date maximale (optionnelle).

---

## Démo GIF

Ajoutez ici un GIF démontrant l'utilisation du package.

---

## Licence
Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

---

## Contribution
Les contributions sont les bienvenues ! N'hésitez pas à soumettre une pull request ou à ouvrir une issue pour toute amélioration ou correction de bug.

