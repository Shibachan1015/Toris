module Main (main) where

-- import Lib

-- n ミリメートルの丈の長さの生地を長さｘで裁断します。
-- 長さｘミリメートルで採れた生地の数量を出す関数を定義します。あまりの長さもミリメートルで出したいです。
-- そして、長さxミリメートルの生地の横幅ｙを先程と同じように、長さzミリメートルで裁断し、採れる数量とあまり生地をミリメートルで出します。
-- Cut a length x of fabric of length n millimeters.
-- Define a function that produces the quantity of fabric taken at length x millimeters. We also want to get the not much length in millimeters.
-- Then, cut the width y of the fabric of length x millimeters in the same way as before, with length z millimeters, and get the quantity of the fabric taken and the quantity of the fabric left over in millimeters.

-- 生地を裁断する関数
cutFabric :: Int -> Int -> (Int, Int)
cutFabric n x = (n `div` x, n `mod` x)

-- 横幅を裁断する関数
cutWidth :: Int -> Int -> Int -> (Int, Int)
cutWidth y z x = cutFabric (y * x) z

main :: IO ()
main = do
    putStrLn "生地の長さ n (mm) を入力してください:"
    n <- readLn

    putStrLn "裁断する長さ(鼻緒の丈) x (mm) を入力してください:"
    x <- readLn

    putStrLn "生地の横幅 y (mm) を入力してください:"
    y <- readLn

    putStrLn "横幅を裁断する長さ(鼻緒の分) z (mm) を入力してください:"
    z <- readLn

    -- 長さ n の生地を長さ x で裁断
    let (quantityX, remainderX) = cutFabric n x
    putStrLn $ "長さ " ++ show x ++ " mm のケタの数量: " ++ show quantityX ++ ", 余り生地の長さ: " ++ show remainderX ++ " mm"

    -- 横幅 y の長さ x の生地を長さ z で裁断
    let (quantityZ, remainderZ) = cutWidth y z quantityX
    putStrLn $ "横幅 " ++ show y ++ " mm の長さを " ++ show x ++ " mm の生地を長さ,並びに " ++ show z ++ " mm で裁断した場合の数量: " ++ show quantityZ ++ "本" ++ ", 余り: " ++ show remainderZ ++ " mm"

