# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rvan-aud <rvan-aud@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/04 17:47:22 by rvan-aud          #+#    #+#              #
#    Updated: 2022/10/10 16:49:35 by rvan-aud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libasm

NAME_BONUS	= libasm_bonus

NAME_LIB	= libasm.a

SRCS_DIR	= srcs

SRCS		= $(SRCS_DIR)/ft_read.s	\
				$(SRCS_DIR)/ft_strcmp.s	\
				$(SRCS_DIR)/ft_strcpy.s	\
				$(SRCS_DIR)/ft_strdup.s	\
				$(SRCS_DIR)/ft_strlen.s	\
				$(SRCS_DIR)/ft_write.s	\

SRCS_BONUS	= $(SRCS_DIR)/ft_atoi_base.s			\
				$(SRCS_DIR)/ft_list_push_front.s	\
				$(SRCS_DIR)/ft_list_remove_if.s		\
				$(SRCS_DIR)/ft_list_size.s 			\
				$(SRCS_DIR)/ft_list_sort.s 			\

CC			= gcc

CFLAGS		= -Wall -Wextra -Werror -D STD=${STD}

NASM		= nasm

NASMFLAGS	= -f macho64

OBJS		= $(SRCS:.s=.o)

OBJS_BONUS	= $(SRCS_BONUS:.s=.o)

RM			= rm -f

%.o : %.s
			$(NASM) $(NASMFLAGS) $< -o $@

all:		$(NAME)

$(NAME):	$(OBJS)
			ar rcs $(NAME_LIB) $(OBJS)
			$(CC) $(CFLAGS) main.c $(NAME_LIB) -o $(NAME)

bonus:		$(OBJS) $(OBJS_BONUS)
			ar rcs $(NAME_LIB) $(OBJS) $(OBJS_BONUS)
			$(CC) $(CFLAGS) main_bonus.c $(NAME_LIB) -o $(NAME_BONUS)

clean:
			$(RM) $(OBJS) $(OBJS_BONUS)

fclean:		clean
			$(RM) $(NAME_LIB)
			$(RM) $(NAME) $(NAME_BONUS)

re:			fclean all

.PHONY:		all compile clean fclean re