/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rvan-aud <rvan-aud@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/28 16:50:22 by rvan-aud          #+#    #+#             */
/*   Updated: 2022/10/04 18:23:50 by rvan-aud         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int main() {
	/* ft_strlen */
	//printf("%zu\n", ft_strlen("Test"));
	//printf("%zu\n", ft_strlen(""));

	/* ft_strcpy */
	//char	*dest;
	//printf("|%s|\n|%s|\n", ft_strcpy(dest, "Test"), dest);
	//printf("|%s|\n|%s|\n", ft_strcpy(dest, ""), dest);

	/* ft_strcmp */
	//printf("Should be 0 -> %d\n", ft_strcmp("Test", "Test"));
	//printf("Should be 1 -> %d\n", ft_strcmp("Test", "Tes"));
	//printf("Should be -1 -> %d\n", ft_strcmp("", "Test"));
	//printf("Should be 0 -> %d\n", ft_strcmp("", ""));

	/* ft_write */
	printf("%zd\n", ft_write(1, "Test\n", 5));
	printf("errno = %d", errno);
	printf("%zd\n", ft_write(1, "Test\n", 3));
	printf("errno = %d", errno);

	/* ft_read */
	//char	*buf;
	//printf("%zd\n", ft_read(0, buf, 10));

	/* ft_strdup */
	//char	*ret;
	//ret = ft_strdup("Test\n");
	//printf("%s", ret);
	//free(ret);
	//ret = ft_strdup("");
	//printf("%s", ret);
	//free(ret);
	return 0;
}
