echo "Format cpp files"
find ./ -iname *.cpp | xargs clang-format -i
echo "Format hpp files"
find ./ -iname *.hpp | xargs clang-format -i
echo "Format c files"
find ./ -iname *.c | xargs clang-format -i
echo "Format h files"
find ./ -iname *.h | xargs clang-format -i

