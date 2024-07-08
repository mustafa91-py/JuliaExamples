
"""
``` pyton 
# referans kod (2020)

# https://github.com/mustafa91-py/DNA-gene-sequence-/blob/master/seq.py#L383

def restriction(seq="MustafaUyar", splite="5", specifity=False):
        ""
        to splite the sequence
        :param seq: array to be plotted
        :param splite: form of parceling
        :param specifity: attribute
        :return:list
        ""
        splite = int(splite)
        non_id_rstx_list = []
        id_rstx_list = []
        upper = 0
        _Treu_seq = ""
        for base in seq:
            if base != "\n":
                _Treu_seq += base
        while upper < splite:
            restriction = [_Treu_seq[i:i + splite] for i in range(upper, len(seq), splite)]
            position = 0
            for base in restriction:
                if not specifity:
                    if len(base) == splite:
                        non_id_rstx_list.append(base)
                if specifity:
                    if len(base) == splite:
                        id_rstx_list.append((str(upper + (splite * position)) +
                                             " <"
                                             + base +
                                             "<= "
                                             + str(((splite * (position + 1)) - (splite - len(base))) + upper)))
                position += 1
            upper += 1
        if specifity:
            return id_rstx_list
        if not specifity:
            return non_id_rstx_list

```
"""

struct Fragment
    first::Int64
    base::String
    last::Int64
end

function parse_dna2(dna::String, fragmentation::Int64)
    f = fragmentation # kac parca olacagini belirliyoruz
    len = length(dna) # kac karakter oldugu belirliyoruz
    
    est_len = div(len, f) * f # tahmini toplam parca sayisi
    # 5 karakterden olusan dizisi 3 er li dizi haline ayirmak icin normalde ilk 3 karakteri verir ve sonlanir
    # 1 karakter den sayma yaptiktan sonra toplam fragment kadar saga dogru kayma yapmasi gerekir ki tam anlami ayirma olusan
    

    

    out = Vector{Fragment}(undef, est_len) #onceden tahmin etmek icin Fragmentlerden olusan Vector uzunlugu tahmin edilir

    index = 1 # fragmentlerin sira numarasi
    
    for i in 1:f #  1 den fragment sayisi kadar
    
        for s in i:f:len-f+1  # fragmentlerin baslangic noktalarini belirliyor
            

            out[index] = Fragment(s, dna[s:s+f-1], s+f-1) # fragmentleri olusturuyor
    
            index += 1 # sira numarasiyi artiriyor
      
        end 
    end
    
    return out[1:index-1]
end



