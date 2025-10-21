# sky130_op_amp

- Description: 2 stage operational amplifier design
- PDK: sky130A

## Authorship

- Designer: Pravindu Goonetilleke x Nilakna Warushavithana
- Company: University of Moratuwa
- Created: October 21, 2025
- License: Apache 2.0
- Last modified: None

## Pins

- VDD
  + Description: Positive analog power supply
  + Type: power
  + Direction: inout
  + Vmin: 1.7
  + Vmax: 1.9
- VSS
  + Description: Analog ground
  + Type: ground
  + Direction: inout
- IBIAS
  + Description: Bias current input
  + Type: signal
  + Direction: input
- Vp
  + Description: Voltage positive input
  + Type: signal
  + Direction: input
- Vn
  + Description: Voltage negative input
  + Type: signal
  + Direction: input
- Vout
  + Description: Voltage output
  + Type: signal
  + Direction: output
- En
  + Description: Enable pin
  + Type: signal
  + Direction: input

## Default Conditions

- vdd
  + Description: Analog power supply voltage
  + Display: Vdd
  + Unit: V
  + Typical: 1.8
- vcm
  + Description: Input common mode voltage
  + Display: Vcm
  + Unit: V
  + Typical: 0.9
- ib
  + Description: Bias current
  + Display: Ib
  + Unit: uA
  + Typical: 5
- cl
  + Description: Output load capacitance
  + Display: CLoad
  + Unit: pF
  + Maximum: 25
- corner
  + Description: Process corner
  + Display: Corner
  + Typical: tt
- temperature
  + Description: Ambient temperature
  + Display: Temp
  + Unit: °C
  + Typical: 27

## Symbol

![Symbol of sky130_op_amp](sky130_op_amp_symbol.svg)

## Schematic

![Schematic of sky130_op_amp](sky130_op_amp_schematic.svg)

## Layout

![Layout of sky130_op_amp with white background](sky130_op_amp_w.png)
![Layout of sky130_op_amp with black background](sky130_op_amp_b.png)
