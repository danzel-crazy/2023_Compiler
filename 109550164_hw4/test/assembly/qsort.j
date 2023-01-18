.class public qsort
.super java/lang/Object
.field public static i I
.field public static j I
.field public static tmp I
.field public static size I
.field public static arr [I
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
.field public static input I
    ldc 0
L1:
    getstatic qsort/input I
    ldc 0
    if_icmpne L2
    ldc 0
    goto L3
L2:
    ldc 1
L3:
    ifeq L4
    getstatic qsort/size I
    ldc 1
    iadd
    getstatic qsort/arr [I
    getstatic qsort/size I
    getstatic qsort/input I
    iastore
    goto L1
L4:
.end method
.method public static split_0(I)I
.limit locals 50
.limit stack 50
    iload 0
.field public static test I
.field public static left I
.field public static right I
.field public static pivot I
.field public static tmp I
    getstatic qsort/arr [I
    iaload
    ldc 1
    iadd
L5:
    getstatic qsort/left I
    getstatic qsort/right I
    if_icmple L6
    ldc 0
    goto L7
L6:
    ldc 1
L7:
    ifeq L8
    ldc 1
    getstatic qsort/left I
    if_icmple L8
    ldc 0
    goto L9
L8:
    ldc 1
L9:
    ifne L10
    goto L11
L10:
    ldc 0
L11:
    getstatic qsort/test I
    ldc 1
    if_icmpeq L12
    ldc 0
    goto L13
L12:
    ldc 1
L13:
    ifeq L14
    getstatic qsort/arr [I
    getstatic qsort/left I
    iaload
    getstatic qsort/pivot I
    if_icmplt L15
    ldc 0
    goto L16
L15:
    ldc 1
L16:
    ifeq L17
    goto L18
L17:
    ldc 0
L18:
    goto L19
L18:
L19:
L20:
    getstatic qsort/test I
    ldc 1
    if_icmpeq L21
    ldc 0
    goto L22
L21:
    ldc 1
L22:
    ifeq L23
    getstatic qsort/left I
    ldc 1
    iadd
    ldc 1
    getstatic qsort/left I
    if_icmple L23
    ldc 0
    goto L24
L23:
    ldc 1
L24:
    ifeq L25
    goto L26
L25:
    ldc 0
L26:
    getstatic qsort/test I
    ldc 1
    if_icmpeq L27
    ldc 0
    goto L28
L27:
    ldc 1
L28:
    ifeq L29
    getstatic qsort/arr [I
    getstatic qsort/left I
    iaload
    getstatic qsort/pivot I
    if_icmplt L30
    ldc 0
    goto L31
L30:
    ldc 1
L31:
    ifeq L32
    goto L33
L32:
    ldc 0
L33:
    goto L34
L33:
L34:
    goto L32
L35:
    ldc 1
    getstatic qsort/right I
    if_icmpgt L36
    ldc 0
    goto L37
L36:
    ldc 1
L37:
    ifne L38
    goto L39
L38:
    ldc 0
L39:
    getstatic qsort/test I
    ldc 1
    if_icmpeq L40
    ldc 0
    goto L41
L40:
    ldc 1
L41:
    ifeq L42
    getstatic qsort/arr [I
    getstatic qsort/right I
    iaload
    getstatic qsort/pivot I
    if_icmpge L43
    ldc 0
    goto L44
L43:
    ldc 1
L44:
    ifeq L45
    goto L46
L45:
    ldc 0
L46:
    goto L47
L46:
L47:
L48:
    getstatic qsort/test I
    ldc 1
    if_icmpeq L49
    ldc 0
    goto L50
L49:
    ldc 1
L50:
    ifeq L51
    getstatic qsort/right I
    ldc 1
    isub
    ldc 1
    getstatic qsort/right I
    if_icmpgt L51
    ldc 0
    goto L52
L51:
    ldc 1
L52:
    ifeq L53
    goto L54
L53:
    ldc 0
L54:
    getstatic qsort/test I
    ldc 1
    if_icmpeq L55
    ldc 0
    goto L56
L55:
    ldc 1
L56:
    ifeq L57
    getstatic qsort/arr [I
    getstatic qsort/right I
    iaload
    getstatic qsort/pivot I
    if_icmpge L58
    ldc 0
    goto L59
L58:
    ldc 1
L59:
    ifeq L60
    goto L61
L60:
    ldc 0
L61:
    goto L62
L61:
L62:
    goto L60
L63:
    getstatic qsort/left I
    getstatic qsort/right I
    if_icmplt L64
    ldc 0
    goto L65
L64:
    ldc 1
L65:
    ifne L66
    getstatic qsort/arr [I
    getstatic qsort/left I
    iaload
    getstatic qsort/arr [I
    getstatic qsort/left I
    getstatic qsort/arr [I
    getstatic qsort/right I
    iaload
    getstatic qsort/arr [I
    getstatic qsort/right I
    getstatic qsort/tmp I
    iastore
    goto L67
L66:
L67:
    goto L65
L68:
    getstatic qsort/arr [I
    iaload
    getstatic qsort/arr [I
    getstatic qsort/arr [I
    getstatic qsort/right I
    iaload
    getstatic qsort/arr [I
    getstatic qsort/right I
    getstatic qsort/tmp I
    iastore
    getstatic qsort/right I
    ireturn
    ireturn
.end method
.method public static split_0(I)I
.limit locals 50
.limit stack 50
    iload 0
.field public static m I
.field public static splitpt I
    if_icmplt L69
    ldc 0
    goto L70
L69:
    ldc 1
L70:
    ifne L71
    invokestatic qsort/split_0(I)I
    getstatic qsort/splitpt I
    ldc 1
    isub
    getstatic qsort/splitpt I
    ldc 1
    isub
    getstatic qsort/splitpt I
    ldc 1
    iadd
    getstatic qsort/splitpt I
    ldc 1
    iadd
    goto L72
L71:
L72:
    ireturn
    ireturn
.end method
.method public static split_0(I)I
.limit locals 50
.limit stack 50
    iload 0
    ldc 1
    getstatic qsort/size I
    ldc 1
    getstatic qsort/size I
    ireturn
    ireturn
.end method
.method public static main([Ljava/lang/String;)V
.limit locals 50
.limit stack 50
    ldc 0
    putstatic qsort/i I
    ldc 0
    putstatic qsort/j I
    ldc 0
    putstatic qsort/tmp I
    ldc 0
    putstatic qsort/size I
    ldc 0
    putstatic qsort/input I
    ldc 0
    putstatic qsort/test I
    ldc 0
    putstatic qsort/left I
    ldc 0
    putstatic qsort/right I
    ldc 0
    putstatic qsort/pivot I
    ldc 0
    putstatic qsort/tmp I
    ldc 0
    putstatic qsort/m I
    ldc 0
    putstatic qsort/splitpt I
    ldc 50
    multianewarray [I 1
    putstatic qsort/arr [I
    getstatic qsort/arr [I
    getstatic qsort/arr [I
    getstatic qsort/arr [I
    getstatic qsort/arr [I
    ldc 1
    putstatic qsort/i I
L73:
    getstatic qsort/i I
    getstatic qsort/size I
    if_icmple L74
    ldc 0
    goto L75
L74:
    ldc 1
L75:
    ifeq L76
    getstatic qsort/arr [I
    getstatic qsort/i I
    iaload
    invokestatic qsort/writelnI(I)V
    getstatic qsort/i I
    ldc 1
    iadd
    putstatic qsort/i I
    goto L73
L76:
    return
.end method
