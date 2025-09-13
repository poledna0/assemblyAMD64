# C para Assembly: soma com ponteiros (x86_64)

Este projeto tem como objetivo traduzir um pequeno programa em C para Assembly AMD64 (x86_64), seguindo a convenção System V utilizada em sistemas Linux.

---

## 📌 Descrição

O código original em C define uma função `soma` que opera sobre dois ponteiros para `long int`. Ela compara os valores apontados e realiza a soma entre eles, armazenando o resultado no maior dos dois.

### Código original em C:

```c
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

int main() {
    long int a = 5;
    long int b = 3;
    soma(&a, &b);
    return a;
}
