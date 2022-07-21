#include<stdio.h>

int main(){
    
    int n = 3;
    int a[] = {1, 2, 3};
    int b[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    int c[3];
    for(int i = 0; i < n; i++){
        for(int j = 0; j < n; j++){
            c[i] = b[i][j] * a[i];
        }
    }
    return 0;
}