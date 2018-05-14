#include <stdio.h>
#include <stdlib.h>

char* binary_conversion(int);

int main() {

int num = 1;
 
 while(num != 0) {
   char* bin;

   scanf("%d", &num);
   bin = binary_conversion(num);
   printf("%s\n", bin);
}
}

char* binary_conversion(int num) {

char* array = malloc(sizeof(char)*9); //sizeof gives bits.  mult by num of objects
int j = 0;
unsigned int mask = 0x8000; //16 bits. hexits work with 4 bits at a time. so '8' for 1000, and '0', '0', '0' for 0000
//maybe here??? ^^^^^^^^
//set to 1 if column you're interested in. start at most significant digit and move backwards. 
   for (int i = 15; i >= 0; i--) {
        array[j] = ((mask & num) >> i)  + '0'; //"0" refers to char* and '0' refers to char//append this to char pointer and return char pointer
        mask = mask >> 1;
        j++;
   }return array;
}


