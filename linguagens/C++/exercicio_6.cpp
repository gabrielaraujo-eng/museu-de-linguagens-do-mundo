#include <iostream>
#include <memory>

int main() {
    // unique_ptr gerencia automaticamente o objeto alocado.
    const auto value = std::make_unique<int>(5);
    std::cout << *value << '\n';
    return 0;
}
