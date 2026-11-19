// Trata tanto a divisão válida quanto o divisor zero com Result.
fn dividir(a: u32, b: u32) -> Result<u32, ByteArray> {
    if b == 0 {
        Err("Divisor zero")
    } else {
        Ok(a / b)
    }
}

#[executable]
fn main() {
    match dividir(10, 2) {
        Ok(resultado) => println!("Resultado: {}", resultado),
        Err(mensagem) => println!("Erro: {}", mensagem),
    }
    match dividir(10, 0) {
        Ok(resultado) => println!("Resultado: {}", resultado),
        Err(mensagem) => println!("Erro: {}", mensagem),
    }
}
