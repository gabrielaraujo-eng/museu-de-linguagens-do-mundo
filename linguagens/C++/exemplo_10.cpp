#include <iostream>

template <typename T>
class Box {
public:
    explicit Box(T value) : value_(value) {}
    const T& value() const { return value_; }

private:
    T value_;
};

int main() {
    // Instancia e utiliza a classe template.
    const Box<int> box(42);
    std::cout << box.value() << '\n';
    return 0;
}
