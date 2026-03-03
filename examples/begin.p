#include <console>

main()
    *begin /* { */
        *var counter = 0;
        while (counter != 10) *begin
            ++counter;
            printf("counter: %d", counter);
        *end
        *begin
            printf("Hello, World!");
        *end
    *end /* } */