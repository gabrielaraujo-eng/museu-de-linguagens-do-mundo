#include <fstream>
#include <iostream>
#include <string>

int main() {
    // Abre t.txt, verifica a falha e exibe a primeira linha se houver.
    std::ifstream file("t.txt");
    if (!file) {
        std::cerr << "Não foi possível abrir t.txt\n";
        return 1;
    }

    std::string line;
    if (std::getline(file, line)) {
        std::cout << line << '\n';
    }
    return 0;
}
