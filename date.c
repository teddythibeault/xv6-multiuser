#include "types.h"
#include "user.h"

int main(int argc, char **argv)
{
	struct rtcdate d1;
	struct rtcdate* d = &d1;
	date(d);
	printf(1, "%d/%d/%d %d:%d:%d", d -> month, d -> day, d -> year, d -> hour, d -> minute, d -> second);
	exit();
}
