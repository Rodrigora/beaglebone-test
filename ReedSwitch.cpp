#include <iostream>
#include "SimpleGPIO.h"
#include "SimpleGPIO.cpp"
#include <stdint.h>
#include <unistd.h>

using namespace std;

int main()
{
   gpio_export(60);
   gpio_set_dir(60, INPUT_PIN);
   unsigned int value;

   while(true)
   {
      usleep(1000000);

      gpio_get_value(60, &value);

      cout << "value : " << value << endl;
   }

   return 0;
}
