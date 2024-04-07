## property:
##   text ends with a capital Latin letter, which is unique

last_of:
  xorb %al, %al      # c = 0
.L1:
  movb (%rdi), %r8b
  testb %r8b, %r8b   # *s != '\0'
  je .L2
  movb %r8b, %al     # c = *s
  incq %rdi          # ++s
  jmp .L1            # for - iterate to last letter
.L2:
  ret


count:
  xorl %eax, %eax    # n = 0
.L3:
  movb (%rdi), %r8b
  testb %r8b, %r8b   # *s != '\0'
  je .L5
  cmpb %r8b, %sil    # *s == c
  jne .L4
  incl %eax          # ++n
.L4:
  incq %rdi          # ++s
  jmp .L3            # for - count if same
.L5:
  ret


.globl check_property

check_property:
  pushq %rdi         # store s on stack
  call last_of

  pushq %rax         # store c on stack
  # NB! Under MinGW standard functions use MS ABI
  movsbl %al, %ecx   # char -> int
  call isupper
  popq %rsi          # restore c
  popq %rdi          # and s from stack

  testl %eax, %eax   # !isupper(c)
  jnz .L6
  ret                # return 0

.L6:
  call count
  cmpl $1, %eax
  sete %al
  movzbl %al, %eax
  ret                # return n == 1
