
# MIPS → RISCV

## 紹介文
〜〜〜〜〜〜〜。
![回路図](img/cpu_project_structure.png)

## サポートする命令

| 命令 | 命令形式 | 命令　| 命令形式|
| -------- | -------- | -----| ----|
| add|R|addi|I|
| sub|R|slli|I|
| or|R|slti|I|
|and| R|sltiu|I|
|xor| R|xori|I|
|sll| R|srli|I|
|slt| R|srai|I|
|sltu| R|ori| I|
|slt| R|andi|I|
|srl|R|lw|I|
|sra|R|sw|I|
|beq|B|jalr|I|
|bne|B|
|jal|J|



## 仕様
### PC
* pcSRC
    * PC+4（特に条件なし）
    * Branch
    * Jump→簡単（Opcodeから識別可能）

* isFetch（Fetch時に1）:ControlUnit
* PCWrite = isFetch + Branch/Jump
    * PC+4する場合（1つ次の命令に進む）
    * Branch命令において、分岐条件を満たした場合
    * Jump命令が実行される場合

Opcode→isJump（Jump命令なら1）
Opcode→isBranch（Branch命令なら1）
zeroFlag（ALU）・reversezFlag（ControlUnit）・isBranch→Branch成功（分岐条件を満たしていれば1）

pcSRC　← isJump +（論理和） Branch成功
## Getting started


## 動作環境

