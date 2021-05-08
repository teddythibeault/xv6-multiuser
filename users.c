struct user get_user_from_username(char username[])
{
	struct user *to_return = (struct user *) malloc (sizeof(struct user));

	FILE *file_pointer;
	file_pointer = fopen("./etc/passwd", "rw");

	to_return -> username = "";
	to_return -> password = "";

	char to_read = ' ';
	while (to_read != ':')
	{
		next_char = fgetc(file_pointer);
		if(to_read != ':')
			strcat(to_return -> username, {next_char, '\0'});
	}

	to_read = ' ';
	while (to_read != ':')
	{
		next_char = fgetc(file_pointer);
		if(to_read != ':')
			strcat(to_return -> password, {next_char, '\0'});
	}


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
