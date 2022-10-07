/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rvan-aud <rvan-aud@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/06 18:03:14 by rvan-aud          #+#    #+#             */
/*   Updated: 2022/10/07 17:20:31 by rvan-aud         ###   ########.fr       */
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

int	main()
{
	//t_list	lst;

	//lst.data = strdup("A");
	//lst.next = NULL;
	//printf("*** ft_list_size ***\n");
	//printf("Size of lst = %d\n", ft_list_size(&lst));
	//printf("Size of NULL = %d\n", ft_list_size(NULL));
	//print_list(&lst);

	//printf("\n*** ft_list_push_front ***\n");
	//t_list	*push_test = &lst;
	//ft_list_push_front(&push_test, strdup("B"));
	//print_list(push_test);
	//printf("Size of lst = %d\n", ft_list_size(push_test));
	//printf("\n*Trying to push NULL*\n");
	//ft_list_push_front(&push_test, NULL);
	//print_list(push_test);
	//printf("Size of lst = %d\n", ft_list_size(push_test));
	//printf("\n*Trying to push in a NULL ptr*\n");
	//ft_list_push_front(NULL, NULL);
	//print_list(push_test);
	//printf("Size of lst = %d\n", ft_list_size(push_test));

	printf("\n*** ft_list_sort ***\n");
	t_list	*sort_test = malloc(sizeof(t_list));
	sort_test->data = strdup("1");
	sort_test->next = NULL;
	ft_list_push_front(&sort_test, strdup("3"));
	ft_list_push_front(&sort_test, strdup("4"));
	ft_list_push_front(&sort_test, strdup("2"));
	ft_list_push_front(&sort_test, strdup("4"));
	ft_list_push_front(&sort_test, strdup("5"));
	print_list(sort_test);
	ft_list_sort(&sort_test, &strcmp);
	print_list(sort_test);

	printf("\n*** ft_list_remove_if ***\n");
	int a = ft_list_remove_if(&sort_test, strdup("5"), &strcmp);
	printf("%d\n", a);
	return 0;
}
