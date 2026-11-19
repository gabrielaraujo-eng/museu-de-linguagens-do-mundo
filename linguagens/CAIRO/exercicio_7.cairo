// Exercício resolvido: valide uma idade sem interromper o programa.
fn validar_idade(idade: u32) -> Result<u32, ByteArray> {
    if idade >= 18 {
        Ok(idade)
    } else {
        Err("Menor de idade")
    }
}

#[executable]
fn main() {
    match validar_idade(16) {
        Ok(idade) => println!("Idade aceita: {}", idade),
        Err(mensagem) => println!("Validacao: {}", mensagem),
    }
}
