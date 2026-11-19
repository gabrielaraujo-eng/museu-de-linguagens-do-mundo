// Exercício resolvido: remova o primeiro elemento de um Array.
#[executable]
fn main() {
    let mut notas: Array<u32> = ArrayTrait::new();
    notas.append(8);
    notas.append(9);
    let primeira = notas.pop_front().unwrap();
    println!("Primeira nota: {}", primeira);
}
