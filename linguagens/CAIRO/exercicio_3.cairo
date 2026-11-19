// Exercício resolvido: determine se o valor é par ou ímpar.
#[executable]
fn main() {
    let valor: u32 = 7;
    if valor % 2 == 0 {
        println!("{} e par.", valor);
    } else {
        println!("{} e impar.", valor);
    }
}
