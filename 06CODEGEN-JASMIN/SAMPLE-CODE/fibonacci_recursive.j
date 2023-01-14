.class public fibonacci
.super java/lang/Object
.field public static g6 I
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
.method public static f7(I)I
.limit stack 50
.limit locals 50
iload 0
ldc 1
if_icmpeq L0
iload 0
ldc 0
if_icmpeq L2
iload 0
ldc 1
isub
invokestatic fibonacci/f7(I)I
iload 0
ldc 2
isub
invokestatic fibonacci/f7(I)I
iadd
istore 1
goto  L3
L2:
ldc 0
istore 1
L3:
goto  L1
L0:
ldc 1
istore 1
L1:
iload 1
ireturn
.end method
.method public static main([Ljava/lang/String;)V
.limit stack 50
.limit locals 50
invokestatic fibonacci/f3()I
putstatic fibonacci/g6 I
getstatic fibonacci/g6 I
invokestatic fibonacci/f7(I)I
invokestatic fibonacci/f0(I)V
return
.end method
