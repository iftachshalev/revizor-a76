ISB  // instrumentation
.test_case_enter:
.function_main:
.bb_main.entry:
B .bb_main.0 
.bb_main.0:
AND X3, X3, #0b111111111111 // instrumentation
ADD X3, X3, X30 // instrumentation
STRH W5, [X3], #139 
AND X3, X3, #0b111111111111 // instrumentation
ADD X3, X3, X30 // instrumentation
LDTR W5, [X3] 
DMB #15 
CBNZ W2, .bb_main.1 
B .bb_main.2 
.bb_main.1:
CCMP X3, #23, #11, PL 
AND X0, X0, #0b111111111111 // instrumentation
ADD X0, X0, X30 // instrumentation
STRB W2, [X0], #208 
BR X1 
MOV W0, W4 
B .bb_main.2 
.bb_main.2:
SEV  
CBNZ X4, .bb_main.3 
B .bb_main.exit 
.bb_main.3:
CRC32H W3, W0, W3 
CSINC W0, W3, W4, LS 
B .bb_main.4 
.bb_main.4:
CSEL W1, W2, W1, HI 
ROR X5, X0, #47 
CSEL X3, X2, X0, MI 
MADD X2, X3, X0, X0 
SUBS W5, W3, #964 
ROR X3, X0, X4 
.bb_main.exit:
.test_case_exit:
ISB  // instrumentation
