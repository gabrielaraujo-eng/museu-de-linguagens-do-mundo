#include <iostream>
#include <string>

int main() {
    // Concatena duas strings declaradas localmente.
    const std::string name = "mundo";
    const std::string full = "Olá " + name;
    std::cout << full << '\n';
    return 0;
}
