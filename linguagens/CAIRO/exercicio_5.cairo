// Exercício resolvido: defina e use uma função que dobra um número.
fn dobro(valor: u32) -> u32 {
    valor * 2
}

#[executable]
fn main() {
    println!("Dobro de 8: {}", dobro(8));
}
