/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rvan-aud <rvan-aud@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/06 18:03:14 by rvan-aud          #+#    #+#             */
/*   Updated: 2022/10/06 19:05:08 by rvan-aud         ###   ########.fr       */
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
	t_list	lst;

	lst.data = strdup("A");
	lst.next = NULL;
	printf("*** ft_list_size ***\n");
	printf("Size of lst = %d\n", ft_list_size(&lst));
	printf("Size of NULL = %d\n", ft_list_size(NULL));
	print_list(&lst);

	printf("\n*** ft_list_push_front ***\n");
	t_list	*push = &lst;
	ft_list_push_front(&push, strdup("B"));
	print_list(push);
	printf("Size of lst = %d\n", ft_list_size(push));
	printf("\n*Trying to push NULL*\n");
	ft_list_push_front(&push, NULL);
	print_list(push);
	printf("Size of lst = %d\n", ft_list_size(push));
	printf("\n*Trying to push in a NULL ptr*\n");
	ft_list_push_front(NULL, NULL);
	print_list(push);
	printf("Size of lst = %d\n", ft_list_size(push));

	int a = ft_list_sort(&push, &strcmp);
	printf("%d", a);
	return 0;
}
