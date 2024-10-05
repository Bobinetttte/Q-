@EntryPoint()
operation cnotDoor() : Unit {
    use control = Qubit();
    use target = Qubit();

    X(control);

    CNOT(control, target);

    Message($"{M(control)} {M(target)}");
}