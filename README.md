# 4-Bit ALU Project

This project, created with my teammates, is a **4-bit ALU** (Arithmetic Logic Unit) design that performs basic arithmetic and logical operations. The ALU carries out tasks such as addition, subtraction, multiplication, and logical operations based on various operation codes (opcodes).

## Features
- **Inputs:**
  - `A` and `B`: 4-bit inputs (numbers to be operated on)
  - `CarryIN`: Carry input (for addition and subtraction operations)
  - `opCodeA`: 3-bit operation code (determines the type of operation)

- **Outputs:**
  - `bcd`: 12-bit Binary Coded Decimal (BCD) output
  - `CarryOUT`: Carry output
  - `overflow`: Overflow status

## Operation Codes
The ALU supports the following operation codes:
- `000`: Addition (**ADD**)
- `001`: Subtraction (**SUB**)
- `010`: Multiplication (**MULT**)
- `100`: Logical AND (**AND**)
- `101`: Logical OR (**OR**)
- `110`: Logical XOR (**XOR**)

## Modules and Functions
- **`opCode` Module:** Determines the operation code and activates different units of the ALU.
- **`arithmeticUnit` Module:** Performs addition and subtraction operations.
- **`logicUnit` Module:** Performs logical operations (AND, OR, XOR).
- **`multiplier` Module:** Performs multiplication.
- **`BinaryToBCD` Module:** Converts the results from Binary to BCD format.

## Usage
The project is written in `Verilog` and can be tested with various simulation tools. **Verilog testbench** files and **Logisim** simulations are provided for testing purposes. Logisim simulations are used for visual verification and analysis of the design.

### Logisim Simulations

Logisim software has been used for visual verification of the project design. The ALU’s operation for each opcode has been simulated in the Logisim environment. The purpose of the simulations is to test the accuracy of the circuits and observe the correct outputs for various input values.

#### Simulation Features:
- **Addition (ADD):**
  - When `opCodeA = 3'b000`, the sum of the `A` and `B` inputs is calculated.
  - Example: `A = 4'b0011`, `B = 4'b0001` → Output: `bcd = 12'b000000000100`, `CarryOUT = 0`
  - The addition operation is simulated step by step in Logisim.

- **Subtraction (SUB):**
  - When `opCodeA = 3'b001`, the value of `B` is subtracted from `A`.
  - Example: `A = 4'b0101`, `B = 4'b0011` → Output: `bcd = 12'b000000000010`, `CarryOUT = 0`
  - During the subtraction operation, the carry input (`CarryIN`) and carry output (`CarryOUT`) are managed correctly.

- **Multiplication (MULT):**
  - When `opCodeA = 3'b010`, the inputs `A` and `B` are multiplied.
  - Example: `A = 4'b0011`, `B = 4'b0010` → Output: `bcd = 12'b000000001110`, `CarryOUT = 0`
  - The multiplication operation has been simulated without exceeding the ALU's capacity.

- **Logical AND (AND):**
  - When `opCodeA = 3'b100`, a bitwise AND operation is performed on the `A` and `B` inputs.
  - Example: `A = 4'b1010`, `B = 4'b1100` → Output: `bcd = 12'b000000000100`, `CarryOUT = 0`
  - The logical AND operation is performed by comparing the corresponding bits of both inputs.

- **Logical OR (OR):**
  - When `opCodeA = 3'b101`, a bitwise OR operation is performed on the `A` and `B` inputs.
  - Example: `A = 4'b1010`, `B = 4'b1100` → Output: `bcd = 12'b000000001110`, `CarryOUT = 0`
  - The OR operation is based on comparing the corresponding bits of both inputs.

- **Logical XOR (XOR):**
  - When `opCodeA = 3'b110`, a bitwise XOR operation is performed on the `A` and `B` inputs.
  - Example: `A = 4'b1010`, `B = 4'b1100` → Output: `bcd = 12'b000000001110`, `CarryOUT = 0`
  - The XOR operation returns 1 only for bits that differ.

#### Simulation Results:
- Correct outputs have been obtained for each operation type.
- Various input combinations were used to test each operation type.
- Carry (`CarryIN`, `CarryOUT`) and overflow (`overflow`) conditions were correctly handled.
- Logisim files contain visual schematics that simulate all the functionality of the ALU.

#### Logisim Files:
- The **`Aluproject`** files available in the project directory can be accessed to test the simulations.
- In Logisim, the simulations can be observed step by step, and the accuracy of each operation code can be verified visually.

