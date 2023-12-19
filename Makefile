LIB = src/ccosh.c src/common.c
LIB_OBJ = $(addprefix build/, $(notdir $(patsubst %.c, %.o, $(LIB))))
EXE_SRC = src/play.c src/main.c 
CC = icc -fp-model precise -no-ftz -g

EXE = $(addprefix build/_, $(notdir $(basename $(EXE_SRC))))

all: $(EXE) $(LIB_OBJ)

build/_%: src/%.c $(LIB_OBJ)
	@mkdir -p $(dir $@)
	$(CC) $^ -o $@

build/%.o: src/%.c
	@mkdir -p $(dir $@)
	$(CC) $< -c -o $@

clean:
	rm -rf build _*