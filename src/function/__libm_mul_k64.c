#include <stdint.h>

//取高位字（2Byte），返回原指针
uint16_t* HIWORD_pri(double* value) {
    uint16_t* bytePtr = (uint16_t*)value;
    return (uint16_t*)(bytePtr + 3);
}
//取高位字，返回副本
uint16_t HIWORD_copy(double* value) {
    uint16_t* bytePtr = (uint16_t*)value;
    uint16_t result = *(uint16_t*)(bytePtr + 3);
    return result;
}
//取高位双字（4Byte），返回原指针
uint32_t HIDWORD_pri(double* value)
{
    uint32_t* bytePtr = (uint32_t*)value;
    return (uint32_t*)(bytePtr + 1);
}
//取高位双字，返回副本
uint32_t HIDWORD_copy(double* value)
{
    uint32_t* bytePtr = (uint32_t*)value;
    uint32_t result = *(uint32_t*)(bytePtr + 1);
    return result;
}
//取低位双字，返回原指针
uint32_t LODWORD_pri(double* value)
{
    return (uint32_t*)value;
}
//取低位双字，返回副本
uint32_t LODWORD_copy(double* value)
{
    uint32_t result = *(uint32_t*)value;
    return result;
}
//计算a2*a3*10^a1并将结果存于a4
//计算a2*a3*10^a1并将结果存于a4

void  __libm_mul_k64(int a1, double* a2, double* a3, double* a4)
{
    union double_content {
        int64_t f;
        double z;
    }content1, content2, content3, content4;
    content1.f = 0x7FE0000000000000;
    content2.f = 0x41A0000002000000;
    content3.f = 0x0010000000000000;
    content4.f = 0x26F0000000000000;

    int v4;
    double v5;
    double v6;
    double v7;
    double v8;
    int v9;
    double v11;
    double v12;
    int v13;
    double v14;
    double v15;
    double v16;
    double v17;
    double v18;
    double v19;
    int v20;
    int v21;
    double v22;
    double v23;
    double v24;
    double v25;
    double v26;
    double v27;
    double v28;

    //取出第一个乘数的指数位，存于v4
    int16_t value = HIWORD_copy(a2);
    v4 = (value & 0x7FF0) >> 4;
    //储存第一个乘数
    v5 = a2[0];//xmm3
    v6 = a2[1];//movsd   xmm7, qword ptr [rsi+8];意义不明
    //储存第二个乘数
    v7 = a3[0];//xmm2
    v8 = a3[1];
    //当两个乘数都不是0或inf或nan或无穷，条件为真
    if (v4 != 0x7FF
        && (v4 || (HIDWORD_copy(a2) & 0xFFFFF) != 0 || LODWORD_copy(a2))//指数位与小数位不同时为0
        && (v9 = (HIWORD_copy(&v7) & 0x7FF0) >> 4, v9 != 2047)
        && (v9 || (HIDWORD_copy(&v7) & 0xFFFFF) != 0 || LODWORD_copy(&v7))
        )
    {
        if (v4)//v4是移码，当它为0时表示最小负数
        {
            //suc
            v24 = 1.0;
            //从汇编语言来看，应该是将(0x7FE - v4) & 0x7FF左移4位，并且空位用1补齐，故应+15（如果测试结果不正确就尝试+15）
            //取倒数，v24的值应该等于10^（第一个乘数的指数的相反数）
            *HIWORD_pri(&v24) = 16 * ((0x7FE - v4) & 0x7FF);
            v11 = v5 * v24;//v11是a2的规格化小数部分
            v12 = v6 * v24;
        }
        else
        {
            //suc
            v11 = content1.z * v5;//实际上与if做的是相同的事，可以合并
            v12 = v6 * content1.z;
            
        }
        if (v9)//第二个乘数是规格数
        {
            //suc
            v25 = 1.0;
            //取倒数，v25的值应该等于10^（第二个乘数的指数的相反数）
            *HIWORD_pri(&v25) = 16 * ((0x7FE - v9) & 0x7FF);
            v14 = v7 * v25;//v14是a3的规格化小数部分
            v15 = v8 * v25;
            
        }
        else
        {
            //suc
            v14 = content1.z * v7;
            v15 = v8 * content1.z;

        }
        v13 = a1 + v4 + v9 - 0x3FF - 0x3FF;//指数是移码，减去0x3FF偏移量得到实际指数的值
        v16 = v11 + v12;
        v17 = content2.z * v16 - (content2.z * v16 - v16);
        v18 = content2.z * (v15 + v14) - (content2.z * (v15 + v14) - (v15 + v14));
        v19 = ((((v12+v11)-((content2.z*(v12+v11))-((content2.z*(v12+v11))-(v12+v11))))+(v12 - ((v12+v11)-v11)))*(((v15+v14)-((content2.z*(v15+v14))-((content2.z*(v15+v14))-(v15+v14))))+(v15-((v15+v14)-v14))))
        +((((v15+v14)-((content2.z*(v15+v14))-((content2.z*(v15+v14))-(v15+v14))))+(v15-((v15+v14)-v14)))
*((content2.z*(v12+v11))-((content2.z*(v12+v11))-(v12+v11))))
+((((v12+v11)-((content2.z*(v12+v11))-((content2.z*(v12+v11))-(v12+v11))))+(v12 - ((v12+v11)-v11)))*((content2.z*(v15+v14))-((content2.z*(v15+v14))-(v15+v14))));
        v28 = v17 * v18 + v19;
        v20 = (unsigned __int16)(HIWORD_copy(&v28) & 0x7FF0) >> 4;
        v21 = v13 + v20;//v13=第一个乘数的指数+第二个乘数的指数+a1+小数部分相乘后的指数（这个指数仍是移码，因此得到的V21也是移码）。
        //这里应该是考虑到两个数相乘指数溢出的情况，提供的解决办法便是直接将两个指数存到整型中，再相加。当然还要加上剩下小数部分相乘而增加的指数，v21存的便是结果的指数了
        if (v21 < 0x7FF)//不超指数位可表示的最大值
        {
            if (v21 <= 0)
            {
                if (v21 < -9)//cmp     eax, 0FFFFFFF7h
                {
                    if (v21 <= -62)//cmp     eax, 0FFFFFFC2h
                    {
                        *a4 = content3.z * content3.z * v5 * v7;
                    }
                    else
                    {
                        v27 = 1.0;
                        *HIWORD_pri(&v27) = 16 * ((v13 + v20 + 1022) & 0x7FF);
                        *HIWORD_pri(&v28) = (HIWORD_copy(&v28) & 0x800F) + 16;
                        *a4 = v28 * (content3.z * content3.z + v27);
                    }
                }
                else
                {
                    v26 = 1.0;
                    v22 = v17 * v18 + content3.z * content3.z;
                    v23 = content2.z * (v19 + v22) - (content2.z * (v19 + v22) - (v19 + v22));
                    *HIWORD_pri(&v26) = 16 * ((v13 + 0x58F) & 0x7FF);
                    *a4 = v23 * content4.z * v26 + (v19 + v22 - v23 + v19 - (v19 + v22 - v22)) * content4.z * v26;;
                }
            }
            else
            {
                //suc
                //直接将指数结果v21作为小数部分相乘得到的结果v28的指数部分
                *HIWORD_pri(&v28) = (16 * (v21 & 0x7FF)) | HIWORD_copy(&v28) & 0xffff800F;
                *a4 = v28;
            }
        }
        else
        {
            //结果的指数溢出了
            *a4 = content1.z * content1.z * v5 * v7;
        }
    }
    else
    {
        //suc
        //由于至少有一个乘数是特殊的数，结果肯定也是特殊的数，故无需处理，直接相乘
        *a4 = v5 * v7;
    }
}