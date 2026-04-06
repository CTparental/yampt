sudo apt-get install libboost-filesystem-dev

cd yampt

mkdir build

ls -1 *.cpp  | while read file
do
echo "<build $file>"
name=$(echo $file | sed -e "s/\.cpp$//g")
g++ -c $file -o build/$name.o

echo "</build $file>"
done

cd build
line=$(ls -1 *.o | sed -e "s/$/ /g")
g++  $line -o yampt -lboost_filesystem -lboost_system
