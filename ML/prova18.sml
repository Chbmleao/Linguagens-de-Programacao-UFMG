fun toDig str = 
    let
        val charList = explode str
        val intList = map (fn(x) => ord x) charList
        fun intToStr 48 = "zero"
         |  intToStr 49 = "um"
         |  intToStr 50 = "dois"
         |  intToStr 51 = "tres"
         |  intToStr 52 = "quatro"
         |  intToStr 53 = "cinco"
         |  intToStr 54 = "seis"
         |  intToStr 55 = "sete"
         |  intToStr 56 = "oito"
         |  intToStr 57 = "nove"
         |  intToStr _ = "???"
    in
        map (fn(x) => intToStr x) intList
    end;
        
toDig "123";
toDig "";
toDig "001001";
toDig "A23";