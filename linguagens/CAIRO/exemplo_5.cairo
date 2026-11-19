// Define uma função auxiliar e chama-a pelo ponto de entrada.
fn soma(a: u32, b: u32) -> u32 {
    a + b
}

#[executable]
fn main() {
    println!("2 + 3 = {}", soma(2, 3));
}
