#include<stdio.h>

void binary_search(int arr[], int target, int n){
    int l = 0;
    int h = n-1; 
    int mid;
    int idx = -1;
    while(l <= h){
        mid = (l + h) / 2;
        if(arr[mid] == target){
            idx = mid;
            break;
        }
        else if(arr[mid] > target){
            h = mid - 1;
        }
        else{
            l = mid + 1;
        }
    }

    if(idx == -1){
        printf("Not found\n");
    }
    else{
        printf("Found at index %d\n", idx);
    }
}

int main(){
    int arr[] = {1, -92, 32, -193, 73, 483};
    binary_search(arr, 3, 6); 
    return 0;
}