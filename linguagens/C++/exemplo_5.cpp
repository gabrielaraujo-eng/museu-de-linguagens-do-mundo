#include <iostream>

int main() {
    // Define uma lambda e usa o resultado retornado.
    const auto square = [](int value) { return value * value; };
    std::cout << "4 ao quadrado = " << square(4) << '\n';
    return 0;
}
