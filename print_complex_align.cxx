#include <iostream>
#include <complex>

int main(int argc, char **argv)
{
  std::cout << alignof(std::complex<float>) << std::endl;
  std::cout << alignof(std::complex<double>) << std::endl;
}
