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
    long int a = 15;
    long int b = 5;
    soma(&a, &b);
    return a;
}

