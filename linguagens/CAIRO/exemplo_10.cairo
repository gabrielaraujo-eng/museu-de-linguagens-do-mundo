// Calcula o máximo divisor comum pelo algoritmo de Euclides.
fn mdc(mut a: u32, mut b: u32) -> u32 {
    loop {
        if b == 0 {
            break a;
        }
        let resto = a % b;
        a = b;
        b = resto;
    }
}

#[executable]
fn main() {
    println!("MDC de 48 e 18: {}", mdc(48, 18));
}
