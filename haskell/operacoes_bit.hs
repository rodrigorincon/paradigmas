import Data.Bits
import Data.Char (ord)
--5 `mod` 8 == 5%8

xorChar x y = (ord x) `xor` (ord y)

multGF2 x
			|(ord x) * 2  > 255 = ( (ord x) * 2) `xor` 283
			|otherwise = (ord x) * 2

multGF3 x = (multGF2 x) `xor` ord x