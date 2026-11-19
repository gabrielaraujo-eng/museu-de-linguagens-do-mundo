// Cria um Array e consulta sua quantidade de elementos.
#[executable]
fn main() {
    let mut valores: Array<u32> = ArrayTrait::new();
    valores.append(10);
    valores.append(20);
    valores.append(30);
    println!("Quantidade: {}", valores.len());
}
