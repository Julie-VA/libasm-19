/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rvan-aud <rvan-aud@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/06 18:03:14 by rvan-aud          #+#    #+#             */
/*   Updated: 2022/10/11 14:31:38 by rvan-aud         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void	print_list(t_list *lst)
{
	printf("\nCurrent list:\n");
	for (t_list *tmp = lst; tmp != NULL; tmp = tmp->next)
		printf("%s\n", tmp->data);
}

void	ft_lstclear(t_list **list)
{
	t_list	*tmp;

	while (*list)
	{
		tmp = (*list)->next;
		if ((*list)->data)
			free((*list)->data);
		free(*list);
		*list = tmp;
	}
}

int	main()
{
	t_list	lst;

	lst.data = strdup("A");
	lst.next = NULL;
	printf("*** ft_list_size ***\n");
	printf("Size of lst = %d\n", ft_list_size(&lst));
	printf("Size of NULL = %d\n", ft_list_size(NULL));
	print_list(&lst);

	printf("\n*** ft_list_push_front ***\n");
	t_list	*push_test = malloc(sizeof(t_list));
	push_test->data = strdup("A");
	push_test->next = NULL;
	printf("Pushed B\n");
	ft_list_push_front(&push_test, strdup("B"));
	print_list(push_test);
	printf("Size of lst = %d\n", ft_list_size(push_test));
	printf("\n*Trying to push NULL*\n");
	ft_list_push_front(&push_test, NULL);
	print_list(push_test);
	printf("Size of lst = %d\n", ft_list_size(push_test));
	printf("\n*Trying to push in a NULL ptr*\n");
	ft_list_push_front(NULL, NULL);
	print_list(push_test);
	printf("Size of lst = %d\n", ft_list_size(push_test));

	ft_lstclear(&push_test);

	printf("\n*** ft_list_sort ***\n");
	t_list	*sort_test = malloc(sizeof(t_list));
	sort_test->data = strdup("1");
	sort_test->next = NULL;
	ft_list_push_front(&sort_test, strdup("3"));
	ft_list_push_front(&sort_test, strdup("4"));
	ft_list_push_front(&sort_test, strdup("2"));
	ft_list_push_front(&sort_test, strdup("5"));
	print_list(sort_test);
	ft_list_sort(&sort_test, &strcmp);
	print_list(sort_test);

	printf("\n*** ft_list_remove_if ***\n");
	printf("\nRemoved 1 and 2:");
	ft_list_remove_if(&sort_test, strdup("1"), &strcmp, &free);
	ft_list_remove_if(&sort_test, strdup("2"), &strcmp, &free);
	print_list(sort_test);
	printf("\nPushed 4:");
	ft_list_push_front(&sort_test, strdup("4"));
	print_list(sort_test);
	printf("\nRemoved 4:");
	ft_list_remove_if(&sort_test, strdup("4"), &strcmp, &free);
	print_list(sort_test);

	ft_lstclear(&sort_test);

	printf("\n*** ft_atoi_base ***\n");
	printf("Base 10, 42 : %d\n", ft_atoi_base("42", "0123456789"));
	printf("Base 2, -11 : %d\n", ft_atoi_base("-11", "01"));
	printf("Base 16, ---+FFFFFF : %d\n", ft_atoi_base("    ---+FFFFFF", "0123456789ABCDEF"));
	printf("Base 3, 65 (invalid base-number combo) : %d\n", ft_atoi_base("65", "012"));
	printf("Base invalid (invalid character) : %d\n", ft_atoi_base("65", "   01"));
	printf("Base invalid (duplicate) : %d\n", ft_atoi_base("11", "0112"));
	printf("Number invalid : %d\n", ft_atoi_base("++  11", "01"));
	
	return 0;
}
