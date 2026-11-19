// Exercício resolvido: formate uma saudação com um nome.
#[executable]
fn main() {
    let nome: ByteArray = "Lia";
    let saudacao = format!("Ola, {}!", nome);
    println!("{}", saudacao);
}
