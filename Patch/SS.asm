.nds
.thumb

.definelabel MI_CpuFill32, 0x020D40D0
.definelabel ClearPokeWalkerPlayerData, 0x020321C8

.open "overlay9_0112_SS.bin", 0x021E4E40

.org 0x021EB5CE
bl		HookClearPokeWalkerPlayerData
nop
nop
nop
nop
nop

.org 0x021E7B9C
mov	r0, #0

.org 0x021E7BA2
blx		MI_CpuFill32

.org 0x21FA93C
HookClearPokeWalkerPlayerData:
push	{r4-r5, lr}
mov	r4, r0
ldr		r1, =0x12C
ldr		r5, [r4, r1]
bl		ClearPokeWalkerPlayerData
ldr		r0, =0x12C
str		r5, [r4, r0]
pop	{r4-r5, pc}

.pool

.close