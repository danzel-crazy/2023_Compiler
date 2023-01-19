.class public test2
.super java/lang/Object
.field public static aa I
.field public static bb I
.field public static cc I
.field public static g [[I
.field public static r [[I
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
.var 0 is z I
.end method
.method public static tt_0(I)I
.limit locals 50
.limit stack 50
    iload 0
.var 1 is z I
    ldc 3
    ldc 4
    ldc 5
    imul
    iadd
    istore 0
    iload 0
    invokestatic test2/writelnI(I)V
    ldc 5
    iadd
    ireturn
    ireturn
.end method
.method public static main([Ljava/lang/String;)V
.limit locals 50
.limit stack 50
    ldc 0
    putstatic test2/aa I
    ldc 0
    putstatic test2/bb I
    ldc 0
    putstatic test2/cc I
    ldc 2
    ldc 2
    multianewarray [[I 2
    putstatic test2/g [[I
    ldc 2
    ldc 2
    multianewarray [[I 2
    putstatic test2/r [[I
    getstatic test2/aa I
    ldc 3
    getstatic test2/bb I
    imul
    iadd
    ldc 4
    ldc 2
    idiv
    isub
    putstatic test2/aa I
    getstatic test2/aa I
    invokestatic test2/writelnI(I)V
    getstatic test2/bb I
    invokestatic test2/writelnI(I)V
    getstatic test2/aa I
    getstatic test2/bb I
    if_icmple L1
    ldc 0
    goto L2
L1:
    ldc 1
L2:
    ifne L3
    getstatic test2/aa I
    ldc 0
    if_icmplt L4
    ldc 0
    goto L5
L4:
    ldc 1
L5:
    ifne L6
    ldc 333
    putstatic test2/aa I
    goto L7
L6:
    ldc 111
    putstatic test2/aa I
L7:
    goto L8
L7:
    ldc 222
    putstatic test2/aa I
L8:
    getstatic test2/aa I
    invokestatic test2/writelnI(I)V
L9:
    getstatic test2/bb I
    ldc 5
    if_icmplt L10
    ldc 0
    goto L11
L10:
    ldc 1
L11:
    ifeq L12
    ldc 0
    putstatic test2/aa I
L12:
    getstatic test2/aa I
    ldc 5
    if_icmplt L13
    ldc 0
    goto L14
L13:
    ldc 1
L14:
    ifeq L15
    getstatic test2/aa I
    ldc 1
    iadd
    putstatic test2/aa I
    goto L12
L15:
    getstatic test2/bb I
    ldc 1
    iadd
    putstatic test2/bb I
    getstatic test2/bb I
    invokestatic test2/writelnI(I)V
    goto L13
L16:
    getstatic test2/g [[I
    ldc 0
    ldc 0
    isub
    aaload
    ldc 3
    ldc 2
    isub
    ldc 4
    ldc 0
    isub
    getstatic test2/aa I
    getstatic test2/r [[I
    ldc 1
    ldc 4
    iaload
    iadd
    ldc 2
    ldc 3
    ldc 4.000000
    ldc 6.500000
    invokestatic test2/tt_0(I)I
    ldc 2
    ldc 3
    ldc 4.000000
    ldc 6.500000
    iadd
    putstatic test2/g I
    getstatic test2/g [[I
    ldc 0
    ldc 0
    isub
    aaload
    ldc 3
    ldc 2
    isub
    ldc 4
    ldc 0
    isub
    iaload
    invokestatic test2/writelnI(I)V
    return
.end method
