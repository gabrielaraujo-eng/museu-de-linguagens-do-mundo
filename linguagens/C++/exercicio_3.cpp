#include <iostream>

int main() {
    // Retorna cedo quando val é zero; caso contrário, informa o valor.
    const int value = 0;
    if (value == 0) {
        std::cout << "Valor igual a zero\n";
        return 0;
    }
    std::cout << "Valor diferente de zero\n";
    return 0;
}
