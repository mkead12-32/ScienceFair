# Makefile to compile main.c into assembly files with different optimization levels

CC = gcc
SRC = main.c

.PHONY: all
all: main.s mainO1.s mainO2.s mainO3.s mainOfast.s log.txt logO1.txt logO2.txt logO3.txt logOfast.txt
	cat log*.txt

main.s: $(SRC)
	@echo "Compiling with optimization level -O0"
	$(CC) -S $(SRC) -o main.s
	$(CC) $(SRC) -o main


# Targets for each optimization level
mainO1.s: $(SRC)
	@echo "Compiling with optimization level -O1"
	$(CC) -O1 -S $(SRC) -o mainO1.s
	$(CC) -O1 $(SRC) -o mainO1

mainO2.s: $(SRC)
	@echo "Compiling with optimization level -O2"
	$(CC) -O2 -S $(SRC) -o mainO2.s
	$(CC) -O2 $(SRC) -o mainO2

mainO3.s: $(SRC)
	@echo "Compiling with optimization level -O3"
	$(CC) -O3 -S $(SRC) -o mainO3.s
	$(CC) -O3 $(SRC) -o mainO3

mainOfast.s: $(SRC)
	@echo "Compiling with optimization level -Ofast"
	$(CC) -Ofast -S $(SRC) -o mainOfast.s
	$(CC) -Ofast $(SRC) -o mainOfast
# Log targets
log.txt: main.s
	echo "Optimization level: -O0" > log.txt; \
	total=$$(grep -E '^\s*[a-zA-Z]' main.s | wc -l); \
	risc_count=$$(grep -E '^\s*(mov|add|sub|and|or|xor|cmp|jmp|je|jne|jl|jg|call|ret|push|pop)' main.s | wc -l); \
	cisc_count=$$((total - risc_count)); \
	echo "RISC instructions: $$risc_count" >> log.txt; \
	echo "CISC instructions: $$cisc_count" >> log.txt; \
	echo "Executable size: $$(stat -c%s main) bytes" >> log.txt

# Log targets
logO1.txt: mainO1.s
	echo "Optimization level: -O1" > logO1.txt; \
	total=$$(grep -E '^\s*[a-zA-Z]' mainO1.s | wc -l); \
	risc_count=$$(grep -E '^\s*(mov|add|sub|and|or|xor|cmp|jmp|je|jne|jl|jg|call|ret|push|pop)' mainO1.s | wc -l); \
	cisc_count=$$((total - risc_count)); \
	echo "RISC instructions: $$risc_count" >> logO1.txt; \
	echo "CISC instructions: $$cisc_count" >> logO1.txt; \
	echo "Executable size: $$(stat -c%s mainO1) bytes" >> logO1.txt

logO2.txt: mainO2.s
	echo "Optimization level: -O2" > logO2.txt; \
	total=$$(grep -E '^\s*[a-zA-Z]' mainO2.s | wc -l); \
	risc_count=$$(grep -E '^\s*(mov|add|sub|and|or|xor|cmp|jmp|je|jne|jl|jg|call|ret|push|pop)' mainO2.s | wc -l); \
	cisc_count=$$((total - risc_count)); \
	echo "RISC instructions: $$risc_count" >> logO2.txt; \
	echo "CISC instructions: $$cisc_count" >> logO2.txt; \
	echo "Executable size: $$(stat -c%s mainO2) bytes" >> logO2.txt

logO3.txt: mainO3.s
	echo "Optimization level: -O3" > logO3.txt; \
	total=$$(grep -E '^\s*[a-zA-Z]' mainO3.s | wc -l); \
	risc_count=$$(grep -E '^\s*(mov|add|sub|and|or|xor|cmp|jmp|je|jne|jl|jg|call|ret|push|pop)' mainO3.s | wc -l); \
	cisc_count=$$((total - risc_count)); \
	echo "RISC instructions: $$risc_count" >> logO3.txt; \
	echo "CISC instructions: $$cisc_count" >> logO3.txt; \
	echo "Executable size: $$(stat -c%s mainO3) bytes" >> logO3.txt

logOfast.txt: mainOfast.s
	echo "Optimization level: -Ofast" > logOfast.txt; \
	total=$$(grep -E '^\s*[a-zA-Z]' mainOfast.s | wc -l); \
	risc_count=$$(grep -E '^\s*(mov|add|sub|and|or|xor|cmp|jmp|je|jne|jl|jg|call|ret|push|pop)' mainOfast.s | wc -l); \
	cisc_count=$$((total - risc_count)); \
	echo "RISC instructions: $$risc_count" >> logOfast.txt; \
	echo "CISC instructions: $$cisc_count" >> logOfast.txt; \
	echo "Executable size: $$(stat -c%s mainOfast) bytes" >> logOfast.txt

# Target to build all
all: main.s mainO1.s mainO2.s mainO3.s log.txt logO1.txt logO2.txt logO3.txt

# Clean target
clean:
	rm -f main.s mainO1.s mainO2.s mainO3.s mainOfast.s main mainO1 mainO2 mainO3 mainOfast log.txt logO1.txt logO2.txt logO3.txt logOfast.txt

.PHONY: all clean