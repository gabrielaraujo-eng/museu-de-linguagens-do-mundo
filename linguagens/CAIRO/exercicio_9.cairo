// Exercício resolvido: calcule o fatorial de 5 com um laço.
#[executable]
fn main() {
    let mut numero: u32 = 5;
    let mut fatorial: u32 = 1;
    while numero > 1 {
        fatorial *= numero;
        numero -= 1;
    }
    println!("5! = {}", fatorial);
}
