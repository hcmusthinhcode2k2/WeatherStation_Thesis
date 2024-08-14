#include "Utils.h"

// <editor-fold defaultstate="collapsed" desc="String Processing">

void mymemset(uint8_t *pD, uint8_t init, uint16_t len) // <editor-fold defaultstate="collapsed" desc="8-bit array memory set">
{
    while(len>0)
    {
        *pD=init;
        pD++;
        len--;
    }
} // </editor-fold>

void mymemcpy(uint8_t *pDes, const uint8_t *pSrc, uint16_t size) // <editor-fold defaultstate="collapsed" desc="8-bit array memory copy">
{
    while(size>0)
    {
        *pDes=*pSrc;
        pDes++;
        pSrc++;
        size--;
    }
} // </editor-fold>

char *mystrchr(const char *pStr, char c) // <editor-fold defaultstate="collapsed" desc="find a char in a string">
{
    while(*pStr!=0x00)
    {
        if(*pStr==c)
            return (char *) pStr;

        pStr++;
    }

    return NULL;
} // </editor-fold>

void mystrcpy(char *pDes, const char *pSrc) // <editor-fold defaultstate="collapsed" desc="copy a string">
{
    while(*pSrc!=0x00)
    {
        *pDes=*pSrc;
        pDes++;
        pSrc++;
    }
} // </editor-fold>

public void random8(uint8_t *des, int len, uint8_t min, uint8_t max) // <editor-fold defaultstate="collapsed" desc="Generate 8-bit random value">
{
    uint8_t step=(max-min)+1;

    while(len>0)
    {
        uint16_t val=(0xFF&rand());

        val*=step;
        val>>=8;
        val+=min;
        *des=(uint8_t) val;
        des++;
        len--;
    }
} // </editor-fold>

public void random8s(int8_t *des, int len, int8_t min, int8_t max) // <editor-fold defaultstate="collapsed" desc="Generate 8-bit random value">
{
    int8_t step=(max-min)+1;

    while(len>0)
    {
        int16_t val=(0xFF&rand());

        val*=step;
        val>>=8;
        val+=min;
        *des=(int8_t) val;
        des++;
        len--;
    }
} // </editor-fold>

public size_t slen(const char *pStr) // <editor-fold defaultstate="collapsed" desc="Calculate length of an ASCII string">
{
    size_t len=0;

    while((*pStr!=0)&&(*pStr!=255))
    {
        len++;
        pStr++;
    }

    return len;
} // </editor-fold>

public uint8_t UpperCase(uint8_t Data) // <editor-fold defaultstate="collapsed" desc="Convert lower case to upper case">
{
    if((Data>='a')&&(Data<='z'))
        return (Data&0xDF);

    return Data;
} // </editor-fold>

public void str_uppercase(uint8_t *pData) // <editor-fold defaultstate="collapsed" desc="Convert lower case to upper case">
{
    while(*pData!=0x00)
    {
        if((*pData>='a')&&(*pData<='z'))
            *pData&=0xDF;

        pData++;
    }
} // </editor-fold>

public uint8_t LowerCase(uint8_t Data) // <editor-fold defaultstate="collapsed" desc="Convert upper case to lower case">
{
    if((Data>='A')&&(Data<='Z'))
        return (Data|0x20);

    return Data;
} // </editor-fold>

public void str_lowercase(uint8_t *pData) // <editor-fold defaultstate="collapsed" desc="Convert upper case to lower case">
{
    while(*pData!=0x00)
    {
        if((*pData>='A')&&(*pData<='Z')) *pData|=0x20;
        pData++;
    }
} // </editor-fold>

public bool FindString(uint8_t c, size_t *pIdx, const char *pStrSample) // <editor-fold defaultstate="collapsed" desc="Find a string">
{
    if(pStrSample!=NULL)
    {
        if(c!=0x00)
        {
LOOP:
            if(c==pStrSample[*pIdx])
            {
                (*pIdx)=(*pIdx)+1;

                if(pStrSample[*pIdx]==0x00)
                {
                    *pIdx=0;
                    return 1; // matched
                }
            }
            else if(*pIdx>0)
            {
                *pIdx=0;
                goto LOOP;
            }
            else
                *pIdx=0;
        }
        else
            *pIdx=0;
    }
    else
        *pIdx=0;

    return 0;
} // </editor-fold>

uint16_t Copy_Str2Break(const uint8_t *pDatain, uint8_t break_byte, uint8_t *pDataout) // <editor-fold defaultstate="collapsed" desc="Copy a string to break byte">
{
    uint16_t lenout=0;

    while((*pDatain!=0x00)&&(*pDatain!=break_byte))
    {
        *pDataout++=*pDatain++;
        lenout++;
    }

    return lenout;
} // </editor-fold>

uint16_t str_len2break(const uint8_t *pData, uint8_t break_byte) // <editor-fold defaultstate="collapsed" desc="Length from start to break character">
{
    uint16_t i;

    i=0;

    while(pData[i]!=break_byte)
    {
        if(pData[i]==0x00)
        {
            if(break_byte==0x00)
                return i;

            return 0;
        }

        i++;
    }

    return i;
} // </editor-fold>

public bool str_cmp(const char *pDatain, const char *pSample) // <editor-fold defaultstate="collapsed" desc="Compare sub-string in string">
{
    int i;
    int l=slen(pSample);

    for(i=0; i<l; i++)
    {
        if(pDatain[i]!=pSample[i])
            return 0;
    }

    return 1;
} // </editor-fold>

public bool str_cmp_without_case(const uint8_t *pDatain, int Len, const uint8_t *pSample) // <editor-fold defaultstate="collapsed" desc="Compare sub-string in string">
{
    int i;

    for(i=0; i<Len; i++)
    {
        if(pDatain[i]!=pSample[i])
        {
            if(UpperCase(pDatain[i])!=pSample[i]) // not upper case
            {
                if(LowerCase(pDatain[i])!=pSample[i]) // not lower case
                    return 0;
            }
        }
    }

    return 1;
} // </editor-fold>

public bool findSString(char *pDatain, const char *pSample) // <editor-fold defaultstate="collapsed" desc="Find sub-string in string">
{
    uint8_t i, LenD=(uint8_t) slen((char *) pDatain);

    for(i=0; i<LenD; i++)
    {
        if(pDatain[i]==pSample[0])
        {
            if(str_cmp(&pDatain[i], pSample))
                return 1;
        }
    }

    return 0;
} // </editor-fold>

public bool remove_1st_Substring(char *str, const char *sub) // <editor-fold defaultstate="collapsed" desc="Remove the 1st sub-string">
{
    bool found=0;
    int i=0, j=0;

    while(str[i])
    {
        if(str[i]==sub[j])
        {

            int temp=i;

            while(str[i]==sub[j]&&str[i]&&sub[j])
            {
                i++;
                j++;
            }

            if(!sub[j])
            {
                i=temp;

                while(str[i])
                {
                    str[i]=str[i+j];
                    i++;
                }

                found=1;
            }

            j=0;

        }
        else
        {
            i++;
        }
    }

    return found;
} // </editor-fold>

public void delSString(char *pDatain, const char *pSample) // <editor-fold defaultstate="collapsed" desc="Remove a sub-string in a string just once">
{
    while(remove_1st_Substring(pDatain, pSample)==1);
} // </editor-fold>

public int str_remove(char *p, char c) // <editor-fold defaultstate="collapsed" desc="Remove a character in a string">
{
    int i, j, len;

    len=(int) slen(p);

    i=0;

    while(p[i]!=0x00)
    {
        if(p[i]==c)
        {
            j=i;

            while(j<len)
            {
                p[j]=p[j+1];
                j++;
            }

            p[j]=0x00;
            len--;
        }

        i++;
    }

    return i;
} // </editor-fold>

public void str_sremove(char *str, char c, uint8_t amount) // <editor-fold defaultstate="collapsed" desc="Remove some characters from String">
{
    uint8_t i, j, k, len;

    len=(uint8_t) slen(str);

    i=0;
    k=0;

    while(str[i]!=0x00&&k<amount)
    {
        if(str[i]==c)
        {
            j=i;

            while(j<len)
            {
                str[j]=str[j+1];
                j++;
            }

            str[j]=0x00;
            len--;
            k++;
        }

        i++;
    }
}// </editor-fold>

public uint16_t str_nremove(char *p, const char *c) // <editor-fold defaultstate="collapsed" desc="Remove a sub-string in a string">
{
    uint16_t len, i, j;

    i=0;

    while(p[i]!=0)
    {
        if(mystrchr(c, p[i])!=NULL)
            break;
        i++;
    }

    j=i+1;

    do
    {
        if(mystrchr(c, p[j])==NULL)
            p[i++]=p[j];
    }
    while(p[j++]!=0);

    len=i;

    while(i<j)
        p[i++]=0;

    return len;
} // </editor-fold>

public uint8_t str_is_number(char c) // <editor-fold defaultstate="collapsed" desc="Check number character">
{
    if((c<'0')||(c>'9'))
        return 0xFF;

    return (uint8_t) (c-'0');
} // </editor-fold>

public uint16_t str_count(const char *p, char c) // <editor-fold defaultstate="collapsed" desc="Count character 'c' in string">
{
    uint16_t i=0;

    while(*p!=0x00)
    {
        if(*p==c)
            i++;

        p++;
    }

    return i;
} // </editor-fold>

public int str_1st_index(const char *p, char c) // <editor-fold defaultstate="collapsed" desc="Get the 1st index of a character">
{
    int i;

    i=0;

    while(*p!=0x00)
    {
        if(*p==c)
            return i;

        i++;
        p++;
    }

    return (-1);
} // </editor-fold>

public int str_n_index(const char *p, char c, int count) // <editor-fold defaultstate="collapsed" desc="Get index N of a character in a string">
{
    int i=0;

    while(count>0)
    {
        int j=str_1st_index(&p[i], c);

        if(j>=0)
            i+=j+1;
        else
            return (-1);

        count--;
    }

    return (i-1);
} // </editor-fold>

public const char *str_1st_contain(const char *sub, const char *str) // <editor-fold defaultstate="collapsed" desc="Get pointer of the 1st sub-string">
{
    int i, j;
    int sl=(int) slen(sub);

    if(sl>0)
    {
        i=0;
        j=0;

        while(str[i]!=0)
        {
LOOP:
            if(str[i]==sub[j])
            {
                if(++j>=sl)
                    return (&str[i-sl+1]);
            }
            else if(j>0)
            {
                j=0;
                goto LOOP;
            }
            else
                j=0;

            i++;
        }
    }

    return NULL;
} // </editor-fold>

public int str_1st_contain_idx(const char *sub, const char *str) // <editor-fold defaultstate="collapsed" desc="First position of sub-string">
{
    const char *plast=(const char *) str_1st_contain(sub, str);

    if(plast!=NULL)
        return (int) (plast-str);

    return (-1);
} // </editor-fold>

public const char *str_last_contain(const char *sub, const char *str) // <editor-fold defaultstate="collapsed" desc="Get pointer of the last sub-string">
{
    int i, j, sl, len;

    sl=(int) slen(sub);
    len=(int) slen(str);

    if((sl>0)&&(len>0))
    {
        len--;
        sl--;

        i=len;
        j=sl;

        while(i>0)
        {
LOOP:
            if(str[i]==sub[j])
            {
                if(j==0)
                    return (&str[i]);

                j--;
            }
            else if(j<sl)
            {
                j=sl;
                goto LOOP;
            }
            else
                j=sl;

            i--;
        }
    }

    return NULL;
} // </editor-fold>

public int str_last_contain_idx(const char *sub, const char *str) // <editor-fold defaultstate="collapsed" desc="Last position of sub-string">
{
    const char *plast=(const char *) str_last_contain(sub, str);

    if(plast!=NULL)
        return (int) (plast-str);

    return (-1);
} // </editor-fold>

public const char *str_n_contain(const char *sub, const char *str, int count) // <editor-fold defaultstate="collapsed" desc="Get pointer of the Nth sub-string">
{
    const char *i=str;

    while(count>0)
    {
        const char *j=str_1st_contain(sub, i);

        if(j!=NULL)
            i=j+1;
        else
            return NULL;

        count--;
    }

    return (i-1);
} // </editor-fold>

public int str_sub(char *des, const char *src, char c1, int count1, int offset1, char c2, int count2, int offset2) // <editor-fold defaultstate="collapsed" desc="Get sub-string">
{
    int begin, end;

    begin=str_n_index(src, c1, count1)+offset1;
    //printf("\nbegin: %d", begin);

    if(begin<0)
    {
        *des=0;
        return 0;
    }

    end=str_n_index(&src[begin], c2, count2)+offset2+1;
    //printf("\nend: %d", end);

    if(end<0)
    {
        *des=0;
        return 0;
    }

    mymemcpy((uint8_t *) des, (uint8_t *)&src[begin], end);
    des[end]=0;

    return end;
} // </editor-fold>

public int str_sub_between_2sub(char *des, const char *src, const char *sub1, const char *sub2) // <editor-fold defaultstate="collapsed" desc="Get sub string between 2 sub strings">
{
    int i, len=0;
    const char *psub1, *psub2;

    psub1=str_1st_contain(src, sub1);

    if(psub1!=NULL)
    {
        psub1+=slen(sub1);
        psub2=str_1st_contain(psub1, sub2);

        if(psub2!=NULL)
        {
            len=(int) (psub2-psub1)+1;

            for(i=0; i<len; i++)
                des[i]=psub1[i];

            des[i]=0x00;
        }
    }

    return len;
}// </editor-fold>

public char *str_first(char *p, char c) // <editor-fold defaultstate="collapsed" desc="Get pointer of the first index of 'c' in string">
{
    while(*p!=0x00)
    {
        if(*p==c)
            return p;

        p++;
    }

    return NULL;
} // </editor-fold>

public char *str_last(char *p, char c) // <editor-fold defaultstate="collapsed" desc="Get pointer of the last index of 'c' in string">
{
    char *rslt;

    rslt=NULL;

    while(*p!=0x00)
    {
        if(*p==c)
            rslt=p;

        p++;
    }

    return rslt;
} // </editor-fold>

public int32_t IntParse(const char *c) // <editor-fold defaultstate="collapsed" desc="String to signed integer value">
{
    bool minus=0;
    int32_t res=0;

    if(c==NULL)
        return 0;

    if(*c=='-')
    {
        c++;
        minus=1;
    }

    while((*c>='0')&&(*c<='9'))
    {
        res*=10;
        res+=(*c-'0');
        c++;
    }

    if(minus)
        res*=(-1);

    return res;
} // </editor-fold>

public uint32_t UIntParse(const char *c) // <editor-fold defaultstate="collapsed" desc="String to unsigned integer">
{
    uint32_t res=0;

    if(c==NULL)
        return 0;

    while((*c>='0')&&(*c<='9'))
    {
        res*=10;
        res+=(*c-'0');
        c++;
    }

    return res;
} // </editor-fold>

public uint32_t HexParse(const char *c) // <editor-fold defaultstate="collapsed" desc="String parsing">
{
    uint32_t res=0;

    if(c==NULL)
        return 0;

    while(true)
    {
        uint8_t b=*c;

        if((b>='0')&&(b<='9'))
        {
            res<<=4;
            res|=(b-'0');
        }
        else
        {
            b&=0xDF;

            if((b>='A')&&(b<='F'))
            {
                res<<=4;
                res|=((b-'A')+10);
            }
            else
                break;
        }

        c++;
    }

    return res;
} // </editor-fold>

bool is_hex_data(uint8_t b) // <editor-fold defaultstate="collapsed" desc="Check Intel hex valid data">
{
    if(b==':')
        return 1;

    if((b>='0')&&(b<='9'))
        return 1;

    if((b>='a')&&(b<='f'))
        return 1;

    if((b>='A')&&(b<='F'))
        return 1;

    return 0;
} // </editor-fold>

public bool is_printable(uint8_t c) // <editor-fold defaultstate="collapsed" desc="Check printable character">
{
    if((c>=' ')&&(c<='~'))
        return 1;

    return 0;
} // </editor-fold>

public int8_t StrCmp(strcmp_t *pCxt, uint8_t c) // <editor-fold defaultstate="collapsed" desc="Compare 2 strings">
{
    if(c!=pCxt->pStr[pCxt->idx++])
    {
        pCxt->idx=0;
        return (-1); // error
    }

    if(pCxt->pStr[pCxt->idx]==0x00)
    {
        pCxt->idx=0;
        return 1; // matched
    }

    return 0; // to be continued
} // </editor-fold>
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Cryptography Processing">
#ifdef USE_FAST_CRC_CCITT
private const uint16_t ccitt_tab[]={
    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
    0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
    0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
    0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de,
    0x2462, 0x3443, 0x0420, 0x1401, 0x64e6, 0x74c7, 0x44a4, 0x5485,
    0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
    0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4,
    0xb75b, 0xa77a, 0x9719, 0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc,
    0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
    0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b,
    0x5af5, 0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12,
    0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
    0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60, 0x1c41,
    0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49,
    0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
    0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a, 0x9f59, 0x8f78,
    0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f,
    0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
    0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e,
    0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256,
    0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
    0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
    0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c,
    0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
    0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab,
    0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3,
    0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
    0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92,
    0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9,
    0x7c26, 0x6c07, 0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
    0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8,
    0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0
};

uint16_t crc_ccitt(uint16_t crc, const uint8_t *buf_p, size_t size) // <editor-fold defaultstate="collapsed" desc="Fast CRC CCITT">
{
    size_t i;
    const uint8_t *b_p;

    b_p=buf_p;

    for(i=0; i<size; i++)
        crc=(crc<<8) ^ ccitt_tab[(crc>>8) ^ *b_p++];

    return (crc);
} // </editor-fold>
#else

public uint16_t crc_ccitt(uint16_t crc, const uint8_t *buf_p, size_t size) // <editor-fold defaultstate="collapsed" desc="CRC CCITT Calculator">
{
    uint16_t wh1, wh2, wh3, wh4;

    while(size--)
    {
        wh1=(crc^*buf_p)&0xFF;
        wh2=wh1&0x0F;
        wh3=(wh2<<4)^wh1;
        wh4=wh3>>4;
        crc=(((((wh3<<1)^wh4)<<4)^wh2)<<3)^wh4^(crc>>8);
        buf_p++;
    }

    return crc;
} // </editor-fold>
#endif

public uint16_t Crc16_Calc(const uint8_t *pData, uint16_t len) // <editor-fold defaultstate="collapsed" desc="CRC16 Calculator">
{
    uint8_t i;
    uint16_t data;
    uint16_t crc=0xFFFF;

    if(len==0)
        return 0x0000;

    do
    {
        for(i=0, data=0xFF&*pData++; i<8; i++, data>>=1)
        {
            if((crc&1)^(data&1))
                crc=(crc>>1)^0x8408;
            else
                crc>>=1;
        }
    }
    while(--len);

    crc=~crc;
    data=crc;
    crc=(crc<<8)|(data>>8&0xFF);

    return crc;
} // </editor-fold>

public uint16_t Mask(uint8_t *pData, uint16_t len) // <editor-fold defaultstate="collapsed" desc="Mask an array">
{
    uint16_t i;

    for(i=0; i<len; i++)
        pData[len-i]=pData[len-i-1];
    pData[0]=(uint8_t) rand();
    len++;

    for(i=1; i<len; i++)
        pData[i]^=pData[0];
    pData[0]^=0xFF;

    return len;
} // </editor-fold>

public uint16_t UnMask(uint8_t *pData, uint16_t len) // <editor-fold defaultstate="collapsed" desc="Unmask an array">
{
    uint16_t i;

    pData[0]^=0xFF;
    for(i=1; i<len; i++)
        pData[i]^=pData[0];

    for(i=0; i<len; i++)
        pData[i]=pData[i+1]; // remove random byte

    return (len-1);
} // </editor-fold>

public uint8_t CalcSum8(void *pData, uint16_t len) // <editor-fold defaultstate="collapsed" desc="Calculate 8-bit sumary">
{
    uint8_t sum=0;
    uint8_t *pD=(uint8_t *) pData;

    while(len>0)
    {
        sum+=*pD;
        pD++;
        len--;
    }

    return sum;
} // </editor-fold>

// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Data Type Converter">

public uint32_t Swap_nBits(uint32_t Value, uint8_t nBit) // <editor-fold defaultstate="collapsed" desc="Swap n Bits">
{
    uint32_t result=0;

    while(nBit--)
    {
        result<<=1;
        result|=Value&1;
        Value>>=1;
    }

    return result;
} // </editor-fold>

public uint16_t Swap_2Bytes(uint16_t Value) // <editor-fold defaultstate="collapsed" desc="Swap 2 bytes">
{
    uint16_t result=Value&0xFF;

    result<<=8;
    result|=Value>>8;

    return result;
} // </editor-fold>

public void Convert16to2x8(uint16_t Value, uint8_t *pArr) // <editor-fold defaultstate="collapsed" desc="Convert 16bit to 2x8bit">
{
    pArr[0]=(uint8_t) (Value>>8);
    pArr[1]=(uint8_t) (Value);
} // </editor-fold>

public void Convert32to4x8(uint32_t Value, uint8_t *pArr) // <editor-fold defaultstate="collapsed" desc="Convert 32bit to 4x8bit">
{
    pArr[0]=(uint8_t) (Value>>24);
    pArr[1]=(uint8_t) (Value>>16);
    pArr[2]=(uint8_t) (Value>>8);
    pArr[3]=(uint8_t) (Value);
} // </editor-fold>

public uint16_t Convert2x8to16(const uint8_t *pArr) // <editor-fold defaultstate="collapsed" desc="Convert 16bit to 2x8bit">
{
    uint16_t Value=pArr[0];

    Value<<=8;
    Value|=pArr[1];

    return Value;
} // </editor-fold>

public uint32_t Convert4x8to32(const uint8_t *pArr) // <editor-fold defaultstate="collapsed" desc="Convert 32bit to 4x8bit">
{
    uint32_t Value=pArr[0];

    Value<<=8;
    Value|=pArr[1];
    Value<<=8;
    Value|=pArr[2];
    Value<<=8;
    Value|=pArr[3];

    return Value;
} // </editor-fold>

public int32_t ConvertStr2Integer(const uint8_t *pArr) // <editor-fold defaultstate="collapsed" desc="Convert string to integer">
{
    uint8_t i;
    int32_t Value=0;

    if(pArr[0]=='-')
        i=1;
    else
        i=0;

    while(pArr[i]!=0x00)
    {
        if((pArr[i]<'0')||(pArr[i]>'9'))
            break;

        Value*=10;
        Value+=(pArr[i]-'0');

        if(++i>=4)
            break;
    }

    if(pArr[0]=='-')
        Value*=(-1);

    return Value;
} // </editor-fold>

public int8_t chr2int(uint8_t c) // <editor-fold defaultstate="collapsed" desc="Char to integer">
{
    if((c>='0')&&(c<='9'))
        return (c-'0');

    return (-1);
} // </editor-fold>

public uint32_t StrHex2Int(uint8_t *p) // <editor-fold defaultstate="collapsed" desc="Convert string Hex to integer">
{
    uint32_t value=0;
    uint8_t x, i=slen((char *) p);

    if(i<=8&&i!=0)
    {
        for(x=0; x<i; x++)
        {
            if(p[x]>='0'&&p[x]<='9')
                p[x]-='0';
            else if(p[x]>='A'&&p[x]<='F')
                p[x]-='7';
            else if(p[x]>='a'&&p[x]<='f')
                p[x]-='W';
            else
                return value;

            value<<=4;
            value|=p[x];
        }

        return value;
    }

    return 0;
}// </editor-fold>

public int BinSearch(const uint8_t *pSource, int Size) // <editor-fold defaultstate="collapsed" desc="Binary search. Return -1 if failed">
{
    int idx, step, left, right;

    if(pSource[0]==0xFF)
        return 0;

    if(pSource[Size-1]!=0xFF)
        return Size+1;

    step=0;
    left=0;
    right=Size-1;
    idx=right>>1;

    while(1)
    {
        step++;

        if(pSource[idx]==0xFF)
            right=idx;
        else
            left=idx;

        idx=(left+right)>>1;

        if(right==(left+1))
            return right;
    }

    return -1;
} // </editor-fold>

public uint8_t bits_reverse_8(uint8_t value) // <editor-fold defaultstate="collapsed" desc="Bit reserse 8bit">
{
    value=((uint8_t) ((value&0xaa)>>1)|(uint8_t) ((value&0x55)<<1));
    value=((uint8_t) ((value&0xcc)>>2)|(uint8_t) ((value&0x33)<<2));

    return ((uint8_t) ((value&0xf0)>>4)|(uint8_t) ((value&0x0f)<<4));
} // </editor-fold>

public uint32_t bits_reverse_16(uint32_t value) // <editor-fold defaultstate="collapsed" desc="Bit reserse 16bit">
{
    value=(((value&0xaaaa)>>1)|((value&0x5555)<<1));
    value=(((value&0xcccc)>>2)|((value&0x3333)<<2));
    value=(((value&0xf0f0)>>4)|((value&0x0f0f)<<4));
    value=(((value&0xff00)>>8)|((value&0x00ff)<<8));

    return ((value>>8)|(value<<8));
} // </editor-fold>

public uint32_t bits_reverse_32(uint32_t value) // <editor-fold defaultstate="collapsed" desc="Bit reserse 32bit">
{
    value=(((value&0xaaaaaaaa)>>1)|((value&0x55555555)<<1));
    value=(((value&0xcccccccc)>>2)|((value&0x33333333)<<2));
    value=(((value&0xf0f0f0f0)>>4)|((value&0x0f0f0f0f)<<4));
    value=(((value&0xff00ff00)>>8)|((value&0x00ff00ff)<<8));

    return ((value>>16)|(value<<16));
} // </editor-fold>

public uint32_t bits_mask_32(int width) // <editor-fold defaultstate="collapsed" desc="Bit mask 32">
{
    return ((1<<width)-1);
} // </editor-fold>

public uint32_t bits_insert_32(uint32_t dst, int position, int size, uint32_t src) // <editor-fold defaultstate="collapsed" desc="Bit insert 32">
{
    uint32_t mask;

    mask=(((1LU<<size)-1)<<position);
    dst&= ~mask;
    dst|=((src<<position)&mask);

    return (dst);
} // </editor-fold>

public char Bcd2AHex(uint8_t bcd) // <editor-fold defaultstate="collapsed" desc="Convert BCD to ASCII Hex">
{
    bcd&=0x0F;

    if(bcd<10)
        return (char) (bcd+'0');
    else
    {
        bcd-=10;
        return (char) (bcd+'A');
    }
} // </editor-fold>

public int8_t AHex2Bcd(char ahex) // <editor-fold defaultstate="collapsed" desc="Convert ASCII Hex to BCD">
{
    if((ahex>='0')&&(ahex<='9'))
        return (ahex-'0');
    else if((ahex>='A')&&(ahex<='F'))
        return (ahex-'7');
    else if((ahex>='a')&&(ahex<='f'))
        return (ahex-'W');
    else
    {
        ahex-=10;
        return (char) (ahex+'A');
    }
} // </editor-fold>

public int Array2AHex(char *des, const uint8_t *src, int len) // <editor-fold defaultstate="collapsed" desc="Convert Array to ASCII Hex">
{
    int i;

    for(i=0; i<len; i++)
    {
        uint8_t b=*src;

        *des=Bcd2AHex(b>>4);
        des++;
        *des=Bcd2AHex(b);
        src++;
        des++;
    }

    *des=0;

    return (len<<1);
} // </editor-fold>

public int AHex2Array(uint8_t *des, const char *src, int len) // <editor-fold defaultstate="collapsed" desc="Convert ASCII Hex to Array">
{
    int i;

    len>>=1;

    for(i=0; i<len; i++)
    {
        uint8_t c;

        c=AHex2Bcd(*src++);
        c<<=4;
        c|=AHex2Bcd(*src++);
        *des=c;
        des++;
    }

    *des=0;

    return len;
} // </editor-fold>

void u32str(uint32_t b, char *pDes) // <editor-fold defaultstate="collapsed" desc="32-bit unsigned integer to string">
{
    int8_t i, idx;
    uint8_t digit[10];

    for(i=9; i>=0; i--)
    {
        digit[i]=((uint8_t) (b%10))+'0';
        b/=10;
    }

    for(i=0, idx=1; i<10; i++)
    {
        if(digit[i]!='0')
            idx=0;

        if(idx==0)
        {
            *pDes=digit[i];
            pDes++;
        }
    }

    if(idx==1)
        *pDes='0';
} // </editor-fold>

void i32str(int32_t b, char *pDes) // <editor-fold defaultstate="collapsed" desc="32-bit signed integer to string">
{
    if(b<0)
    {
        *pDes='-';
        pDes++;
        b*=(-1);
    }

    u32str((uint32_t) b, pDes);
} // </editor-fold>

// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Date Time">
public const uint8_t DayOfMonth[12]={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}; // extern variable

public bool CheckLeapYear(uint16_t Year) // <editor-fold defaultstate="collapsed" desc="Check leap year">
{
    bool leap=0;

    if((Year%4)==0)
    {
        if((Year%100)==0)
        {
            if((Year%400)==0)
                leap=1;
        }
        else
            leap=1;
    }

    return leap;
} // </editor-fold>

public uint8_t Calc_DayOfWeek(uint32_t Day, uint32_t Month, uint32_t Year) // <editor-fold defaultstate="collapsed" desc="Calculate day of week">
{
    uint32_t DoW;
    const uint8_t t[]={0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};

    Year-=Month<3;
    DoW=(Year+Year/4-Year/100+Year/400+t[Month-1]+Day)%7;

    return (uint8_t) DoW;
} // </editor-fold>

public uint8_t Dec2BCD(uint8_t hexvalue) // <editor-fold defaultstate="collapsed" desc="Convert Hex to BCD">
{
    return (((uint8_t) ((hexvalue/10)<<4))|(hexvalue%10));
} // </editor-fold>

public uint8_t BCD2Dec(uint8_t bcdvalue) // <editor-fold defaultstate="collapsed" desc="Convert BCD to Hex">
{
    return (((uint8_t) (bcdvalue>>4)*10)+(bcdvalue&0x0F));
} // </editor-fold>

// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Filters">

public uint16_t iir(uint32_t *prev, uint16_t current, uint8_t hardness) // <editor-fold defaultstate="collapsed" desc="IIR Filter">
{
    uint32_t ir;
    uint32_t tmp;

    tmp=current<<4; //current*16;

    if(tmp > *prev)
    {
        ir=(tmp- *prev) >> (hardness-1);
        *prev+=(ir>>1); //ir/2;
    }
    else
    {
        ir=(*prev-tmp) >> (hardness-1);
        *prev-=(ir>>1); //ir/2;
    }

    return (uint16_t) (*prev>>4); //(*prev/16);
} // </editor-fold>
// </editor-fold>