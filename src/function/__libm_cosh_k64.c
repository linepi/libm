#include<stdio.h>
#include"common.h"
#include"convert.h"
static uint8_t exp_table[] = {0xb1,0x2f,0x8b,0x90,0xcc,0x3b,0xef,0x3d,0x00,0x00,
                     0x60,0x66,0x9e,0xa0,0xe6,0x3f,0x30,0x53,0xed,0xda,
                     0x7d,0xb5,0xd7,0x3d,0x00,0x00,0x00,0x75,0x12,0xc0,
                     0xe6,0x3f,0x30,0x8b,0x83,0xc8,0xbb,0x68,0xc4,0x3d,
                     0x00,0x00,0x60,0x3c,0xb2,0xdf,0xe6,0x3f,0xb5,0xe1,
                     0x87,0xcf,0x83,0x94,0xe1,0x3d,0x00,0x00,0x40,0xf9,
                     0x7d,0xff,0xe6,0x3f,0xe6,0xe1,0x46,0xba,0xe7,0xbe,
                     0xd8,0x3d,0x00,0x00,0xe0,0xe8,0x75,0x1f,0xe7,0x3f,
                     0x3a,0x69,0x72,0xf5,0xce,0x05,0xc6,0x3d,0x00,0x00,
                     0xa0,0x48,0x9a,0x3f,0xe7,0x3f,0x1a,0xd5,0x74,0xfb,
                     0x45,0x3e,0xb3,0x3d,0x00,0x00,0x40,0x56,0xeb,0x5f,
                     0xe7,0x3f,0x28,0xe0,0x9a,0x61,0x3f,0x5d,0xee,0x3d,
                     0x00,0x00,0xc0,0x4f,0x69,0x80,0xe7,0x3f,0x48,0x20,
                     0xaa,0xaf,0x0d,0x03,0xd6,0x3d,0x00,0x00,0xe0,0x73,
                     0x14,0xa1,0xe7,0x3f,0x44,0x33,0x49,0x7c,0x32,0xc1,
                     0xe0,0x3d,0x00,0x00,0x20,0x01,0xed,0xc1,0xe7,0x3f,
                     0x74,0x05,0xba,0x20,0xc4,0x9c,0xde,0x3d,0x00,0x00,
                     0xc0,0x36,0xf3,0xe2,0xe7,0x3f,0x76,0xe6,0x0d,0xb6,
                     0x11,0x1a,0xee,0x3d,0x00,0x00,0x20,0x54,0x27,0x04,
                     0xe8,0x3f,0x5f,0x11,0x9f,0x15,0x25,0x9c,0xd9,0x3d,
                     0x00,0x00,0x40,0x99,0x89,0x25,0xe8,0x3f,0xcc,0xb5,
                     0x97,0x72,0x66,0x3d,0xbe,0x3d,0x00,0x00,0x20,0x46,
                     0x1a,0x47,0xe8,0x3f,0x43,0x76,0x90,0x03,0xb2,0x4b,
                     0xc2,0x3d,0x00,0x00,0x40,0x9b,0xd9,0x68,0xe8,0x3f,
                     0x9c,0x17,0xa6,0xcc,0x32,0xcd,0xd4,0x3d,0x00,0x00,
                     0x80,0xd9,0xc7,0x8a,0xe8,0x3f,0xb4,0x8a,0x4f,0xb7,
                     0xb6,0x41,0xd5,0x3d,0x00,0x00,0x20,0x42,0xe5,0xac,
                     0xe8,0x3f,0xcd,0xa1,0x2a,0xef,0x8b,0x44,0xe5,0x3d,
                     0x00,0x00,0xa0,0x16,0x32,0xcf,0xe8,0x3f,0x46,0x27,
                     0x98,0x2b,0x36,0x77,0xe5,0x3d,0x00,0x00,0x00,0x99,
                     0xae,0xf1,0xe8,0x3f,0x47,0x1b,0xa6,0x88,0xc5,0xff,
                     0xe1,0x3d,0x00,0x00,0x80,0x0b,0x5b,0x14,0xe9,0x3f,
                     0x7e,0x38,0xa0,0xe8,0xc9,0x8b,0xdb,0x3d,0x00,0x00,
                     0xc0,0xb0,0x37,0x37,0xe9,0x3f,0xd3,0x06,0x69,0xd3,
                     0x1d,0xa4,0xd0,0x3d,0x00,0x00,0xc0,0xcb,0x44,0x5a,
                     0xe9,0x3f,0x10,0x92,0x9e,0x8b,0x4f,0x4e,0xee,0x3d,
                     0x00,0x00,0xc0,0x9f,0x82,0x7d,0xe9,0x3f,0x72,0x13,
                     0x62,0x74,0x73,0x0f,0xd4,0x3d,0x00,0x00,0xc0,0x70,
                     0xf1,0xa0,0xe9,0x3f,0x84,0x35,0xe2,0xe3,0x80,0x84,
                     //第一个检查点
                     0xbf,0x3d,0x00,0x00,0xa0,0x82,0x91,0xc4,0xe9,0x3f,
                     0xc7,0x53,0x26,0xc1,0x18,0x19,0xb9,0x3d,0x00,0x00,
                     0xe0,0x19,0x63,0xe8,0xe9,0x3f,0x8c,0xda,0x9a,0xb2,
                     0x64,0xe5,0xed,0x3d,0x00,0x00,0x40,0x7b,0x66,0x0c,
                     0xea,0x3f,0xef,0xe3,0x82,0xb1,0x66,0x5a,0xd4,0x3d,
                     0x00,0x00,0x40,0xec,0x9b,0x30,0xea,0x3f,0x92,0x44,
                     0x42,0x8b,0x5c,0x25,0xee,0x3d,0x00,0x00,0x20,0xb2,
                     0x03,0x55,0xea,0x3f,0x2b,0xfb,0x2d,0x6f,0x58,0xb3,
                     0xe0,0x3d,0x00,0x00,0x20,0x13,0x9e,0x79,0xea,0x3f,0x3c,
                     0x24,0xeb,0x43,0xbf,0xfd,0xe9,0x3d,0x00,0x00,0x60,
                     0x55,0x6b,0x9e,0xea,0x3f,0x6a,0x96,0xdb,0xc0,0x79,
                     0xf3,0xe3,0x3d,0x00,0x00,0xc0,0xbf,0x6b,0xc3,0xea,
                     0x3f,0xd1,0x34,0x87,0x5e,0xad,0xd3,0xea,0x3d,0x00,
                     0x00,0x40,0x99,0x9f,0xe8,0xea,0x3f,0x9c,0x55,0x08,
                     0x21,0xcb,0x6c,0xdb,0x3d,0x00,0x00,0x80,0x29,0x07,
                     0x0e,0xeb,0x3f,0xcf,0xa1,0x7f,0xed,0xf5,0x2b,0xde,
                     0x3d,0x00,0x00,0x40,0xb8,0xa2,0x33,0xeb,0x3f,0x44,
                     0x04,0xe2,0x38,0xe6,0x64,0xc5,0x3d,0x00,0x00,0xe0,
                     0x8d,0x72,0x59,0xeb,0x3f,0x82,0xb0,0xa7,0xea,0x46,
                     0x5e,0xeb,0x3d,0x00,0x00,0xe0,0xf2,0x76,0x7f,0xeb,
                     0x3f,0x6b,0x3c,0xcb,0x40,0x98,0x64,0xa0,0x3d,0x00,
                     0x00,0xa0,0x30,0xb0,0xa5,0xeb,0x3f,0xe9,0x41,0xf7,
                     0x48,0xa4,0x83,0xd7,0x3d,0x00,0x00,0x40,0x90,0x1e,
                     0xcc,0xeb,0x3f,0x02,0xd7,0x08,0x84,0x08,0x1e,0xe7,
                     0x3d,0x00,0x00,0xc0,0x5b,0xc2,0xf2,0xeb,0x3f,0x4b,
                     0x2c,0x83,0x88,0x70,0x4a,0xc5,0x3d,0x00,0x00,0x80,
                     0xdd,0x9b,0x19,0xec,0x3f,0x82,0xdf,0x14,0x6d,0x7a,
                     0xd0,0xef,0x3d,0x00,0x00,0xe0,0x5f,0xab,0x40,0xec,
                     0x3f,0xfd,0x37,0x21,0x4a,0x4b,0xd1,0xe7,0x3d,0x00,
                     0x00,0x40,0x2e,0xf1,0x67,0xec,0x3f,0x22,0xf1,0xb2,
                     0x46,0xd4,0x9e,0xcb,0x3d,0x00,0x00,0x00,0x94,0x6d,
                     0x8f,0xec,0x3f,0xa4,0x97,0x07,0x2a,0xd2,0x20,0xdf,
                     0x3d,0x00,0x00,0xe0,0xdc,0x20,0xb7,0xec,0x3f,0x59,
                     0x89,0x4f,0xc4,0xf9,0xc3,0xed,0x3d,0x00,0x00,0x40,
                     0x55,0x0b,0xdf,0xec,0x3f,0xc8,0x8b,0x3c,0x34,0xee,
                     0x25,0xce,0x3d,0x00,0x00,0x00,0x4a,0x2d,0x07,0xed,
                     0x3f,0x73,0x24,0xbc,0x15,0xe3,0x13,0xdb,0x3d,0x00,
                     0x00,0x00,0x08,0x87,0x2f,0xed,0x3f,0xaf,0x05,0xda,
                     0x25,0x87,0xa4,0xeb,0x3d,0x00,0x00,0xe0,0xdc,0x18,
                     0x58,0xed,0x3f,0xa1,0xf3,0x09,0x77,0x2f,0x07,0xd3,
                     0x3d,0x00,0x00,0xc0,0x16,0xe3,0x80,0xed,0x3f,0xa6,
                     0x01,0x8c,0x70,0x85,0x32,0xeb,0x3d,0x00,0x00,0xc0,
                     0x03,0xe6,0xa9,0xed,0x3f,0x3c,0xde,0x95,0xb6,0x04,
                     0x46,0xab,0x3d,0x00,0x00,0x00,0xf3,0x21,0xd3,0xed,
                     0x3f,0xc4,0xca,0x68,0xb9,0x5e,0x9b,0xeb,0x3d,0x00,
                     0x00,0x60,0x33,0x97,0xfc,0xed,0x3f,0xfa,0x61,0x27,
                     0xa1,0x28,0xa1,0xe5,0x3d,0x00,0x00,0xe0,0x14,0x46,
                     0x26,0xee,0x3f,0x03,0x26,0x7a,0x4e,0xec,0x7f,0xd6,
                     0x3d,0x00,0x00,0x80,0xe7,0x2e,0x50,0xee,0x3f,0xa1,
                     0x2c,0x52,0x2d,0x0d,0x32,0xcd,0x3d,0x00,0x00,0xc0,
                     0xfb,0x51,0x7a,0xee,0x3f,0x86,0xce,0x3d,0x16,0x66,
//第二个检查点
                     0x43,0xc2,0x3d,0x00,0x00,0xa0,0xa2,0xaf,0xa4,0xee,
                     0x3f,0x5f,0x62,0x60,0x1b,0xe1,0xcf,0xdc,0x3d,0x00,
                     0x00,0x80,0x2d,0x48,0xcf,0xee,0x3f,0xa9,0x21,0xfd,
                     0x71,0x77,0xa2,0xa5,0x3d,0x00,0x00,0x60,0xee,0x1b,
                     0xfa,0xee,0x3f,0xf8,0x2d,0x0d,0x9d,0x2e,0x75,0xd7,
                     0x3d,0x00,0x00,0x60,0x37,0x2b,0x25,0xef,0x3f,0x6f,
                     0x09,0x9f,0xce,0x80,0x8a,0xdc,0x3d,0x00,0x00,0x60,
                     0x5b,0x76,0x50,0xef,0x3f,0xc0,0xb4,0x13,0x89,0x13,
                     0xbe,0xec,0x3d,0x00,0x00,0x80,0xad,0xfd,0x7b,0xef,
                     0x3f,0xe7,0xa7,0x90,0x2e,0xd8,0x90,0xee,0x3d,0x00,
                     0x00,0x80,0x81,0xc1,0xa7,0xef,0x3f,0x96,0x74,0xeb,
                     0x12,0xe2,0xe3,0xde,0x3d,0x00,0x00,0x80,0x2b,0xc2,
                     0xd3,0xef,0x3f,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
                     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xf0,0x3f,0x6b,
                     0xa6,0x84,0x6d,0x35,0x33,0xfb,0x3d,0x00,0x00,0xe0,
                     0xa9,0x3d,0x16,0xf0,0x3f,0xad,0x7c,0x6f,0xee,0x60,
                     0x80,0xf7,0x3d,0x00,0x00,0x60,0x3e,0x9a,0x2c,0xf0,
                     0x3f,0x34,0x1f,0xe7,0x7a,0x09,0xff,0xec,0x3d,0x00,
                     0x00,0x60,0xe8,0x15,0x43,0xf0,0x3f,0x49,0xc5,0xe7,
                     0x3a,0x74,0x85,0xf5,0x3d,0x00,0x00,0x00,0xd3,0xb0,
                     0x59,0xf0,0x3f,0x3b,0x40,0xdc,0xc6,0xdd,0xf6,0xfd,
//第三个检查点
                     0x3d,0x00,0x00,0xc0,0x29,0x6b,0x70,0xf0,0x3f,0x26,
                     0x5f,0xc3,0x08,0xc8,0x9b,0xf5,0x3d,0x00,0x00,0x60,
                     0x18,0x45,0x87,0xf0,0x3f,0x83,0x81,0x87,0x14,0x0d,
                     0xce,0xdb,0x3d,0x00,0x00,0xc0,0xca,0x3e,0x9e,0xf0,
                     0x3f,0x2b,0xb9,0x98,0x62,0x0f,0x89,0xf9,0x3d,0x00,
                     0x00,0xe0,0x6c,0x58,0xb5,0xf0,0x3f,0x5c,0x70,0x7b,
                     0x40,0xf7,0x47,0xf2,0x3d,0x00,0x00,0x60,0x2b,0x92,
                     0xcc,0xf0,0x3f,0xe5,0x42,0x07,0x02,0xa2,0xd1,0xf3,
                     0x3d,0x00,0x00,0xc0,0x32,0xec,0xe3,0xf0,0x3f,0x1e,
                     0x09,0x32,0xf2,0x1a,0xd3,0xfe,0x3d,0x00,0x00,0xe0,
                     0xaf,0x66,0xfb,0xf0,0x3f,0x1b,0xbf,0xeb,0xa4,0x50,
                     0x5b,0xf2,0x3d,0x00,0x00,0x00,0xd0,0x01,0x13,0xf1,
                     0x3f,0xa6,0x75,0x25,0xf7,0x97,0x63,0xe8,0x3d,0x00,
                     0x00,0x60,0xc0,0xbd,0x2a,0xf1,0x3f,0x28,0x03,0x82,
                     0x66,0xbf,0x5b,0xe2,0x3d,0x00,0x00,0xa0,0xae,0x9a,
                     0x42,0xf1,0x3f,0xcf,0x55,0x03,0x92,0x44,0x39,
                     0xd6,0x3d,0x00,0x00,0xa0,0xc8,0x98,0x5a,0xf1,0x3f,
                     0x8c,0x7c,0xdf,0xdc,0x7a,0x51,0xfd,0x3d,0x00,0x00,
                     0x60,0x3c,0xb8,0x72,0xf1,0x3f,0x73,0xe1,0x7e,0x77,
                     0xd3,0x1b,0xe9,0x3d,0x00,0x00,0x80,0x38,0xf9,0x8a,
                     0xf1,0x3f,0xed,0x31,0x6d,0x79,0xea,0x96,0xef,0x3d,
                     0x00,0x00,0x60,0xeb,0x5b,0xa3,0xf1,0x3f,0xad,0x9c,
                     0xc7,0x6a,0x4e,0x73,0xd1,0x3d,0x00,0x00,0x00,0x84,
                     0xe0,0xbb,0xf1,0x3f,0x05,0x70,0x0b,0xf0,0x54,0x73,
                     0xe1,0x3d,0x00,0x00,0x60,0x31,0x87,0xd4,0xf1,0x3f,
                     0xf6,0x9f,0x81,0xb8,0x1c,0xd9,0xfc,0x3d,0x00,0x00,
                     0xe0,0x22,0x50,0xed,0xf1,0x3f,0x15,0x58,0x77,0xdc,
                     0xb1,0x66,0xc4,0x3d,0x00,0x00,0x60,0x88,0x3b,0x06,

                     0xf2,0x3f,0x29,0xfd,0x52,0x25,0x96,0xdc,0xfd,0x3d,
                     0x00,0x00,0x60,0x91,0x49,0x1f,
                     0xf2,0x3f,0xdb,0xfa,0xc1,0x66,0x38,0x62,0xf5,0x3d,
                     0x00,0x00,0x60,0x6e,0x7a,0x38,0xf2,
                     0x3f,0x7e,0xab,0x82,0x35,0x3f,0xa6,0xf2,0x3d,0x00,
                     0x00,0xa0,0x4f,0xce,0x51,0xf2,0x3f,0x94,0x39,0xd3,
                     0x2b,0xe9,0xe6,0xc3,0x3d,0x00,0x00,0xe0,0x65,0x45,
                     0x6b,0xf2,0x3f,0xcf,0x15,0xcf,0x96,0x80,0x63,0xf5,
                     0x3d,0x00,0x00,0xe0,0xe1,0xdf,0x84,0xf2,0x3f,0x5f,
                     0xd1,0x25,0x2c,0xe1,0xde,0xff,0x3d,0x00,0x00,0x00,
                     0xf5,0x9d,0x9e,0xf2,0x3f,0x65,0xa4,0xde,0xfd,0x8f,
                     0xd9,0xfa,0x3d,0x00,0x00,0xc0,0xd0,0x7f,0xb8,0xf2,
                     0x3f,0x4e,0x75,0x24,0x00,0x2d,0x0c,0xd0,0x3d,0x00,
                     0x00,0xe0,0xa6,0x85,0xd2,0xf2,0x3f,0x46,0x0f,0xca,
                     0x11,0x56,0x2f,0xfe,0x3d,0x00,0x00,0x20,0xa9,0xaf,
                     0xec,0xf2,0x3f,0xa4,0xd5,0xe8,0x2d,0x15,0xb7,0xf1,
                     0x3d,0x00,0x00,0x20,0x0a,0xfe,0x06,0xf3,0x3f,0x38,
                     0x9e,0x73,0x6a,0x62,0xb0,0xe9,0x3d,0x00,0x00,0x40,
                     0xfc,0x70,0x21,0xf3,0x3f,0x43,0x18,0x72,0x32,0xfd,
                     0x5b,0xd0,0x3d,0x00,0x00,0x60,0xb2,0x08,0x3c,0xf3,
                     0x3f,0x47,0x23,0x46,0xc9,0xf0,0x9f,0xf2,0x3d,0x00,
                     0x00,0x80,0x5f,0xc5,0x56,0xf3,0x3f,0x03,0x55,0x14,
//第四个检查点
                     0xa7,0xca,0xa9,0xfa,0x3d,0x00,0x00,0x20,0x37,0xa7,
                     0x71,0xf3,0x3f,0x36,0x2c,0xa7,
                     0x16,0x96,0x61,0xd7,0x3d,0x00,0x00,0x00,
                     0x6d,0xae,0x8c,0xf3,0x3f,0xa6,0x24,0x6f,0xa8,0xdb,
                     0x7f,0xd6,0x3d,0x00,0x00,0xe0,0x34,0xdb,0xa7,0xf3,
                     0x3f,0x23,0x1f,0x00,0x84,0xe4,0xa8,0xf3,0x3d,0x00,
                     0x00,0x00,0xc3,0x2d,0xc3,0xf3,0x3f,0x24,0x12,0xb4,
                     0x35,0x22,0x34,0xf2,0x3d,0x00,0x00,0x00,0x4c,0xa6,
                     0xde,0xf3,0x3f,0x35,0xe0,0x7e,0x41,0x37,0x00,0xe9,
                     0x3d,0x00,0x00,0xa0,0x04,0x45,0xfa,0xf3,0x3f,0xb9,
                     0x25,0x43,0xf8,0x29,0x2e,0xf7,0x3d,0x00,0x00,0xe0,
                     0x21,0x0a,0x16,0xf4,0x3f,0x39,0x44,0x70,0xdc,0x96,
                     0xa8,0xf0,0x3d,0x00,0x00,0x40,0xd9,0xf5,0x31,0xf4,
                     0x3f,0x0a,0xf4,0x36,0x31,0xd0,0x92,0xb8,0x3d,0x00,
                     0x00,0x60,0x60,0x08,0x4e,0xf4,0x3f,0x46,0x2f,0x51,
                     0x72,0x57,0x00,0xfd,0x3d,0x00,0x00,0x00,0xed,0x41,
                     0x6a,0xf4,0x3f,0x69,0x3b,0x1a,0x3c,0x01,0xcd,0xb3,
                     0x3d,0x00,0x00,0xc0,0xb5,0xa2,0x86,0xf4,0x3f,0xcf,
                     0x8b,0x2d,0x67,0xde,0xd3,0xf7,0x3d,0x00,0x00,0xc0,
                     0xf0,0x2a,0xa3,0xf4,0x3f,0xb0,0x97,0x43,0x1d,0x27,
                     0x2a,0xf6,0x3d,0x00,0x00,0x20,0xd5,0xda,0xbf,0xf4,
                     0x3f,0xf2,0x6e,0xb3,0x63,0x0d,0xdd,0xfd,0x3d,0x00,
                     0x00,0xe0,0x99,0xb2,0xdc,0xf4,0x3f,0xb7,0xd8,0x33,
                     0xad,0xa6,0x2c,0xfd,0x3d,0x00,0x00,0x80,0x76,0xb2,
                     0xf9,0xf4,0x3f,0x59,0xea,0x25,0x82,0x83,0xcc,0xee,
                     0x3d,0x00,0x00,0xc0,0xa2,0xda,0x16,0xf5,0x3f,0xc5,
                     0x83,0x0a,0xdf,0x81,0x4f,0xfd,0x3d,0x00,0x00,0x80,
                     0x56,0x2b,0x34,0xf5,0x3f,0x20,0xc6,0x2e,0xc5,0x0e,
                     0x92,0xfd,0x3d,0x00,0x00,0x40,0xca,0xa4,0x51,0xf5,
                     0x3f,0x04,0xb0,0xec,0x66,0xda,0x27,0xf5,0x3d,0x00,
                     0x00,0xa0,0x36,0x47,0x6f,0xf5,0x3f,0xb7,0xc2,0x2b,
                     0x25,0xfd,0xc7,0xf7,0x3d,0x00,0x00,0x80,0xd4,0x12,
                     0x8d,0xf5,0x3f,0x2a,0x60,0x92,0xb1,0x52,0xa8,0xe0,
                     0x3d,0x00,0x00,0x40,0xdd,0x07,0xab,0xf5,0x3f,0xb8,
                     0xb1,0xc4,0x01,0xb7,0x46,0xf9,0x3d,0x00,0x00,0x40,
                     0x8a,0x26,0xc9,0xf5,0x3f,0x84,0xc9,0x37,0xdd,0x90,
                     0x42,0xea,0x3d,0x00,0x00,0xa0,0x15,0x6f,0xe7,0xf5,
                     0x3f,0x93,0xf5,0x76,0xb0,0x08,0xdc,0xf6,0x3d,0x00,
                     0x00,0x60,0xb9,0xe1,0x05,0xf6,0x3f,0x07,0xfa,0xf0,
                     0xb1,0x84,0x55,0xfa,0x3d,0x00,0x00,0x20,0xb0,0x7e,
                     0x24,0xf6,0x3f,0x2a,0x0e,0xdf,0x8e,0x3f,0x86,0xe9,
                     0x3d,0x00,0x00,0xc0,0x34,0x46,0x43,0xf6,0x3f,0xe3,
                     0xd9,0x27,0x91,0x24,0x22,0xf5,0x3d,0x00,0x00,0x40,
                     0x82,0x38,0x62,0xf6,0x3f,0x45,0xae,0x38,0x10,0xe6,
                     0x52,0xe9,0x3d,0x00,0x00,0x40,0xd4,0x55,0x81,0xf6,
                     0x3f,0xb1,0x2f,0x8b,0x90,0xcc,0x3b,0xff,0x3d,0x00,
                     0x00,0x60,0x66,0x9e,0xa0,0xf6,0x3f,0x00,0x00,0x00,
                     0x00,0x00,0x00,0x00,0x00};


//

uint64_t get_exp_table(int pos){    
    uint64_t result = 0;
    int j=0;
    for (int i = pos; i <pos+ 8; i++) {
        result |= ((uint64_t)exp_table[i] << (j * 8));
        j++;
    }
    return result;
}

int __libm_cosh_k64(double input,double* result){
    double xmm0,xmm1,xmm2,xmm3,xmm4,xmm5,xmm6,xmm7,xmm8,xmm9,xmm10,xmm11,xmm12,xmm13,xmm14,xmm15;
    //功能实现
    xmm0 = input;
    uint64_t rsp_0x20= Asuint64(xmm0);
    uint32_t eax=(uint32_t)((rsp_0x20>>48)&0x00007ff0);//eax
    if(eax<0x4150){
        //printf("eax<0x4150\n");
        uint32_t edx=(uint32_t)((rsp_0x20>>32)&0x7fffffff);//edx
        if(edx>0x3F847AE1){
            //printf("edx>0x3F847AE1\n");
            xmm2=Asdouble(rsp_0x20);
            xmm2=Asdouble(Asuint64(xmm2)&0x7FFFFFFFFFFFFFFF);
            xmm4=Asdouble(0x40671547652b82fe);
            xmm4*=xmm2;
            xmm0=Asdouble(0x4330000000000000);
            xmm1=Asdouble(0x3f762e4200000000);
            xmm4+=xmm0;
            uint64_t rsp_0x28=Asuint64(xmm4);
            xmm4-=xmm0;
            xmm1*=xmm4;
            rsp_0x20= Asuint64(xmm2);
            xmm2-=xmm1;
            xmm3=Asdouble(0x3e2fdf473de6af28);
            xmm6=xmm2;
            xmm4*=xmm3;
            eax=(uint32_t)(rsp_0x28);//eax
            uint32_t r8d=eax;//r8d
            r8d=r8d<<0x19;
            xmm6-=xmm4;
            if((r8d&0x80000000)==0x0){
                r8d=r8d>>0x19;
            }
            else{
                r8d=r8d>>0x19;
                r8d=r8d|0xffffff80;
            }
            xmm2-=xmm6;
            eax-=r8d;
            xmm2-=xmm4;
            xmm1=Asdouble(0x3ff0000000000000);
            xmm0=xmm2;
            if((eax&0x80000000)==0x0){
                eax=eax>>0x7;
            }
            else{
                eax=eax>>0x7;
                eax=eax|0xfe000000;
            }
            xmm0+=xmm6;
            xmm1+=xmm6;
            uint32_t esi=0x3ff0;
            if(edx<0x4036DFB5||edx==0x4036DFB5){
                //printf("edx<0x4036DFB5||edx==0x4036DFB5\n");
                xmm7=xmm0;
                edx=edx^edx;
                xmm7*=xmm0;
                xmm9=xmm6;
                xmm8=Asdouble(0x3f8111116887cd7c);
                uint32_t ecx=eax;
                xmm8*=xmm7;
                ecx=~ecx+0x1;
                xmm3=Asdouble(0x3ff0000000000000);
                ecx+=0x3ff;
                rsp_0x20=Asuint64(xmm1);
                ecx-=eax;
                rsp_0x20&=0xFFFFFFFF00000000;
                rsp_0x20|=(uint64_t)(edx);
                ecx&=0x7ff;
                xmm10=Asdouble(rsp_0x20);
                esi&=0x0FFFF800F;
                xmm4=Asdouble(0xbff0000000000000);
                eax-=0x1;
                xmm5=Asdouble(0xbff0000000000000);
                xmm3-=xmm6;
                xmm8+=Asdouble(0x3FC5555555555405);
                xmm4+=xmm10;
                xmm8*=xmm7;
                xmm9-=xmm4;
                xmm8*=xmm0;
                xmm9+=xmm2;
                xmm0=Asdouble(0x3F56C16C87372663);
                xmm9+=xmm8;
                xmm0*=xmm7;
                uint64_t rsp_0x18=Asuint64(xmm3);
                rsp_0x18&=0xFFFFFFFF00000000;
                rsp_0x18|=(uint64_t)(edx);
                xmm1=Asdouble(rsp_0x18);
                uint64_t r8=(uint64_t)(r8d);
                xmm0+=Asdouble(0x3FA555555555541D);
                xmm5+=xmm1;
                xmm0*=xmm7;
                xmm6+=xmm5;
                xmm0+=Asdouble(0x3FE0000000000000);
                xmm2+=xmm6;
                xmm0*=xmm7;
                xmm2=Asdouble(Asuint64(xmm2)^0x8000000000000000);
                xmm9+=xmm0;
                xmm2-=xmm8;
                xmm15=xmm9;
                xmm9+=xmm10;
                xmm2+=xmm0;
                xmm6=Asdouble(0x3FF0000000000000);
                xmm12=xmm2;
                ecx=ecx<<0x4;
                xmm2+=xmm1;
                r8=r8<<0x4;
                esi|=ecx;
                uint64_t rsp_0x10=Asuint64(xmm6);
                uint16_t si=(uint16_t)(esi);
                rsp_0x10&=0x0000FFFFFFFFFFFF;
                rsp_0x10|=(((uint64_t)(si))<<48);
                xmm13=Asdouble(get_exp_table(r8+0x408)); 
                xmm9*=Asdouble(get_exp_table(r8+0x400));
                r8=~r8+0x1;
                xmm15*=xmm13;
                xmm2*=Asdouble(get_exp_table(r8+0x400));
                xmm13*=xmm10;
                xmm15+=xmm9;
                xmm11=Asdouble(get_exp_table(r8+0x408));
                xmm14=xmm13;
                xmm12*=xmm11;
                xmm1*=xmm11;
                xmm12+=xmm2;
                xmm2=Asdouble(rsp_0x10);
                xmm1*=xmm2;
                xmm12*=xmm2;
                xmm14+=xmm1;
                xmm15+=xmm12;
                xmm13-=xmm14;
                xmm13+=xmm1;
                xmm15+=xmm13;
                result[0] = xmm14;
                result[1] = xmm15;
            }
            else{
                //printf("else:edx<0x4036DFB5||edx==0x4036DFB5\n");
                rsp_0x28 = Asuint64(xmm1);
                xmm4 = xmm0;
                rsp_0x28&=0xFFFFFFFF00000000;
                eax -= 0x1;
                xmm7 = Asdouble(rsp_0x28);
                xmm1 = Asdouble(0x0BFF0000000000000);
                xmm4 *= xmm0;
                xmm1 += xmm7;
                xmm5 = Asdouble(0x3F56C16C87372663);
                xmm6 -= xmm1;
                xmm5 *= xmm4;
                xmm2 += xmm6;
                xmm5 += Asdouble(0x3FA555555555541D);
                xmm6 = Asdouble(0x3F8111116887CD7C);
                xmm6 *= xmm4;
                xmm5 *= xmm4;
                xmm6 += Asdouble(0x3FC5555555555405);
                xmm0 *= xmm6;
                xmm3 = Asdouble(0x3FE0000000000000);
                xmm5 += xmm0;
                xmm5 *= xmm4;
                xmm4 *= xmm3;
                uint64_t r8=(uint64_t)(r8d);
                xmm5 += xmm4;
                r8=r8<<4;
                xmm2 += xmm5;
                xmm8 = xmm2;
                xmm2 += xmm7;
                xmm0=Asdouble(get_exp_table(r8+0x408));
                xmm2*=Asdouble(get_exp_table(r8+0x400));           
                xmm8 *= xmm0;
                xmm7 *= xmm0;
                xmm8 += xmm2;
                result[0] = xmm7;
                result[1] = xmm8;
            }
        }
        else{
            //printf("else:edx>0x3F847AE1\n");
            if (edx<0x3C600000){
                uint64_t rax = 0x3FF0000000000000;
                result[0] = Asdouble(rax);
                result[1] = 0.0;
            }
            else {
                xmm0 = Asdouble(rsp_0x20);
                uint64_t rax = 0x3FF0000000000000;
                xmm0 *= xmm0;
                xmm1 = xmm0;
                xmm1 *= xmm0;
                xmm3 = Asdouble(0x3F56C1716A3D464E);
                xmm3 *= xmm1;
                xmm2 = Asdouble(0x3FA555555554A6CF);
                xmm2 *= xmm1;
                xmm3 += Asdouble(0x3FE0000000000000);
                xmm3 *= xmm0;
                xmm3 += xmm2;
                result[0] = Asdouble(rax);
                result[1] = xmm3;
            }
            eax = 0;
        }
    }
    else{
        //printf("else:eax<0x4150\n");
        eax = 0;
        result[0] = 0.0;
        result[1] = 0.0;
    }
    return eax;
 }
