#include <exception>
#include <iostream>

int main() {
    // std::terminate encerra deliberadamente o processo.
    std::cerr << "Chamando std::terminate; o processo será encerrado.\n";
    std::terminate();
}
