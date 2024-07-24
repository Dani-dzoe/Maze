# compiler to use
CC=gcc

# Flags to create object files with
CFLAGS=-g -Wall -Werror -Wextra -pedantic
# Flags to link the SDL2 library
SDL_FLAGS=-I/usr/local/include/SDL2 -L/usr/lib/x86_64-linux-gnu -lSDL2 -lm

# All C program files
SOURCE=./source/maze.c ./source/main.c ./source/dist_checks.c ./source/draw.c ./source/event_handlers.c ./source/additional_moves.c ./source/init_instance.c ./source/main_playground.c ./source/move.c ./source/player_wins.c
# The names of all object files
OBJ=$(SOURCE:.c=.o)
# Executable name
NAME=maze

# Removal command
RM=rm

# Compile all files into the executable
# CFLAGS will only be used when creating object files
# SDL_FLAGS includes necessary libraries to link
all: $(OBJ)
	$(CC) $(OBJ) -o $(NAME) $(SDL_FLAGS)

# Remove all temp files
clean:
	$(RM) -f *~

# Remove all object files
oclean:
	$(RM) -f $(OBJ)

# Remove temp files, object files, and executable
fclean: clean oclean
	$(RM) -f $(NAME)

# Run full clean and recompile all files
re: fclean all
