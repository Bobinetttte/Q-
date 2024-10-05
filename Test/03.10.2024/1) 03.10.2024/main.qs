namespace mesureQubit {
    open Microsoft.Quantum.Intrinsic; // Importation des opérations quantiques
    open Microsoft.Quantum.Canon; // Pour les opérations de mesure et autres utilitaires
    open Microsoft.Quantum.Diagnostics; // Pour afficher des messages de diagnostic
    @EntryPoint()
    operation mesureEtAfficheQubit() : Unit {
        // etape 1 : allocation dun qubit
        use qb = (Qubit[1]) {
            // Affiche message de diagnostic
            Message("Qubits alloué");

            // etape 2 : appliquer la porte hadamard
            for i in 0..Length(qb) - 1 {
                H(qb[i]);
                Message($"Port hadamard appliquée sur le qubit {i}. Qubit {i} actuellement en superposition");
            }

            // etape 3 : Mesurer le qubit
            for i in 0..Length(qb) - 1 {
                let mesureResulat = M(qb[i]);
                Message($"Mesure faite sur qubit {i}");

                // etape 4 : afficher le résultat de la mesure
                if (mesureResulat == One) {
                    Message($"Le qubit {i} à été mesuré à 1");
                }
                elif(mesureResulat == Zero) {
                    Message($"Le qubit {i} à été mesuré à 0");
                }
                else{
                    Message($"Un problème est survenu l'or de la mesure du qubit numéro {i}");
                }


                // etape 5 : Reinitialiser le qubit (le relacher)
                Reset(qb[i]);
                Message($"Qubit{i} relacher");
            }
        }
    }
}
