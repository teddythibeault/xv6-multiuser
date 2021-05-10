#include "types.h"
#include "stat.h"
#include "user.h"
#include "users.c"

int main(int argc, char *argv[])
{
	int result = passwd();

	if(result < 0)
	{
		printf(2, "passwd: failed to change password");
		exit();
	}

	printf(2, "Successfully changed password");
	exit();
}
