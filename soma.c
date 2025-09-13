void soma(long int *x, long int *y) {
    long int tmp;
    if (*x >= *y) {
        tmp = *x + *y;
        *x = tmp;
    } else {
        tmp = *y + *x;
        *y = tmp;
    }
}

int main(){
    long int a = 5;
    long int b = 3;
    soma(&a, &b);
    return a;
}
