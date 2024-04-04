#include "library.h"
#include "sha256.h"

#include <iostream>

void hello()
{
	SHA256 sha256;
	std::cout << sha256("Hello, World!") << std::endl;
}
