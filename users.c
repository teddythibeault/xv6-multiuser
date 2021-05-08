char *get_active_user()
{

}

struct user *get_user_from_line(FILE *file_pointer)
{
	struct user *to_return = (struct user *) malloc (sizeof(struct user));
	to_return -> username = "";
	to_return -> password = "";

	fscanf(file_pointer, "%s:%s", to_return -> username, to_return -> password);

	return to_return;
}

struct user get_user_from_username(char username[])
{
	struct user *to_return;
	FILE *file_pointer;
	file_pointer = fopen("./etc/passwd", "rw");

	while (True)
	{
		to_return = get_user_from_line(file_pointer);

		if (strcmp(to_return -> username, username) == 0)
			return to_return;

		free(to_return);
	}

	return to_return;
}

int username_exists(char username[])
{
	if(strcmp(username, "root") == 0)
	{
		//https://stackoverflow.com/questions/9314586/c-faster-way-to-check-if-a-directory-exists
		if (0 != access("./etc/", F_OK))
		{
			if (ENOENT == errno)
			{
				char *mkargs[] = {"mkdir", "./etc"};
				exec("mkdir", mkargs);
			}
		}
	}
}

int passwords_match(char password[])
{

}
