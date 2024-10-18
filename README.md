# Ρύθμιση Neovim με LazyVim

Αυτός ο οδηγός θα σε καθοδηγήσει στην εγκατάσταση του Neovim και του LazyVim, με ρυθμίσεις που απευθύνονται κυρίως σε **JavaScript** και **React web developers**. 
Η συγκεκριμένη ρύθμιση στοχεύει στην ενίσχυση της παραγωγικότητας όσων εργάζονται με frontend τεχνολογίες.
Παρακάτω θα βρεις τα βήματα για την εγκατάσταση σε Arch Linux και macOS.

## Απαιτήσεις

### Για Arch Linux

Για την εγκατάσταση του Neovim και των απαραίτητων dependencies στο Arch Linux:

- **Neovim:** Η εγκατάσταση γίνεται εύκολα μέσω του `pacman`.
    ```bash
    sudo pacman -S neovim
    ```

- **Git:** Για διαχείριση του LazyVim.
    ```bash
    sudo pacman -S git
    ```

- **Node.js και npm:** Μπορεί να χρειαστούν για μελλοντικές επεκτάσεις ή υποστήριξη plugins.
    ```bash
    sudo pacman -S nodejs npm 

    pnpm setup
    npm install -g live-server
    ```

### Για macOS

Για την εγκατάσταση του Neovim και των dependencies στο macOS, θα χρειαστείς το Homebrew. Αν δεν το έχεις ήδη εγκαταστήσει, μπορείς να το κάνεις [από εδώ](https://brew.sh/).

- **Neovim:** Εγκατάσταση με Homebrew.
    ```bash
    brew install neovim
    ```

- **Git:** Για τη διαχείριση του LazyVim.
    ```bash
    brew install git
    ```

- **Node.js και npm:** Μπορεί να χρειαστούν για μελλοντική χρήση με plugins.
    ```bash
    brew install node luarocks pnpm

    pnpm setup
    npm install -g live-server
    ```

## Εγκατάσταση LazyVim

Το LazyVim είναι ένα διαχειριστικό εργαλείο για τις ρυθμίσεις του Neovim. Ακολούθησε τα παρακάτω βήματα για να το εγκαταστήσεις:

1. Κλωνοποίησε το repository του Neovim στο σύστημα σου:
    ```bash
    git clone https://github.com/HellasDev/neovim ~/.config/nvim
    ```

2. Άνοιξε το Neovim για να επιβεβαιώσεις την επιτυχή εγκατάσταση:
    ```bash
    nvim
    ```

3. Το LazyVim θα ξεκινήσει αυτόματα τη ρύθμιση των αρχείων και θα εγκαταστήσει τυχόν προεπιλεγμένα configurations.

## Extra Ρυθμίσεις

Αν θέλεις να προσθέσεις επιπλέον ρυθμίσεις, μπορείς να επεξεργαστείς το αρχείο `init.lua` στον φάκελο `~/.config/nvim`. 
Το LazyVim σου επιτρέπει να κάνεις προσαρμογές με ευκολία, αν το χρειαστείς.

## Ολοκλήρωση

Αυτό ήταν! 
Το Neovim σου είναι έτοιμο με το LazyVim χωρίς πρόσθετα plugins. 
Μπορείς να το προσαρμόσεις όπως επιθυμείς ή να προσθέσεις επιπλέον λειτουργίες στο μέλλον.
