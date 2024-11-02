mkdir -p ../users/

read -p "Введите ник: " nickname

mkdir -p ../users/$nickname/photos
echo "Папка photos сделана"
mkdir -p ../users/$nickname/photos/202{0..4}
echo "Папки с 2020 по 2024 созданы"
touch ../users/$nickname/photos/202{0..4}/default.png
echo "default png cозданы"

mkdir -p ../users/$nickname/videos
echo "Папка videos сделана"
mkdir -p ../users/$nickname/videos/202{0..4}
echo "Папки с 2020 по 2024 созданы"
touch ../users/$nickname/videos/202{0..4}/default.mp4
echo "default mp4 cозданы"

