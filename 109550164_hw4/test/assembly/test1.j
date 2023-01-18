.class public test1
.super java/lang/Object
.field public static a I
.field public static b I
.field public static c I
.field public static u I
.field public static g F
.field public static h F
.field public static x F
.method public static writelnI(I)V
.limit locals 5
.limit stack 5
    getstatic java/lang/System/out Ljava/io/PrintStream;
    iload 0
    invokevirtual java/io/PrintStream/println(I)V
    return
.end method

.method public static writelnR(F)V
    .limit locals 5
    .limit stack 5
    getstatic java/lang/System/out Ljava/io/PrintStream;
    fload 0
    invokevirtual java/io/PrintStream/println(F)V
    return
.end method

.method public static writelnS(Ljava/lang/String;)V
    .limit locals 5
    .limit stack 5
    getstatic java/lang/System/out Ljava/io/PrintStream;
    aload 0
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
    return
.end method

.method public static readlnI()I
    .limit locals 10
    .limit stack 10
    ldc 0
    istore 1
LAB1:
    getstatic java/lang/System/in Ljava/io/InputStream;
    invokevirtual java/io/InputStream/read()I
    istore 2
    iload 2
    ldc 10
    isub
    ifeq LAB2
    iload 2
    ldc 32
    isub
    ifeq LAB2
    iload 2
    ldc 48
    isub
    ldc 10
    iload 1
    imul
    iadd
    istore 1
    goto LAB1
LAB2:
    iload 1
    ireturn
.end method
.field public static b I
    getstatic test1/b I
.end method
.method public static addition_0(I)I
.limit locals 50
.limit stack 50
    iload 0
    getstatic test1/a I
    getstatic test1/b I
    iadd
    ireturn
    ireturn
.end method
.method public static ggyy_1(F)F
.limit locals 50
.limit stack 50
    getstatic test1/g F
    getstatic test1/h F
    fadd
.end method
.method public static main([Ljava/lang/String;)V
.limit locals 50
.limit stack 50
    ldc 0
    putstatic test1/a I
    ldc 0
    putstatic test1/b I
    ldc 0
    putstatic test1/c I
    ldc 0
    putstatic test1/u I
    ldc 0.0
    putstatic test1/g F
    ldc 0.0
    putstatic test1/h F
    ldc 0.0
    putstatic test1/x F
    ldc 0
    putstatic test1/b I
    ldc 8
    ldc 8
    invokestatic test1/addition_0(I)I
    ldc 8
    ldc 8
    putstatic test1/c I
    getstatic test1/c I
    invokestatic test1/writelnI(I)V
    ldc 8
    fneg
    ldc 8
    fneg
    invokestatic test1/addition_0(I)I
    ldc 8
    fneg
    putstatic test1/c I
    getstatic test1/c I
    invokestatic test1/writelnI(I)V
    ldc 3.300000
    ldc 5.500000
    invokestatic test1/ggyy_1(F)F
    ldc 3.300000
    ldc 5.500000
    putstatic test1/x Ljava/lang/String;
    getstatic test1/x F
    invokestatic test1/writelnR(F)V
    ldc 0
    putstatic test1/b I
    getstatic test1/b I
    getstatic test1/a I
    if_icmpgt L1
    ldc 0
    goto L2
L1:
    ldc 1
L2:
    ldc 111
    putstatic test1/a I
    ldc 222
    putstatic test1/a I
    getstatic test1/a I
    invokestatic test1/writelnI(I)V
    getstatic test1/b I
    getstatic test1/a I
    if_icmplt L3
    ldc 0
    goto L4
L3:
    ldc 1
L4:
    ldc 111
    putstatic test1/a I
    ldc 222
    putstatic test1/a I
    getstatic test1/a I
    invokestatic test1/writelnI(I)V
    getstatic test1/b I
    getstatic test1/a I
    if_icmpeq L5
    ldc 0
    goto L6
L5:
    ldc 1
L6:
    ldc 111
    putstatic test1/a I
    ldc 222
    putstatic test1/a I
    getstatic test1/a I
    invokestatic test1/writelnI(I)V
    getstatic test1/b I
    getstatic test1/a I
    if_icmpge L7
    ldc 0
    goto L8
L7:
    ldc 1
L8:
    ldc 111
    putstatic test1/a I
    ldc 222
    putstatic test1/a I
    getstatic test1/a I
    invokestatic test1/writelnI(I)V
    getstatic test1/b I
    getstatic test1/a I
    if_icmple L9
    ldc 0
    goto L10
L9:
    ldc 1
L10:
    ldc 111
    putstatic test1/a I
    ldc 222
    putstatic test1/a I
    getstatic test1/a I
    invokestatic test1/writelnI(I)V
    getstatic test1/b I
    ldc 0
    if_icmpne L11
    ldc 0
    goto L12
L11:
    ldc 1
L12:
    ldc 111
    putstatic test1/a I
    ldc 222
    putstatic test1/a I
    getstatic test1/a I
    invokestatic test1/writelnI(I)V
    ldc 1
    putstatic test1/a I
    getstatic test1/a I
    ldc 5
    if_icmplt L13
    ldc 0
    goto L14
L13:
    ldc 1
L14:
    getstatic test1/a I
    invokestatic test1/writelnI(I)V
    getstatic test1/a I
    ldc 1
    iadd
    putstatic test1/a I
    ldc 1
    putstatic test1/b I
    getstatic test1/b I
    ldc 11
    if_icmplt L15
    ldc 0
    goto L16
L15:
    ldc 1
L16:
    getstatic test1/b I
    getstatic test1/b I
    getstatic test1/b I
    getstatic test1/b I
    ldc 3
    iadd
    imul
    iadd
    putstatic test1/d I
    getstatic test1/b I
    ldc 1
    iadd
    putstatic test1/b I
    ldc 3
    ldc 9.990000
    putstatic test1/e Ljava/lang/String;
    ldc 25
    ldc 26
    ldc 3.140000
    putstatic test1/k Ljava/lang/String;
    ldc 28
    ldc 26
    ldc 88
    putstatic test1/l I
    getstatic test1/a I
    invokestatic test1/writelnI(I)V
    invokestatic test1/d()I
    ldc 5
    putstatic test1/u I
    getstatic test1/u I
    invokestatic test1/writelnI(I)V
    invokestatic test1/e()I
    ldc 3
    putstatic test1/g Ljava/lang/String;
    getstatic test1/g F
    invokestatic test1/writelnR(F)V
    invokestatic test1/k()I
    ldc 25
    ldc 26
    putstatic test1/g Ljava/lang/String;
    getstatic test1/g F
    invokestatic test1/writelnR(F)V
    invokestatic test1/l()I
    ldc 28
    ldc 26
    putstatic test1/u I
    getstatic test1/u I
    invokestatic test1/writelnI(I)V
    ldc 9
    ldc 9
    iadd
    ldc 10
    isub
    putstatic test1/u I
    getstatic test1/u I
    invokestatic test1/writelnI(I)V
    ldc 9
    ldc 9
    iadd
    ldc 3
    idiv
    ldc 5
    ldc 2
    imul
    iadd
    ldc 1
    isub
    getstatic test1/u I
    iadd
    putstatic test1/u I
    getstatic test1/u I
    invokestatic test1/writelnI(I)V
    return
.end method
