
# CACE Summary for sky130_op_amp

**netlist source**: rcx

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| DC Gain              | ngspice              | a0                   |        1000 V/V |          ​ |            ​ |          ​ |            ​ |          ​ |   Error ❗   |
| Unity Gain Frequency | ngspice              | ugf                  |          1e6 Hz |          ​ |            ​ |          ​ |            ​ |          ​ |   Error ❗   |
| Phase Margin         | ngspice              | pm                   |            60 ° |          ​ |            ​ |          ​ |            ​ |          ​ |   Error ❗   |
| Output Offset Voltage | ngspice              | vout_offset          |               ​ |          ​ |            ​ |          ​ |            ​ |          ​ |   Error ❗   |
| Input Offset Voltage | ngspice              | vin_offset           |               ​ |          ​ |            ​ |          ​ |            ​ |          ​ |   Error ❗   |
| Positive Slew Rate   | ngspice              | sr_pos               |               ​ |          ​ |            ​ |          ​ |            ​ |          ​ |   Error ❗   |
| Negative Slew Rate   | ngspice              | sr_neg               |               ​ |          ​ |            ​ |          ​ |            ​ |          ​ |   Error ❗   |
| Supply Current (Enabled) | ngspice              | idd_enabled          |               ​ |          ​ |            ​ |          ​ |            ​ |          ​ |   Error ❗   |
| Supply Current (Disabled) | ngspice              | idd_disabled         |               ​ |          ​ |            ​ |          ​ |            ​ |          ​ |   Error ❗   |
| Area                 | magic_area           | area                 |               ​ |          ​ |            ​ |          ​ |     9600 µm² | 6689.038 µm² |   Pass ✅    |
| Width                | magic_area           | width                |               ​ |          ​ |            ​ |          ​ |          any |  88.275 µm |   Pass ✅    |
| Height               | magic_area           | height               |               ​ |          ​ |            ​ |          ​ |          any |  75.775 µm |   Pass ✅    |
| Magic DRC            | magic_drc            | drc_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          0 |   Pass ✅    |
| Netgen LVS           | netgen_lvs           | lvs_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          0 |   Pass ✅    |
| KLayout DRC feol     | klayout_drc          | drc_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          0 |   Pass ✅    |
| KLayout DRC beol     | klayout_drc          | drc_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          0 |   Pass ✅    |
| KLayout DRC full     | klayout_drc          | drc_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          0 |   Pass ✅    |
| Antenna Checks       | magic_antenna_check  | antenna_violations   |               ​ |          ​ |            ​ |          ​ |            0 |          0 |   Pass ✅    |

