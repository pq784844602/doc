c语言中的对齐方式

对齐有自然对齐（Natural）和指定对齐（Assign）

自然对齐指数据类型本身的对齐方式，例如 int为4，float为4，double为8.

指定对齐为编译器默认的对齐方式（VC默认为8）或用#pragma pack(x) x为对齐值。用#pragma pack()可以解除对齐方式。

1.对数据类型来说

实际对齐方式 = min（数据对齐，指定对齐） 即数据本身长度和指定对齐中小的哪一个。其实指定这种对齐对数据类型来说意义不大。

2.结构体得对齐方式

实际对齐方式 = min（max（结构体内各字段对齐），指定对齐） 所以要先看结构体中最大的那个对齐长度是多少，然后跟指定对齐值比较，取小值。

在VC中计算一下长度

struct MyStruct
{
double m8;
char m1;
int m4;
};


struct MyStruct1
{
char m1;
double m8;
int m4;
};
#pragma pack(push)
#pragma pack(4)
struct MyStruct2
{
char m1;
int m4;
double m8;
};
#pragma pack(pop)
int a , b , c;

a = sizeof(MyStruct);
b = sizeof(MyStruct1);
c = sizeof(MyStruct2);
a,b,c的值分别为 16， 24,和16