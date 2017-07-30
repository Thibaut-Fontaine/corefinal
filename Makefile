# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgagnot <jgagnot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/13 09:59:01 by jgagnot           #+#    #+#              #
#    Updated: 2017/07/30 03:14:07 by tfontain         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = corewar

CFLAGS = -Wall -Wextra -Werror

CC = clang

INCLUDES_PATH = includes/

SRCS_PATH = srcs/

SRCS_NAME = main.c\
			champ_header.c\
			check_operation.c\
			error_champ.c\
			error_file.c\
			error.c\
			extract_dir.c\
			extract_ind.c\
			extract_reg.c\
			flag.c\
			free_gui.c\
			get_args.c\
			get_ref_tab.c\
			gui.c\
			gui_refreshers.c\
			gui_wlist.c\
			instructions_helpers.c\
			instructions_jgagnot.c\
			instructions_mperronc.c\
			instructions_tfontain.c\
			instruction_and_or_xor.c\
			open_file.c\
			parse.c\
			parser2.c\
			print.c\
			process.c\
			run_fight.c\
			last_living_player.c\
			mathfuncs.c\
			fork.c\
			gui_misc.c


SRCS = $(addprefix $(SRCS_PATH), $(SRCS_NAME))

OBJS_PATH = objs/

OBJS_NAME = $(SRCS_NAME:.c=.o)

OBJS = $(addprefix $(OBJS_PATH), $(OBJS_NAME))

LIBRARY = -lm -L ../libft/ -lft -lncurses

all: odir $(NAME)

$(NAME): $(OBJS)
	@Make -C ../libft
	@echo " - Making $(NAME)"
	@$(CC) $(CFLAGS) -o $(NAME) $^ $(LIBRARY)

$(OBJS_PATH)%.o: $(SRCS_PATH)%.c
	@echo " - Compiling $<"
	@$(CC) $(CFLAGS) -o $@ -c $< -I$(INCLUDES_PATH)

odir:
	@mkdir -p $(OBJS_PATH)

clean:
	@Make clean -C ../libft
	@echo " - Cleaning objs"
	@rm -f $(OBJS)

fclean: clean
	@Make fclean -C ../libft
	@echo " - Cleaning executable"
	@rm -f $(NAME)

re: fclean all

.PHONY: clean fclean re odir
