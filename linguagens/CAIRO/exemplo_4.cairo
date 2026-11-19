// Conta regressivamente usando um laço condicional.
#[executable]
fn main() {
    let mut contagem: u32 = 3;
    while contagem > 0 {
        println!("{}", contagem);
        contagem -= 1;
    }
    println!("Fim!");
}
