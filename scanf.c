//implementations copied from uClibc

int scanf(const char * __restrict format, ...)
{
	va_list arg;
	int rv;

	va_start(arg, format);
	rv = vfscanf(stdin, format, arg);
	va_end(arg);

	return rv;
}

int sscanf(const char * __restrict str, const char * __restrict format, ...)
{
	va_list arg;
	int rv;

	va_start(arg, format);
	rv = vsscanf(str, format, arg);
	va_end(arg);

	return rv;
}

