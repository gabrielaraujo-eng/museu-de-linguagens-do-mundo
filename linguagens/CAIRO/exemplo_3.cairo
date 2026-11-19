// Demonstra uma decisão dentro de uma função.
#[executable]
fn main() {
    let valor: u32 = 42;
    if valor > 10 {
        println!("Maior que 10");
    } else {
        println!("10 ou menor");
    }
}
