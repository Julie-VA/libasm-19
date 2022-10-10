/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rvan-aud <rvan-aud@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/28 17:22:00 by rvan-aud          #+#    #+#             */
/*   Updated: 2022/10/10 16:38:00 by rvan-aud         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once

#include <unistd.h>

/* Mandatory */

size_t	ft_strlen(const char *);
char	*ft_strcpy(char *, const char *);
int		ft_strcmp(const char *, const char *);
ssize_t	ft_write(int, const void *, size_t);
ssize_t	ft_read(int, void *, size_t);
char	*ft_strdup(const char *);

/* Bonus */

typedef struct s_list
{
	void *data;
	struct s_list *next;
}	t_list;

void	ft_list_push_front(t_list **, void *);
int		ft_list_size(t_list *);
void	ft_list_sort(t_list **, int (*)());
void	ft_list_remove_if(t_list **, void *, int (*)(), void (*)(void *));