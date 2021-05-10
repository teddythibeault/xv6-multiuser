
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
		return -1;
	return 0;
}

int main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	56                   	push   %esi
       e:	53                   	push   %ebx
       f:	51                   	push   %ecx
      10:	83 ec 28             	sub    $0x28,%esp
	static char buf[100];
	int fd;

	//Navigate to correct user directory, uses asprintf to create the path and then calls chdir
	char* username = malloc(16);
      13:	6a 10                	push   $0x10
      15:	e8 c6 12 00 00       	call   12e0 <malloc>
	char *argv[] = { "w", username};
	exec("w", argv);
      1a:	5b                   	pop    %ebx
	char *argv[] = { "w", username};
      1b:	c7 45 e0 8c 14 00 00 	movl   $0x148c,-0x20(%ebp)
      22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	char* username = malloc(16);
      25:	89 c6                	mov    %eax,%esi
	exec("w", argv);
      27:	58                   	pop    %eax
      28:	8d 45 e0             	lea    -0x20(%ebp),%eax
      2b:	50                   	push   %eax
      2c:	68 8c 14 00 00       	push   $0x148c
      31:	e8 e5 0e 00 00       	call   f1b <exec>

	char* directory_path = malloc(100);
      36:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
      3d:	e8 9e 12 00 00       	call   12e0 <malloc>
//	asprintf(&directory_path, "./%s", username);
	strcpy(directory_path, "./");
      42:	5a                   	pop    %edx
      43:	59                   	pop    %ecx
      44:	68 8e 14 00 00       	push   $0x148e
      49:	50                   	push   %eax
	char* directory_path = malloc(100);
      4a:	89 c3                	mov    %eax,%ebx
	strcpy(directory_path, "./");
      4c:	e8 3f 0c 00 00       	call   c90 <strcpy>
	strcpy(directory_path + strlen(directory_path), username);
      51:	89 1c 24             	mov    %ebx,(%esp)
      54:	e8 b7 0c 00 00       	call   d10 <strlen>
      59:	5a                   	pop    %edx
      5a:	59                   	pop    %ecx
      5b:	56                   	push   %esi
      5c:	01 d8                	add    %ebx,%eax
      5e:	50                   	push   %eax
      5f:	e8 2c 0c 00 00       	call   c90 <strcpy>
	chdir(directory_path);
      64:	89 1c 24             	mov    %ebx,(%esp)
      67:	e8 e7 0e 00 00       	call   f53 <chdir>

	// Ensure that three file descriptors are open.
	while((fd = open("console", O_RDWR)) >= 0)
      6c:	83 c4 10             	add    $0x10,%esp
      6f:	eb 10                	jmp    81 <main+0x81>
      71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	{
		if(fd >= 3)
      78:	83 f8 02             	cmp    $0x2,%eax
      7b:	0f 8f 91 00 00 00    	jg     112 <main+0x112>
	while((fd = open("console", O_RDWR)) >= 0)
      81:	83 ec 08             	sub    $0x8,%esp
      84:	6a 02                	push   $0x2
      86:	68 91 14 00 00       	push   $0x1491
      8b:	e8 93 0e 00 00       	call   f23 <open>
      90:	83 c4 10             	add    $0x10,%esp
      93:	85 c0                	test   %eax,%eax
      95:	79 e1                	jns    78 <main+0x78>
      97:	eb 2e                	jmp    c7 <main+0xc7>
      99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	}

	// Read and run input commands.
	while(getcmd(buf, sizeof(buf)) >= 0)
	{
		if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' ')
      a0:	80 3d 02 1b 00 00 20 	cmpb   $0x20,0x1b02
      a7:	0f 84 88 00 00 00    	je     135 <main+0x135>
      ad:	8d 76 00             	lea    0x0(%esi),%esi

int fork1(void)
{
	int pid;

	pid = fork();
      b0:	e8 26 0e 00 00       	call   edb <fork>

	if(pid == -1)
      b5:	83 f8 ff             	cmp    $0xffffffff,%eax
      b8:	0f 84 c1 00 00 00    	je     17f <main+0x17f>
		if(fork1() == 0)
      be:	85 c0                	test   %eax,%eax
      c0:	74 5e                	je     120 <main+0x120>
		wait();
      c2:	e8 24 0e 00 00       	call   eeb <wait>
	printf(2, "[] $ ");
      c7:	83 ec 08             	sub    $0x8,%esp
      ca:	68 e8 13 00 00       	push   $0x13e8
      cf:	6a 02                	push   $0x2
      d1:	e8 aa 0f 00 00       	call   1080 <printf>
	memset(buf, 0, nbuf);
      d6:	83 c4 0c             	add    $0xc,%esp
      d9:	6a 64                	push   $0x64
      db:	6a 00                	push   $0x0
      dd:	68 00 1b 00 00       	push   $0x1b00
      e2:	e8 59 0c 00 00       	call   d40 <memset>
	gets(buf, nbuf);
      e7:	58                   	pop    %eax
      e8:	5a                   	pop    %edx
      e9:	6a 64                	push   $0x64
      eb:	68 00 1b 00 00       	push   $0x1b00
      f0:	e8 ab 0c 00 00       	call   da0 <gets>
	if(buf[0] == 0)  //EOF
      f5:	0f b6 05 00 1b 00 00 	movzbl 0x1b00,%eax
      fc:	83 c4 10             	add    $0x10,%esp
      ff:	84 c0                	test   %al,%al
     101:	74 77                	je     17a <main+0x17a>
		if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' ')
     103:	3c 63                	cmp    $0x63,%al
     105:	75 a9                	jne    b0 <main+0xb0>
     107:	80 3d 01 1b 00 00 64 	cmpb   $0x64,0x1b01
     10e:	75 a0                	jne    b0 <main+0xb0>
     110:	eb 8e                	jmp    a0 <main+0xa0>
			close(fd);
     112:	83 ec 0c             	sub    $0xc,%esp
     115:	50                   	push   %eax
     116:	e8 f0 0d 00 00       	call   f0b <close>
			break;
     11b:	83 c4 10             	add    $0x10,%esp
     11e:	eb a7                	jmp    c7 <main+0xc7>
		runcmd(parsecmd(buf));
     120:	83 ec 0c             	sub    $0xc,%esp
     123:	68 00 1b 00 00       	push   $0x1b00
     128:	e8 f3 0a 00 00       	call   c20 <parsecmd>
     12d:	89 04 24             	mov    %eax,(%esp)
     130:	e8 eb 00 00 00       	call   220 <runcmd>
			buf[strlen(buf)-1] = 0;  // chop \n
     135:	83 ec 0c             	sub    $0xc,%esp
     138:	68 00 1b 00 00       	push   $0x1b00
     13d:	e8 ce 0b 00 00       	call   d10 <strlen>
			if(chdir(buf+3) < 0)
     142:	c7 04 24 03 1b 00 00 	movl   $0x1b03,(%esp)
			buf[strlen(buf)-1] = 0;  // chop \n
     149:	c6 80 ff 1a 00 00 00 	movb   $0x0,0x1aff(%eax)
			if(chdir(buf+3) < 0)
     150:	e8 fe 0d 00 00       	call   f53 <chdir>
     155:	83 c4 10             	add    $0x10,%esp
     158:	85 c0                	test   %eax,%eax
     15a:	0f 89 67 ff ff ff    	jns    c7 <main+0xc7>
				printf(2, "cannot cd %s\n", buf+3);
     160:	51                   	push   %ecx
     161:	68 03 1b 00 00       	push   $0x1b03
     166:	68 99 14 00 00       	push   $0x1499
     16b:	6a 02                	push   $0x2
     16d:	e8 0e 0f 00 00       	call   1080 <printf>
     172:	83 c4 10             	add    $0x10,%esp
     175:	e9 4d ff ff ff       	jmp    c7 <main+0xc7>
	exit();
     17a:	e8 64 0d 00 00       	call   ee3 <exit>
		panic("fork");
     17f:	83 ec 0c             	sub    $0xc,%esp
     182:	68 ee 13 00 00       	push   $0x13ee
     187:	e8 54 00 00 00       	call   1e0 <panic>
     18c:	66 90                	xchg   %ax,%ax
     18e:	66 90                	xchg   %ax,%ax

00000190 <getcmd>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	56                   	push   %esi
     194:	53                   	push   %ebx
     195:	8b 75 0c             	mov    0xc(%ebp),%esi
     198:	8b 5d 08             	mov    0x8(%ebp),%ebx
	printf(2, "[] $ ");
     19b:	83 ec 08             	sub    $0x8,%esp
     19e:	68 e8 13 00 00       	push   $0x13e8
     1a3:	6a 02                	push   $0x2
     1a5:	e8 d6 0e 00 00       	call   1080 <printf>
	memset(buf, 0, nbuf);
     1aa:	83 c4 0c             	add    $0xc,%esp
     1ad:	56                   	push   %esi
     1ae:	6a 00                	push   $0x0
     1b0:	53                   	push   %ebx
     1b1:	e8 8a 0b 00 00       	call   d40 <memset>
	gets(buf, nbuf);
     1b6:	58                   	pop    %eax
     1b7:	5a                   	pop    %edx
     1b8:	56                   	push   %esi
     1b9:	53                   	push   %ebx
     1ba:	e8 e1 0b 00 00       	call   da0 <gets>
	if(buf[0] == 0)  //EOF
     1bf:	83 c4 10             	add    $0x10,%esp
     1c2:	31 c0                	xor    %eax,%eax
     1c4:	80 3b 00             	cmpb   $0x0,(%ebx)
     1c7:	0f 94 c0             	sete   %al
}
     1ca:	8d 65 f8             	lea    -0x8(%ebp),%esp
     1cd:	5b                   	pop    %ebx
	if(buf[0] == 0)  //EOF
     1ce:	f7 d8                	neg    %eax
}
     1d0:	5e                   	pop    %esi
     1d1:	5d                   	pop    %ebp
     1d2:	c3                   	ret    
     1d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001e0 <panic>:
{
     1e0:	55                   	push   %ebp
     1e1:	89 e5                	mov    %esp,%ebp
     1e3:	83 ec 0c             	sub    $0xc,%esp
	printf(2, "%s\n", s);
     1e6:	ff 75 08             	push   0x8(%ebp)
     1e9:	68 88 14 00 00       	push   $0x1488
     1ee:	6a 02                	push   $0x2
     1f0:	e8 8b 0e 00 00       	call   1080 <printf>
	exit();
     1f5:	e8 e9 0c 00 00       	call   ee3 <exit>
     1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <fork1>:
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 08             	sub    $0x8,%esp
	pid = fork();
     206:	e8 d0 0c 00 00       	call   edb <fork>
	if(pid == -1)
     20b:	83 f8 ff             	cmp    $0xffffffff,%eax
     20e:	74 02                	je     212 <fork1+0x12>

	return pid;
}
     210:	c9                   	leave  
     211:	c3                   	ret    
		panic("fork");
     212:	83 ec 0c             	sub    $0xc,%esp
     215:	68 ee 13 00 00       	push   $0x13ee
     21a:	e8 c1 ff ff ff       	call   1e0 <panic>
     21f:	90                   	nop

00000220 <runcmd>:
{
     220:	55                   	push   %ebp
     221:	89 e5                	mov    %esp,%ebp
     223:	53                   	push   %ebx
     224:	83 ec 14             	sub    $0x14,%esp
     227:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if(cmd == 0) exit();
     22a:	85 db                	test   %ebx,%ebx
     22c:	74 42                	je     270 <runcmd+0x50>
	switch(cmd -> type)
     22e:	83 3b 05             	cmpl   $0x5,(%ebx)
     231:	0f 87 e3 00 00 00    	ja     31a <runcmd+0xfa>
     237:	8b 03                	mov    (%ebx),%eax
     239:	ff 24 85 a8 14 00 00 	jmp    *0x14a8(,%eax,4)
		if(ecmd->argv[0] == 0)
     240:	8b 43 04             	mov    0x4(%ebx),%eax
     243:	85 c0                	test   %eax,%eax
     245:	74 29                	je     270 <runcmd+0x50>
		exec(ecmd->argv[0], ecmd->argv);
     247:	8d 53 04             	lea    0x4(%ebx),%edx
     24a:	51                   	push   %ecx
     24b:	51                   	push   %ecx
     24c:	52                   	push   %edx
     24d:	50                   	push   %eax
     24e:	e8 c8 0c 00 00       	call   f1b <exec>
		printf(2, "exec %s failed\n", ecmd->argv[0]);
     253:	83 c4 0c             	add    $0xc,%esp
     256:	ff 73 04             	push   0x4(%ebx)
     259:	68 fa 13 00 00       	push   $0x13fa
     25e:	6a 02                	push   $0x2
     260:	e8 1b 0e 00 00       	call   1080 <printf>
		break;
     265:	83 c4 10             	add    $0x10,%esp
     268:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     26f:	90                   	nop
	if(cmd == 0) exit();
     270:	e8 6e 0c 00 00       	call   ee3 <exit>
		if(fork1() == 0)
     275:	e8 86 ff ff ff       	call   200 <fork1>
     27a:	85 c0                	test   %eax,%eax
     27c:	75 f2                	jne    270 <runcmd+0x50>
     27e:	e9 8c 00 00 00       	jmp    30f <runcmd+0xef>
		if(pipe(p) < 0)
     283:	83 ec 0c             	sub    $0xc,%esp
     286:	8d 45 f0             	lea    -0x10(%ebp),%eax
     289:	50                   	push   %eax
     28a:	e8 64 0c 00 00       	call   ef3 <pipe>
     28f:	83 c4 10             	add    $0x10,%esp
     292:	85 c0                	test   %eax,%eax
     294:	0f 88 a2 00 00 00    	js     33c <runcmd+0x11c>
		if(fork1() == 0){
     29a:	e8 61 ff ff ff       	call   200 <fork1>
     29f:	85 c0                	test   %eax,%eax
     2a1:	0f 84 a2 00 00 00    	je     349 <runcmd+0x129>
		if(fork1() == 0){
     2a7:	e8 54 ff ff ff       	call   200 <fork1>
     2ac:	85 c0                	test   %eax,%eax
     2ae:	0f 84 c3 00 00 00    	je     377 <runcmd+0x157>
		close(p[0]);
     2b4:	83 ec 0c             	sub    $0xc,%esp
     2b7:	ff 75 f0             	push   -0x10(%ebp)
     2ba:	e8 4c 0c 00 00       	call   f0b <close>
		close(p[1]);
     2bf:	58                   	pop    %eax
     2c0:	ff 75 f4             	push   -0xc(%ebp)
     2c3:	e8 43 0c 00 00       	call   f0b <close>
		wait();
     2c8:	e8 1e 0c 00 00       	call   eeb <wait>
		wait();
     2cd:	e8 19 0c 00 00       	call   eeb <wait>
		break;
     2d2:	83 c4 10             	add    $0x10,%esp
     2d5:	eb 99                	jmp    270 <runcmd+0x50>
		if(fork1() == 0)
     2d7:	e8 24 ff ff ff       	call   200 <fork1>
     2dc:	85 c0                	test   %eax,%eax
     2de:	74 2f                	je     30f <runcmd+0xef>
		wait();
     2e0:	e8 06 0c 00 00       	call   eeb <wait>
		runcmd(lcmd->right);
     2e5:	83 ec 0c             	sub    $0xc,%esp
     2e8:	ff 73 08             	push   0x8(%ebx)
     2eb:	e8 30 ff ff ff       	call   220 <runcmd>
		close(rcmd->fd);
     2f0:	83 ec 0c             	sub    $0xc,%esp
     2f3:	ff 73 14             	push   0x14(%ebx)
     2f6:	e8 10 0c 00 00       	call   f0b <close>
		if(open(rcmd->file, rcmd->mode) < 0){
     2fb:	58                   	pop    %eax
     2fc:	5a                   	pop    %edx
     2fd:	ff 73 10             	push   0x10(%ebx)
     300:	ff 73 08             	push   0x8(%ebx)
     303:	e8 1b 0c 00 00       	call   f23 <open>
     308:	83 c4 10             	add    $0x10,%esp
     30b:	85 c0                	test   %eax,%eax
     30d:	78 18                	js     327 <runcmd+0x107>
		runcmd(bcmd->cmd);
     30f:	83 ec 0c             	sub    $0xc,%esp
     312:	ff 73 04             	push   0x4(%ebx)
     315:	e8 06 ff ff ff       	call   220 <runcmd>
		panic("runcmd");
     31a:	83 ec 0c             	sub    $0xc,%esp
     31d:	68 f3 13 00 00       	push   $0x13f3
     322:	e8 b9 fe ff ff       	call   1e0 <panic>
		printf(2, "open %s failed\n", rcmd->file);
     327:	51                   	push   %ecx
     328:	ff 73 08             	push   0x8(%ebx)
     32b:	68 0a 14 00 00       	push   $0x140a
     330:	6a 02                	push   $0x2
     332:	e8 49 0d 00 00       	call   1080 <printf>
		exit();
     337:	e8 a7 0b 00 00       	call   ee3 <exit>
		panic("pipe");
     33c:	83 ec 0c             	sub    $0xc,%esp
     33f:	68 1a 14 00 00       	push   $0x141a
     344:	e8 97 fe ff ff       	call   1e0 <panic>
		close(1);
     349:	83 ec 0c             	sub    $0xc,%esp
     34c:	6a 01                	push   $0x1
     34e:	e8 b8 0b 00 00       	call   f0b <close>
		dup(p[1]);
     353:	58                   	pop    %eax
     354:	ff 75 f4             	push   -0xc(%ebp)
     357:	e8 ff 0b 00 00       	call   f5b <dup>
		close(p[0]);
     35c:	58                   	pop    %eax
     35d:	ff 75 f0             	push   -0x10(%ebp)
     360:	e8 a6 0b 00 00       	call   f0b <close>
		close(p[1]);
     365:	58                   	pop    %eax
     366:	ff 75 f4             	push   -0xc(%ebp)
     369:	e8 9d 0b 00 00       	call   f0b <close>
		runcmd(pcmd->left);
     36e:	5a                   	pop    %edx
     36f:	ff 73 04             	push   0x4(%ebx)
     372:	e8 a9 fe ff ff       	call   220 <runcmd>
		close(0);
     377:	83 ec 0c             	sub    $0xc,%esp
     37a:	6a 00                	push   $0x0
     37c:	e8 8a 0b 00 00       	call   f0b <close>
		dup(p[0]);
     381:	5a                   	pop    %edx
     382:	ff 75 f0             	push   -0x10(%ebp)
     385:	e8 d1 0b 00 00       	call   f5b <dup>
		close(p[0]);
     38a:	59                   	pop    %ecx
     38b:	ff 75 f0             	push   -0x10(%ebp)
     38e:	e8 78 0b 00 00       	call   f0b <close>
		close(p[1]);
     393:	58                   	pop    %eax
     394:	ff 75 f4             	push   -0xc(%ebp)
     397:	e8 6f 0b 00 00       	call   f0b <close>
		runcmd(pcmd->right);
     39c:	58                   	pop    %eax
     39d:	ff 73 08             	push   0x8(%ebx)
     3a0:	e8 7b fe ff ff       	call   220 <runcmd>
     3a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003b0 <execcmd>:

//PAGEBREAK!
// Constructors

struct cmd* execcmd(void)
{
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	53                   	push   %ebx
     3b4:	83 ec 10             	sub    $0x10,%esp
	struct execcmd *cmd;

	cmd = malloc(sizeof(*cmd));
     3b7:	6a 54                	push   $0x54
     3b9:	e8 22 0f 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     3be:	83 c4 0c             	add    $0xc,%esp
     3c1:	6a 54                	push   $0x54
	cmd = malloc(sizeof(*cmd));
     3c3:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     3c5:	6a 00                	push   $0x0
     3c7:	50                   	push   %eax
     3c8:	e8 73 09 00 00       	call   d40 <memset>
	cmd->type = EXEC;
     3cd:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
	return (struct cmd*)cmd;
}
     3d3:	89 d8                	mov    %ebx,%eax
     3d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3d8:	c9                   	leave  
     3d9:	c3                   	ret    
     3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003e0 <redircmd>:

struct cmd* redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	53                   	push   %ebx
     3e4:	83 ec 10             	sub    $0x10,%esp
	struct redircmd *cmd;

	cmd = malloc(sizeof(*cmd));
     3e7:	6a 18                	push   $0x18
     3e9:	e8 f2 0e 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     3ee:	83 c4 0c             	add    $0xc,%esp
     3f1:	6a 18                	push   $0x18
	cmd = malloc(sizeof(*cmd));
     3f3:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     3f5:	6a 00                	push   $0x0
     3f7:	50                   	push   %eax
     3f8:	e8 43 09 00 00       	call   d40 <memset>
	cmd->type = REDIR;
	cmd->cmd = subcmd;
     3fd:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = REDIR;
     400:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
	cmd->cmd = subcmd;
     406:	89 43 04             	mov    %eax,0x4(%ebx)
	cmd->file = file;
     409:	8b 45 0c             	mov    0xc(%ebp),%eax
     40c:	89 43 08             	mov    %eax,0x8(%ebx)
	cmd->efile = efile;
     40f:	8b 45 10             	mov    0x10(%ebp),%eax
     412:	89 43 0c             	mov    %eax,0xc(%ebx)
	cmd->mode = mode;
     415:	8b 45 14             	mov    0x14(%ebp),%eax
     418:	89 43 10             	mov    %eax,0x10(%ebx)
	cmd->fd = fd;
     41b:	8b 45 18             	mov    0x18(%ebp),%eax
     41e:	89 43 14             	mov    %eax,0x14(%ebx)
	return (struct cmd*)cmd;
}
     421:	89 d8                	mov    %ebx,%eax
     423:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     426:	c9                   	leave  
     427:	c3                   	ret    
     428:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     42f:	90                   	nop

00000430 <pipecmd>:

struct cmd* pipecmd(struct cmd *left, struct cmd *right)
{
     430:	55                   	push   %ebp
     431:	89 e5                	mov    %esp,%ebp
     433:	53                   	push   %ebx
     434:	83 ec 10             	sub    $0x10,%esp
	struct pipecmd *cmd;

	cmd = malloc(sizeof(*cmd));
     437:	6a 0c                	push   $0xc
     439:	e8 a2 0e 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     43e:	83 c4 0c             	add    $0xc,%esp
     441:	6a 0c                	push   $0xc
	cmd = malloc(sizeof(*cmd));
     443:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     445:	6a 00                	push   $0x0
     447:	50                   	push   %eax
     448:	e8 f3 08 00 00       	call   d40 <memset>
	cmd->type = PIPE;
	cmd->left = left;
     44d:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = PIPE;
     450:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
	cmd->left = left;
     456:	89 43 04             	mov    %eax,0x4(%ebx)
	cmd->right = right;
     459:	8b 45 0c             	mov    0xc(%ebp),%eax
     45c:	89 43 08             	mov    %eax,0x8(%ebx)
	return (struct cmd*)cmd;
}
     45f:	89 d8                	mov    %ebx,%eax
     461:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     464:	c9                   	leave  
     465:	c3                   	ret    
     466:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     46d:	8d 76 00             	lea    0x0(%esi),%esi

00000470 <listcmd>:

struct cmd* listcmd(struct cmd *left, struct cmd *right)
{
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	53                   	push   %ebx
     474:	83 ec 10             	sub    $0x10,%esp
	struct listcmd *cmd;

	cmd = malloc(sizeof(*cmd));
     477:	6a 0c                	push   $0xc
     479:	e8 62 0e 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     47e:	83 c4 0c             	add    $0xc,%esp
     481:	6a 0c                	push   $0xc
	cmd = malloc(sizeof(*cmd));
     483:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     485:	6a 00                	push   $0x0
     487:	50                   	push   %eax
     488:	e8 b3 08 00 00       	call   d40 <memset>
	cmd->type = LIST;
	cmd->left = left;
     48d:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = LIST;
     490:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
	cmd->left = left;
     496:	89 43 04             	mov    %eax,0x4(%ebx)
	cmd->right = right;
     499:	8b 45 0c             	mov    0xc(%ebp),%eax
     49c:	89 43 08             	mov    %eax,0x8(%ebx)
	return (struct cmd*)cmd;
}
     49f:	89 d8                	mov    %ebx,%eax
     4a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4a4:	c9                   	leave  
     4a5:	c3                   	ret    
     4a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4ad:	8d 76 00             	lea    0x0(%esi),%esi

000004b0 <backcmd>:

struct cmd* backcmd(struct cmd *subcmd)
{
     4b0:	55                   	push   %ebp
     4b1:	89 e5                	mov    %esp,%ebp
     4b3:	53                   	push   %ebx
     4b4:	83 ec 10             	sub    $0x10,%esp
	struct backcmd *cmd;

	cmd = malloc(sizeof(*cmd));
     4b7:	6a 08                	push   $0x8
     4b9:	e8 22 0e 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     4be:	83 c4 0c             	add    $0xc,%esp
     4c1:	6a 08                	push   $0x8
	cmd = malloc(sizeof(*cmd));
     4c3:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     4c5:	6a 00                	push   $0x0
     4c7:	50                   	push   %eax
     4c8:	e8 73 08 00 00       	call   d40 <memset>
	cmd->type = BACK;
	cmd->cmd = subcmd;
     4cd:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = BACK;
     4d0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
	cmd->cmd = subcmd;
     4d6:	89 43 04             	mov    %eax,0x4(%ebx)
	return (struct cmd*)cmd;
}
     4d9:	89 d8                	mov    %ebx,%eax
     4db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4de:	c9                   	leave  
     4df:	c3                   	ret    

000004e0 <gettoken>:

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq)
{
     4e0:	55                   	push   %ebp
     4e1:	89 e5                	mov    %esp,%ebp
     4e3:	57                   	push   %edi
     4e4:	56                   	push   %esi
     4e5:	53                   	push   %ebx
     4e6:	83 ec 0c             	sub    $0xc,%esp
	char *s;
	int ret;

	s = *ps;
     4e9:	8b 45 08             	mov    0x8(%ebp),%eax
{
     4ec:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     4ef:	8b 75 10             	mov    0x10(%ebp),%esi
	s = *ps;
     4f2:	8b 38                	mov    (%eax),%edi
	while(s < es && strchr(whitespace, *s)) s++;
     4f4:	39 df                	cmp    %ebx,%edi
     4f6:	72 0f                	jb     507 <gettoken+0x27>
     4f8:	eb 25                	jmp    51f <gettoken+0x3f>
     4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     500:	83 c7 01             	add    $0x1,%edi
     503:	39 fb                	cmp    %edi,%ebx
     505:	74 18                	je     51f <gettoken+0x3f>
     507:	0f be 07             	movsbl (%edi),%eax
     50a:	83 ec 08             	sub    $0x8,%esp
     50d:	50                   	push   %eax
     50e:	68 e8 1a 00 00       	push   $0x1ae8
     513:	e8 48 08 00 00       	call   d60 <strchr>
     518:	83 c4 10             	add    $0x10,%esp
     51b:	85 c0                	test   %eax,%eax
     51d:	75 e1                	jne    500 <gettoken+0x20>
	if(q) *q = s;
     51f:	85 f6                	test   %esi,%esi
     521:	74 02                	je     525 <gettoken+0x45>
     523:	89 3e                	mov    %edi,(%esi)
	ret = *s;
     525:	0f b6 07             	movzbl (%edi),%eax
	switch(*s)
     528:	3c 3c                	cmp    $0x3c,%al
     52a:	0f 8f d0 00 00 00    	jg     600 <gettoken+0x120>
     530:	3c 3a                	cmp    $0x3a,%al
     532:	0f 8f b4 00 00 00    	jg     5ec <gettoken+0x10c>
     538:	84 c0                	test   %al,%al
     53a:	75 44                	jne    580 <gettoken+0xa0>
     53c:	31 f6                	xor    %esi,%esi
		while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
		s++;
		break;
	}

	if(eq) *eq = s;
     53e:	8b 55 14             	mov    0x14(%ebp),%edx
     541:	85 d2                	test   %edx,%edx
     543:	74 05                	je     54a <gettoken+0x6a>
     545:	8b 45 14             	mov    0x14(%ebp),%eax
     548:	89 38                	mov    %edi,(%eax)

	while(s < es && strchr(whitespace, *s)) s++;
     54a:	39 df                	cmp    %ebx,%edi
     54c:	72 09                	jb     557 <gettoken+0x77>
     54e:	eb 1f                	jmp    56f <gettoken+0x8f>
     550:	83 c7 01             	add    $0x1,%edi
     553:	39 fb                	cmp    %edi,%ebx
     555:	74 18                	je     56f <gettoken+0x8f>
     557:	0f be 07             	movsbl (%edi),%eax
     55a:	83 ec 08             	sub    $0x8,%esp
     55d:	50                   	push   %eax
     55e:	68 e8 1a 00 00       	push   $0x1ae8
     563:	e8 f8 07 00 00       	call   d60 <strchr>
     568:	83 c4 10             	add    $0x10,%esp
     56b:	85 c0                	test   %eax,%eax
     56d:	75 e1                	jne    550 <gettoken+0x70>

	*ps = s;
     56f:	8b 45 08             	mov    0x8(%ebp),%eax
     572:	89 38                	mov    %edi,(%eax)
	return ret;
}
     574:	8d 65 f4             	lea    -0xc(%ebp),%esp
     577:	89 f0                	mov    %esi,%eax
     579:	5b                   	pop    %ebx
     57a:	5e                   	pop    %esi
     57b:	5f                   	pop    %edi
     57c:	5d                   	pop    %ebp
     57d:	c3                   	ret    
     57e:	66 90                	xchg   %ax,%ax
	switch(*s)
     580:	79 5e                	jns    5e0 <gettoken+0x100>
		while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     582:	39 fb                	cmp    %edi,%ebx
     584:	77 34                	ja     5ba <gettoken+0xda>
	if(eq) *eq = s;
     586:	8b 45 14             	mov    0x14(%ebp),%eax
     589:	be 61 00 00 00       	mov    $0x61,%esi
     58e:	85 c0                	test   %eax,%eax
     590:	75 b3                	jne    545 <gettoken+0x65>
     592:	eb db                	jmp    56f <gettoken+0x8f>
     594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     598:	0f be 07             	movsbl (%edi),%eax
     59b:	83 ec 08             	sub    $0x8,%esp
     59e:	50                   	push   %eax
     59f:	68 e0 1a 00 00       	push   $0x1ae0
     5a4:	e8 b7 07 00 00       	call   d60 <strchr>
     5a9:	83 c4 10             	add    $0x10,%esp
     5ac:	85 c0                	test   %eax,%eax
     5ae:	75 22                	jne    5d2 <gettoken+0xf2>
		s++;
     5b0:	83 c7 01             	add    $0x1,%edi
		while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5b3:	39 fb                	cmp    %edi,%ebx
     5b5:	74 cf                	je     586 <gettoken+0xa6>
     5b7:	0f b6 07             	movzbl (%edi),%eax
     5ba:	83 ec 08             	sub    $0x8,%esp
     5bd:	0f be f0             	movsbl %al,%esi
     5c0:	56                   	push   %esi
     5c1:	68 e8 1a 00 00       	push   $0x1ae8
     5c6:	e8 95 07 00 00       	call   d60 <strchr>
     5cb:	83 c4 10             	add    $0x10,%esp
     5ce:	85 c0                	test   %eax,%eax
     5d0:	74 c6                	je     598 <gettoken+0xb8>
		ret = 'a';
     5d2:	be 61 00 00 00       	mov    $0x61,%esi
     5d7:	e9 62 ff ff ff       	jmp    53e <gettoken+0x5e>
     5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	switch(*s)
     5e0:	3c 26                	cmp    $0x26,%al
     5e2:	74 08                	je     5ec <gettoken+0x10c>
     5e4:	8d 48 d8             	lea    -0x28(%eax),%ecx
     5e7:	80 f9 01             	cmp    $0x1,%cl
     5ea:	77 96                	ja     582 <gettoken+0xa2>
	ret = *s;
     5ec:	0f be f0             	movsbl %al,%esi
		case '<': s++;
     5ef:	83 c7 01             	add    $0x1,%edi
		break;
     5f2:	e9 47 ff ff ff       	jmp    53e <gettoken+0x5e>
     5f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5fe:	66 90                	xchg   %ax,%ax
	switch(*s)
     600:	3c 3e                	cmp    $0x3e,%al
     602:	75 1c                	jne    620 <gettoken+0x140>
		if(*s == '>')
     604:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
		case '>': s++;
     608:	8d 47 01             	lea    0x1(%edi),%eax
		if(*s == '>')
     60b:	74 1c                	je     629 <gettoken+0x149>
		case '>': s++;
     60d:	89 c7                	mov    %eax,%edi
     60f:	be 3e 00 00 00       	mov    $0x3e,%esi
     614:	e9 25 ff ff ff       	jmp    53e <gettoken+0x5e>
     619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	switch(*s)
     620:	3c 7c                	cmp    $0x7c,%al
     622:	74 c8                	je     5ec <gettoken+0x10c>
     624:	e9 59 ff ff ff       	jmp    582 <gettoken+0xa2>
			s++;
     629:	83 c7 02             	add    $0x2,%edi
			ret = '+';
     62c:	be 2b 00 00 00       	mov    $0x2b,%esi
     631:	e9 08 ff ff ff       	jmp    53e <gettoken+0x5e>
     636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     63d:	8d 76 00             	lea    0x0(%esi),%esi

00000640 <peek>:

int peek(char **ps, char *es, char *toks)
{
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	57                   	push   %edi
     644:	56                   	push   %esi
     645:	53                   	push   %ebx
     646:	83 ec 0c             	sub    $0xc,%esp
     649:	8b 7d 08             	mov    0x8(%ebp),%edi
     64c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     64f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     651:	39 f3                	cmp    %esi,%ebx
     653:	72 12                	jb     667 <peek+0x27>
     655:	eb 28                	jmp    67f <peek+0x3f>
     657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     65e:	66 90                	xchg   %ax,%ax
    s++;
     660:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     663:	39 de                	cmp    %ebx,%esi
     665:	74 18                	je     67f <peek+0x3f>
     667:	0f be 03             	movsbl (%ebx),%eax
     66a:	83 ec 08             	sub    $0x8,%esp
     66d:	50                   	push   %eax
     66e:	68 e8 1a 00 00       	push   $0x1ae8
     673:	e8 e8 06 00 00       	call   d60 <strchr>
     678:	83 c4 10             	add    $0x10,%esp
     67b:	85 c0                	test   %eax,%eax
     67d:	75 e1                	jne    660 <peek+0x20>
  *ps = s;
     67f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     681:	0f be 03             	movsbl (%ebx),%eax
     684:	31 d2                	xor    %edx,%edx
     686:	84 c0                	test   %al,%al
     688:	75 0e                	jne    698 <peek+0x58>
}
     68a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     68d:	89 d0                	mov    %edx,%eax
     68f:	5b                   	pop    %ebx
     690:	5e                   	pop    %esi
     691:	5f                   	pop    %edi
     692:	5d                   	pop    %ebp
     693:	c3                   	ret    
     694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     698:	83 ec 08             	sub    $0x8,%esp
     69b:	50                   	push   %eax
     69c:	ff 75 10             	push   0x10(%ebp)
     69f:	e8 bc 06 00 00       	call   d60 <strchr>
     6a4:	83 c4 10             	add    $0x10,%esp
     6a7:	31 d2                	xor    %edx,%edx
     6a9:	85 c0                	test   %eax,%eax
     6ab:	0f 95 c2             	setne  %dl
}
     6ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6b1:	5b                   	pop    %ebx
     6b2:	89 d0                	mov    %edx,%eax
     6b4:	5e                   	pop    %esi
     6b5:	5f                   	pop    %edi
     6b6:	5d                   	pop    %ebp
     6b7:	c3                   	ret    
     6b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6bf:	90                   	nop

000006c0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     6c0:	55                   	push   %ebp
     6c1:	89 e5                	mov    %esp,%ebp
     6c3:	57                   	push   %edi
     6c4:	56                   	push   %esi
     6c5:	53                   	push   %ebx
     6c6:	83 ec 2c             	sub    $0x2c,%esp
     6c9:	8b 75 0c             	mov    0xc(%ebp),%esi
     6cc:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6cf:	90                   	nop
     6d0:	83 ec 04             	sub    $0x4,%esp
     6d3:	68 3c 14 00 00       	push   $0x143c
     6d8:	53                   	push   %ebx
     6d9:	56                   	push   %esi
     6da:	e8 61 ff ff ff       	call   640 <peek>
     6df:	83 c4 10             	add    $0x10,%esp
     6e2:	85 c0                	test   %eax,%eax
     6e4:	0f 84 f6 00 00 00    	je     7e0 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     6ea:	6a 00                	push   $0x0
     6ec:	6a 00                	push   $0x0
     6ee:	53                   	push   %ebx
     6ef:	56                   	push   %esi
     6f0:	e8 eb fd ff ff       	call   4e0 <gettoken>
     6f5:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     6f7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     6fa:	50                   	push   %eax
     6fb:	8d 45 e0             	lea    -0x20(%ebp),%eax
     6fe:	50                   	push   %eax
     6ff:	53                   	push   %ebx
     700:	56                   	push   %esi
     701:	e8 da fd ff ff       	call   4e0 <gettoken>
     706:	83 c4 20             	add    $0x20,%esp
     709:	83 f8 61             	cmp    $0x61,%eax
     70c:	0f 85 d9 00 00 00    	jne    7eb <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     712:	83 ff 3c             	cmp    $0x3c,%edi
     715:	74 69                	je     780 <parseredirs+0xc0>
     717:	83 ff 3e             	cmp    $0x3e,%edi
     71a:	74 05                	je     721 <parseredirs+0x61>
     71c:	83 ff 2b             	cmp    $0x2b,%edi
     71f:	75 af                	jne    6d0 <parseredirs+0x10>
	cmd = malloc(sizeof(*cmd));
     721:	83 ec 0c             	sub    $0xc,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     724:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     727:	8b 4d e0             	mov    -0x20(%ebp),%ecx
	cmd = malloc(sizeof(*cmd));
     72a:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     72c:	89 55 d0             	mov    %edx,-0x30(%ebp)
     72f:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
	cmd = malloc(sizeof(*cmd));
     732:	e8 a9 0b 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     737:	83 c4 0c             	add    $0xc,%esp
     73a:	6a 18                	push   $0x18
	cmd = malloc(sizeof(*cmd));
     73c:	89 c7                	mov    %eax,%edi
	memset(cmd, 0, sizeof(*cmd));
     73e:	6a 00                	push   $0x0
     740:	50                   	push   %eax
     741:	e8 fa 05 00 00       	call   d40 <memset>
	cmd->type = REDIR;
     746:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
	cmd->cmd = subcmd;
     74c:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     74f:	83 c4 10             	add    $0x10,%esp
	cmd->cmd = subcmd;
     752:	89 47 04             	mov    %eax,0x4(%edi)
	cmd->file = file;
     755:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     758:	89 4f 08             	mov    %ecx,0x8(%edi)
	cmd->efile = efile;
     75b:	8b 55 d0             	mov    -0x30(%ebp),%edx
	cmd->mode = mode;
     75e:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
	cmd->efile = efile;
     765:	89 57 0c             	mov    %edx,0xc(%edi)
	cmd->fd = fd;
     768:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     76f:	89 7d 08             	mov    %edi,0x8(%ebp)
     772:	e9 59 ff ff ff       	jmp    6d0 <parseredirs+0x10>
     777:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     77e:	66 90                	xchg   %ax,%ax
	cmd = malloc(sizeof(*cmd));
     780:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     783:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     786:	8b 4d e0             	mov    -0x20(%ebp),%ecx
	cmd = malloc(sizeof(*cmd));
     789:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     78b:	89 55 d0             	mov    %edx,-0x30(%ebp)
     78e:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
	cmd = malloc(sizeof(*cmd));
     791:	e8 4a 0b 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     796:	83 c4 0c             	add    $0xc,%esp
     799:	6a 18                	push   $0x18
	cmd = malloc(sizeof(*cmd));
     79b:	89 c7                	mov    %eax,%edi
	memset(cmd, 0, sizeof(*cmd));
     79d:	6a 00                	push   $0x0
     79f:	50                   	push   %eax
     7a0:	e8 9b 05 00 00       	call   d40 <memset>
	cmd->cmd = subcmd;
     7a5:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->file = file;
     7a8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     7ab:	89 7d 08             	mov    %edi,0x8(%ebp)
	cmd->efile = efile;
     7ae:	8b 55 d0             	mov    -0x30(%ebp),%edx
	cmd->type = REDIR;
     7b1:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     7b7:	83 c4 10             	add    $0x10,%esp
	cmd->cmd = subcmd;
     7ba:	89 47 04             	mov    %eax,0x4(%edi)
	cmd->file = file;
     7bd:	89 4f 08             	mov    %ecx,0x8(%edi)
	cmd->efile = efile;
     7c0:	89 57 0c             	mov    %edx,0xc(%edi)
	cmd->mode = mode;
     7c3:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
	cmd->fd = fd;
     7ca:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     7d1:	e9 fa fe ff ff       	jmp    6d0 <parseredirs+0x10>
     7d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7dd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     7e0:	8b 45 08             	mov    0x8(%ebp),%eax
     7e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7e6:	5b                   	pop    %ebx
     7e7:	5e                   	pop    %esi
     7e8:	5f                   	pop    %edi
     7e9:	5d                   	pop    %ebp
     7ea:	c3                   	ret    
      panic("missing file for redirection");
     7eb:	83 ec 0c             	sub    $0xc,%esp
     7ee:	68 1f 14 00 00       	push   $0x141f
     7f3:	e8 e8 f9 ff ff       	call   1e0 <panic>
     7f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7ff:	90                   	nop

00000800 <parseexec.part.0>:
  cmd = parseredirs(cmd, ps, es);
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
     800:	55                   	push   %ebp
     801:	89 e5                	mov    %esp,%ebp
     803:	57                   	push   %edi
     804:	89 d7                	mov    %edx,%edi
     806:	56                   	push   %esi
     807:	89 c6                	mov    %eax,%esi
     809:	53                   	push   %ebx
     80a:	83 ec 38             	sub    $0x38,%esp
	cmd = malloc(sizeof(*cmd));
     80d:	6a 54                	push   $0x54
     80f:	e8 cc 0a 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     814:	83 c4 0c             	add    $0xc,%esp
     817:	6a 54                	push   $0x54
	cmd = malloc(sizeof(*cmd));
     819:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     81b:	6a 00                	push   $0x0
     81d:	50                   	push   %eax
	cmd = malloc(sizeof(*cmd));
     81e:	89 45 d0             	mov    %eax,-0x30(%ebp)
	memset(cmd, 0, sizeof(*cmd));
     821:	e8 1a 05 00 00       	call   d40 <memset>

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     826:	83 c4 0c             	add    $0xc,%esp
	cmd->type = EXEC;
     829:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  ret = parseredirs(ret, ps, es);
     82f:	57                   	push   %edi
     830:	56                   	push   %esi
     831:	53                   	push   %ebx
  argc = 0;
     832:	31 db                	xor    %ebx,%ebx
  ret = parseredirs(ret, ps, es);
     834:	e8 87 fe ff ff       	call   6c0 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     839:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     83c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     83f:	eb 1a                	jmp    85b <parseexec.part.0+0x5b>
     841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     848:	83 ec 04             	sub    $0x4,%esp
     84b:	57                   	push   %edi
     84c:	56                   	push   %esi
     84d:	ff 75 d4             	push   -0x2c(%ebp)
     850:	e8 6b fe ff ff       	call   6c0 <parseredirs>
     855:	83 c4 10             	add    $0x10,%esp
     858:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     85b:	83 ec 04             	sub    $0x4,%esp
     85e:	68 54 14 00 00       	push   $0x1454
     863:	57                   	push   %edi
     864:	56                   	push   %esi
     865:	e8 d6 fd ff ff       	call   640 <peek>
     86a:	83 c4 10             	add    $0x10,%esp
     86d:	85 c0                	test   %eax,%eax
     86f:	75 47                	jne    8b8 <parseexec.part.0+0xb8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     871:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     874:	50                   	push   %eax
     875:	8d 45 e0             	lea    -0x20(%ebp),%eax
     878:	50                   	push   %eax
     879:	57                   	push   %edi
     87a:	56                   	push   %esi
     87b:	e8 60 fc ff ff       	call   4e0 <gettoken>
     880:	83 c4 10             	add    $0x10,%esp
     883:	85 c0                	test   %eax,%eax
     885:	74 31                	je     8b8 <parseexec.part.0+0xb8>
    if(tok != 'a')
     887:	83 f8 61             	cmp    $0x61,%eax
     88a:	75 4a                	jne    8d6 <parseexec.part.0+0xd6>
    cmd->argv[argc] = q;
     88c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     88f:	8b 4d d0             	mov    -0x30(%ebp),%ecx
     892:	89 44 99 04          	mov    %eax,0x4(%ecx,%ebx,4)
    cmd->eargv[argc] = eq;
     896:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     899:	89 44 99 2c          	mov    %eax,0x2c(%ecx,%ebx,4)
    argc++;
     89d:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     8a0:	83 fb 0a             	cmp    $0xa,%ebx
     8a3:	75 a3                	jne    848 <parseexec.part.0+0x48>
      panic("too many args");
     8a5:	83 ec 0c             	sub    $0xc,%esp
     8a8:	68 46 14 00 00       	push   $0x1446
     8ad:	e8 2e f9 ff ff       	call   1e0 <panic>
     8b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  cmd->argv[argc] = 0;
     8b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     8bb:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     8c2:	00 
  cmd->eargv[argc] = 0;
     8c3:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     8ca:	00 
  return ret;
}
     8cb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     8ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8d1:	5b                   	pop    %ebx
     8d2:	5e                   	pop    %esi
     8d3:	5f                   	pop    %edi
     8d4:	5d                   	pop    %ebp
     8d5:	c3                   	ret    
      panic("syntax");
     8d6:	83 ec 0c             	sub    $0xc,%esp
     8d9:	68 3f 14 00 00       	push   $0x143f
     8de:	e8 fd f8 ff ff       	call   1e0 <panic>
     8e3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008f0 <parseblock>:
{
     8f0:	55                   	push   %ebp
     8f1:	89 e5                	mov    %esp,%ebp
     8f3:	57                   	push   %edi
     8f4:	56                   	push   %esi
     8f5:	53                   	push   %ebx
     8f6:	83 ec 10             	sub    $0x10,%esp
     8f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     8ff:	68 59 14 00 00       	push   $0x1459
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	e8 35 fd ff ff       	call   640 <peek>
     90b:	83 c4 10             	add    $0x10,%esp
     90e:	85 c0                	test   %eax,%eax
     910:	74 4a                	je     95c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     912:	6a 00                	push   $0x0
     914:	6a 00                	push   $0x0
     916:	56                   	push   %esi
     917:	53                   	push   %ebx
     918:	e8 c3 fb ff ff       	call   4e0 <gettoken>
  cmd = parseline(ps, es);
     91d:	58                   	pop    %eax
     91e:	5a                   	pop    %edx
     91f:	56                   	push   %esi
     920:	53                   	push   %ebx
     921:	e8 1a 01 00 00       	call   a40 <parseline>
  if(!peek(ps, es, ")"))
     926:	83 c4 0c             	add    $0xc,%esp
     929:	68 77 14 00 00       	push   $0x1477
  cmd = parseline(ps, es);
     92e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     930:	56                   	push   %esi
     931:	53                   	push   %ebx
     932:	e8 09 fd ff ff       	call   640 <peek>
     937:	83 c4 10             	add    $0x10,%esp
     93a:	85 c0                	test   %eax,%eax
     93c:	74 2b                	je     969 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     93e:	6a 00                	push   $0x0
     940:	6a 00                	push   $0x0
     942:	56                   	push   %esi
     943:	53                   	push   %ebx
     944:	e8 97 fb ff ff       	call   4e0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     949:	83 c4 0c             	add    $0xc,%esp
     94c:	56                   	push   %esi
     94d:	53                   	push   %ebx
     94e:	57                   	push   %edi
     94f:	e8 6c fd ff ff       	call   6c0 <parseredirs>
}
     954:	8d 65 f4             	lea    -0xc(%ebp),%esp
     957:	5b                   	pop    %ebx
     958:	5e                   	pop    %esi
     959:	5f                   	pop    %edi
     95a:	5d                   	pop    %ebp
     95b:	c3                   	ret    
    panic("parseblock");
     95c:	83 ec 0c             	sub    $0xc,%esp
     95f:	68 5b 14 00 00       	push   $0x145b
     964:	e8 77 f8 ff ff       	call   1e0 <panic>
    panic("syntax - missing )");
     969:	83 ec 0c             	sub    $0xc,%esp
     96c:	68 66 14 00 00       	push   $0x1466
     971:	e8 6a f8 ff ff       	call   1e0 <panic>
     976:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     97d:	8d 76 00             	lea    0x0(%esi),%esi

00000980 <parsepipe>:
{
     980:	55                   	push   %ebp
     981:	89 e5                	mov    %esp,%ebp
     983:	57                   	push   %edi
     984:	56                   	push   %esi
     985:	53                   	push   %ebx
     986:	83 ec 10             	sub    $0x10,%esp
     989:	8b 75 08             	mov    0x8(%ebp),%esi
     98c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(peek(ps, es, "("))
     98f:	68 59 14 00 00       	push   $0x1459
     994:	57                   	push   %edi
     995:	56                   	push   %esi
     996:	e8 a5 fc ff ff       	call   640 <peek>
     99b:	83 c4 10             	add    $0x10,%esp
     99e:	85 c0                	test   %eax,%eax
     9a0:	75 2e                	jne    9d0 <parsepipe+0x50>
     9a2:	89 fa                	mov    %edi,%edx
     9a4:	89 f0                	mov    %esi,%eax
     9a6:	e8 55 fe ff ff       	call   800 <parseexec.part.0>
     9ab:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     9ad:	83 ec 04             	sub    $0x4,%esp
     9b0:	68 79 14 00 00       	push   $0x1479
     9b5:	57                   	push   %edi
     9b6:	56                   	push   %esi
     9b7:	e8 84 fc ff ff       	call   640 <peek>
     9bc:	83 c4 10             	add    $0x10,%esp
     9bf:	85 c0                	test   %eax,%eax
     9c1:	75 25                	jne    9e8 <parsepipe+0x68>
}
     9c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c6:	89 d8                	mov    %ebx,%eax
     9c8:	5b                   	pop    %ebx
     9c9:	5e                   	pop    %esi
     9ca:	5f                   	pop    %edi
     9cb:	5d                   	pop    %ebp
     9cc:	c3                   	ret    
     9cd:	8d 76 00             	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     9d0:	83 ec 08             	sub    $0x8,%esp
     9d3:	57                   	push   %edi
     9d4:	56                   	push   %esi
     9d5:	e8 16 ff ff ff       	call   8f0 <parseblock>
     9da:	83 c4 10             	add    $0x10,%esp
     9dd:	89 c3                	mov    %eax,%ebx
     9df:	eb cc                	jmp    9ad <parsepipe+0x2d>
     9e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     9e8:	6a 00                	push   $0x0
     9ea:	6a 00                	push   $0x0
     9ec:	57                   	push   %edi
     9ed:	56                   	push   %esi
     9ee:	e8 ed fa ff ff       	call   4e0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     9f3:	58                   	pop    %eax
     9f4:	5a                   	pop    %edx
     9f5:	57                   	push   %edi
     9f6:	56                   	push   %esi
     9f7:	e8 84 ff ff ff       	call   980 <parsepipe>
	cmd = malloc(sizeof(*cmd));
     9fc:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a03:	89 c7                	mov    %eax,%edi
	cmd = malloc(sizeof(*cmd));
     a05:	e8 d6 08 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     a0a:	83 c4 0c             	add    $0xc,%esp
     a0d:	6a 0c                	push   $0xc
	cmd = malloc(sizeof(*cmd));
     a0f:	89 c6                	mov    %eax,%esi
	memset(cmd, 0, sizeof(*cmd));
     a11:	6a 00                	push   $0x0
     a13:	50                   	push   %eax
     a14:	e8 27 03 00 00       	call   d40 <memset>
	cmd->left = left;
     a19:	89 5e 04             	mov    %ebx,0x4(%esi)
	cmd->right = right;
     a1c:	83 c4 10             	add    $0x10,%esp
     a1f:	89 f3                	mov    %esi,%ebx
	cmd->type = PIPE;
     a21:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     a27:	89 d8                	mov    %ebx,%eax
	cmd->right = right;
     a29:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a2f:	5b                   	pop    %ebx
     a30:	5e                   	pop    %esi
     a31:	5f                   	pop    %edi
     a32:	5d                   	pop    %ebp
     a33:	c3                   	ret    
     a34:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a3f:	90                   	nop

00000a40 <parseline>:
{
     a40:	55                   	push   %ebp
     a41:	89 e5                	mov    %esp,%ebp
     a43:	57                   	push   %edi
     a44:	56                   	push   %esi
     a45:	53                   	push   %ebx
     a46:	83 ec 24             	sub    $0x24,%esp
     a49:	8b 75 08             	mov    0x8(%ebp),%esi
     a4c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     a4f:	57                   	push   %edi
     a50:	56                   	push   %esi
     a51:	e8 2a ff ff ff       	call   980 <parsepipe>
  while(peek(ps, es, "&")){
     a56:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     a59:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     a5b:	eb 3b                	jmp    a98 <parseline+0x58>
     a5d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     a60:	6a 00                	push   $0x0
     a62:	6a 00                	push   $0x0
     a64:	57                   	push   %edi
     a65:	56                   	push   %esi
     a66:	e8 75 fa ff ff       	call   4e0 <gettoken>
	cmd = malloc(sizeof(*cmd));
     a6b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     a72:	e8 69 08 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     a77:	83 c4 0c             	add    $0xc,%esp
     a7a:	6a 08                	push   $0x8
     a7c:	6a 00                	push   $0x0
     a7e:	50                   	push   %eax
     a7f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     a82:	e8 b9 02 00 00       	call   d40 <memset>
	cmd->type = BACK;
     a87:	8b 55 e4             	mov    -0x1c(%ebp),%edx
	cmd->cmd = subcmd;
     a8a:	83 c4 10             	add    $0x10,%esp
	cmd->type = BACK;
     a8d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
	cmd->cmd = subcmd;
     a93:	89 5a 04             	mov    %ebx,0x4(%edx)
     a96:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     a98:	83 ec 04             	sub    $0x4,%esp
     a9b:	68 7b 14 00 00       	push   $0x147b
     aa0:	57                   	push   %edi
     aa1:	56                   	push   %esi
     aa2:	e8 99 fb ff ff       	call   640 <peek>
     aa7:	83 c4 10             	add    $0x10,%esp
     aaa:	85 c0                	test   %eax,%eax
     aac:	75 b2                	jne    a60 <parseline+0x20>
  if(peek(ps, es, ";")){
     aae:	83 ec 04             	sub    $0x4,%esp
     ab1:	68 57 14 00 00       	push   $0x1457
     ab6:	57                   	push   %edi
     ab7:	56                   	push   %esi
     ab8:	e8 83 fb ff ff       	call   640 <peek>
     abd:	83 c4 10             	add    $0x10,%esp
     ac0:	85 c0                	test   %eax,%eax
     ac2:	75 0c                	jne    ad0 <parseline+0x90>
}
     ac4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ac7:	89 d8                	mov    %ebx,%eax
     ac9:	5b                   	pop    %ebx
     aca:	5e                   	pop    %esi
     acb:	5f                   	pop    %edi
     acc:	5d                   	pop    %ebp
     acd:	c3                   	ret    
     ace:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     ad0:	6a 00                	push   $0x0
     ad2:	6a 00                	push   $0x0
     ad4:	57                   	push   %edi
     ad5:	56                   	push   %esi
     ad6:	e8 05 fa ff ff       	call   4e0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     adb:	58                   	pop    %eax
     adc:	5a                   	pop    %edx
     add:	57                   	push   %edi
     ade:	56                   	push   %esi
     adf:	e8 5c ff ff ff       	call   a40 <parseline>
	cmd = malloc(sizeof(*cmd));
     ae4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     aeb:	89 c7                	mov    %eax,%edi
	cmd = malloc(sizeof(*cmd));
     aed:	e8 ee 07 00 00       	call   12e0 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     af2:	83 c4 0c             	add    $0xc,%esp
     af5:	6a 0c                	push   $0xc
	cmd = malloc(sizeof(*cmd));
     af7:	89 c6                	mov    %eax,%esi
	memset(cmd, 0, sizeof(*cmd));
     af9:	6a 00                	push   $0x0
     afb:	50                   	push   %eax
     afc:	e8 3f 02 00 00       	call   d40 <memset>
	cmd->left = left;
     b01:	89 5e 04             	mov    %ebx,0x4(%esi)
	cmd->right = right;
     b04:	83 c4 10             	add    $0x10,%esp
     b07:	89 f3                	mov    %esi,%ebx
	cmd->type = LIST;
     b09:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     b0f:	89 d8                	mov    %ebx,%eax
	cmd->right = right;
     b11:	89 7e 08             	mov    %edi,0x8(%esi)
}
     b14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b17:	5b                   	pop    %ebx
     b18:	5e                   	pop    %esi
     b19:	5f                   	pop    %edi
     b1a:	5d                   	pop    %ebp
     b1b:	c3                   	ret    
     b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b20 <parseexec>:
{
     b20:	55                   	push   %ebp
     b21:	89 e5                	mov    %esp,%ebp
     b23:	56                   	push   %esi
     b24:	53                   	push   %ebx
     b25:	8b 75 0c             	mov    0xc(%ebp),%esi
     b28:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(peek(ps, es, "("))
     b2b:	83 ec 04             	sub    $0x4,%esp
     b2e:	68 59 14 00 00       	push   $0x1459
     b33:	56                   	push   %esi
     b34:	53                   	push   %ebx
     b35:	e8 06 fb ff ff       	call   640 <peek>
     b3a:	83 c4 10             	add    $0x10,%esp
     b3d:	85 c0                	test   %eax,%eax
     b3f:	75 0f                	jne    b50 <parseexec+0x30>
}
     b41:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b44:	89 f2                	mov    %esi,%edx
     b46:	89 d8                	mov    %ebx,%eax
     b48:	5b                   	pop    %ebx
     b49:	5e                   	pop    %esi
     b4a:	5d                   	pop    %ebp
     b4b:	e9 b0 fc ff ff       	jmp    800 <parseexec.part.0>
    return parseblock(ps, es);
     b50:	89 75 0c             	mov    %esi,0xc(%ebp)
     b53:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     b56:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b59:	5b                   	pop    %ebx
     b5a:	5e                   	pop    %esi
     b5b:	5d                   	pop    %ebp
    return parseblock(ps, es);
     b5c:	e9 8f fd ff ff       	jmp    8f0 <parseblock>
     b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b6f:	90                   	nop

00000b70 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd* nulterminate(struct cmd *cmd)
{
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	53                   	push   %ebx
     b74:	83 ec 04             	sub    $0x4,%esp
     b77:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     b7a:	85 db                	test   %ebx,%ebx
     b7c:	0f 84 8e 00 00 00    	je     c10 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
     b82:	83 3b 05             	cmpl   $0x5,(%ebx)
     b85:	77 61                	ja     be8 <nulterminate+0x78>
     b87:	8b 03                	mov    (%ebx),%eax
     b89:	ff 24 85 c0 14 00 00 	jmp    *0x14c0(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     b90:	83 ec 0c             	sub    $0xc,%esp
     b93:	ff 73 04             	push   0x4(%ebx)
     b96:	e8 d5 ff ff ff       	call   b70 <nulterminate>
    nulterminate(lcmd->right);
     b9b:	58                   	pop    %eax
     b9c:	ff 73 08             	push   0x8(%ebx)
     b9f:	e8 cc ff ff ff       	call   b70 <nulterminate>
    break;
     ba4:	83 c4 10             	add    $0x10,%esp
     ba7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ba9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bac:	c9                   	leave  
     bad:	c3                   	ret    
     bae:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     bb0:	83 ec 0c             	sub    $0xc,%esp
     bb3:	ff 73 04             	push   0x4(%ebx)
     bb6:	e8 b5 ff ff ff       	call   b70 <nulterminate>
    break;
     bbb:	89 d8                	mov    %ebx,%eax
     bbd:	83 c4 10             	add    $0x10,%esp
}
     bc0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bc3:	c9                   	leave  
     bc4:	c3                   	ret    
     bc5:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     bc8:	8b 4b 04             	mov    0x4(%ebx),%ecx
     bcb:	8d 43 08             	lea    0x8(%ebx),%eax
     bce:	85 c9                	test   %ecx,%ecx
     bd0:	74 16                	je     be8 <nulterminate+0x78>
     bd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     bd8:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     bdb:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     bde:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     be1:	8b 50 fc             	mov    -0x4(%eax),%edx
     be4:	85 d2                	test   %edx,%edx
     be6:	75 f0                	jne    bd8 <nulterminate+0x68>
  switch(cmd->type){
     be8:	89 d8                	mov    %ebx,%eax
}
     bea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bed:	c9                   	leave  
     bee:	c3                   	ret    
     bef:	90                   	nop
    nulterminate(rcmd->cmd);
     bf0:	83 ec 0c             	sub    $0xc,%esp
     bf3:	ff 73 04             	push   0x4(%ebx)
     bf6:	e8 75 ff ff ff       	call   b70 <nulterminate>
    *rcmd->efile = 0;
     bfb:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     bfe:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     c01:	c6 00 00             	movb   $0x0,(%eax)
    break;
     c04:	89 d8                	mov    %ebx,%eax
}
     c06:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c09:	c9                   	leave  
     c0a:	c3                   	ret    
     c0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c0f:	90                   	nop
    return 0;
     c10:	31 c0                	xor    %eax,%eax
     c12:	eb 95                	jmp    ba9 <nulterminate+0x39>
     c14:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c1f:	90                   	nop

00000c20 <parsecmd>:
{
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	57                   	push   %edi
     c24:	56                   	push   %esi
  cmd = parseline(&s, es);
     c25:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     c28:	53                   	push   %ebx
     c29:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     c2c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     c2f:	53                   	push   %ebx
     c30:	e8 db 00 00 00       	call   d10 <strlen>
  cmd = parseline(&s, es);
     c35:	59                   	pop    %ecx
     c36:	5e                   	pop    %esi
  es = s + strlen(s);
     c37:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     c39:	53                   	push   %ebx
     c3a:	57                   	push   %edi
     c3b:	e8 00 fe ff ff       	call   a40 <parseline>
  peek(&s, es, "");
     c40:	83 c4 0c             	add    $0xc,%esp
     c43:	68 09 14 00 00       	push   $0x1409
  cmd = parseline(&s, es);
     c48:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     c4a:	53                   	push   %ebx
     c4b:	57                   	push   %edi
     c4c:	e8 ef f9 ff ff       	call   640 <peek>
  if(s != es){
     c51:	8b 45 08             	mov    0x8(%ebp),%eax
     c54:	83 c4 10             	add    $0x10,%esp
     c57:	39 d8                	cmp    %ebx,%eax
     c59:	75 13                	jne    c6e <parsecmd+0x4e>
  nulterminate(cmd);
     c5b:	83 ec 0c             	sub    $0xc,%esp
     c5e:	56                   	push   %esi
     c5f:	e8 0c ff ff ff       	call   b70 <nulterminate>
}
     c64:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c67:	89 f0                	mov    %esi,%eax
     c69:	5b                   	pop    %ebx
     c6a:	5e                   	pop    %esi
     c6b:	5f                   	pop    %edi
     c6c:	5d                   	pop    %ebp
     c6d:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     c6e:	52                   	push   %edx
     c6f:	50                   	push   %eax
     c70:	68 7d 14 00 00       	push   $0x147d
     c75:	6a 02                	push   $0x2
     c77:	e8 04 04 00 00       	call   1080 <printf>
    panic("syntax");
     c7c:	c7 04 24 3f 14 00 00 	movl   $0x143f,(%esp)
     c83:	e8 58 f5 ff ff       	call   1e0 <panic>
     c88:	66 90                	xchg   %ax,%ax
     c8a:	66 90                	xchg   %ax,%ax
     c8c:	66 90                	xchg   %ax,%ax
     c8e:	66 90                	xchg   %ax,%ax

00000c90 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     c90:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     c91:	31 c0                	xor    %eax,%eax
{
     c93:	89 e5                	mov    %esp,%ebp
     c95:	53                   	push   %ebx
     c96:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c99:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     ca0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     ca4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     ca7:	83 c0 01             	add    $0x1,%eax
     caa:	84 d2                	test   %dl,%dl
     cac:	75 f2                	jne    ca0 <strcpy+0x10>
    ;
  return os;
}
     cae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     cb1:	89 c8                	mov    %ecx,%eax
     cb3:	c9                   	leave  
     cb4:	c3                   	ret    
     cb5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000cc0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     cc0:	55                   	push   %ebp
     cc1:	89 e5                	mov    %esp,%ebp
     cc3:	53                   	push   %ebx
     cc4:	8b 4d 08             	mov    0x8(%ebp),%ecx
     cc7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     cca:	0f b6 01             	movzbl (%ecx),%eax
     ccd:	0f b6 1a             	movzbl (%edx),%ebx
     cd0:	84 c0                	test   %al,%al
     cd2:	75 1d                	jne    cf1 <strcmp+0x31>
     cd4:	eb 2a                	jmp    d00 <strcmp+0x40>
     cd6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cdd:	8d 76 00             	lea    0x0(%esi),%esi
     ce0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
     ce4:	83 c1 01             	add    $0x1,%ecx
     ce7:	83 c2 01             	add    $0x1,%edx
  return (uchar)*p - (uchar)*q;
     cea:	0f b6 1a             	movzbl (%edx),%ebx
  while(*p && *p == *q)
     ced:	84 c0                	test   %al,%al
     cef:	74 0f                	je     d00 <strcmp+0x40>
     cf1:	38 d8                	cmp    %bl,%al
     cf3:	74 eb                	je     ce0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     cf5:	29 d8                	sub    %ebx,%eax
}
     cf7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     cfa:	c9                   	leave  
     cfb:	c3                   	ret    
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d00:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     d02:	29 d8                	sub    %ebx,%eax
}
     d04:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d07:	c9                   	leave  
     d08:	c3                   	ret    
     d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d10 <strlen>:

uint
strlen(const char *s)
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     d16:	80 3a 00             	cmpb   $0x0,(%edx)
     d19:	74 15                	je     d30 <strlen+0x20>
     d1b:	31 c0                	xor    %eax,%eax
     d1d:	8d 76 00             	lea    0x0(%esi),%esi
     d20:	83 c0 01             	add    $0x1,%eax
     d23:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     d27:	89 c1                	mov    %eax,%ecx
     d29:	75 f5                	jne    d20 <strlen+0x10>
    ;
  return n;
}
     d2b:	89 c8                	mov    %ecx,%eax
     d2d:	5d                   	pop    %ebp
     d2e:	c3                   	ret    
     d2f:	90                   	nop
  for(n = 0; s[n]; n++)
     d30:	31 c9                	xor    %ecx,%ecx
}
     d32:	5d                   	pop    %ebp
     d33:	89 c8                	mov    %ecx,%eax
     d35:	c3                   	ret    
     d36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d3d:	8d 76 00             	lea    0x0(%esi),%esi

00000d40 <memset>:

void*
memset(void *dst, int c, uint n)
{
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	57                   	push   %edi
     d44:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     d47:	8b 4d 10             	mov    0x10(%ebp),%ecx
     d4a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d4d:	89 d7                	mov    %edx,%edi
     d4f:	fc                   	cld    
     d50:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     d52:	8b 7d fc             	mov    -0x4(%ebp),%edi
     d55:	89 d0                	mov    %edx,%eax
     d57:	c9                   	leave  
     d58:	c3                   	ret    
     d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d60 <strchr>:

char*
strchr(const char *s, char c)
{
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	8b 45 08             	mov    0x8(%ebp),%eax
     d66:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     d6a:	0f b6 10             	movzbl (%eax),%edx
     d6d:	84 d2                	test   %dl,%dl
     d6f:	75 12                	jne    d83 <strchr+0x23>
     d71:	eb 1d                	jmp    d90 <strchr+0x30>
     d73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d77:	90                   	nop
     d78:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     d7c:	83 c0 01             	add    $0x1,%eax
     d7f:	84 d2                	test   %dl,%dl
     d81:	74 0d                	je     d90 <strchr+0x30>
    if(*s == c)
     d83:	38 d1                	cmp    %dl,%cl
     d85:	75 f1                	jne    d78 <strchr+0x18>
      return (char*)s;
  return 0;
}
     d87:	5d                   	pop    %ebp
     d88:	c3                   	ret    
     d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     d90:	31 c0                	xor    %eax,%eax
}
     d92:	5d                   	pop    %ebp
     d93:	c3                   	ret    
     d94:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d9f:	90                   	nop

00000da0 <gets>:

char*
gets(char *buf, int max)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	57                   	push   %edi
     da4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     da5:	31 f6                	xor    %esi,%esi
{
     da7:	53                   	push   %ebx
     da8:	89 f3                	mov    %esi,%ebx
     daa:	83 ec 1c             	sub    $0x1c,%esp
     dad:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
     db0:	eb 2f                	jmp    de1 <gets+0x41>
     db2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
     db8:	83 ec 04             	sub    $0x4,%esp
     dbb:	8d 45 e7             	lea    -0x19(%ebp),%eax
     dbe:	6a 01                	push   $0x1
     dc0:	50                   	push   %eax
     dc1:	6a 00                	push   $0x0
     dc3:	e8 33 01 00 00       	call   efb <read>
    if(cc < 1)
     dc8:	83 c4 10             	add    $0x10,%esp
     dcb:	85 c0                	test   %eax,%eax
     dcd:	7e 1c                	jle    deb <gets+0x4b>
      break;
    buf[i++] = c;
     dcf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    if(c == '\n' || c == '\r')
     dd3:	83 c7 01             	add    $0x1,%edi
    buf[i++] = c;
     dd6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     dd9:	3c 0a                	cmp    $0xa,%al
     ddb:	74 23                	je     e00 <gets+0x60>
     ddd:	3c 0d                	cmp    $0xd,%al
     ddf:	74 1f                	je     e00 <gets+0x60>
  for(i=0; i+1 < max; ){
     de1:	83 c3 01             	add    $0x1,%ebx
    buf[i++] = c;
     de4:	89 fe                	mov    %edi,%esi
  for(i=0; i+1 < max; ){
     de6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     de9:	7c cd                	jl     db8 <gets+0x18>
     deb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     ded:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     df0:	c6 03 00             	movb   $0x0,(%ebx)
}
     df3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     df6:	5b                   	pop    %ebx
     df7:	5e                   	pop    %esi
     df8:	5f                   	pop    %edi
     df9:	5d                   	pop    %ebp
     dfa:	c3                   	ret    
     dfb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     dff:	90                   	nop
  buf[i] = '\0';
     e00:	8b 75 08             	mov    0x8(%ebp),%esi
}
     e03:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     e06:	01 de                	add    %ebx,%esi
     e08:	89 f3                	mov    %esi,%ebx
     e0a:	c6 03 00             	movb   $0x0,(%ebx)
}
     e0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e10:	5b                   	pop    %ebx
     e11:	5e                   	pop    %esi
     e12:	5f                   	pop    %edi
     e13:	5d                   	pop    %ebp
     e14:	c3                   	ret    
     e15:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e20 <stat>:

int
stat(const char *n, struct stat *st)
{
     e20:	55                   	push   %ebp
     e21:	89 e5                	mov    %esp,%ebp
     e23:	56                   	push   %esi
     e24:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e25:	83 ec 08             	sub    $0x8,%esp
     e28:	6a 00                	push   $0x0
     e2a:	ff 75 08             	push   0x8(%ebp)
     e2d:	e8 f1 00 00 00       	call   f23 <open>
  if(fd < 0)
     e32:	83 c4 10             	add    $0x10,%esp
     e35:	85 c0                	test   %eax,%eax
     e37:	78 27                	js     e60 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     e39:	83 ec 08             	sub    $0x8,%esp
     e3c:	ff 75 0c             	push   0xc(%ebp)
     e3f:	89 c3                	mov    %eax,%ebx
     e41:	50                   	push   %eax
     e42:	e8 f4 00 00 00       	call   f3b <fstat>
  close(fd);
     e47:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     e4a:	89 c6                	mov    %eax,%esi
  close(fd);
     e4c:	e8 ba 00 00 00       	call   f0b <close>
  return r;
     e51:	83 c4 10             	add    $0x10,%esp
}
     e54:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e57:	89 f0                	mov    %esi,%eax
     e59:	5b                   	pop    %ebx
     e5a:	5e                   	pop    %esi
     e5b:	5d                   	pop    %ebp
     e5c:	c3                   	ret    
     e5d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     e60:	be ff ff ff ff       	mov    $0xffffffff,%esi
     e65:	eb ed                	jmp    e54 <stat+0x34>
     e67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e6e:	66 90                	xchg   %ax,%ax

00000e70 <atoi>:

int
atoi(const char *s)
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	53                   	push   %ebx
     e74:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     e77:	0f be 02             	movsbl (%edx),%eax
     e7a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     e7d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     e80:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     e85:	77 1e                	ja     ea5 <atoi+0x35>
     e87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e8e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     e90:	83 c2 01             	add    $0x1,%edx
     e93:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     e96:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     e9a:	0f be 02             	movsbl (%edx),%eax
     e9d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     ea0:	80 fb 09             	cmp    $0x9,%bl
     ea3:	76 eb                	jbe    e90 <atoi+0x20>
  return n;
}
     ea5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ea8:	89 c8                	mov    %ecx,%eax
     eaa:	c9                   	leave  
     eab:	c3                   	ret    
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000eb0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	8b 45 10             	mov    0x10(%ebp),%eax
     eb7:	8b 55 08             	mov    0x8(%ebp),%edx
     eba:	56                   	push   %esi
     ebb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     ebe:	85 c0                	test   %eax,%eax
     ec0:	7e 13                	jle    ed5 <memmove+0x25>
     ec2:	01 d0                	add    %edx,%eax
  dst = vdst;
     ec4:	89 d7                	mov    %edx,%edi
     ec6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ecd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     ed0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     ed1:	39 f8                	cmp    %edi,%eax
     ed3:	75 fb                	jne    ed0 <memmove+0x20>
  return vdst;
}
     ed5:	5e                   	pop    %esi
     ed6:	89 d0                	mov    %edx,%eax
     ed8:	5f                   	pop    %edi
     ed9:	5d                   	pop    %ebp
     eda:	c3                   	ret    

00000edb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     edb:	b8 01 00 00 00       	mov    $0x1,%eax
     ee0:	cd 40                	int    $0x40
     ee2:	c3                   	ret    

00000ee3 <exit>:
SYSCALL(exit)
     ee3:	b8 02 00 00 00       	mov    $0x2,%eax
     ee8:	cd 40                	int    $0x40
     eea:	c3                   	ret    

00000eeb <wait>:
SYSCALL(wait)
     eeb:	b8 03 00 00 00       	mov    $0x3,%eax
     ef0:	cd 40                	int    $0x40
     ef2:	c3                   	ret    

00000ef3 <pipe>:
SYSCALL(pipe)
     ef3:	b8 04 00 00 00       	mov    $0x4,%eax
     ef8:	cd 40                	int    $0x40
     efa:	c3                   	ret    

00000efb <read>:
SYSCALL(read)
     efb:	b8 05 00 00 00       	mov    $0x5,%eax
     f00:	cd 40                	int    $0x40
     f02:	c3                   	ret    

00000f03 <write>:
SYSCALL(write)
     f03:	b8 10 00 00 00       	mov    $0x10,%eax
     f08:	cd 40                	int    $0x40
     f0a:	c3                   	ret    

00000f0b <close>:
SYSCALL(close)
     f0b:	b8 15 00 00 00       	mov    $0x15,%eax
     f10:	cd 40                	int    $0x40
     f12:	c3                   	ret    

00000f13 <kill>:
SYSCALL(kill)
     f13:	b8 06 00 00 00       	mov    $0x6,%eax
     f18:	cd 40                	int    $0x40
     f1a:	c3                   	ret    

00000f1b <exec>:
SYSCALL(exec)
     f1b:	b8 07 00 00 00       	mov    $0x7,%eax
     f20:	cd 40                	int    $0x40
     f22:	c3                   	ret    

00000f23 <open>:
SYSCALL(open)
     f23:	b8 0f 00 00 00       	mov    $0xf,%eax
     f28:	cd 40                	int    $0x40
     f2a:	c3                   	ret    

00000f2b <mknod>:
SYSCALL(mknod)
     f2b:	b8 11 00 00 00       	mov    $0x11,%eax
     f30:	cd 40                	int    $0x40
     f32:	c3                   	ret    

00000f33 <unlink>:
SYSCALL(unlink)
     f33:	b8 12 00 00 00       	mov    $0x12,%eax
     f38:	cd 40                	int    $0x40
     f3a:	c3                   	ret    

00000f3b <fstat>:
SYSCALL(fstat)
     f3b:	b8 08 00 00 00       	mov    $0x8,%eax
     f40:	cd 40                	int    $0x40
     f42:	c3                   	ret    

00000f43 <link>:
SYSCALL(link)
     f43:	b8 13 00 00 00       	mov    $0x13,%eax
     f48:	cd 40                	int    $0x40
     f4a:	c3                   	ret    

00000f4b <mkdir>:
SYSCALL(mkdir)
     f4b:	b8 14 00 00 00       	mov    $0x14,%eax
     f50:	cd 40                	int    $0x40
     f52:	c3                   	ret    

00000f53 <chdir>:
SYSCALL(chdir)
     f53:	b8 09 00 00 00       	mov    $0x9,%eax
     f58:	cd 40                	int    $0x40
     f5a:	c3                   	ret    

00000f5b <dup>:
SYSCALL(dup)
     f5b:	b8 0a 00 00 00       	mov    $0xa,%eax
     f60:	cd 40                	int    $0x40
     f62:	c3                   	ret    

00000f63 <getpid>:
SYSCALL(getpid)
     f63:	b8 0b 00 00 00       	mov    $0xb,%eax
     f68:	cd 40                	int    $0x40
     f6a:	c3                   	ret    

00000f6b <sbrk>:
SYSCALL(sbrk)
     f6b:	b8 0c 00 00 00       	mov    $0xc,%eax
     f70:	cd 40                	int    $0x40
     f72:	c3                   	ret    

00000f73 <sleep>:
SYSCALL(sleep)
     f73:	b8 0d 00 00 00       	mov    $0xd,%eax
     f78:	cd 40                	int    $0x40
     f7a:	c3                   	ret    

00000f7b <uptime>:
SYSCALL(uptime)
     f7b:	b8 0e 00 00 00       	mov    $0xe,%eax
     f80:	cd 40                	int    $0x40
     f82:	c3                   	ret    

00000f83 <date>:
SYSCALL(date)
     f83:	b8 16 00 00 00       	mov    $0x16,%eax
     f88:	cd 40                	int    $0x40
     f8a:	c3                   	ret    

00000f8b <w>:
SYSCALL(w)
     f8b:	b8 17 00 00 00       	mov    $0x17,%eax
     f90:	cd 40                	int    $0x40
     f92:	c3                   	ret    

00000f93 <login>:
SYSCALL(login)
     f93:	b8 18 00 00 00       	mov    $0x18,%eax
     f98:	cd 40                	int    $0x40
     f9a:	c3                   	ret    

00000f9b <user>:
SYSCALL(user)
     f9b:	b8 19 00 00 00       	mov    $0x19,%eax
     fa0:	cd 40                	int    $0x40
     fa2:	c3                   	ret    

00000fa3 <attempt_login>:
SYSCALL(attempt_login)
     fa3:	b8 1a 00 00 00       	mov    $0x1a,%eax
     fa8:	cd 40                	int    $0x40
     faa:	c3                   	ret    

00000fab <su>:
SYSCALL(su)
     fab:	b8 1b 00 00 00       	mov    $0x1b,%eax
     fb0:	cd 40                	int    $0x40
     fb2:	c3                   	ret    

00000fb3 <adduser>:
SYSCALL(adduser)
     fb3:	b8 1c 00 00 00       	mov    $0x1c,%eax
     fb8:	cd 40                	int    $0x40
     fba:	c3                   	ret    

00000fbb <passwd>:
SYSCALL(passwd)
     fbb:	b8 1d 00 00 00       	mov    $0x1d,%eax
     fc0:	cd 40                	int    $0x40
     fc2:	c3                   	ret    
     fc3:	66 90                	xchg   %ax,%ax
     fc5:	66 90                	xchg   %ax,%ax
     fc7:	66 90                	xchg   %ax,%ax
     fc9:	66 90                	xchg   %ax,%ax
     fcb:	66 90                	xchg   %ax,%ax
     fcd:	66 90                	xchg   %ax,%ax
     fcf:	90                   	nop

00000fd0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     fd0:	55                   	push   %ebp
     fd1:	89 e5                	mov    %esp,%ebp
     fd3:	57                   	push   %edi
     fd4:	56                   	push   %esi
     fd5:	53                   	push   %ebx
     fd6:	83 ec 3c             	sub    $0x3c,%esp
     fd9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     fdc:	89 d1                	mov    %edx,%ecx
{
     fde:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     fe1:	85 d2                	test   %edx,%edx
     fe3:	0f 89 7f 00 00 00    	jns    1068 <printint+0x98>
     fe9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     fed:	74 79                	je     1068 <printint+0x98>
    neg = 1;
     fef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     ff6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     ff8:	31 db                	xor    %ebx,%ebx
     ffa:	8d 75 d7             	lea    -0x29(%ebp),%esi
     ffd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1000:	89 c8                	mov    %ecx,%eax
    1002:	31 d2                	xor    %edx,%edx
    1004:	89 cf                	mov    %ecx,%edi
    1006:	f7 75 c4             	divl   -0x3c(%ebp)
    1009:	0f b6 92 e0 14 00 00 	movzbl 0x14e0(%edx),%edx
    1010:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1013:	89 d8                	mov    %ebx,%eax
    1015:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1018:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    101b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    101e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1021:	76 dd                	jbe    1000 <printint+0x30>
  if(neg)
    1023:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1026:	85 c9                	test   %ecx,%ecx
    1028:	74 0c                	je     1036 <printint+0x66>
    buf[i++] = '-';
    102a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    102f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1031:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1036:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1039:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    103d:	eb 07                	jmp    1046 <printint+0x76>
    103f:	90                   	nop
    putc(fd, buf[i]);
    1040:	0f b6 13             	movzbl (%ebx),%edx
    1043:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1046:	83 ec 04             	sub    $0x4,%esp
    1049:	88 55 d7             	mov    %dl,-0x29(%ebp)
    104c:	6a 01                	push   $0x1
    104e:	56                   	push   %esi
    104f:	57                   	push   %edi
    1050:	e8 ae fe ff ff       	call   f03 <write>
  while(--i >= 0)
    1055:	83 c4 10             	add    $0x10,%esp
    1058:	39 de                	cmp    %ebx,%esi
    105a:	75 e4                	jne    1040 <printint+0x70>
}
    105c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    105f:	5b                   	pop    %ebx
    1060:	5e                   	pop    %esi
    1061:	5f                   	pop    %edi
    1062:	5d                   	pop    %ebp
    1063:	c3                   	ret    
    1064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1068:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    106f:	eb 87                	jmp    ff8 <printint+0x28>
    1071:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1078:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    107f:	90                   	nop

00001080 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	57                   	push   %edi
    1084:	56                   	push   %esi
    1085:	53                   	push   %ebx
    1086:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1089:	8b 75 0c             	mov    0xc(%ebp),%esi
    108c:	0f b6 1e             	movzbl (%esi),%ebx
    108f:	84 db                	test   %bl,%bl
    1091:	0f 84 b8 00 00 00    	je     114f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    1097:	8d 45 10             	lea    0x10(%ebp),%eax
    109a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    109d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    10a0:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    10a2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    10a5:	eb 37                	jmp    10de <printf+0x5e>
    10a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ae:	66 90                	xchg   %ax,%ax
    10b0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    10b3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    10b8:	83 f8 25             	cmp    $0x25,%eax
    10bb:	74 17                	je     10d4 <printf+0x54>
  write(fd, &c, 1);
    10bd:	83 ec 04             	sub    $0x4,%esp
    10c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
    10c3:	6a 01                	push   $0x1
    10c5:	57                   	push   %edi
    10c6:	ff 75 08             	push   0x8(%ebp)
    10c9:	e8 35 fe ff ff       	call   f03 <write>
    10ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    10d1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    10d4:	0f b6 1e             	movzbl (%esi),%ebx
    10d7:	83 c6 01             	add    $0x1,%esi
    10da:	84 db                	test   %bl,%bl
    10dc:	74 71                	je     114f <printf+0xcf>
    c = fmt[i] & 0xff;
    10de:	0f be cb             	movsbl %bl,%ecx
    10e1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    10e4:	85 d2                	test   %edx,%edx
    10e6:	74 c8                	je     10b0 <printf+0x30>
      }
    } else if(state == '%'){
    10e8:	83 fa 25             	cmp    $0x25,%edx
    10eb:	75 e7                	jne    10d4 <printf+0x54>
      if(c == 'd'){
    10ed:	83 f8 64             	cmp    $0x64,%eax
    10f0:	0f 84 9a 00 00 00    	je     1190 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    10f6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    10fc:	83 f9 70             	cmp    $0x70,%ecx
    10ff:	74 5f                	je     1160 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1101:	83 f8 73             	cmp    $0x73,%eax
    1104:	0f 84 d6 00 00 00    	je     11e0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    110a:	83 f8 63             	cmp    $0x63,%eax
    110d:	0f 84 8d 00 00 00    	je     11a0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1113:	83 f8 25             	cmp    $0x25,%eax
    1116:	0f 84 b4 00 00 00    	je     11d0 <printf+0x150>
  write(fd, &c, 1);
    111c:	83 ec 04             	sub    $0x4,%esp
    111f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1123:	6a 01                	push   $0x1
    1125:	57                   	push   %edi
    1126:	ff 75 08             	push   0x8(%ebp)
    1129:	e8 d5 fd ff ff       	call   f03 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    112e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1131:	83 c4 0c             	add    $0xc,%esp
    1134:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
    1136:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1139:	57                   	push   %edi
    113a:	ff 75 08             	push   0x8(%ebp)
    113d:	e8 c1 fd ff ff       	call   f03 <write>
  for(i = 0; fmt[i]; i++){
    1142:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1146:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1149:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    114b:	84 db                	test   %bl,%bl
    114d:	75 8f                	jne    10de <printf+0x5e>
    }
  }
}
    114f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1152:	5b                   	pop    %ebx
    1153:	5e                   	pop    %esi
    1154:	5f                   	pop    %edi
    1155:	5d                   	pop    %ebp
    1156:	c3                   	ret    
    1157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1160:	83 ec 0c             	sub    $0xc,%esp
    1163:	b9 10 00 00 00       	mov    $0x10,%ecx
    1168:	6a 00                	push   $0x0
    116a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    116d:	8b 45 08             	mov    0x8(%ebp),%eax
    1170:	8b 13                	mov    (%ebx),%edx
    1172:	e8 59 fe ff ff       	call   fd0 <printint>
        ap++;
    1177:	89 d8                	mov    %ebx,%eax
    1179:	83 c4 10             	add    $0x10,%esp
      state = 0;
    117c:	31 d2                	xor    %edx,%edx
        ap++;
    117e:	83 c0 04             	add    $0x4,%eax
    1181:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1184:	e9 4b ff ff ff       	jmp    10d4 <printf+0x54>
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1190:	83 ec 0c             	sub    $0xc,%esp
    1193:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1198:	6a 01                	push   $0x1
    119a:	eb ce                	jmp    116a <printf+0xea>
    119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    11a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    11a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    11a6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    11a8:	6a 01                	push   $0x1
        ap++;
    11aa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    11ad:	57                   	push   %edi
    11ae:	ff 75 08             	push   0x8(%ebp)
        putc(fd, *ap);
    11b1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    11b4:	e8 4a fd ff ff       	call   f03 <write>
        ap++;
    11b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    11bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
    11bf:	31 d2                	xor    %edx,%edx
    11c1:	e9 0e ff ff ff       	jmp    10d4 <printf+0x54>
    11c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    11d0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    11d3:	83 ec 04             	sub    $0x4,%esp
    11d6:	e9 59 ff ff ff       	jmp    1134 <printf+0xb4>
    11db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11df:	90                   	nop
        s = (char*)*ap;
    11e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    11e3:	8b 18                	mov    (%eax),%ebx
        ap++;
    11e5:	83 c0 04             	add    $0x4,%eax
    11e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    11eb:	85 db                	test   %ebx,%ebx
    11ed:	74 17                	je     1206 <printf+0x186>
        while(*s != 0){
    11ef:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    11f2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    11f4:	84 c0                	test   %al,%al
    11f6:	0f 84 d8 fe ff ff    	je     10d4 <printf+0x54>
    11fc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    11ff:	89 de                	mov    %ebx,%esi
    1201:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1204:	eb 1a                	jmp    1220 <printf+0x1a0>
          s = "(null)";
    1206:	bb d8 14 00 00       	mov    $0x14d8,%ebx
        while(*s != 0){
    120b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    120e:	b8 28 00 00 00       	mov    $0x28,%eax
    1213:	89 de                	mov    %ebx,%esi
    1215:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1218:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    121f:	90                   	nop
  write(fd, &c, 1);
    1220:	83 ec 04             	sub    $0x4,%esp
          s++;
    1223:	83 c6 01             	add    $0x1,%esi
    1226:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1229:	6a 01                	push   $0x1
    122b:	57                   	push   %edi
    122c:	53                   	push   %ebx
    122d:	e8 d1 fc ff ff       	call   f03 <write>
        while(*s != 0){
    1232:	0f b6 06             	movzbl (%esi),%eax
    1235:	83 c4 10             	add    $0x10,%esp
    1238:	84 c0                	test   %al,%al
    123a:	75 e4                	jne    1220 <printf+0x1a0>
      state = 0;
    123c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    123f:	31 d2                	xor    %edx,%edx
    1241:	e9 8e fe ff ff       	jmp    10d4 <printf+0x54>
    1246:	66 90                	xchg   %ax,%ax
    1248:	66 90                	xchg   %ax,%ax
    124a:	66 90                	xchg   %ax,%ax
    124c:	66 90                	xchg   %ax,%ax
    124e:	66 90                	xchg   %ax,%ax

00001250 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1250:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1251:	a1 64 1b 00 00       	mov    0x1b64,%eax
{
    1256:	89 e5                	mov    %esp,%ebp
    1258:	57                   	push   %edi
    1259:	56                   	push   %esi
    125a:	53                   	push   %ebx
    125b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    125e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1268:	89 c2                	mov    %eax,%edx
    126a:	8b 00                	mov    (%eax),%eax
    126c:	39 ca                	cmp    %ecx,%edx
    126e:	73 30                	jae    12a0 <free+0x50>
    1270:	39 c1                	cmp    %eax,%ecx
    1272:	72 04                	jb     1278 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1274:	39 c2                	cmp    %eax,%edx
    1276:	72 f0                	jb     1268 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1278:	8b 73 fc             	mov    -0x4(%ebx),%esi
    127b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    127e:	39 f8                	cmp    %edi,%eax
    1280:	74 30                	je     12b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1282:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    1285:	8b 42 04             	mov    0x4(%edx),%eax
    1288:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    128b:	39 f1                	cmp    %esi,%ecx
    128d:	74 3a                	je     12c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    128f:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
    1291:	5b                   	pop    %ebx
  freep = p;
    1292:	89 15 64 1b 00 00    	mov    %edx,0x1b64
}
    1298:	5e                   	pop    %esi
    1299:	5f                   	pop    %edi
    129a:	5d                   	pop    %ebp
    129b:	c3                   	ret    
    129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12a0:	39 c2                	cmp    %eax,%edx
    12a2:	72 c4                	jb     1268 <free+0x18>
    12a4:	39 c1                	cmp    %eax,%ecx
    12a6:	73 c0                	jae    1268 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    12a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12ae:	39 f8                	cmp    %edi,%eax
    12b0:	75 d0                	jne    1282 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    12b2:	03 70 04             	add    0x4(%eax),%esi
    12b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    12b8:	8b 02                	mov    (%edx),%eax
    12ba:	8b 00                	mov    (%eax),%eax
    12bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    12bf:	8b 42 04             	mov    0x4(%edx),%eax
    12c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    12c5:	39 f1                	cmp    %esi,%ecx
    12c7:	75 c6                	jne    128f <free+0x3f>
    p->s.size += bp->s.size;
    12c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    12cc:	89 15 64 1b 00 00    	mov    %edx,0x1b64
    p->s.size += bp->s.size;
    12d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    12d5:	8b 43 f8             	mov    -0x8(%ebx),%eax
    12d8:	89 02                	mov    %eax,(%edx)
}
    12da:	5b                   	pop    %ebx
    12db:	5e                   	pop    %esi
    12dc:	5f                   	pop    %edi
    12dd:	5d                   	pop    %ebp
    12de:	c3                   	ret    
    12df:	90                   	nop

000012e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	57                   	push   %edi
    12e4:	56                   	push   %esi
    12e5:	53                   	push   %ebx
    12e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    12ec:	8b 3d 64 1b 00 00    	mov    0x1b64,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12f2:	8d 70 07             	lea    0x7(%eax),%esi
    12f5:	c1 ee 03             	shr    $0x3,%esi
    12f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    12fb:	85 ff                	test   %edi,%edi
    12fd:	0f 84 ad 00 00 00    	je     13b0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1303:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1305:	8b 48 04             	mov    0x4(%eax),%ecx
    1308:	39 f1                	cmp    %esi,%ecx
    130a:	73 71                	jae    137d <malloc+0x9d>
    130c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1312:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1317:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    131a:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1321:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1324:	eb 1b                	jmp    1341 <malloc+0x61>
    1326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    132d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1330:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1332:	8b 4a 04             	mov    0x4(%edx),%ecx
    1335:	39 f1                	cmp    %esi,%ecx
    1337:	73 4f                	jae    1388 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1339:	8b 3d 64 1b 00 00    	mov    0x1b64,%edi
    133f:	89 d0                	mov    %edx,%eax
    1341:	39 c7                	cmp    %eax,%edi
    1343:	75 eb                	jne    1330 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1345:	83 ec 0c             	sub    $0xc,%esp
    1348:	ff 75 e4             	push   -0x1c(%ebp)
    134b:	e8 1b fc ff ff       	call   f6b <sbrk>
  if(p == (char*)-1)
    1350:	83 c4 10             	add    $0x10,%esp
    1353:	83 f8 ff             	cmp    $0xffffffff,%eax
    1356:	74 1b                	je     1373 <malloc+0x93>
  hp->s.size = nu;
    1358:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    135b:	83 ec 0c             	sub    $0xc,%esp
    135e:	83 c0 08             	add    $0x8,%eax
    1361:	50                   	push   %eax
    1362:	e8 e9 fe ff ff       	call   1250 <free>
  return freep;
    1367:	a1 64 1b 00 00       	mov    0x1b64,%eax
      if((p = morecore(nunits)) == 0)
    136c:	83 c4 10             	add    $0x10,%esp
    136f:	85 c0                	test   %eax,%eax
    1371:	75 bd                	jne    1330 <malloc+0x50>
        return 0;
  }
}
    1373:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1376:	31 c0                	xor    %eax,%eax
}
    1378:	5b                   	pop    %ebx
    1379:	5e                   	pop    %esi
    137a:	5f                   	pop    %edi
    137b:	5d                   	pop    %ebp
    137c:	c3                   	ret    
    if(p->s.size >= nunits){
    137d:	89 c2                	mov    %eax,%edx
    137f:	89 f8                	mov    %edi,%eax
    1381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1388:	39 ce                	cmp    %ecx,%esi
    138a:	74 54                	je     13e0 <malloc+0x100>
        p->s.size -= nunits;
    138c:	29 f1                	sub    %esi,%ecx
    138e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1391:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1394:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1397:	a3 64 1b 00 00       	mov    %eax,0x1b64
}
    139c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    139f:	8d 42 08             	lea    0x8(%edx),%eax
}
    13a2:	5b                   	pop    %ebx
    13a3:	5e                   	pop    %esi
    13a4:	5f                   	pop    %edi
    13a5:	5d                   	pop    %ebp
    13a6:	c3                   	ret    
    13a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ae:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    13b0:	c7 05 64 1b 00 00 68 	movl   $0x1b68,0x1b64
    13b7:	1b 00 00 
    base.s.size = 0;
    13ba:	bf 68 1b 00 00       	mov    $0x1b68,%edi
    base.s.ptr = freep = prevp = &base;
    13bf:	c7 05 68 1b 00 00 68 	movl   $0x1b68,0x1b68
    13c6:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13c9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    13cb:	c7 05 6c 1b 00 00 00 	movl   $0x0,0x1b6c
    13d2:	00 00 00 
    if(p->s.size >= nunits){
    13d5:	e9 32 ff ff ff       	jmp    130c <malloc+0x2c>
    13da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    13e0:	8b 0a                	mov    (%edx),%ecx
    13e2:	89 08                	mov    %ecx,(%eax)
    13e4:	eb b1                	jmp    1397 <malloc+0xb7>
