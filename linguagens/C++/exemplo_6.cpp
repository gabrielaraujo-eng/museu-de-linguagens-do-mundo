#include <iostream>
#include <vector>

int main() {
    // std::vector armazena uma sequência de inteiros.
    const std::vector<int> values{1, 2, 3};
    for (const int value : values) {
        std::cout << value << '\n';
    }
    return 0;
}
