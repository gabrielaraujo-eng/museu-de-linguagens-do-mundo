#include <iostream>

int main() {
    // Lê um inteiro e verifica se a extração foi bem-sucedida.
    int value{};
    std::cout << "Digite um inteiro: ";
    if (!(std::cin >> value)) {
        std::cerr << "Entrada inválida\n";
        return 1;
    }
    std::cout << "Você digitou " << value << '\n';
    return 0;
}
