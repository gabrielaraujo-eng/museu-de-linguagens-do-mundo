#include <iostream>
#include <vector>

int main() {
    // Range-for percorre cada elemento do vector.
    const std::vector<int> values{1, 2, 3};
    for (const int item : values) {
        std::cout << item << '\n';
    }
    return 0;
}
