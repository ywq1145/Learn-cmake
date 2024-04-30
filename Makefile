src_path := $(shell find src -name *.c)
obj_path := $(patsubst src/%.c,obj/%.o,$(src_path))


obj/%.o : src/%.c
	@mkdir -p $(dir $@)
	@gcc -c $< -o $@

objects : $(obj_path)

workspace/exec : $(obj_path)
	@mkdir -p $(dir $@)
	@gcc $^ -o $@

run : workspace/exec
	./$<

debug:
	@echo $(src_path)


.PHONY : debug objects
