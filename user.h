struct stat;
struct rtcdate;
struct user;

// system calls
int fork(void);
int exit(void) __attribute__((noreturn));
int wait(void);
int pipe(int*);
int write(int, const void*, int);
int read(int, void*, int);
int close(int);
int kill(int);
int exec(char*, char**);
int open(const char*, int);
int mknod(const char*, short, short);
int unlink(const char*);
int fstat(int fd, struct stat*);
int link(const char*, const char*);
int mkdir(const char*);
int chdir(const char*);
int dup(int);
int getpid(void);
char* sbrk(int);
int sleep(int);
int uptime(void);
int date(void);

// ulib.c
int stat(const char*, struct stat*);
char* strcpy(char*, const char*);
char *strcat(char *dest, const char *src);
void *memmove(void*, const void*, int);
char* strchr(const char*, char c);
int strcmp(const char*, const char*);
void printf(int, const char*, ...);
char* gets(char*, int max);
uint strlen(const char*);
void* memset(void*, int, uint);
void* malloc(uint);
void free(void*);
int atoi(const char*);

//users.c
int w(char *username);
int login(char username[]);
int get_user(struct user *to_get, char username[]);
int save_user(struct user *to_save);
int attempt_login(char username[], char password[]);
int su(char username[]);
int useradd(char username[]);
int passwd();

