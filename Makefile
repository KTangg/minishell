# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tratanat <tawan.rtn@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/12 14:53:45 by spoolpra          #+#    #+#              #
#    Updated: 2022/04/23 16:02:07 by tratanat         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Wall -Werror -Wextra
RM = rm -rf

SRC_DIR = srcs/
OBJ_DIR = objs/
LIB_DIR = libft/
RDL_DIR = /usr/local/opt/readline/

INCS = -Iincludes/ -I$(LIB_DIR) -I$(RDL_DIR)include/
NAME = minishell
SRCS = ms_main.c ms_main_input.c ms_main_line.c\
		ms_parse.c ms_parse_utils.c ms_parse_utils2.c ms_vars.c ms_parse_vars.c \
		ms_vars_set.c ms_parse_check.c ms_parse_utils3.c ms_parse_debug.c ms_parse_err.c \
		ms_parse_vars_utils.c ms_vars_cleanup.c ms_parse_file.c ms_parse_quotes.c \
		ms_built_cmd.c ms_built_err.c ms_built_utils.c ms_built_unset.c ms_built_ls.c \
		ms_wildcards.c ms_wildcards2.c ms_wildcards3.c ms_parse_file_utils.c \
		ms_exec_execve.c ms_exec_helper.c ms_exec_check.c\
		ms_redir_exec.c ms_redir_inout.c ms_redir_pipe.c \
		ms_section.c
OBJS = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(addprefix $(OBJ_DIR),$(OBJS))
	$(MAKE) -C $(LIB_DIR)
	$(CC) $(INCS) $^ -o $(NAME) -L$(RDL_DIR)lib/ -lreadline -L$(LIB_DIR) -lft
$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< $(INCS) -o $@
clean:
	$(RM) $(OBJ_DIR)
fclean: clean
	$(RM) $(NAME)
re: fclean all
