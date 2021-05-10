
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
char *argv[] = { "sh", 0 };
char username[16];
char password[16];

int main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 18             	sub    $0x18,%esp
	int pid, wpid;

	if(open("console", O_RDWR) < 0)
  12:	6a 02                	push   $0x2
  14:	68 b8 08 00 00       	push   $0x8b8
  19:	e8 d5 03 00 00       	call   3f3 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 0d 01 00 00    	js     136 <main+0x136>
	{
		mknod("console", 1, 1);
		open("console", O_RDWR);
	}
	dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 f8 03 00 00       	call   42b <dup>
	dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 ec 03 00 00       	call   42b <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

	for(;;)
	{
		printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 c0 08 00 00       	push   $0x8c0
  50:	6a 01                	push   $0x1
  52:	e8 f9 04 00 00       	call   550 <printf>
		pid = fork();
  57:	e8 4f 03 00 00       	call   3ab <fork>

		if(pid < 0)
  5c:	83 c4 10             	add    $0x10,%esp
		pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
		if(pid < 0)
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
		{
			printf(1, "init: fork failed\n");
			exit();
		}

		if(pid == 0)
  65:	74 3d                	je     a4 <main+0xa4>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax

			printf(1, "init: exec sh failed\n");
			exit();
		}

		while((wpid=wait()) >= 0 && wpid != pid) printf(1, "zombie!\n");
  70:	e8 46 03 00 00       	call   3bb <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 23 09 00 00       	push   $0x923
  85:	6a 01                	push   $0x1
  87:	e8 c4 04 00 00       	call   550 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
			printf(1, "init: fork failed\n");
  91:	50                   	push   %eax
  92:	50                   	push   %eax
  93:	68 d3 08 00 00       	push   $0x8d3
  98:	6a 01                	push   $0x1
  9a:	e8 b1 04 00 00       	call   550 <printf>
			exit();
  9f:	e8 0f 03 00 00       	call   3b3 <exit>
  a4:	8d 5d ec             	lea    -0x14(%ebp),%ebx
  a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ae:	66 90                	xchg   %ax,%ax
					printf(1, "Username:\t");
  b0:	83 ec 08             	sub    $0x8,%esp
  b3:	68 e6 08 00 00       	push   $0x8e6
  b8:	6a 01                	push   $0x1
  ba:	e8 91 04 00 00       	call   550 <printf>
					gets(username, 16);
  bf:	58                   	pop    %eax
  c0:	5a                   	pop    %edx
  c1:	6a 10                	push   $0x10
  c3:	68 f4 0b 00 00       	push   $0xbf4
  c8:	e8 a3 01 00 00       	call   270 <gets>
					printf(1, "Password:\t");
  cd:	59                   	pop    %ecx
  ce:	58                   	pop    %eax
  cf:	68 f1 08 00 00       	push   $0x8f1
  d4:	6a 01                	push   $0x1
  d6:	e8 75 04 00 00       	call   550 <printf>
					gets(password, 16);
  db:	58                   	pop    %eax
  dc:	5a                   	pop    %edx
  dd:	6a 10                	push   $0x10
  df:	68 e4 0b 00 00       	push   $0xbe4
  e4:	e8 87 01 00 00       	call   270 <gets>
					result = exec("attempt_login", args);
  e9:	59                   	pop    %ecx
  ea:	58                   	pop    %eax
  eb:	53                   	push   %ebx
  ec:	68 fc 08 00 00       	push   $0x8fc
					char *args[] = { "attempt_login", username, password};
  f1:	c7 45 ec fc 08 00 00 	movl   $0x8fc,-0x14(%ebp)
  f8:	c7 45 f0 f4 0b 00 00 	movl   $0xbf4,-0x10(%ebp)
  ff:	c7 45 f4 e4 0b 00 00 	movl   $0xbe4,-0xc(%ebp)
					result = exec("attempt_login", args);
 106:	e8 e0 02 00 00       	call   3eb <exec>
				while(result < 0)
 10b:	83 c4 10             	add    $0x10,%esp
 10e:	85 c0                	test   %eax,%eax
 110:	78 9e                	js     b0 <main+0xb0>
				exec("sh", argv);
 112:	50                   	push   %eax
 113:	50                   	push   %eax
 114:	68 dc 0b 00 00       	push   $0xbdc
 119:	68 0a 09 00 00       	push   $0x90a
 11e:	e8 c8 02 00 00       	call   3eb <exec>
				printf(1, "init: exec sh failed\n");
 123:	5a                   	pop    %edx
 124:	59                   	pop    %ecx
 125:	68 0d 09 00 00       	push   $0x90d
 12a:	6a 01                	push   $0x1
 12c:	e8 1f 04 00 00       	call   550 <printf>
				exit();
 131:	e8 7d 02 00 00       	call   3b3 <exit>
		mknod("console", 1, 1);
 136:	50                   	push   %eax
 137:	6a 01                	push   $0x1
 139:	6a 01                	push   $0x1
 13b:	68 b8 08 00 00       	push   $0x8b8
 140:	e8 b6 02 00 00       	call   3fb <mknod>
		open("console", O_RDWR);
 145:	58                   	pop    %eax
 146:	5a                   	pop    %edx
 147:	6a 02                	push   $0x2
 149:	68 b8 08 00 00       	push   $0x8b8
 14e:	e8 a0 02 00 00       	call   3f3 <open>
 153:	83 c4 10             	add    $0x10,%esp
 156:	e9 ce fe ff ff       	jmp    29 <main+0x29>
 15b:	66 90                	xchg   %ax,%ax
 15d:	66 90                	xchg   %ax,%ax
 15f:	90                   	nop

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 161:	31 c0                	xor    %eax,%eax
{
 163:	89 e5                	mov    %esp,%ebp
 165:	53                   	push   %ebx
 166:	8b 4d 08             	mov    0x8(%ebp),%ecx
 169:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 170:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 174:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 177:	83 c0 01             	add    $0x1,%eax
 17a:	84 d2                	test   %dl,%dl
 17c:	75 f2                	jne    170 <strcpy+0x10>
    ;
  return os;
}
 17e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 181:	89 c8                	mov    %ecx,%eax
 183:	c9                   	leave  
 184:	c3                   	ret    
 185:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 4d 08             	mov    0x8(%ebp),%ecx
 197:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 19a:	0f b6 01             	movzbl (%ecx),%eax
 19d:	0f b6 1a             	movzbl (%edx),%ebx
 1a0:	84 c0                	test   %al,%al
 1a2:	75 1d                	jne    1c1 <strcmp+0x31>
 1a4:	eb 2a                	jmp    1d0 <strcmp+0x40>
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1b4:	83 c1 01             	add    $0x1,%ecx
 1b7:	83 c2 01             	add    $0x1,%edx
  return (uchar)*p - (uchar)*q;
 1ba:	0f b6 1a             	movzbl (%edx),%ebx
  while(*p && *p == *q)
 1bd:	84 c0                	test   %al,%al
 1bf:	74 0f                	je     1d0 <strcmp+0x40>
 1c1:	38 d8                	cmp    %bl,%al
 1c3:	74 eb                	je     1b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1c5:	29 d8                	sub    %ebx,%eax
}
 1c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ca:	c9                   	leave  
 1cb:	c3                   	ret    
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1d2:	29 d8                	sub    %ebx,%eax
}
 1d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d7:	c9                   	leave  
 1d8:	c3                   	ret    
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <strlen>:

uint
strlen(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1e6:	80 3a 00             	cmpb   $0x0,(%edx)
 1e9:	74 15                	je     200 <strlen+0x20>
 1eb:	31 c0                	xor    %eax,%eax
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
 1f0:	83 c0 01             	add    $0x1,%eax
 1f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1f7:	89 c1                	mov    %eax,%ecx
 1f9:	75 f5                	jne    1f0 <strlen+0x10>
    ;
  return n;
}
 1fb:	89 c8                	mov    %ecx,%eax
 1fd:	5d                   	pop    %ebp
 1fe:	c3                   	ret    
 1ff:	90                   	nop
  for(n = 0; s[n]; n++)
 200:	31 c9                	xor    %ecx,%ecx
}
 202:	5d                   	pop    %ebp
 203:	89 c8                	mov    %ecx,%eax
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <memset>:

void*
memset(void *dst, int c, uint n)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 217:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 d7                	mov    %edx,%edi
 21f:	fc                   	cld    
 220:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 222:	8b 7d fc             	mov    -0x4(%ebp),%edi
 225:	89 d0                	mov    %edx,%eax
 227:	c9                   	leave  
 228:	c3                   	ret    
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 23a:	0f b6 10             	movzbl (%eax),%edx
 23d:	84 d2                	test   %dl,%dl
 23f:	75 12                	jne    253 <strchr+0x23>
 241:	eb 1d                	jmp    260 <strchr+0x30>
 243:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 247:	90                   	nop
 248:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 24c:	83 c0 01             	add    $0x1,%eax
 24f:	84 d2                	test   %dl,%dl
 251:	74 0d                	je     260 <strchr+0x30>
    if(*s == c)
 253:	38 d1                	cmp    %dl,%cl
 255:	75 f1                	jne    248 <strchr+0x18>
      return (char*)s;
  return 0;
}
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 260:	31 c0                	xor    %eax,%eax
}
 262:	5d                   	pop    %ebp
 263:	c3                   	ret    
 264:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <gets>:

char*
gets(char *buf, int max)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 275:	31 f6                	xor    %esi,%esi
{
 277:	53                   	push   %ebx
 278:	89 f3                	mov    %esi,%ebx
 27a:	83 ec 1c             	sub    $0x1c,%esp
 27d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 280:	eb 2f                	jmp    2b1 <gets+0x41>
 282:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 288:	83 ec 04             	sub    $0x4,%esp
 28b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 28e:	6a 01                	push   $0x1
 290:	50                   	push   %eax
 291:	6a 00                	push   $0x0
 293:	e8 33 01 00 00       	call   3cb <read>
    if(cc < 1)
 298:	83 c4 10             	add    $0x10,%esp
 29b:	85 c0                	test   %eax,%eax
 29d:	7e 1c                	jle    2bb <gets+0x4b>
      break;
    buf[i++] = c;
 29f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    if(c == '\n' || c == '\r')
 2a3:	83 c7 01             	add    $0x1,%edi
    buf[i++] = c;
 2a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2a9:	3c 0a                	cmp    $0xa,%al
 2ab:	74 23                	je     2d0 <gets+0x60>
 2ad:	3c 0d                	cmp    $0xd,%al
 2af:	74 1f                	je     2d0 <gets+0x60>
  for(i=0; i+1 < max; ){
 2b1:	83 c3 01             	add    $0x1,%ebx
    buf[i++] = c;
 2b4:	89 fe                	mov    %edi,%esi
  for(i=0; i+1 < max; ){
 2b6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2b9:	7c cd                	jl     288 <gets+0x18>
 2bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2c0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2c6:	5b                   	pop    %ebx
 2c7:	5e                   	pop    %esi
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop
  buf[i] = '\0';
 2d0:	8b 75 08             	mov    0x8(%ebp),%esi
}
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2d6:	01 de                	add    %ebx,%esi
 2d8:	89 f3                	mov    %esi,%ebx
 2da:	c6 03 00             	movb   $0x0,(%ebx)
}
 2dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e0:	5b                   	pop    %ebx
 2e1:	5e                   	pop    %esi
 2e2:	5f                   	pop    %edi
 2e3:	5d                   	pop    %ebp
 2e4:	c3                   	ret    
 2e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f5:	83 ec 08             	sub    $0x8,%esp
 2f8:	6a 00                	push   $0x0
 2fa:	ff 75 08             	push   0x8(%ebp)
 2fd:	e8 f1 00 00 00       	call   3f3 <open>
  if(fd < 0)
 302:	83 c4 10             	add    $0x10,%esp
 305:	85 c0                	test   %eax,%eax
 307:	78 27                	js     330 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 309:	83 ec 08             	sub    $0x8,%esp
 30c:	ff 75 0c             	push   0xc(%ebp)
 30f:	89 c3                	mov    %eax,%ebx
 311:	50                   	push   %eax
 312:	e8 f4 00 00 00       	call   40b <fstat>
  close(fd);
 317:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 31a:	89 c6                	mov    %eax,%esi
  close(fd);
 31c:	e8 ba 00 00 00       	call   3db <close>
  return r;
 321:	83 c4 10             	add    $0x10,%esp
}
 324:	8d 65 f8             	lea    -0x8(%ebp),%esp
 327:	89 f0                	mov    %esi,%eax
 329:	5b                   	pop    %ebx
 32a:	5e                   	pop    %esi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 330:	be ff ff ff ff       	mov    $0xffffffff,%esi
 335:	eb ed                	jmp    324 <stat+0x34>
 337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33e:	66 90                	xchg   %ax,%ax

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	53                   	push   %ebx
 344:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 347:	0f be 02             	movsbl (%edx),%eax
 34a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 34d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 350:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 355:	77 1e                	ja     375 <atoi+0x35>
 357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 360:	83 c2 01             	add    $0x1,%edx
 363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 36a:	0f be 02             	movsbl (%edx),%eax
 36d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 370:	80 fb 09             	cmp    $0x9,%bl
 373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
 375:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 378:	89 c8                	mov    %ecx,%eax
 37a:	c9                   	leave  
 37b:	c3                   	ret    
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 45 10             	mov    0x10(%ebp),%eax
 387:	8b 55 08             	mov    0x8(%ebp),%edx
 38a:	56                   	push   %esi
 38b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 38e:	85 c0                	test   %eax,%eax
 390:	7e 13                	jle    3a5 <memmove+0x25>
 392:	01 d0                	add    %edx,%eax
  dst = vdst;
 394:	89 d7                	mov    %edx,%edi
 396:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3a1:	39 f8                	cmp    %edi,%eax
 3a3:	75 fb                	jne    3a0 <memmove+0x20>
  return vdst;
}
 3a5:	5e                   	pop    %esi
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    

000003ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ab:	b8 01 00 00 00       	mov    $0x1,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <exit>:
SYSCALL(exit)
 3b3:	b8 02 00 00 00       	mov    $0x2,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <wait>:
SYSCALL(wait)
 3bb:	b8 03 00 00 00       	mov    $0x3,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <pipe>:
SYSCALL(pipe)
 3c3:	b8 04 00 00 00       	mov    $0x4,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <read>:
SYSCALL(read)
 3cb:	b8 05 00 00 00       	mov    $0x5,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <write>:
SYSCALL(write)
 3d3:	b8 10 00 00 00       	mov    $0x10,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <close>:
SYSCALL(close)
 3db:	b8 15 00 00 00       	mov    $0x15,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <kill>:
SYSCALL(kill)
 3e3:	b8 06 00 00 00       	mov    $0x6,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <exec>:
SYSCALL(exec)
 3eb:	b8 07 00 00 00       	mov    $0x7,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <open>:
SYSCALL(open)
 3f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <mknod>:
SYSCALL(mknod)
 3fb:	b8 11 00 00 00       	mov    $0x11,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <unlink>:
SYSCALL(unlink)
 403:	b8 12 00 00 00       	mov    $0x12,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <fstat>:
SYSCALL(fstat)
 40b:	b8 08 00 00 00       	mov    $0x8,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <link>:
SYSCALL(link)
 413:	b8 13 00 00 00       	mov    $0x13,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <mkdir>:
SYSCALL(mkdir)
 41b:	b8 14 00 00 00       	mov    $0x14,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <chdir>:
SYSCALL(chdir)
 423:	b8 09 00 00 00       	mov    $0x9,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <dup>:
SYSCALL(dup)
 42b:	b8 0a 00 00 00       	mov    $0xa,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <getpid>:
SYSCALL(getpid)
 433:	b8 0b 00 00 00       	mov    $0xb,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <sbrk>:
SYSCALL(sbrk)
 43b:	b8 0c 00 00 00       	mov    $0xc,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <sleep>:
SYSCALL(sleep)
 443:	b8 0d 00 00 00       	mov    $0xd,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <uptime>:
SYSCALL(uptime)
 44b:	b8 0e 00 00 00       	mov    $0xe,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <date>:
SYSCALL(date)
 453:	b8 16 00 00 00       	mov    $0x16,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <w>:
SYSCALL(w)
 45b:	b8 17 00 00 00       	mov    $0x17,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <login>:
SYSCALL(login)
 463:	b8 18 00 00 00       	mov    $0x18,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <user>:
SYSCALL(user)
 46b:	b8 19 00 00 00       	mov    $0x19,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <attempt_login>:
SYSCALL(attempt_login)
 473:	b8 1a 00 00 00       	mov    $0x1a,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <su>:
SYSCALL(su)
 47b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <adduser>:
SYSCALL(adduser)
 483:	b8 1c 00 00 00       	mov    $0x1c,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <passwd>:
SYSCALL(passwd)
 48b:	b8 1d 00 00 00       	mov    $0x1d,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    
 493:	66 90                	xchg   %ax,%ax
 495:	66 90                	xchg   %ax,%ax
 497:	66 90                	xchg   %ax,%ax
 499:	66 90                	xchg   %ax,%ax
 49b:	66 90                	xchg   %ax,%ax
 49d:	66 90                	xchg   %ax,%ax
 49f:	90                   	nop

000004a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 3c             	sub    $0x3c,%esp
 4a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4ac:	89 d1                	mov    %edx,%ecx
{
 4ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4b1:	85 d2                	test   %edx,%edx
 4b3:	0f 89 7f 00 00 00    	jns    538 <printint+0x98>
 4b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4bd:	74 79                	je     538 <printint+0x98>
    neg = 1;
 4bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4c8:	31 db                	xor    %ebx,%ebx
 4ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4d0:	89 c8                	mov    %ecx,%eax
 4d2:	31 d2                	xor    %edx,%edx
 4d4:	89 cf                	mov    %ecx,%edi
 4d6:	f7 75 c4             	divl   -0x3c(%ebp)
 4d9:	0f b6 92 34 09 00 00 	movzbl 0x934(%edx),%edx
 4e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4e3:	89 d8                	mov    %ebx,%eax
 4e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4f1:	76 dd                	jbe    4d0 <printint+0x30>
  if(neg)
 4f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4f6:	85 c9                	test   %ecx,%ecx
 4f8:	74 0c                	je     506 <printint+0x66>
    buf[i++] = '-';
 4fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 501:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 506:	8b 7d b8             	mov    -0x48(%ebp),%edi
 509:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 50d:	eb 07                	jmp    516 <printint+0x76>
 50f:	90                   	nop
    putc(fd, buf[i]);
 510:	0f b6 13             	movzbl (%ebx),%edx
 513:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 516:	83 ec 04             	sub    $0x4,%esp
 519:	88 55 d7             	mov    %dl,-0x29(%ebp)
 51c:	6a 01                	push   $0x1
 51e:	56                   	push   %esi
 51f:	57                   	push   %edi
 520:	e8 ae fe ff ff       	call   3d3 <write>
  while(--i >= 0)
 525:	83 c4 10             	add    $0x10,%esp
 528:	39 de                	cmp    %ebx,%esi
 52a:	75 e4                	jne    510 <printint+0x70>
}
 52c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 52f:	5b                   	pop    %ebx
 530:	5e                   	pop    %esi
 531:	5f                   	pop    %edi
 532:	5d                   	pop    %ebp
 533:	c3                   	ret    
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 538:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 53f:	eb 87                	jmp    4c8 <printint+0x28>
 541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 548:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop

00000550 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 559:	8b 75 0c             	mov    0xc(%ebp),%esi
 55c:	0f b6 1e             	movzbl (%esi),%ebx
 55f:	84 db                	test   %bl,%bl
 561:	0f 84 b8 00 00 00    	je     61f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 567:	8d 45 10             	lea    0x10(%ebp),%eax
 56a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 56d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 570:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 572:	89 45 d0             	mov    %eax,-0x30(%ebp)
 575:	eb 37                	jmp    5ae <printf+0x5e>
 577:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57e:	66 90                	xchg   %ax,%ax
 580:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 583:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 588:	83 f8 25             	cmp    $0x25,%eax
 58b:	74 17                	je     5a4 <printf+0x54>
  write(fd, &c, 1);
 58d:	83 ec 04             	sub    $0x4,%esp
 590:	88 5d e7             	mov    %bl,-0x19(%ebp)
 593:	6a 01                	push   $0x1
 595:	57                   	push   %edi
 596:	ff 75 08             	push   0x8(%ebp)
 599:	e8 35 fe ff ff       	call   3d3 <write>
 59e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5a1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5a4:	0f b6 1e             	movzbl (%esi),%ebx
 5a7:	83 c6 01             	add    $0x1,%esi
 5aa:	84 db                	test   %bl,%bl
 5ac:	74 71                	je     61f <printf+0xcf>
    c = fmt[i] & 0xff;
 5ae:	0f be cb             	movsbl %bl,%ecx
 5b1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5b4:	85 d2                	test   %edx,%edx
 5b6:	74 c8                	je     580 <printf+0x30>
      }
    } else if(state == '%'){
 5b8:	83 fa 25             	cmp    $0x25,%edx
 5bb:	75 e7                	jne    5a4 <printf+0x54>
      if(c == 'd'){
 5bd:	83 f8 64             	cmp    $0x64,%eax
 5c0:	0f 84 9a 00 00 00    	je     660 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5c6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5cc:	83 f9 70             	cmp    $0x70,%ecx
 5cf:	74 5f                	je     630 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5d1:	83 f8 73             	cmp    $0x73,%eax
 5d4:	0f 84 d6 00 00 00    	je     6b0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5da:	83 f8 63             	cmp    $0x63,%eax
 5dd:	0f 84 8d 00 00 00    	je     670 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5e3:	83 f8 25             	cmp    $0x25,%eax
 5e6:	0f 84 b4 00 00 00    	je     6a0 <printf+0x150>
  write(fd, &c, 1);
 5ec:	83 ec 04             	sub    $0x4,%esp
 5ef:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5f3:	6a 01                	push   $0x1
 5f5:	57                   	push   %edi
 5f6:	ff 75 08             	push   0x8(%ebp)
 5f9:	e8 d5 fd ff ff       	call   3d3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5fe:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 601:	83 c4 0c             	add    $0xc,%esp
 604:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
 606:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 609:	57                   	push   %edi
 60a:	ff 75 08             	push   0x8(%ebp)
 60d:	e8 c1 fd ff ff       	call   3d3 <write>
  for(i = 0; fmt[i]; i++){
 612:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 616:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 619:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 61b:	84 db                	test   %bl,%bl
 61d:	75 8f                	jne    5ae <printf+0x5e>
    }
  }
}
 61f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 622:	5b                   	pop    %ebx
 623:	5e                   	pop    %esi
 624:	5f                   	pop    %edi
 625:	5d                   	pop    %ebp
 626:	c3                   	ret    
 627:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 630:	83 ec 0c             	sub    $0xc,%esp
 633:	b9 10 00 00 00       	mov    $0x10,%ecx
 638:	6a 00                	push   $0x0
 63a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 63d:	8b 45 08             	mov    0x8(%ebp),%eax
 640:	8b 13                	mov    (%ebx),%edx
 642:	e8 59 fe ff ff       	call   4a0 <printint>
        ap++;
 647:	89 d8                	mov    %ebx,%eax
 649:	83 c4 10             	add    $0x10,%esp
      state = 0;
 64c:	31 d2                	xor    %edx,%edx
        ap++;
 64e:	83 c0 04             	add    $0x4,%eax
 651:	89 45 d0             	mov    %eax,-0x30(%ebp)
 654:	e9 4b ff ff ff       	jmp    5a4 <printf+0x54>
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 0a 00 00 00       	mov    $0xa,%ecx
 668:	6a 01                	push   $0x1
 66a:	eb ce                	jmp    63a <printf+0xea>
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 670:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 673:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 676:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 678:	6a 01                	push   $0x1
        ap++;
 67a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 67d:	57                   	push   %edi
 67e:	ff 75 08             	push   0x8(%ebp)
        putc(fd, *ap);
 681:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 684:	e8 4a fd ff ff       	call   3d3 <write>
        ap++;
 689:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 68c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68f:	31 d2                	xor    %edx,%edx
 691:	e9 0e ff ff ff       	jmp    5a4 <printf+0x54>
 696:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 6a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6a3:	83 ec 04             	sub    $0x4,%esp
 6a6:	e9 59 ff ff ff       	jmp    604 <printf+0xb4>
 6ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop
        s = (char*)*ap;
 6b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6b3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6b5:	83 c0 04             	add    $0x4,%eax
 6b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6bb:	85 db                	test   %ebx,%ebx
 6bd:	74 17                	je     6d6 <printf+0x186>
        while(*s != 0){
 6bf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6c2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6c4:	84 c0                	test   %al,%al
 6c6:	0f 84 d8 fe ff ff    	je     5a4 <printf+0x54>
 6cc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6cf:	89 de                	mov    %ebx,%esi
 6d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6d4:	eb 1a                	jmp    6f0 <printf+0x1a0>
          s = "(null)";
 6d6:	bb 2c 09 00 00       	mov    $0x92c,%ebx
        while(*s != 0){
 6db:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6de:	b8 28 00 00 00       	mov    $0x28,%eax
 6e3:	89 de                	mov    %ebx,%esi
 6e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ef:	90                   	nop
  write(fd, &c, 1);
 6f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6f3:	83 c6 01             	add    $0x1,%esi
 6f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6f9:	6a 01                	push   $0x1
 6fb:	57                   	push   %edi
 6fc:	53                   	push   %ebx
 6fd:	e8 d1 fc ff ff       	call   3d3 <write>
        while(*s != 0){
 702:	0f b6 06             	movzbl (%esi),%eax
 705:	83 c4 10             	add    $0x10,%esp
 708:	84 c0                	test   %al,%al
 70a:	75 e4                	jne    6f0 <printf+0x1a0>
      state = 0;
 70c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 70f:	31 d2                	xor    %edx,%edx
 711:	e9 8e fe ff ff       	jmp    5a4 <printf+0x54>
 716:	66 90                	xchg   %ax,%ax
 718:	66 90                	xchg   %ax,%ax
 71a:	66 90                	xchg   %ax,%ax
 71c:	66 90                	xchg   %ax,%ax
 71e:	66 90                	xchg   %ax,%ax

00000720 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 720:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	a1 04 0c 00 00       	mov    0xc04,%eax
{
 726:	89 e5                	mov    %esp,%ebp
 728:	57                   	push   %edi
 729:	56                   	push   %esi
 72a:	53                   	push   %ebx
 72b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 72e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 738:	89 c2                	mov    %eax,%edx
 73a:	8b 00                	mov    (%eax),%eax
 73c:	39 ca                	cmp    %ecx,%edx
 73e:	73 30                	jae    770 <free+0x50>
 740:	39 c1                	cmp    %eax,%ecx
 742:	72 04                	jb     748 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 744:	39 c2                	cmp    %eax,%edx
 746:	72 f0                	jb     738 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 748:	8b 73 fc             	mov    -0x4(%ebx),%esi
 74b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 74e:	39 f8                	cmp    %edi,%eax
 750:	74 30                	je     782 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 752:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 755:	8b 42 04             	mov    0x4(%edx),%eax
 758:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 75b:	39 f1                	cmp    %esi,%ecx
 75d:	74 3a                	je     799 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 75f:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
 761:	5b                   	pop    %ebx
  freep = p;
 762:	89 15 04 0c 00 00    	mov    %edx,0xc04
}
 768:	5e                   	pop    %esi
 769:	5f                   	pop    %edi
 76a:	5d                   	pop    %ebp
 76b:	c3                   	ret    
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 770:	39 c2                	cmp    %eax,%edx
 772:	72 c4                	jb     738 <free+0x18>
 774:	39 c1                	cmp    %eax,%ecx
 776:	73 c0                	jae    738 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 778:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77e:	39 f8                	cmp    %edi,%eax
 780:	75 d0                	jne    752 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 782:	03 70 04             	add    0x4(%eax),%esi
 785:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 788:	8b 02                	mov    (%edx),%eax
 78a:	8b 00                	mov    (%eax),%eax
 78c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 78f:	8b 42 04             	mov    0x4(%edx),%eax
 792:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 795:	39 f1                	cmp    %esi,%ecx
 797:	75 c6                	jne    75f <free+0x3f>
    p->s.size += bp->s.size;
 799:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 79c:	89 15 04 0c 00 00    	mov    %edx,0xc04
    p->s.size += bp->s.size;
 7a2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7a5:	8b 43 f8             	mov    -0x8(%ebx),%eax
 7a8:	89 02                	mov    %eax,(%edx)
}
 7aa:	5b                   	pop    %ebx
 7ab:	5e                   	pop    %esi
 7ac:	5f                   	pop    %edi
 7ad:	5d                   	pop    %ebp
 7ae:	c3                   	ret    
 7af:	90                   	nop

000007b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7bc:	8b 3d 04 0c 00 00    	mov    0xc04,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c2:	8d 70 07             	lea    0x7(%eax),%esi
 7c5:	c1 ee 03             	shr    $0x3,%esi
 7c8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7cb:	85 ff                	test   %edi,%edi
 7cd:	0f 84 ad 00 00 00    	je     880 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d3:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 7d5:	8b 48 04             	mov    0x4(%eax),%ecx
 7d8:	39 f1                	cmp    %esi,%ecx
 7da:	73 71                	jae    84d <malloc+0x9d>
 7dc:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 7e2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7e7:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7ea:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 7f1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 7f4:	eb 1b                	jmp    811 <malloc+0x61>
 7f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 800:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 802:	8b 4a 04             	mov    0x4(%edx),%ecx
 805:	39 f1                	cmp    %esi,%ecx
 807:	73 4f                	jae    858 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 809:	8b 3d 04 0c 00 00    	mov    0xc04,%edi
 80f:	89 d0                	mov    %edx,%eax
 811:	39 c7                	cmp    %eax,%edi
 813:	75 eb                	jne    800 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 815:	83 ec 0c             	sub    $0xc,%esp
 818:	ff 75 e4             	push   -0x1c(%ebp)
 81b:	e8 1b fc ff ff       	call   43b <sbrk>
  if(p == (char*)-1)
 820:	83 c4 10             	add    $0x10,%esp
 823:	83 f8 ff             	cmp    $0xffffffff,%eax
 826:	74 1b                	je     843 <malloc+0x93>
  hp->s.size = nu;
 828:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 82b:	83 ec 0c             	sub    $0xc,%esp
 82e:	83 c0 08             	add    $0x8,%eax
 831:	50                   	push   %eax
 832:	e8 e9 fe ff ff       	call   720 <free>
  return freep;
 837:	a1 04 0c 00 00       	mov    0xc04,%eax
      if((p = morecore(nunits)) == 0)
 83c:	83 c4 10             	add    $0x10,%esp
 83f:	85 c0                	test   %eax,%eax
 841:	75 bd                	jne    800 <malloc+0x50>
        return 0;
  }
}
 843:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 846:	31 c0                	xor    %eax,%eax
}
 848:	5b                   	pop    %ebx
 849:	5e                   	pop    %esi
 84a:	5f                   	pop    %edi
 84b:	5d                   	pop    %ebp
 84c:	c3                   	ret    
    if(p->s.size >= nunits){
 84d:	89 c2                	mov    %eax,%edx
 84f:	89 f8                	mov    %edi,%eax
 851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 858:	39 ce                	cmp    %ecx,%esi
 85a:	74 54                	je     8b0 <malloc+0x100>
        p->s.size -= nunits;
 85c:	29 f1                	sub    %esi,%ecx
 85e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 861:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 864:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 867:	a3 04 0c 00 00       	mov    %eax,0xc04
}
 86c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 86f:	8d 42 08             	lea    0x8(%edx),%eax
}
 872:	5b                   	pop    %ebx
 873:	5e                   	pop    %esi
 874:	5f                   	pop    %edi
 875:	5d                   	pop    %ebp
 876:	c3                   	ret    
 877:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 880:	c7 05 04 0c 00 00 08 	movl   $0xc08,0xc04
 887:	0c 00 00 
    base.s.size = 0;
 88a:	bf 08 0c 00 00       	mov    $0xc08,%edi
    base.s.ptr = freep = prevp = &base;
 88f:	c7 05 08 0c 00 00 08 	movl   $0xc08,0xc08
 896:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 899:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 89b:	c7 05 0c 0c 00 00 00 	movl   $0x0,0xc0c
 8a2:	00 00 00 
    if(p->s.size >= nunits){
 8a5:	e9 32 ff ff ff       	jmp    7dc <malloc+0x2c>
 8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8b0:	8b 0a                	mov    (%edx),%ecx
 8b2:	89 08                	mov    %ecx,(%eax)
 8b4:	eb b1                	jmp    867 <malloc+0xb7>
