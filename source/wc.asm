
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	be 01 00 00 00       	mov    $0x1,%esi
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  21:	83 f8 01             	cmp    $0x1,%eax
{
  24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(argc <= 1){
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 0b 04 00 00       	call   447 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	85 c0                	test   %eax,%eax
  41:	89 c7                	mov    %eax,%edi
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
    wc(fd, argv[i]);
  4d:	50                   	push   %eax
  4e:	83 c3 04             	add    $0x4,%ebx
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 d1 03 00 00       	call   42f <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 9c 03 00 00       	call   407 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 0b 09 00 00       	push   $0x90b
  73:	6a 01                	push   $0x1
  75:	e8 16 05 00 00       	call   590 <printf>
      exit();
  7a:	e8 88 03 00 00       	call   407 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 fd 08 00 00       	push   $0x8fd
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 75 03 00 00       	call   407 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  l = w = c = 0;
  a6:	31 db                	xor    %ebx,%ebx
{
  a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  b9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 60 0c 00 00       	push   $0xc60
  cd:	ff 75 08             	pushl  0x8(%ebp)
  d0:	e8 4a 03 00 00       	call   41f <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	83 f8 00             	cmp    $0x0,%eax
  db:	89 c6                	mov    %eax,%esi
  dd:	7e 61                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  df:	31 ff                	xor    %edi,%edi
  e1:	eb 13                	jmp    f6 <wc+0x56>
  e3:	90                   	nop
  e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        inword = 0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  ef:	83 c7 01             	add    $0x1,%edi
  f2:	39 fe                	cmp    %edi,%esi
  f4:	74 42                	je     138 <wc+0x98>
      if(buf[i] == '\n')
  f6:	0f be 87 60 0c 00 00 	movsbl 0xc60(%edi),%eax
        l++;
  fd:	31 c9                	xor    %ecx,%ecx
  ff:	3c 0a                	cmp    $0xa,%al
 101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 104:	83 ec 08             	sub    $0x8,%esp
 107:	50                   	push   %eax
 108:	68 e8 08 00 00       	push   $0x8e8
        l++;
 10d:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10f:	e8 3c 01 00 00       	call   250 <strchr>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	75 cd                	jne    e8 <wc+0x48>
      else if(!inword){
 11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11e:	85 d2                	test   %edx,%edx
 120:	75 cd                	jne    ef <wc+0x4f>
    for(i=0; i<n; i++){
 122:	83 c7 01             	add    $0x1,%edi
        w++;
 125:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
 129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 130:	39 fe                	cmp    %edi,%esi
 132:	75 c2                	jne    f6 <wc+0x56>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 138:	01 75 e0             	add    %esi,-0x20(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 140:	75 24                	jne    166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 142:	83 ec 08             	sub    $0x8,%esp
 145:	ff 75 0c             	pushl  0xc(%ebp)
 148:	ff 75 e0             	pushl  -0x20(%ebp)
 14b:	ff 75 dc             	pushl  -0x24(%ebp)
 14e:	53                   	push   %ebx
 14f:	68 fe 08 00 00       	push   $0x8fe
 154:	6a 01                	push   $0x1
 156:	e8 35 04 00 00       	call   590 <printf>
}
 15b:	83 c4 20             	add    $0x20,%esp
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
    printf(1, "wc: read error\n");
 166:	50                   	push   %eax
 167:	50                   	push   %eax
 168:	68 ee 08 00 00       	push   $0x8ee
 16d:	6a 01                	push   $0x1
 16f:	e8 1c 04 00 00       	call   590 <printf>
    exit();
 174:	e8 8e 02 00 00       	call   407 <exit>
 179:	66 90                	xchg   %ax,%ax
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 45 08             	mov    0x8(%ebp),%eax
 187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 18a:	89 c2                	mov    %eax,%edx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 190:	83 c1 01             	add    $0x1,%ecx
 193:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 197:	83 c2 01             	add    $0x1,%edx
 19a:	84 db                	test   %bl,%bl
 19c:	88 5a ff             	mov    %bl,-0x1(%edx)
 19f:	75 ef                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 1a1:	5b                   	pop    %ebx
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    
 1a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	0f b6 19             	movzbl (%ecx),%ebx
 1c0:	84 c0                	test   %al,%al
 1c2:	75 1c                	jne    1e0 <strcmp+0x30>
 1c4:	eb 2a                	jmp    1f0 <strcmp+0x40>
 1c6:	8d 76 00             	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1d0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1d6:	83 c1 01             	add    $0x1,%ecx
 1d9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 1dc:	84 c0                	test   %al,%al
 1de:	74 10                	je     1f0 <strcmp+0x40>
 1e0:	38 d8                	cmp    %bl,%al
 1e2:	74 ec                	je     1d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1e4:	29 d8                	sub    %ebx,%eax
}
 1e6:	5b                   	pop    %ebx
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1f2:	29 d8                	sub    %ebx,%eax
}
 1f4:	5b                   	pop    %ebx
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <strlen>:

uint
strlen(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 206:	80 39 00             	cmpb   $0x0,(%ecx)
 209:	74 15                	je     220 <strlen+0x20>
 20b:	31 d2                	xor    %edx,%edx
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	83 c2 01             	add    $0x1,%edx
 213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 217:	89 d0                	mov    %edx,%eax
 219:	75 f5                	jne    210 <strlen+0x10>
    ;
  return n;
}
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 22a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld    
 240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 242:	89 d0                	mov    %edx,%eax
 244:	5f                   	pop    %edi
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	84 d2                	test   %dl,%dl
 25f:	74 1d                	je     27e <strchr+0x2e>
    if(*s == c)
 261:	38 d3                	cmp    %dl,%bl
 263:	89 d9                	mov    %ebx,%ecx
 265:	75 0d                	jne    274 <strchr+0x24>
 267:	eb 17                	jmp    280 <strchr+0x30>
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 270:	38 ca                	cmp    %cl,%dl
 272:	74 0c                	je     280 <strchr+0x30>
  for(; *s; s++)
 274:	83 c0 01             	add    $0x1,%eax
 277:	0f b6 10             	movzbl (%eax),%edx
 27a:	84 d2                	test   %dl,%dl
 27c:	75 f2                	jne    270 <strchr+0x20>
      return (char*)s;
  return 0;
 27e:	31 c0                	xor    %eax,%eax
}
 280:	5b                   	pop    %ebx
 281:	5d                   	pop    %ebp
 282:	c3                   	ret    
 283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
 295:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 296:	31 f6                	xor    %esi,%esi
 298:	89 f3                	mov    %esi,%ebx
{
 29a:	83 ec 1c             	sub    $0x1c,%esp
 29d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2a0:	eb 2f                	jmp    2d1 <gets+0x41>
 2a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2ab:	83 ec 04             	sub    $0x4,%esp
 2ae:	6a 01                	push   $0x1
 2b0:	50                   	push   %eax
 2b1:	6a 00                	push   $0x0
 2b3:	e8 67 01 00 00       	call   41f <read>
    if(cc < 1)
 2b8:	83 c4 10             	add    $0x10,%esp
 2bb:	85 c0                	test   %eax,%eax
 2bd:	7e 1c                	jle    2db <gets+0x4b>
      break;
    buf[i++] = c;
 2bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c3:	83 c7 01             	add    $0x1,%edi
 2c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2c9:	3c 0a                	cmp    $0xa,%al
 2cb:	74 23                	je     2f0 <gets+0x60>
 2cd:	3c 0d                	cmp    $0xd,%al
 2cf:	74 1f                	je     2f0 <gets+0x60>
  for(i=0; i+1 < max; ){
 2d1:	83 c3 01             	add    $0x1,%ebx
 2d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2d7:	89 fe                	mov    %edi,%esi
 2d9:	7c cd                	jl     2a8 <gets+0x18>
 2db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2e0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e6:	5b                   	pop    %ebx
 2e7:	5e                   	pop    %esi
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	90                   	nop
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f0:	8b 75 08             	mov    0x8(%ebp),%esi
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	01 de                	add    %ebx,%esi
 2f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2fa:	c6 03 00             	movb   $0x0,(%ebx)
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	pushl  0x8(%ebp)
 31d:	e8 25 01 00 00       	call   447 <open>
  if(fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	pushl  0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 28 01 00 00       	call   45f <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 ee 00 00 00       	call   42f <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	89 f6                	mov    %esi,%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 11             	movsbl (%ecx),%edx
 36a:	8d 42 d0             	lea    -0x30(%edx),%eax
 36d:	3c 09                	cmp    $0x9,%al
  n = 0;
 36f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 374:	77 1f                	ja     395 <atoi+0x35>
 376:	8d 76 00             	lea    0x0(%esi),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 380:	8d 04 80             	lea    (%eax,%eax,4),%eax
 383:	83 c1 01             	add    $0x1,%ecx
 386:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 38a:	0f be 11             	movsbl (%ecx),%edx
 38d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	5b                   	pop    %ebx
 396:	5d                   	pop    %ebp
 397:	c3                   	ret    
 398:	90                   	nop
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
 3a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ae:	85 db                	test   %ebx,%ebx
 3b0:	7e 14                	jle    3c6 <memmove+0x26>
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 3c2:	39 d3                	cmp    %edx,%ebx
 3c4:	75 f2                	jne    3b8 <memmove+0x18>
  return vdst;
}
 3c6:	5b                   	pop    %ebx
 3c7:	5e                   	pop    %esi
 3c8:	5d                   	pop    %ebp
 3c9:	c3                   	ret    
 3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003d0 <delay>:

void delay(int numberOfClocks)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	83 ec 04             	sub    $0x4,%esp
    int firstClock = uptime();
 3d7:	e8 c3 00 00 00       	call   49f <uptime>
 3dc:	89 c3                	mov    %eax,%ebx
    int incClock = uptime();
 3de:	e8 bc 00 00 00       	call   49f <uptime>
    while(incClock >= (firstClock + numberOfClocks) )
 3e3:	03 5d 08             	add    0x8(%ebp),%ebx
 3e6:	39 d8                	cmp    %ebx,%eax
 3e8:	7c 0f                	jl     3f9 <delay+0x29>
 3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    {
        incClock = uptime();
 3f0:	e8 aa 00 00 00       	call   49f <uptime>
    while(incClock >= (firstClock + numberOfClocks) )
 3f5:	39 d8                	cmp    %ebx,%eax
 3f7:	7d f7                	jge    3f0 <delay+0x20>
    }
}
 3f9:	83 c4 04             	add    $0x4,%esp
 3fc:	5b                   	pop    %ebx
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret    

000003ff <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ff:	b8 01 00 00 00       	mov    $0x1,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <exit>:
SYSCALL(exit)
 407:	b8 02 00 00 00       	mov    $0x2,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <wait>:
SYSCALL(wait)
 40f:	b8 03 00 00 00       	mov    $0x3,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <pipe>:
SYSCALL(pipe)
 417:	b8 04 00 00 00       	mov    $0x4,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <read>:
SYSCALL(read)
 41f:	b8 05 00 00 00       	mov    $0x5,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <write>:
SYSCALL(write)
 427:	b8 10 00 00 00       	mov    $0x10,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <close>:
SYSCALL(close)
 42f:	b8 15 00 00 00       	mov    $0x15,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <kill>:
SYSCALL(kill)
 437:	b8 06 00 00 00       	mov    $0x6,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <exec>:
SYSCALL(exec)
 43f:	b8 07 00 00 00       	mov    $0x7,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <open>:
SYSCALL(open)
 447:	b8 0f 00 00 00       	mov    $0xf,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <mknod>:
SYSCALL(mknod)
 44f:	b8 11 00 00 00       	mov    $0x11,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <unlink>:
SYSCALL(unlink)
 457:	b8 12 00 00 00       	mov    $0x12,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <fstat>:
SYSCALL(fstat)
 45f:	b8 08 00 00 00       	mov    $0x8,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <link>:
SYSCALL(link)
 467:	b8 13 00 00 00       	mov    $0x13,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <mkdir>:
SYSCALL(mkdir)
 46f:	b8 14 00 00 00       	mov    $0x14,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <chdir>:
SYSCALL(chdir)
 477:	b8 09 00 00 00       	mov    $0x9,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <dup>:
SYSCALL(dup)
 47f:	b8 0a 00 00 00       	mov    $0xa,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <getpid>:
SYSCALL(getpid)
 487:	b8 0b 00 00 00       	mov    $0xb,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <sbrk>:
SYSCALL(sbrk)
 48f:	b8 0c 00 00 00       	mov    $0xc,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <sleep>:
SYSCALL(sleep)
 497:	b8 0d 00 00 00       	mov    $0xd,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <uptime>:
SYSCALL(uptime)
 49f:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <incNum>:
SYSCALL(incNum)
 4a7:	b8 16 00 00 00       	mov    $0x16,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <getprocs>:
SYSCALL(getprocs)
 4af:	b8 17 00 00 00       	mov    $0x17,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <set_burst_time>:
SYSCALL(set_burst_time)
 4b7:	b8 18 00 00 00       	mov    $0x18,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <set_priority>:
SYSCALL(set_priority)
 4bf:	b8 19 00 00 00       	mov    $0x19,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <set_lottery_ticket>:
SYSCALL(set_lottery_ticket)
 4c7:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <set_sched_queue>:
SYSCALL(set_sched_queue)
 4cf:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <show_processes_scheduling>:
SYSCALL(show_processes_scheduling)
 4d7:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <getNumFreePages>:
 4df:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    
 4e7:	66 90                	xchg   %ax,%ax
 4e9:	66 90                	xchg   %ax,%ax
 4eb:	66 90                	xchg   %ax,%ax
 4ed:	66 90                	xchg   %ax,%ax
 4ef:	90                   	nop

000004f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4f9:	85 d2                	test   %edx,%edx
{
 4fb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 4fe:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 500:	79 76                	jns    578 <printint+0x88>
 502:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 506:	74 70                	je     578 <printint+0x88>
    x = -xx;
 508:	f7 d8                	neg    %eax
    neg = 1;
 50a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 511:	31 f6                	xor    %esi,%esi
 513:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 516:	eb 0a                	jmp    522 <printint+0x32>
 518:	90                   	nop
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 520:	89 fe                	mov    %edi,%esi
 522:	31 d2                	xor    %edx,%edx
 524:	8d 7e 01             	lea    0x1(%esi),%edi
 527:	f7 f1                	div    %ecx
 529:	0f b6 92 28 09 00 00 	movzbl 0x928(%edx),%edx
  }while((x /= base) != 0);
 530:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 532:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 535:	75 e9                	jne    520 <printint+0x30>
  if(neg)
 537:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 53a:	85 c0                	test   %eax,%eax
 53c:	74 08                	je     546 <printint+0x56>
    buf[i++] = '-';
 53e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 543:	8d 7e 02             	lea    0x2(%esi),%edi
 546:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 54a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 54d:	8d 76 00             	lea    0x0(%esi),%esi
 550:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 553:	83 ec 04             	sub    $0x4,%esp
 556:	83 ee 01             	sub    $0x1,%esi
 559:	6a 01                	push   $0x1
 55b:	53                   	push   %ebx
 55c:	57                   	push   %edi
 55d:	88 45 d7             	mov    %al,-0x29(%ebp)
 560:	e8 c2 fe ff ff       	call   427 <write>

  while(--i >= 0)
 565:	83 c4 10             	add    $0x10,%esp
 568:	39 de                	cmp    %ebx,%esi
 56a:	75 e4                	jne    550 <printint+0x60>
    putc(fd, buf[i]);
}
 56c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56f:	5b                   	pop    %ebx
 570:	5e                   	pop    %esi
 571:	5f                   	pop    %edi
 572:	5d                   	pop    %ebp
 573:	c3                   	ret    
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 578:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 57f:	eb 90                	jmp    511 <printint+0x21>
 581:	eb 0d                	jmp    590 <printf>
 583:	90                   	nop
 584:	90                   	nop
 585:	90                   	nop
 586:	90                   	nop
 587:	90                   	nop
 588:	90                   	nop
 589:	90                   	nop
 58a:	90                   	nop
 58b:	90                   	nop
 58c:	90                   	nop
 58d:	90                   	nop
 58e:	90                   	nop
 58f:	90                   	nop

00000590 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 599:	8b 75 0c             	mov    0xc(%ebp),%esi
 59c:	0f b6 1e             	movzbl (%esi),%ebx
 59f:	84 db                	test   %bl,%bl
 5a1:	0f 84 b3 00 00 00    	je     65a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 5a7:	8d 45 10             	lea    0x10(%ebp),%eax
 5aa:	83 c6 01             	add    $0x1,%esi
  state = 0;
 5ad:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 5af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5b2:	eb 2f                	jmp    5e3 <printf+0x53>
 5b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5b8:	83 f8 25             	cmp    $0x25,%eax
 5bb:	0f 84 a7 00 00 00    	je     668 <printf+0xd8>
  write(fd, &c, 1);
 5c1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5c4:	83 ec 04             	sub    $0x4,%esp
 5c7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5ca:	6a 01                	push   $0x1
 5cc:	50                   	push   %eax
 5cd:	ff 75 08             	pushl  0x8(%ebp)
 5d0:	e8 52 fe ff ff       	call   427 <write>
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 5db:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5df:	84 db                	test   %bl,%bl
 5e1:	74 77                	je     65a <printf+0xca>
    if(state == 0){
 5e3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5e5:	0f be cb             	movsbl %bl,%ecx
 5e8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5eb:	74 cb                	je     5b8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5ed:	83 ff 25             	cmp    $0x25,%edi
 5f0:	75 e6                	jne    5d8 <printf+0x48>
      if(c == 'd'){
 5f2:	83 f8 64             	cmp    $0x64,%eax
 5f5:	0f 84 05 01 00 00    	je     700 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5fb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 601:	83 f9 70             	cmp    $0x70,%ecx
 604:	74 72                	je     678 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 606:	83 f8 73             	cmp    $0x73,%eax
 609:	0f 84 99 00 00 00    	je     6a8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 60f:	83 f8 63             	cmp    $0x63,%eax
 612:	0f 84 08 01 00 00    	je     720 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 618:	83 f8 25             	cmp    $0x25,%eax
 61b:	0f 84 ef 00 00 00    	je     710 <printf+0x180>
  write(fd, &c, 1);
 621:	8d 45 e7             	lea    -0x19(%ebp),%eax
 624:	83 ec 04             	sub    $0x4,%esp
 627:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 62b:	6a 01                	push   $0x1
 62d:	50                   	push   %eax
 62e:	ff 75 08             	pushl  0x8(%ebp)
 631:	e8 f1 fd ff ff       	call   427 <write>
 636:	83 c4 0c             	add    $0xc,%esp
 639:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 63c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 63f:	6a 01                	push   $0x1
 641:	50                   	push   %eax
 642:	ff 75 08             	pushl  0x8(%ebp)
 645:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 648:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 64a:	e8 d8 fd ff ff       	call   427 <write>
  for(i = 0; fmt[i]; i++){
 64f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 653:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 656:	84 db                	test   %bl,%bl
 658:	75 89                	jne    5e3 <printf+0x53>
    }
  }
}
 65a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 65d:	5b                   	pop    %ebx
 65e:	5e                   	pop    %esi
 65f:	5f                   	pop    %edi
 660:	5d                   	pop    %ebp
 661:	c3                   	ret    
 662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 668:	bf 25 00 00 00       	mov    $0x25,%edi
 66d:	e9 66 ff ff ff       	jmp    5d8 <printf+0x48>
 672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 678:	83 ec 0c             	sub    $0xc,%esp
 67b:	b9 10 00 00 00       	mov    $0x10,%ecx
 680:	6a 00                	push   $0x0
 682:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	8b 17                	mov    (%edi),%edx
 68a:	e8 61 fe ff ff       	call   4f0 <printint>
        ap++;
 68f:	89 f8                	mov    %edi,%eax
 691:	83 c4 10             	add    $0x10,%esp
      state = 0;
 694:	31 ff                	xor    %edi,%edi
        ap++;
 696:	83 c0 04             	add    $0x4,%eax
 699:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 69c:	e9 37 ff ff ff       	jmp    5d8 <printf+0x48>
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6ab:	8b 08                	mov    (%eax),%ecx
        ap++;
 6ad:	83 c0 04             	add    $0x4,%eax
 6b0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 6b3:	85 c9                	test   %ecx,%ecx
 6b5:	0f 84 8e 00 00 00    	je     749 <printf+0x1b9>
        while(*s != 0){
 6bb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 6be:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 6c0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 6c2:	84 c0                	test   %al,%al
 6c4:	0f 84 0e ff ff ff    	je     5d8 <printf+0x48>
 6ca:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6cd:	89 de                	mov    %ebx,%esi
 6cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6d2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 6d5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6d8:	83 ec 04             	sub    $0x4,%esp
          s++;
 6db:	83 c6 01             	add    $0x1,%esi
 6de:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6e1:	6a 01                	push   $0x1
 6e3:	57                   	push   %edi
 6e4:	53                   	push   %ebx
 6e5:	e8 3d fd ff ff       	call   427 <write>
        while(*s != 0){
 6ea:	0f b6 06             	movzbl (%esi),%eax
 6ed:	83 c4 10             	add    $0x10,%esp
 6f0:	84 c0                	test   %al,%al
 6f2:	75 e4                	jne    6d8 <printf+0x148>
 6f4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 6f7:	31 ff                	xor    %edi,%edi
 6f9:	e9 da fe ff ff       	jmp    5d8 <printf+0x48>
 6fe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 0a 00 00 00       	mov    $0xa,%ecx
 708:	6a 01                	push   $0x1
 70a:	e9 73 ff ff ff       	jmp    682 <printf+0xf2>
 70f:	90                   	nop
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
 713:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 716:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 719:	6a 01                	push   $0x1
 71b:	e9 21 ff ff ff       	jmp    641 <printf+0xb1>
        putc(fd, *ap);
 720:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 723:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 726:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 728:	6a 01                	push   $0x1
        ap++;
 72a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 72d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 730:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 733:	50                   	push   %eax
 734:	ff 75 08             	pushl  0x8(%ebp)
 737:	e8 eb fc ff ff       	call   427 <write>
        ap++;
 73c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 73f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 742:	31 ff                	xor    %edi,%edi
 744:	e9 8f fe ff ff       	jmp    5d8 <printf+0x48>
          s = "(null)";
 749:	bb 1f 09 00 00       	mov    $0x91f,%ebx
        while(*s != 0){
 74e:	b8 28 00 00 00       	mov    $0x28,%eax
 753:	e9 72 ff ff ff       	jmp    6ca <printf+0x13a>
 758:	66 90                	xchg   %ax,%ax
 75a:	66 90                	xchg   %ax,%ax
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 40 0c 00 00       	mov    0xc40,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 778:	39 c8                	cmp    %ecx,%eax
 77a:	8b 10                	mov    (%eax),%edx
 77c:	73 32                	jae    7b0 <free+0x50>
 77e:	39 d1                	cmp    %edx,%ecx
 780:	72 04                	jb     786 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 782:	39 d0                	cmp    %edx,%eax
 784:	72 32                	jb     7b8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 786:	8b 73 fc             	mov    -0x4(%ebx),%esi
 789:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78c:	39 fa                	cmp    %edi,%edx
 78e:	74 30                	je     7c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 790:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 793:	8b 50 04             	mov    0x4(%eax),%edx
 796:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 799:	39 f1                	cmp    %esi,%ecx
 79b:	74 3a                	je     7d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 79d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 79f:	a3 40 0c 00 00       	mov    %eax,0xc40
}
 7a4:	5b                   	pop    %ebx
 7a5:	5e                   	pop    %esi
 7a6:	5f                   	pop    %edi
 7a7:	5d                   	pop    %ebp
 7a8:	c3                   	ret    
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	39 d0                	cmp    %edx,%eax
 7b2:	72 04                	jb     7b8 <free+0x58>
 7b4:	39 d1                	cmp    %edx,%ecx
 7b6:	72 ce                	jb     786 <free+0x26>
{
 7b8:	89 d0                	mov    %edx,%eax
 7ba:	eb bc                	jmp    778 <free+0x18>
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7c0:	03 72 04             	add    0x4(%edx),%esi
 7c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	8b 12                	mov    (%edx),%edx
 7ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cd:	8b 50 04             	mov    0x4(%eax),%edx
 7d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d3:	39 f1                	cmp    %esi,%ecx
 7d5:	75 c6                	jne    79d <free+0x3d>
    p->s.size += bp->s.size;
 7d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7da:	a3 40 0c 00 00       	mov    %eax,0xc40
    p->s.size += bp->s.size;
 7df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7e5:	89 10                	mov    %edx,(%eax)
}
 7e7:	5b                   	pop    %ebx
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 15 40 0c 00 00    	mov    0xc40,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 78 07             	lea    0x7(%eax),%edi
 805:	c1 ef 03             	shr    $0x3,%edi
 808:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 80b:	85 d2                	test   %edx,%edx
 80d:	0f 84 9d 00 00 00    	je     8b0 <malloc+0xc0>
 813:	8b 02                	mov    (%edx),%eax
 815:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 818:	39 cf                	cmp    %ecx,%edi
 81a:	76 6c                	jbe    888 <malloc+0x98>
 81c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 822:	bb 00 10 00 00       	mov    $0x1000,%ebx
 827:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 82a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 831:	eb 0e                	jmp    841 <malloc+0x51>
 833:	90                   	nop
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 838:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 83a:	8b 48 04             	mov    0x4(%eax),%ecx
 83d:	39 f9                	cmp    %edi,%ecx
 83f:	73 47                	jae    888 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 841:	39 05 40 0c 00 00    	cmp    %eax,0xc40
 847:	89 c2                	mov    %eax,%edx
 849:	75 ed                	jne    838 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 84b:	83 ec 0c             	sub    $0xc,%esp
 84e:	56                   	push   %esi
 84f:	e8 3b fc ff ff       	call   48f <sbrk>
  if(p == (char*)-1)
 854:	83 c4 10             	add    $0x10,%esp
 857:	83 f8 ff             	cmp    $0xffffffff,%eax
 85a:	74 1c                	je     878 <malloc+0x88>
  hp->s.size = nu;
 85c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 85f:	83 ec 0c             	sub    $0xc,%esp
 862:	83 c0 08             	add    $0x8,%eax
 865:	50                   	push   %eax
 866:	e8 f5 fe ff ff       	call   760 <free>
  return freep;
 86b:	8b 15 40 0c 00 00    	mov    0xc40,%edx
      if((p = morecore(nunits)) == 0)
 871:	83 c4 10             	add    $0x10,%esp
 874:	85 d2                	test   %edx,%edx
 876:	75 c0                	jne    838 <malloc+0x48>
        return 0;
  }
}
 878:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 87b:	31 c0                	xor    %eax,%eax
}
 87d:	5b                   	pop    %ebx
 87e:	5e                   	pop    %esi
 87f:	5f                   	pop    %edi
 880:	5d                   	pop    %ebp
 881:	c3                   	ret    
 882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 888:	39 cf                	cmp    %ecx,%edi
 88a:	74 54                	je     8e0 <malloc+0xf0>
        p->s.size -= nunits;
 88c:	29 f9                	sub    %edi,%ecx
 88e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 891:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 894:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 897:	89 15 40 0c 00 00    	mov    %edx,0xc40
}
 89d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8a0:	83 c0 08             	add    $0x8,%eax
}
 8a3:	5b                   	pop    %ebx
 8a4:	5e                   	pop    %esi
 8a5:	5f                   	pop    %edi
 8a6:	5d                   	pop    %ebp
 8a7:	c3                   	ret    
 8a8:	90                   	nop
 8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 40 0c 00 00 44 	movl   $0xc44,0xc40
 8b7:	0c 00 00 
 8ba:	c7 05 44 0c 00 00 44 	movl   $0xc44,0xc44
 8c1:	0c 00 00 
    base.s.size = 0;
 8c4:	b8 44 0c 00 00       	mov    $0xc44,%eax
 8c9:	c7 05 48 0c 00 00 00 	movl   $0x0,0xc48
 8d0:	00 00 00 
 8d3:	e9 44 ff ff ff       	jmp    81c <malloc+0x2c>
 8d8:	90                   	nop
 8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 08                	mov    (%eax),%ecx
 8e2:	89 0a                	mov    %ecx,(%edx)
 8e4:	eb b1                	jmp    897 <malloc+0xa7>
