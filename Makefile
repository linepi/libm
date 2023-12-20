LIB = src/function/ccosh.c src/function/__libm_cosh_k64.c \
	src/function/__libm_sinh_k64.c src/common.c \
	src/function/ccoshf.c

LIB_OBJ = $(addprefix build/, $(patsubst src/%.c, %.o, $(LIB))) build/function/__libm_mul_k64.o 
EXE_SRC = src/play.c src/ccosh_t.c src/ccoshf_t.c
CC = icc -fp-model precise -no-ftz -g -Isrc/inc

EXE = $(addprefix build/_, $(notdir $(basename $(EXE_SRC))))

all: $(EXE) $(LIB_OBJ)

build/function/__libm_mul_k64.o: src/function/__libm_mul_k64.c
	@mkdir -p $(dir $@)
	$(CC) $^ -O0 -c -o $@

build/_%: src/%.c $(LIB_OBJ)
	@mkdir -p $(dir $@)
	$(CC) $^ -o $@

build/%.o: src/%.c
	@mkdir -p $(dir $@)
	$(CC) $< -c -o $@

clean:
	rm -rf build _*