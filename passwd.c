#include "types.h"
#include "stat.h"
#include "users.c"

int main(int argc, char *argv[])
{
	int result = passwd();

	if(result < 0)
	{
		printf(2, "passwd: failed to change password\n");
		exit();
	}

	printf(2, "Successfully changed password\n");
	exit();
}
