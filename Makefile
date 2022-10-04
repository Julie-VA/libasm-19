# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rvan-aud <rvan-aud@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/04 17:47:22 by rvan-aud          #+#    #+#              #
#    Updated: 2022/10/04 17:58:38 by rvan-aud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libasm

NAME_LIB	= libasm.a

SRCS_DIR	= srcs

SRCS		= $(SRCS_DIR)/ft_read.s	\
				$(SRCS_DIR)/ft_strcmp.s	\
				$(SRCS_DIR)/ft_strcpy.s	\
				$(SRCS_DIR)/ft_strdup.s	\
				$(SRCS_DIR)/ft_strlen.s	\
				$(SRCS_DIR)/ft_write.s	\

CC			= gcc

CFLAGS		= -Wall -Wextra -Werror

NASM		= nasm

NASMFLAGS	= -f macho64

OBJS		= $(SRCS:.s=.o)

RM			= rm -f

%.o : %.s
			$(NASM) $(NASMFLAGS) $< -o $@

all:		$(NAME)

$(NAME):	$(OBJS)
			ar rcs $(NAME_LIB) $(OBJS)

compile:
			$(CC) $(CFLAGS) main.c $(NAME_LIB) -o $(NAME)

clean:
			$(RM) $(OBJS)

fclean:		clean
			$(RM) $(NAME_LIB)
			$(RM) $(NAME)

re:			fclean all

.PHONY:		all compile clean fclean re