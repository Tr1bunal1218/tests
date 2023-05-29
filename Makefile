all: obj/main.o obj/functions.o
	mkdir -p bin
	g++ obj/main.o obj/functions.o -o bin/game -lsfml-graphics -lsfml-window -lsfml-system

obj/main.o: src/app/main.cpp
	mkdir -p obj
	g++ -std=c++11 -c src/app/main.cpp -o obj/main.o

obj/functions.o: src/app_lib/functions.cpp
	mkdir -p obj
	g++ -std=c++11 -c src/app_lib/functions.cpp -o obj/functions.o

tests: obj/tests.o obj/functions.o
	mkdir -p bin
	g++ obj/tests.o obj/functions.o -o bin/tests -lsfml-graphics -lsfml-window -lsfml-system

obj/tests.o: tests/tests.cpp
	mkdir -p obj
	g++ -std=c++11 -c tests/tests.cpp -o obj/tests.o

run_tests: bin/tests
	./bin/tests

run: bin/game
	./bin/game

clean:
	rm -rf obj bin
