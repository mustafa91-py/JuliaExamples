



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



