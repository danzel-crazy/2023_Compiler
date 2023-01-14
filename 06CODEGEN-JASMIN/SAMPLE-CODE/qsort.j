.class public Sort
.super java/lang/Object
.field public static g6 [I
.field public static g10 I
.field public static g9 I
.field public static g7 I
.field public static g8 I
.method public static f0(I)V
.limit locals 5
.limit stack 5
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 0
invokevirtual java/io/PrintStream/println(I)V
return
.end method
.method public static f1(F)V
.limit locals 5
.limit stack 5
getstatic java/lang/System/out Ljava/io/PrintStream;
fload 0
invokevirtual java/io/PrintStream/println(F)V
return
.end method
.method public static f2(Ljava/lang/String;)V
.limit locals 5
.limit stack 5
getstatic java/lang/System/out Ljava/io/PrintStream;
aload 0
invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
return
.end method
.method public static f3()I
.limit locals 10 
.limit stack 10 
ldc 0 
istore 1
Label1: 
getstatic java/lang/System/in Ljava/io/InputStream; 
invokevirtual java/io/InputStream/read()I 
istore 2 
iload 2 
ldc 10
isub
ifeq Label2 
iload 2 
ldc 32
isub 
ifeq Label2 
iload 2 
ldc 48
isub 
ldc 10 
iload 1 
imul 
iadd 
istore 1 
goto Label1 
Label2: 
iload 1 
ireturn
.end method
.method public static f27([I)V
.limit stack 50
.limit locals 50
ldc 1
getstatic Sort/g7 I
invokestatic Sort/f22(II)V
return
.end method
.method public static f22(II)V
.limit stack 50
.limit locals 50
iload 0
iload 1
if_icmplt L0
goto  L1
L0:
iload 0
iload 1
invokestatic Sort/f14(II)I
istore 4
iload 0
iload 4
ldc 1
isub
invokestatic Sort/f22(II)V
iload 4
ldc 1
iadd
iload 1
invokestatic Sort/f22(II)V
L1:
return
.end method
.method public static f11([I)V
.limit stack 50
.limit locals 50
ldc 0
putstatic Sort/g7 I
invokestatic Sort/f3()I
istore 2
goto  L3
L2:
getstatic Sort/g7 I
ldc 1
iadd
putstatic Sort/g7 I
getstatic Sort/g6 [I
getstatic Sort/g7 I
ldc 1
isub
iload 2
iastore
invokestatic Sort/f3()I
istore 2
L3:
iload 2
ldc 0
if_icmpne L2
return
.end method
.method public static f14(II)I
.limit stack 50
.limit locals 50
getstatic Sort/g6 [I
iload 0
ldc 1
isub
iaload
istore 4
iload 0
ldc 1
iadd
istore 3
iload 1
istore 5
goto  L5
L4:
ldc 1
istore 6
iload 3
iload 1
if_icmple L6
ldc 0
istore 6
goto  L7
L6:
L7:
iload 6
ldc 1
if_icmpeq L8
goto  L9
L8:
getstatic Sort/g6 [I
iload 3
ldc 1
isub
iaload
iload 4
if_icmplt L10
ldc 0
istore 6
goto  L11
L10:
L11:
L9:
goto  L13
L12:
iload 3
ldc 1
iadd
istore 3
ldc 1
istore 6
iload 3
iload 1
if_icmple L14
ldc 0
istore 6
goto  L15
L14:
L15:
iload 6
ldc 1
if_icmpeq L16
goto  L17
L16:
getstatic Sort/g6 [I
iload 3
ldc 1
isub
iaload
iload 4
if_icmplt L18
ldc 0
istore 6
goto  L19
L18:
L19:
L17:
L13:
iload 6
ldc 1
if_icmpeq L12
ldc 1
istore 6
iload 5
iload 0
if_icmpgt L20
ldc 0
istore 6
goto  L21
L20:
L21:
iload 6
ldc 1
if_icmpeq L22
goto  L23
L22:
getstatic Sort/g6 [I
iload 5
ldc 1
isub
iaload
iload 4
if_icmpge L24
ldc 0
istore 6
goto  L25
L24:
L25:
L23:
goto  L27
L26:
iload 5
ldc 1
isub
istore 5
ldc 1
istore 6
iload 5
iload 0
if_icmpgt L28
ldc 0
istore 6
goto  L29
L28:
L29:
iload 6
ldc 1
if_icmpeq L30
goto  L31
L30:
getstatic Sort/g6 [I
iload 5
ldc 1
isub
iaload
iload 4
if_icmpge L32
ldc 0
istore 6
goto  L33
L32:
L33:
L31:
L27:
iload 6
ldc 1
if_icmpeq L26
iload 3
iload 5
if_icmplt L34
goto  L35
L34:
getstatic Sort/g6 [I
iload 3
ldc 1
isub
iaload
istore 7
getstatic Sort/g6 [I
iload 3
ldc 1
isub
getstatic Sort/g6 [I
iload 5
ldc 1
isub
iaload
iastore
getstatic Sort/g6 [I
iload 5
ldc 1
isub
iload 7
iastore
L35:
L5:
iload 3
iload 5
if_icmple L4
getstatic Sort/g6 [I
iload 0
ldc 1
isub
iaload
istore 7
getstatic Sort/g6 [I
iload 0
ldc 1
isub
getstatic Sort/g6 [I
iload 5
ldc 1
isub
iaload
iastore
getstatic Sort/g6 [I
iload 5
ldc 1
isub
iload 7
iastore
iload 5
istore 2
iload 2
ireturn
.end method
.method public static main([Ljava/lang/String;)V
.limit stack 50
.limit locals 50
ldc 50
multianewarray [I 1
putstatic Sort/g6 [I
getstatic Sort/g6 [I
invokestatic Sort/f11([I)V
getstatic Sort/g6 [I
invokestatic Sort/f27([I)V
ldc 1
putstatic Sort/g10 I
goto  L37
L36:
getstatic Sort/g6 [I
getstatic Sort/g10 I
ldc 1
isub
iaload
invokestatic Sort/f0(I)V
getstatic Sort/g10 I
ldc 1
iadd
putstatic Sort/g10 I
L37:
getstatic Sort/g10 I
getstatic Sort/g7 I
if_icmple L36
return
.end method
