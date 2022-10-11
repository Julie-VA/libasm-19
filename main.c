/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rvan-aud <rvan-aud@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/28 16:50:22 by rvan-aud          #+#    #+#             */
/*   Updated: 2022/10/11 14:12:21 by rvan-aud         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#if STD

int main() {
	printf("*** ft_strlen ***\n");
	printf("Should be 4 -> %zu\n", strlen("Test"));
	printf("Should be 0 -> %zu\n", strlen(""));
	//printf("Should be 0 -> %zu\n", strlen(NULL));

	printf("\n*** ft_strcpy ***\n");
	char	dest[10];
	printf("|%s|\n|%s|\n", strcpy(dest, "Test"), dest);
	printf("|%s|\n|%s|\n", strcpy(dest, ""), dest);
	//printf("|%s|\n|%s|\n", strcpy(dest, NULL), dest);

	printf("\n*** ft_strcmp ***\n");
	printf("Should be 0 -> %d\n", strcmp("Test", "Test"));
	printf("Should be 1 -> %d\n", strcmp("Test", "TesT"));
	printf("Should be 1 -> %d\n", strcmp("Hello", "\n\n\f\r\t"));
	printf("Should be 1 -> %d\n", strcmp("Test", "Tes"));
	printf("Should be -1 -> %d\n", strcmp("", "Test"));
	printf("Should be 0 -> %d\n", strcmp("", ""));
	//printf("Should be 0 -> %d\n", strcmp("Test", NULL));

	printf("\n*** ft_write ***\n");
	printf("ret = %zd\n", write(1, "Test\n", 3));
	printf("errno = %d\n", errno);
	printf("ret = %zd\n", write(-1, "Test\n", 5));
	printf("errno = %d\n", errno);
	printf("ret = %zd\n", write(1, NULL, 5));
	printf("errno = %d\n", errno);

	printf("\n*** ft_read ***\n");
	char	buf[100];
	printf("ret = %zd\n", read(0, buf, 10));
	printf("errno = %d\n", errno);
	printf("ret = %zd\n", read(-1, buf, 10));
	printf("errno = %d\n", errno);
	printf("ret = %zd\n", read(0, NULL, 5));
	printf("errno = %d\n", errno);

	printf("\n*** ft_strdup ***\n");
	char	*ret;
	ret = strdup("Test\n");
	if (ret)
	{
		printf("%s", ret);
		free(ret);
	}
	ret = strdup("");
	if (ret)
	{
		printf("%s", ret);
		free(ret);
	}
	//ret = ft_strdup(NULL);
	return 0;
}

#else

int main() {
	printf("*** ft_strlen ***\n");
	printf("Should be 4 -> %zu\n", ft_strlen("Test"));
	printf("Should be 0 -> %zu\n", ft_strlen(""));
	//printf("Should be 0 -> %zu\n", ft_strlen(NULL));

	printf("\n*** ft_strcpy ***\n");
	char	dest[10];
	printf("|%s|\n|%s|\n", ft_strcpy(dest, "Test"), dest);
	printf("|%s|\n|%s|\n", ft_strcpy(dest, ""), dest);
	//printf("|%s|\n|%s|\n", ft_strcpy(dest, NULL), dest);

	printf("\n*** ft_strcmp ***\n");
	printf("Should be 0 -> %d\n", ft_strcmp("Test", "Test"));
	printf("Should be 1 -> %d\n", ft_strcmp("Test", "TesT"));
	printf("Should be 1 -> %d\n", ft_strcmp("Hello", "\n\n\f\r\t"));
	printf("Should be 1 -> %d\n", ft_strcmp("Test", "Tes"));
	printf("Should be -1 -> %d\n", ft_strcmp("", "Test"));
	printf("Should be 0 -> %d\n", ft_strcmp("", ""));
	//printf("Should be 0 -> %d\n", ft_strcmp("Test", NULL));

	printf("\n*** ft_write ***\n");
	printf("ret = %zd\n", ft_write(1, "Test\n", 3));
	printf("errno = %d\n", errno);
	printf("ret = %zd\n", ft_write(-1, "Test\n", 5));
	printf("errno = %d\n", errno);
	printf("ret = %zd\n", ft_write(1, NULL, 5));
	printf("errno = %d\n", errno);

	printf("\n*** ft_read ***\n");
	char	buf[100];
	printf("ret = %zd\n", ft_read(0, buf, 10));
	printf("errno = %d\n", errno);
	printf("ret = %zd\n", ft_read(-1, buf, 10));
	printf("errno = %d\n", errno);
	printf("ret = %zd\n", ft_read(0, NULL, 5));
	printf("errno = %d\n", errno);

	printf("\n*** ft_strdup ***\n");
	char	*ret;
	ret = ft_strdup("Test\n");
	if (ret)
	{
		printf("%s", ret);
		free(ret);
	}
	ret = ft_strdup("");
	if (ret)
	{
		printf("%s", ret);
		free(ret);
	}
	//ret = ft_strdup(NULL);
	return 0;
}

#endif
