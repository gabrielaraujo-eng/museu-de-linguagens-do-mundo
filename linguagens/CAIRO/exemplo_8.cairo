// Formata uma mensagem a partir de valores ByteArray.
#[executable]
fn main() {
    let nome: ByteArray = "Cairo";
    let saudacao = format!("Ola, {}!", nome);
    println!("{}", saudacao);
}
