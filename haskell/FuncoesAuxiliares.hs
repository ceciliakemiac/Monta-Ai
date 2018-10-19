module FuncoesAuxiliares where

slice :: Int -> Int -> [a] -> [a]
slice start stop xs = fst $ splitAt (stop - start) (snd $ splitAt start xs)

formataString :: String  -> String
formataString nome  
            | length nome > esp = slice 0 esp nome
            | otherwise = nome ++ replicate (esp - length nome) ' '
            where  esp = 15

dec2bin :: Int -> [Int]
dec2bin 0 = [0]
dec2bin 1 = [1]
dec2bin n = dec2bin(n `div` 2) ++ [(n `mod` 2)]

decimalTobinario :: Int -> Int -> [Int]
decimalTobinario num bits = replicate (bits - length numBin ) 0 ++ numBin
    where numBin = dec2bin num
