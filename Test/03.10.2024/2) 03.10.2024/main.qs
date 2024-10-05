// Objectif : Créer un Circuit de Superposition et Mesurer

namespace CircuitSuperMes {
    @EntryPoint()
    operation SuperposMes() : Unit {
        use qb = Qubit[2];

        H(qb[0]);
        H(qb[1]);

        CNOT((qb[0], qb[1])); // si qb[0] = Zero, qb[1] = valeur inchangée. si qb[0] = One, qb[1] = valeur inversée
        // CNOT regarde l'état de qb[0] et applique une opération sur qb[1] en fonction de cet état
        // La décision d'inverser ou de ne pas inverser est effectuée lors de l'application de la porte, avant la mesure


        let mesure0 = M(qb[0]);
        let mesure1 = M(qb[1]);

        Message($"Qubit0 = {mesure0}
Qubit1 = {mesure1}");

        Reset(qb[0]);
        Reset(qb[1]);
    }
}

// Commentaires perso :
// j'avais appliqué la porte hadamard uniquement au qubit0 (H(qb[0]);) ne pas oublier le qubit1 (ligne 9)