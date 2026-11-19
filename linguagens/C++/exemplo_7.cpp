#include <exception>
#include <iostream>
#include <stdexcept>

int main() {
    // Lança uma exceção demonstrativa e trata sua classe-base.
    try {
        throw std::runtime_error("Erro controlado");
    } catch (const std::exception& error) {
        std::cout << "Exceção tratada: " << error.what() << '\n';
    }
    return 0;
}
