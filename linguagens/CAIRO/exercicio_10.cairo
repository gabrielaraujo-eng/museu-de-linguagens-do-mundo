// Exercício resolvido: encontre o maior entre três valores.
fn maior_de_tres(a: u32, b: u32, c: u32) -> u32 {
    let mut maior = a;
    if b > maior {
        maior = b;
    }
    if c > maior {
        maior = c;
    }
    maior
}

#[executable]
fn main() {
    println!("Maior valor: {}", maior_de_tres(12, 7, 19));
}
