ecg2_hw_register_bit_set:
;ecg2_hw.c,4 :: 		static inline void register_bit_set(uint8_t reg, uint8_t bit_num, uint8_t val)
; val start address is: 8 (R2)
; bit_num start address is: 4 (R1)
; reg start address is: 0 (R0)
LINK	LR, #16
; val end address is: 8 (R2)
; bit_num end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; bit_num start address is: 4 (R1)
; val start address is: 8 (R2)
;ecg2_hw.c,8 :: 		ecg2_hal_read_bytes(reg, &tempbuff, 1);
ADD.L	R3, SP, #12
STI.B	SP, #0, R2
STI.B	SP, #4, R1
STI.B	SP, #8, R0
LDK.L	R2, #1
MOVE.L	R1, R3
CALL	_ecg2_hal_read_bytes+0
LDI.B	R0, SP, #8
LDI.B	R1, SP, #4
LDI.B	R2, SP, #0
;ecg2_hw.c,9 :: 		if (val == 1)
CMP.B	R2, #1
JMPC	R30, Z, #0, L_ecg2_hw_register_bit_set0
; val end address is: 8 (R2)
;ecg2_hw.c,10 :: 		tempbuff |= 1 << bit_num;
BEXTU.L	R4, R1, #256
; bit_num end address is: 4 (R1)
LDK.L	R3, #1
ASHL.L	R4, R3, R4
BEXTS.L	R4, R4, #0
LDI.B	R3, SP, #12
OR.L	R3, R3, R4
STI.B	SP, #12, R3
JMP	L_ecg2_hw_register_bit_set1
L_ecg2_hw_register_bit_set0:
;ecg2_hw.c,11 :: 		else if (val == 0)
; val start address is: 8 (R2)
; bit_num start address is: 4 (R1)
CMP.B	R2, #0
JMPC	R30, Z, #0, L_ecg2_hw_register_bit_set2
; val end address is: 8 (R2)
;ecg2_hw.c,12 :: 		tempbuff &= ~(1 << bit_num);
BEXTU.L	R4, R1, #256
; bit_num end address is: 4 (R1)
LDK.L	R3, #1
ASHL.L	R3, R3, R4
BEXTS.L	R3, R3, #0
XOR.L	R4, R3, #-1
BEXTS.L	R4, R4, #0
LDI.B	R3, SP, #12
AND.L	R3, R3, R4
STI.B	SP, #12, R3
L_ecg2_hw_register_bit_set2:
L_ecg2_hw_register_bit_set1:
;ecg2_hw.c,13 :: 		ecg2_hal_write_bytes(reg, &tempbuff, 1);
ADD.L	R3, SP, #12
LDK.L	R2, #1
MOVE.L	R1, R3
; reg end address is: 0 (R0)
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,14 :: 		}
L_end_register_bit_set:
UNLINK	LR
RETURN	
; end of ecg2_hw_register_bit_set
_ecg2_get_device_id:
;ecg2_hw.c,16 :: 		uint8_t ecg2_get_device_id()
LINK	LR, #4
;ecg2_hw.c,19 :: 		ecg2_hal_read_bytes(ID_REG, &tempbuff, 1);
ADD.L	R0, SP, #0
LDK.L	R2, #1
MOVE.L	R1, R0
LDK.L	R0, #0
CALL	_ecg2_hal_read_bytes+0
;ecg2_hw.c,20 :: 		return tempbuff;
LDI.B	R0, SP, #0
;ecg2_hw.c,21 :: 		}
L_end_ecg2_get_device_id:
UNLINK	LR
RETURN	
; end of _ecg2_get_device_id
_ecg2_daisy_chain_enable:
;ecg2_hw.c,23 :: 		void ecg2_daisy_chain_enable(bool enable)
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,25 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_daisy_chain_enable3
; enable end address is: 0 (R0)
;ecg2_hw.c,26 :: 		register_bit_set(CONFIG1_REG, 6, 0);
LDK.L	R2, #0
LDK.L	R1, #6
LDK.L	R0, #1
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_daisy_chain_enable4
L_ecg2_daisy_chain_enable3:
;ecg2_hw.c,28 :: 		register_bit_set(CONFIG1_REG, 6, 1);
LDK.L	R2, #1
LDK.L	R1, #6
LDK.L	R0, #1
CALL	ecg2_hw_register_bit_set+0
L_ecg2_daisy_chain_enable4:
;ecg2_hw.c,29 :: 		}
L_end_ecg2_daisy_chain_enable:
RETURN	
; end of _ecg2_daisy_chain_enable
_ecg2_oscillator_clock_enable:
;ecg2_hw.c,31 :: 		void ecg2_oscillator_clock_enable ( bool enable )
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,34 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_oscillator_clock_enable5
; enable end address is: 0 (R0)
;ecg2_hw.c,35 :: 		register_bit_set(CONFIG1_REG, 5, 0);
LDK.L	R2, #0
LDK.L	R1, #5
LDK.L	R0, #1
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_oscillator_clock_enable6
L_ecg2_oscillator_clock_enable5:
;ecg2_hw.c,37 :: 		register_bit_set(CONFIG1_REG, 5, 1);
LDK.L	R2, #1
LDK.L	R1, #5
LDK.L	R0, #1
CALL	ecg2_hw_register_bit_set+0
L_ecg2_oscillator_clock_enable6:
;ecg2_hw.c,38 :: 		}
L_end_ecg2_oscillator_clock_enable:
RETURN	
; end of _ecg2_oscillator_clock_enable
_ecg2_set_output_data_rate:
;ecg2_hw.c,41 :: 		int8_t ecg2_set_output_data_rate(output_data_rate_t output_data_rate)
; output_data_rate start address is: 0 (R0)
LINK	LR, #8
; output_data_rate end address is: 0 (R0)
; output_data_rate start address is: 0 (R0)
;ecg2_hw.c,43 :: 		uint8_t tempbuff = 0;
LDK.L	R1, #0
STI.B	SP, #4, R1
;ecg2_hw.c,44 :: 		if (output_data_rate > 7)
CMP.B	R0, #7
JMPC	R30, A, #0, L_ecg2_set_output_data_rate7
; output_data_rate end address is: 0 (R0)
;ecg2_hw.c,45 :: 		return  -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_set_output_data_rate
L_ecg2_set_output_data_rate7:
;ecg2_hw.c,47 :: 		ecg2_hal_read_bytes(CONFIG1_REG, &tempbuff, 1);
; output_data_rate start address is: 0 (R0)
ADD.L	R1, SP, #4
STI.B	SP, #0, R0
LDK.L	R2, #1
LDK.L	R0, #1
CALL	_ecg2_hal_read_bytes+0
LDI.B	R0, SP, #0
;ecg2_hw.c,48 :: 		tempbuff &= ~(7);
LDI.B	R1, SP, #4
AND.L	R1, R1, #-8
STI.B	SP, #4, R1
;ecg2_hw.c,50 :: 		tempbuff |= output_data_rate;
BEXTU.L	R1, R1, #256
OR.L	R1, R1, R0
; output_data_rate end address is: 0 (R0)
STI.B	SP, #4, R1
;ecg2_hw.c,51 :: 		ecg2_hal_write_bytes(CONFIG1_REG, &tempbuff, 1);
ADD.L	R1, SP, #4
LDK.L	R2, #1
LDK.L	R0, #1
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,52 :: 		return 0;
LDK.L	R0, #0
;ecg2_hw.c,53 :: 		}
L_end_ecg2_set_output_data_rate:
UNLINK	LR
RETURN	
; end of _ecg2_set_output_data_rate
_ecg2_set_test_source:
;ecg2_hw.c,55 :: 		int8_t ecg2_set_test_source(test_source_t test_source)
; test_source start address is: 0 (R0)
; test_source end address is: 0 (R0)
; test_source start address is: 0 (R0)
;ecg2_hw.c,57 :: 		if ( test_source > 1)
CMP.B	R0, #1
JMPC	R30, A, #0, L_ecg2_set_test_source8
; test_source end address is: 0 (R0)
;ecg2_hw.c,58 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_set_test_source
L_ecg2_set_test_source8:
;ecg2_hw.c,61 :: 		register_bit_set(CONFIG2_REG, 4, test_source);
; test_source start address is: 0 (R0)
BEXTU.L	R2, R0, #256
; test_source end address is: 0 (R0)
LDK.L	R1, #4
LDK.L	R0, #2
CALL	ecg2_hw_register_bit_set+0
;ecg2_hw.c,63 :: 		return 0;
LDK.L	R0, #0
;ecg2_hw.c,64 :: 		}
L_end_ecg2_set_test_source:
RETURN	
; end of _ecg2_set_test_source
_ecg2_set_test_amplitude:
;ecg2_hw.c,66 :: 		int8_t ecg2_set_test_amplitude (test_amplitude_t amplitutde)
; amplitutde start address is: 0 (R0)
; amplitutde end address is: 0 (R0)
; amplitutde start address is: 0 (R0)
;ecg2_hw.c,68 :: 		if (amplitutde > 1)
CMP.B	R0, #1
JMPC	R30, A, #0, L_ecg2_set_test_amplitude10
; amplitutde end address is: 0 (R0)
;ecg2_hw.c,69 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_set_test_amplitude
L_ecg2_set_test_amplitude10:
;ecg2_hw.c,71 :: 		register_bit_set(CONFIG2_REG, 2, 1);
LDK.L	R2, #1
LDK.L	R1, #2
LDK.L	R0, #2
CALL	ecg2_hw_register_bit_set+0
;ecg2_hw.c,73 :: 		return 0;
LDK.L	R0, #0
;ecg2_hw.c,74 :: 		}
L_end_ecg2_set_test_amplitude:
RETURN	
; end of _ecg2_set_test_amplitude
_ecg2_set_test_frequency:
;ecg2_hw.c,77 :: 		int8_t ecg2_set_test_frequency (test_frequency_t frequency)
; frequency start address is: 0 (R0)
LINK	LR, #8
; frequency end address is: 0 (R0)
; frequency start address is: 0 (R0)
;ecg2_hw.c,79 :: 		uint8_t tempbuff = 0;
LDK.L	R1, #0
STI.B	SP, #4, R1
;ecg2_hw.c,80 :: 		if (frequency > 3)
CMP.B	R0, #3
JMPC	R30, A, #0, L_ecg2_set_test_frequency12
; frequency end address is: 0 (R0)
;ecg2_hw.c,81 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_set_test_frequency
L_ecg2_set_test_frequency12:
;ecg2_hw.c,83 :: 		ecg2_hal_read_bytes(CONFIG2_REG, &tempbuff, 1);
; frequency start address is: 0 (R0)
ADD.L	R1, SP, #4
STI.B	SP, #0, R0
LDK.L	R2, #1
LDK.L	R0, #2
CALL	_ecg2_hal_read_bytes+0
LDI.B	R0, SP, #0
;ecg2_hw.c,85 :: 		tempbuff &= ~(3);
LDI.B	R1, SP, #4
AND.L	R1, R1, #-4
STI.B	SP, #4, R1
;ecg2_hw.c,86 :: 		tempbuff |= frequency;
BEXTU.L	R1, R1, #256
OR.L	R1, R1, R0
; frequency end address is: 0 (R0)
STI.B	SP, #4, R1
;ecg2_hw.c,87 :: 		ecg2_hal_write_bytes(CONFIG2_REG, &tempbuff, 1);
ADD.L	R1, SP, #4
LDK.L	R2, #1
LDK.L	R0, #2
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,88 :: 		return 0;
LDK.L	R0, #0
;ecg2_hw.c,89 :: 		}
L_end_ecg2_set_test_frequency:
UNLINK	LR
RETURN	
; end of _ecg2_set_test_frequency
_ecg2_power_down_reference_buffer_enable:
;ecg2_hw.c,91 :: 		void ecg2_power_down_reference_buffer_enable(bool enable)
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,93 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_power_down_reference_buffer_enable13
; enable end address is: 0 (R0)
;ecg2_hw.c,94 :: 		register_bit_set(CONFIG3_REG, 7, 1);
LDK.L	R2, #1
LDK.L	R1, #7
LDK.L	R0, #3
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_power_down_reference_buffer_enable14
L_ecg2_power_down_reference_buffer_enable13:
;ecg2_hw.c,96 :: 		register_bit_set(CONFIG3_REG, 7, 0);
LDK.L	R2, #0
LDK.L	R1, #7
LDK.L	R0, #3
CALL	ecg2_hw_register_bit_set+0
L_ecg2_power_down_reference_buffer_enable14:
;ecg2_hw.c,97 :: 		}
L_end_ecg2_power_down_reference_buffer_enable:
RETURN	
; end of _ecg2_power_down_reference_buffer_enable
_ecg2_set_reference_voltage:
;ecg2_hw.c,99 :: 		int8_t ecg2_set_reference_voltage(reference_voltage_t refvol)
; refvol start address is: 0 (R0)
; refvol end address is: 0 (R0)
; refvol start address is: 0 (R0)
;ecg2_hw.c,101 :: 		if (refvol > 1)
CMP.B	R0, #1
JMPC	R30, A, #0, L_ecg2_set_reference_voltage15
; refvol end address is: 0 (R0)
;ecg2_hw.c,102 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_set_reference_voltage
L_ecg2_set_reference_voltage15:
;ecg2_hw.c,105 :: 		register_bit_set(CONFIG3_REG, 5, refvol);
; refvol start address is: 0 (R0)
BEXTU.L	R2, R0, #256
; refvol end address is: 0 (R0)
LDK.L	R1, #5
LDK.L	R0, #3
CALL	ecg2_hw_register_bit_set+0
;ecg2_hw.c,106 :: 		}
L_end_ecg2_set_reference_voltage:
RETURN	
; end of _ecg2_set_reference_voltage
_ecg2_rld_measurement_enable:
;ecg2_hw.c,108 :: 		void ecg2_rld_measurement_enable( bool enable )
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,110 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_rld_measurement_enable17
; enable end address is: 0 (R0)
;ecg2_hw.c,111 :: 		register_bit_set(CONFIG3_REG, 4, 0);
LDK.L	R2, #0
LDK.L	R1, #4
LDK.L	R0, #3
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_rld_measurement_enable18
L_ecg2_rld_measurement_enable17:
;ecg2_hw.c,113 :: 		register_bit_set(CONFIG3_REG, 4, 0);
LDK.L	R2, #0
LDK.L	R1, #4
LDK.L	R0, #3
CALL	ecg2_hw_register_bit_set+0
L_ecg2_rld_measurement_enable18:
;ecg2_hw.c,114 :: 		}
L_end_ecg2_rld_measurement_enable:
RETURN	
; end of _ecg2_rld_measurement_enable
_ecg2_rldref_source_select:
;ecg2_hw.c,116 :: 		int8_t ecg2_rldref_source_select(rldef_signal_t source)
; source start address is: 0 (R0)
; source end address is: 0 (R0)
; source start address is: 0 (R0)
;ecg2_hw.c,118 :: 		if (source > 1)
CMP.B	R0, #1
JMPC	R30, A, #0, L_ecg2_rldref_source_select19
; source end address is: 0 (R0)
;ecg2_hw.c,119 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_rldref_source_select
L_ecg2_rldref_source_select19:
;ecg2_hw.c,121 :: 		register_bit_set(CONFIG3_REG, 3, source);
; source start address is: 0 (R0)
BEXTU.L	R2, R0, #256
; source end address is: 0 (R0)
LDK.L	R1, #3
LDK.L	R0, #3
CALL	ecg2_hw_register_bit_set+0
;ecg2_hw.c,122 :: 		}
L_end_ecg2_rldref_source_select:
RETURN	
; end of _ecg2_rldref_source_select
_ecg2_rld_buffer_enable:
;ecg2_hw.c,124 :: 		void ecg2_rld_buffer_enable (bool enable)
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,126 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_rld_buffer_enable21
; enable end address is: 0 (R0)
;ecg2_hw.c,127 :: 		register_bit_set(CONFIG3_REG, 2, 1);
LDK.L	R2, #1
LDK.L	R1, #2
LDK.L	R0, #3
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_rld_buffer_enable22
L_ecg2_rld_buffer_enable21:
;ecg2_hw.c,129 :: 		register_bit_set(CONFIG3_REG, 2, 0);
LDK.L	R2, #0
LDK.L	R1, #2
LDK.L	R0, #3
CALL	ecg2_hw_register_bit_set+0
L_ecg2_rld_buffer_enable22:
;ecg2_hw.c,130 :: 		}
L_end_ecg2_rld_buffer_enable:
RETURN	
; end of _ecg2_rld_buffer_enable
_ecg2_rld_sense_enable:
;ecg2_hw.c,132 :: 		int8_t ecg2_rld_sense_enable(bool enable)
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,134 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_rld_sense_enable23
; enable end address is: 0 (R0)
;ecg2_hw.c,135 :: 		register_bit_set(CONFIG3_REG, 1, 1);
LDK.L	R2, #1
LDK.L	R1, #1
LDK.L	R0, #3
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_rld_sense_enable24
L_ecg2_rld_sense_enable23:
;ecg2_hw.c,137 :: 		register_bit_set(CONFIG3_REG, 1, 0);
LDK.L	R2, #0
LDK.L	R1, #1
LDK.L	R0, #3
CALL	ecg2_hw_register_bit_set+0
L_ecg2_rld_sense_enable24:
;ecg2_hw.c,138 :: 		}
L_end_ecg2_rld_sense_enable:
RETURN	
; end of _ecg2_rld_sense_enable
_ecg2_rld_get_status:
;ecg2_hw.c,140 :: 		uint8_t ecg2_rld_get_status ()
LINK	LR, #4
;ecg2_hw.c,142 :: 		uint8_t tempbuff = 0;
LDK.L	R0, #0
STI.B	SP, #0, R0
;ecg2_hw.c,143 :: 		ecg2_hal_read_bytes(CONFIG3_REG, &tempbuff, 1);
ADD.L	R0, SP, #0
LDK.L	R2, #1
MOVE.L	R1, R0
LDK.L	R0, #3
CALL	_ecg2_hal_read_bytes+0
;ecg2_hw.c,144 :: 		return (tempbuff & 1);
LDI.B	R0, SP, #0
AND.L	R0, R0, #1
;ecg2_hw.c,145 :: 		}
L_end_ecg2_rld_get_status:
UNLINK	LR
RETURN	
; end of _ecg2_rld_get_status
_ecg2_lead_off_comparator_threshold_set:
;ecg2_hw.c,147 :: 		int8_t ecg2_lead_off_comparator_threshold_set(lead_off_threshold_t threshold)
; threshold start address is: 0 (R0)
LINK	LR, #8
; threshold end address is: 0 (R0)
; threshold start address is: 0 (R0)
;ecg2_hw.c,149 :: 		uint8_t tempbuf = 0;
LDK.L	R1, #0
STI.B	SP, #4, R1
;ecg2_hw.c,150 :: 		if (threshold > 7)
CMP.B	R0, #7
JMPC	R30, A, #0, L_ecg2_lead_off_comparator_threshold_set25
; threshold end address is: 0 (R0)
;ecg2_hw.c,151 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_lead_off_comparator_threshold_set
L_ecg2_lead_off_comparator_threshold_set25:
;ecg2_hw.c,153 :: 		ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
; threshold start address is: 0 (R0)
ADD.L	R1, SP, #4
STI.B	SP, #0, R0
LDK.L	R2, #1
LDK.L	R0, #4
CALL	_ecg2_hal_read_bytes+0
LDI.B	R0, SP, #0
;ecg2_hw.c,154 :: 		tempbuf &= ~(7 << 5);
LDI.B	R1, SP, #4
AND.L	R2, R1, #31
BEXTU.L	R2, R2, #256
STI.B	SP, #4, R2
;ecg2_hw.c,155 :: 		tempbuf |= threshold << 5;
BEXTU.L	R1, R0, #256
; threshold end address is: 0 (R0)
ASHL.L	R1, R1, #5
BEXTU.L	R1, R1, #0
OR.L	R1, R2, R1
STI.B	SP, #4, R1
;ecg2_hw.c,156 :: 		ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
ADD.L	R1, SP, #4
LDK.L	R2, #1
LDK.L	R0, #4
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,157 :: 		return 0;
LDK.L	R0, #0
;ecg2_hw.c,158 :: 		}
L_end_ecg2_lead_off_comparator_threshold_set:
UNLINK	LR
RETURN	
; end of _ecg2_lead_off_comparator_threshold_set
_ecg2_vlead_off_enable:
;ecg2_hw.c,160 :: 		void ecg2_vlead_off_enable(bool enable)
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,162 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_vlead_off_enable26
; enable end address is: 0 (R0)
;ecg2_hw.c,163 :: 		register_bit_set(LOFF_REG, 4, 0);
LDK.L	R2, #0
LDK.L	R1, #4
LDK.L	R0, #4
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_vlead_off_enable27
L_ecg2_vlead_off_enable26:
;ecg2_hw.c,165 :: 		register_bit_set(LOFF_REG, 4, 1);
LDK.L	R2, #1
LDK.L	R1, #4
LDK.L	R0, #4
CALL	ecg2_hw_register_bit_set+0
L_ecg2_vlead_off_enable27:
;ecg2_hw.c,166 :: 		}
L_end_ecg2_vlead_off_enable:
RETURN	
; end of _ecg2_vlead_off_enable
_ecg2_ilead_off_magnitude_set:
;ecg2_hw.c,168 :: 		int8_t ecg2_ilead_off_magnitude_set (ilead_off_magnitude_t set)
; set start address is: 0 (R0)
LINK	LR, #8
; set end address is: 0 (R0)
; set start address is: 0 (R0)
;ecg2_hw.c,170 :: 		uint8_t tempbuf = 0;
LDK.L	R1, #0
STI.B	SP, #4, R1
;ecg2_hw.c,171 :: 		if (set > 3)
CMP.B	R0, #3
JMPC	R30, A, #0, L_ecg2_ilead_off_magnitude_set28
; set end address is: 0 (R0)
;ecg2_hw.c,172 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_ilead_off_magnitude_set
L_ecg2_ilead_off_magnitude_set28:
;ecg2_hw.c,174 :: 		ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
; set start address is: 0 (R0)
ADD.L	R1, SP, #4
STI.B	SP, #0, R0
LDK.L	R2, #1
LDK.L	R0, #4
CALL	_ecg2_hal_read_bytes+0
LDI.B	R0, SP, #0
;ecg2_hw.c,175 :: 		tempbuf &= ~(3 << 2);
LDI.B	R1, SP, #4
AND.L	R3, R1, #-13
STI.B	SP, #4, R3
;ecg2_hw.c,176 :: 		tempbuf |= set << 2;
BEXTU.L	R1, R0, #256
; set end address is: 0 (R0)
ASHL.L	R2, R1, #2
BEXTU.L	R2, R2, #0
BEXTU.L	R1, R3, #256
OR.L	R1, R1, R2
STI.B	SP, #4, R1
;ecg2_hw.c,177 :: 		ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
ADD.L	R1, SP, #4
LDK.L	R2, #1
LDK.L	R0, #4
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,178 :: 		}
L_end_ecg2_ilead_off_magnitude_set:
UNLINK	LR
RETURN	
; end of _ecg2_ilead_off_magnitude_set
_ecg2_flead_off_frequency_set:
;ecg2_hw.c,180 :: 		int8_t ecg2_flead_off_frequency_set (uint8_t set)
; set start address is: 0 (R0)
LINK	LR, #8
; set end address is: 0 (R0)
; set start address is: 0 (R0)
;ecg2_hw.c,182 :: 		uint8_t tempbuf = 0;
LDK.L	R1, #0
STI.B	SP, #4, R1
;ecg2_hw.c,183 :: 		if (set > 3 )
CMP.B	R0, #3
JMPC	R30, A, #0, L_ecg2_flead_off_frequency_set29
; set end address is: 0 (R0)
;ecg2_hw.c,184 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_flead_off_frequency_set
L_ecg2_flead_off_frequency_set29:
;ecg2_hw.c,185 :: 		ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
; set start address is: 0 (R0)
ADD.L	R1, SP, #4
STI.B	SP, #0, R0
LDK.L	R2, #1
LDK.L	R0, #4
CALL	_ecg2_hal_read_bytes+0
LDI.B	R0, SP, #0
;ecg2_hw.c,186 :: 		tempbuf &= ~ 3;
LDI.B	R1, SP, #4
AND.L	R1, R1, #-4
STI.B	SP, #4, R1
;ecg2_hw.c,187 :: 		tempbuf |= set;
BEXTU.L	R1, R1, #256
OR.L	R1, R1, R0
; set end address is: 0 (R0)
STI.B	SP, #4, R1
;ecg2_hw.c,188 :: 		ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
ADD.L	R1, SP, #4
LDK.L	R2, #1
LDK.L	R0, #4
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,189 :: 		}
L_end_ecg2_flead_off_frequency_set:
UNLINK	LR
RETURN	
; end of _ecg2_flead_off_frequency_set
_ecg2_configure_channel:
;ecg2_hw.c,191 :: 		int8_t ecg2_configure_channel (uint8_t channel, bool power_down, uint8_t pga_gain, uint8_t channel_input)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
; channel start address is: 0 (R0)
LINK	LR, #4
; channel_input end address is: 12 (R3)
; pga_gain end address is: 8 (R2)
; power_down end address is: 4 (R1)
; channel end address is: 0 (R0)
; channel start address is: 0 (R0)
; power_down start address is: 4 (R1)
; pga_gain start address is: 8 (R2)
; channel_input start address is: 12 (R3)
;ecg2_hw.c,193 :: 		uint8_t tempbuff = 0;
LDK.L	R4, #0
STI.B	SP, #0, R4
;ecg2_hw.c,195 :: 		switch (channel)
JMP	L_ecg2_configure_channel30
; channel end address is: 0 (R0)
;ecg2_hw.c,197 :: 		case 1:
L_ecg2_configure_channel32:
;ecg2_hw.c,198 :: 		if (pga_gain > 7)
CMP.B	R2, #7
JMPC	R30, A, #0, L_ecg2_configure_channel33
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,199 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel33:
;ecg2_hw.c,201 :: 		if ( channel_input > 7 )
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R3, #7
JMPC	R30, A, #0, L_ecg2_configure_channel34
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,202 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel34:
;ecg2_hw.c,204 :: 		tempbuff |= pga_gain << 4;
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
BEXTU.L	R4, R2, #256
; pga_gain end address is: 8 (R2)
ASHL.L	R5, R4, #4
BEXTU.L	R5, R5, #0
LDI.B	R4, SP, #0
OR.L	R4, R4, R5
STI.B	SP, #0, R4
;ecg2_hw.c,205 :: 		tempbuff |= channel_input;
BEXTU.L	R4, R4, #256
OR.L	R4, R4, R3
; channel_input end address is: 12 (R3)
STI.B	SP, #0, R4
;ecg2_hw.c,206 :: 		if (power_down)
CMP.B	R1, #0
JMPC	R30, Z, #1, L_ecg2_configure_channel35
; power_down end address is: 4 (R1)
;ecg2_hw.c,207 :: 		tempbuff |= 1 << 7;
LDI.B	R4, SP, #0
OR.L	R4, R4, #128
STI.B	SP, #0, R4
JMP	L_ecg2_configure_channel36
L_ecg2_configure_channel35:
;ecg2_hw.c,209 :: 		tempbuff &= ~(1 << 7);
LDI.B	R4, SP, #0
AND.L	R4, R4, #127
STI.B	SP, #0, R4
L_ecg2_configure_channel36:
;ecg2_hw.c,211 :: 		ecg2_hal_write_bytes(CH1SET_REG, &tempbuff, 1);
ADD.L	R4, SP, #0
LDK.L	R2, #1
MOVE.L	R1, R4
LDK.L	R0, #5
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,212 :: 		return 0;
LDK.L	R0, #0
JMP	L_end_ecg2_configure_channel
;ecg2_hw.c,214 :: 		case 2:
L_ecg2_configure_channel37:
;ecg2_hw.c,215 :: 		if (pga_gain > 15)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R2, #15
JMPC	R30, A, #0, L_ecg2_configure_channel38
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,216 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel38:
;ecg2_hw.c,218 :: 		if ( channel_input > 15 )
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R3, #15
JMPC	R30, A, #0, L_ecg2_configure_channel39
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,219 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel39:
;ecg2_hw.c,221 :: 		if (power_down)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R1, #0
JMPC	R30, Z, #1, L_ecg2_configure_channel40
; power_down end address is: 4 (R1)
;ecg2_hw.c,222 :: 		tempbuff |= 1 << 7;
LDI.B	R4, SP, #0
OR.L	R4, R4, #128
STI.B	SP, #0, R4
JMP	L_ecg2_configure_channel41
L_ecg2_configure_channel40:
;ecg2_hw.c,224 :: 		tempbuff &= ~(1 << 7);
LDI.B	R4, SP, #0
AND.L	R4, R4, #127
STI.B	SP, #0, R4
L_ecg2_configure_channel41:
;ecg2_hw.c,226 :: 		tempbuff |= pga_gain << 4;
BEXTU.L	R4, R2, #256
; pga_gain end address is: 8 (R2)
ASHL.L	R5, R4, #4
BEXTU.L	R5, R5, #0
LDI.B	R4, SP, #0
OR.L	R4, R4, R5
STI.B	SP, #0, R4
;ecg2_hw.c,227 :: 		tempbuff |= channel_input;
BEXTU.L	R4, R4, #256
OR.L	R4, R4, R3
; channel_input end address is: 12 (R3)
STI.B	SP, #0, R4
;ecg2_hw.c,228 :: 		ecg2_hal_write_bytes(CH2SET_REG, &tempbuff, 1);
ADD.L	R4, SP, #0
LDK.L	R2, #1
MOVE.L	R1, R4
LDK.L	R0, #6
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,229 :: 		return 0;
LDK.L	R0, #0
JMP	L_end_ecg2_configure_channel
;ecg2_hw.c,231 :: 		case 3:
L_ecg2_configure_channel42:
;ecg2_hw.c,232 :: 		if (pga_gain > 15)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R2, #15
JMPC	R30, A, #0, L_ecg2_configure_channel43
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,233 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel43:
;ecg2_hw.c,235 :: 		if ( channel_input > 15 )
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R3, #15
JMPC	R30, A, #0, L_ecg2_configure_channel44
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,236 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel44:
;ecg2_hw.c,238 :: 		if (power_down)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R1, #0
JMPC	R30, Z, #1, L_ecg2_configure_channel45
; power_down end address is: 4 (R1)
;ecg2_hw.c,239 :: 		tempbuff |= 1 << 7;
LDI.B	R4, SP, #0
OR.L	R4, R4, #128
STI.B	SP, #0, R4
JMP	L_ecg2_configure_channel46
L_ecg2_configure_channel45:
;ecg2_hw.c,241 :: 		tempbuff &= ~(1 << 7);
LDI.B	R4, SP, #0
AND.L	R4, R4, #127
STI.B	SP, #0, R4
L_ecg2_configure_channel46:
;ecg2_hw.c,243 :: 		tempbuff |= pga_gain << 4;
BEXTU.L	R4, R2, #256
; pga_gain end address is: 8 (R2)
ASHL.L	R5, R4, #4
BEXTU.L	R5, R5, #0
LDI.B	R4, SP, #0
OR.L	R4, R4, R5
STI.B	SP, #0, R4
;ecg2_hw.c,244 :: 		tempbuff |= channel_input;
BEXTU.L	R4, R4, #256
OR.L	R4, R4, R3
; channel_input end address is: 12 (R3)
STI.B	SP, #0, R4
;ecg2_hw.c,245 :: 		ecg2_hal_write_bytes(CH3SET_REG, &tempbuff, 1);
ADD.L	R4, SP, #0
LDK.L	R2, #1
MOVE.L	R1, R4
LDK.L	R0, #7
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,246 :: 		return 0;
LDK.L	R0, #0
JMP	L_end_ecg2_configure_channel
;ecg2_hw.c,248 :: 		case 4:
L_ecg2_configure_channel47:
;ecg2_hw.c,249 :: 		if (pga_gain > 15)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R2, #15
JMPC	R30, A, #0, L_ecg2_configure_channel48
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,250 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel48:
;ecg2_hw.c,252 :: 		if ( channel_input > 15 )
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R3, #15
JMPC	R30, A, #0, L_ecg2_configure_channel49
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,253 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel49:
;ecg2_hw.c,255 :: 		if (power_down)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R1, #0
JMPC	R30, Z, #1, L_ecg2_configure_channel50
; power_down end address is: 4 (R1)
;ecg2_hw.c,256 :: 		tempbuff |= 1 << 7;
LDI.B	R4, SP, #0
OR.L	R4, R4, #128
STI.B	SP, #0, R4
JMP	L_ecg2_configure_channel51
L_ecg2_configure_channel50:
;ecg2_hw.c,258 :: 		tempbuff &= ~(1 << 7);
LDI.B	R4, SP, #0
AND.L	R4, R4, #127
STI.B	SP, #0, R4
L_ecg2_configure_channel51:
;ecg2_hw.c,260 :: 		tempbuff |= pga_gain << 4;
BEXTU.L	R4, R2, #256
; pga_gain end address is: 8 (R2)
ASHL.L	R5, R4, #4
BEXTU.L	R5, R5, #0
LDI.B	R4, SP, #0
OR.L	R4, R4, R5
STI.B	SP, #0, R4
;ecg2_hw.c,261 :: 		tempbuff |= channel_input;
BEXTU.L	R4, R4, #256
OR.L	R4, R4, R3
; channel_input end address is: 12 (R3)
STI.B	SP, #0, R4
;ecg2_hw.c,262 :: 		ecg2_hal_write_bytes(CH4SET_REG, &tempbuff, 1);
ADD.L	R4, SP, #0
LDK.L	R2, #1
MOVE.L	R1, R4
LDK.L	R0, #8
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,263 :: 		return 0;
LDK.L	R0, #0
JMP	L_end_ecg2_configure_channel
;ecg2_hw.c,264 :: 		case 5:
L_ecg2_configure_channel52:
;ecg2_hw.c,265 :: 		if (pga_gain > 15)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R2, #15
JMPC	R30, A, #0, L_ecg2_configure_channel53
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,266 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel53:
;ecg2_hw.c,268 :: 		if ( channel_input > 15 )
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R3, #15
JMPC	R30, A, #0, L_ecg2_configure_channel54
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,269 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel54:
;ecg2_hw.c,271 :: 		if (power_down)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R1, #0
JMPC	R30, Z, #1, L_ecg2_configure_channel55
; power_down end address is: 4 (R1)
;ecg2_hw.c,272 :: 		tempbuff |= 1 << 7;
LDI.B	R4, SP, #0
OR.L	R4, R4, #128
STI.B	SP, #0, R4
JMP	L_ecg2_configure_channel56
L_ecg2_configure_channel55:
;ecg2_hw.c,274 :: 		tempbuff &= ~(1 << 7);
LDI.B	R4, SP, #0
AND.L	R4, R4, #127
STI.B	SP, #0, R4
L_ecg2_configure_channel56:
;ecg2_hw.c,276 :: 		tempbuff |= pga_gain << 4;
BEXTU.L	R4, R2, #256
; pga_gain end address is: 8 (R2)
ASHL.L	R5, R4, #4
BEXTU.L	R5, R5, #0
LDI.B	R4, SP, #0
OR.L	R4, R4, R5
STI.B	SP, #0, R4
;ecg2_hw.c,277 :: 		tempbuff |= channel_input;
BEXTU.L	R4, R4, #256
OR.L	R4, R4, R3
; channel_input end address is: 12 (R3)
STI.B	SP, #0, R4
;ecg2_hw.c,278 :: 		ecg2_hal_write_bytes(CH5SET_REG, &tempbuff, 1);
ADD.L	R4, SP, #0
LDK.L	R2, #1
MOVE.L	R1, R4
LDK.L	R0, #9
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,279 :: 		return 0;
LDK.L	R0, #0
JMP	L_end_ecg2_configure_channel
;ecg2_hw.c,281 :: 		case 6:
L_ecg2_configure_channel57:
;ecg2_hw.c,282 :: 		if (pga_gain > 15)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R2, #15
JMPC	R30, A, #0, L_ecg2_configure_channel58
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,283 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel58:
;ecg2_hw.c,285 :: 		if ( channel_input > 15 )
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R3, #15
JMPC	R30, A, #0, L_ecg2_configure_channel59
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,286 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel59:
;ecg2_hw.c,288 :: 		if (power_down)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R1, #0
JMPC	R30, Z, #1, L_ecg2_configure_channel60
; power_down end address is: 4 (R1)
;ecg2_hw.c,289 :: 		tempbuff |= 1 << 7;
LDI.B	R4, SP, #0
OR.L	R4, R4, #128
STI.B	SP, #0, R4
JMP	L_ecg2_configure_channel61
L_ecg2_configure_channel60:
;ecg2_hw.c,291 :: 		tempbuff &= ~(1 << 7);
LDI.B	R4, SP, #0
AND.L	R4, R4, #127
STI.B	SP, #0, R4
L_ecg2_configure_channel61:
;ecg2_hw.c,293 :: 		tempbuff |= pga_gain << 4;
BEXTU.L	R4, R2, #256
; pga_gain end address is: 8 (R2)
ASHL.L	R5, R4, #4
BEXTU.L	R5, R5, #0
LDI.B	R4, SP, #0
OR.L	R4, R4, R5
STI.B	SP, #0, R4
;ecg2_hw.c,294 :: 		tempbuff |= channel_input;
BEXTU.L	R4, R4, #256
OR.L	R4, R4, R3
; channel_input end address is: 12 (R3)
STI.B	SP, #0, R4
;ecg2_hw.c,295 :: 		ecg2_hal_write_bytes(CH6SET_REG, &tempbuff, 1);
ADD.L	R4, SP, #0
LDK.L	R2, #1
MOVE.L	R1, R4
LDK.L	R0, #10
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,296 :: 		return 0;
LDK.L	R0, #0
JMP	L_end_ecg2_configure_channel
;ecg2_hw.c,298 :: 		case 7:
L_ecg2_configure_channel62:
;ecg2_hw.c,299 :: 		if (pga_gain > 15)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R2, #15
JMPC	R30, A, #0, L_ecg2_configure_channel63
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,300 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel63:
;ecg2_hw.c,302 :: 		if ( channel_input > 15 )
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R3, #15
JMPC	R30, A, #0, L_ecg2_configure_channel64
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,303 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel64:
;ecg2_hw.c,305 :: 		if (power_down)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R1, #0
JMPC	R30, Z, #1, L_ecg2_configure_channel65
; power_down end address is: 4 (R1)
;ecg2_hw.c,306 :: 		tempbuff |= 1 << 7;
LDI.B	R4, SP, #0
OR.L	R4, R4, #128
STI.B	SP, #0, R4
JMP	L_ecg2_configure_channel66
L_ecg2_configure_channel65:
;ecg2_hw.c,308 :: 		tempbuff &= ~(1 << 7);
LDI.B	R4, SP, #0
AND.L	R4, R4, #127
STI.B	SP, #0, R4
L_ecg2_configure_channel66:
;ecg2_hw.c,310 :: 		tempbuff |= pga_gain << 4;
BEXTU.L	R4, R2, #256
; pga_gain end address is: 8 (R2)
ASHL.L	R5, R4, #4
BEXTU.L	R5, R5, #0
LDI.B	R4, SP, #0
OR.L	R4, R4, R5
STI.B	SP, #0, R4
;ecg2_hw.c,311 :: 		tempbuff |= channel_input;
BEXTU.L	R4, R4, #256
OR.L	R4, R4, R3
; channel_input end address is: 12 (R3)
STI.B	SP, #0, R4
;ecg2_hw.c,312 :: 		ecg2_hal_write_bytes(CH7SET_REG, &tempbuff, 1);
ADD.L	R4, SP, #0
LDK.L	R2, #1
MOVE.L	R1, R4
LDK.L	R0, #11
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,313 :: 		return 0;
LDK.L	R0, #0
JMP	L_end_ecg2_configure_channel
;ecg2_hw.c,315 :: 		case 8:
L_ecg2_configure_channel67:
;ecg2_hw.c,316 :: 		if (pga_gain > 15)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R2, #15
JMPC	R30, A, #0, L_ecg2_configure_channel68
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,317 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel68:
;ecg2_hw.c,319 :: 		if ( channel_input > 15 )
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R3, #15
JMPC	R30, A, #0, L_ecg2_configure_channel69
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
;ecg2_hw.c,320 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
L_ecg2_configure_channel69:
;ecg2_hw.c,322 :: 		if (power_down)
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
CMP.B	R1, #0
JMPC	R30, Z, #1, L_ecg2_configure_channel70
; power_down end address is: 4 (R1)
;ecg2_hw.c,323 :: 		tempbuff |= 1 << 7;
LDI.B	R4, SP, #0
OR.L	R4, R4, #128
STI.B	SP, #0, R4
JMP	L_ecg2_configure_channel71
L_ecg2_configure_channel70:
;ecg2_hw.c,325 :: 		tempbuff &= ~(1 << 7);
LDI.B	R4, SP, #0
AND.L	R4, R4, #127
STI.B	SP, #0, R4
L_ecg2_configure_channel71:
;ecg2_hw.c,327 :: 		tempbuff |= pga_gain << 4;
BEXTU.L	R4, R2, #256
; pga_gain end address is: 8 (R2)
ASHL.L	R5, R4, #4
BEXTU.L	R5, R5, #0
LDI.B	R4, SP, #0
OR.L	R4, R4, R5
STI.B	SP, #0, R4
;ecg2_hw.c,328 :: 		tempbuff |= channel_input;
BEXTU.L	R4, R4, #256
OR.L	R4, R4, R3
; channel_input end address is: 12 (R3)
STI.B	SP, #0, R4
;ecg2_hw.c,329 :: 		ecg2_hal_write_bytes(CH8SET_REG, &tempbuff, 1);
ADD.L	R4, SP, #0
LDK.L	R2, #1
MOVE.L	R1, R4
LDK.L	R0, #12
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,330 :: 		return 0;
LDK.L	R0, #0
JMP	L_end_ecg2_configure_channel
;ecg2_hw.c,332 :: 		default:
L_ecg2_configure_channel72:
;ecg2_hw.c,333 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_configure_channel
;ecg2_hw.c,334 :: 		}
L_ecg2_configure_channel30:
; channel_input start address is: 12 (R3)
; pga_gain start address is: 8 (R2)
; power_down start address is: 4 (R1)
; channel start address is: 0 (R0)
CMP.B	R0, #1
JMPC	R30, Z, #1, L_ecg2_configure_channel32
CMP.B	R0, #2
JMPC	R30, Z, #1, L_ecg2_configure_channel37
CMP.B	R0, #3
JMPC	R30, Z, #1, L_ecg2_configure_channel42
CMP.B	R0, #4
JMPC	R30, Z, #1, L_ecg2_configure_channel47
CMP.B	R0, #5
JMPC	R30, Z, #1, L_ecg2_configure_channel52
CMP.B	R0, #6
JMPC	R30, Z, #1, L_ecg2_configure_channel57
CMP.B	R0, #7
JMPC	R30, Z, #1, L_ecg2_configure_channel62
CMP.B	R0, #8
JMPC	R30, Z, #1, L_ecg2_configure_channel67
; channel end address is: 0 (R0)
; power_down end address is: 4 (R1)
; pga_gain end address is: 8 (R2)
; channel_input end address is: 12 (R3)
JMP	L_ecg2_configure_channel72
;ecg2_hw.c,335 :: 		}
L_end_ecg2_configure_channel:
UNLINK	LR
RETURN	
; end of _ecg2_configure_channel
_ecg2_right_leg_positive_drive_set:
;ecg2_hw.c,337 :: 		void ecg2_right_leg_positive_drive_set(uint8_t set)
; set start address is: 0 (R0)
LINK	LR, #4
; set end address is: 0 (R0)
; set start address is: 0 (R0)
;ecg2_hw.c,339 :: 		uint8_t tempbuff = set;
STI.B	SP, #0, R0
; set end address is: 0 (R0)
;ecg2_hw.c,340 :: 		ecg2_hal_write_bytes(RLD_SENSP_REG, &tempbuff, 1);
ADD.L	R1, SP, #0
LDK.L	R2, #1
LDK.L	R0, #13
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,341 :: 		}
L_end_ecg2_right_leg_positive_drive_set:
UNLINK	LR
RETURN	
; end of _ecg2_right_leg_positive_drive_set
_ecg2_right_leg_negative_drive_set:
;ecg2_hw.c,343 :: 		void ecg2_right_leg_negative_drive_set(uint8_t set)
; set start address is: 0 (R0)
LINK	LR, #4
; set end address is: 0 (R0)
; set start address is: 0 (R0)
;ecg2_hw.c,345 :: 		uint8_t tempbuff = set;
STI.B	SP, #0, R0
; set end address is: 0 (R0)
;ecg2_hw.c,346 :: 		ecg2_hal_write_bytes(RLD_SENSN_REG, &tempbuff, 1);
ADD.L	R1, SP, #0
LDK.L	R2, #1
LDK.L	R0, #14
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,347 :: 		}
L_end_ecg2_right_leg_negative_drive_set:
UNLINK	LR
RETURN	
; end of _ecg2_right_leg_negative_drive_set
_ecg2_lead_off_positive_channel_select:
;ecg2_hw.c,349 :: 		void ecg2_lead_off_positive_channel_select (uint8_t set)
; set start address is: 0 (R0)
LINK	LR, #4
; set end address is: 0 (R0)
; set start address is: 0 (R0)
;ecg2_hw.c,351 :: 		uint8_t tempbuff = set;
STI.B	SP, #0, R0
; set end address is: 0 (R0)
;ecg2_hw.c,352 :: 		ecg2_hal_write_bytes(LOFF_SENSP_REG, &tempbuff, 1);
ADD.L	R1, SP, #0
LDK.L	R2, #1
LDK.L	R0, #15
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,353 :: 		}
L_end_ecg2_lead_off_positive_channel_select:
UNLINK	LR
RETURN	
; end of _ecg2_lead_off_positive_channel_select
_ecg2_lead_off_negative_channel_select:
;ecg2_hw.c,355 :: 		void ecg2_lead_off_negative_channel_select (uint8_t set)
; set start address is: 0 (R0)
LINK	LR, #4
; set end address is: 0 (R0)
; set start address is: 0 (R0)
;ecg2_hw.c,357 :: 		uint8_t tempbuff = set;
STI.B	SP, #0, R0
; set end address is: 0 (R0)
;ecg2_hw.c,358 :: 		ecg2_hal_write_bytes(LOFF_SENSN_REG, &tempbuff, 1);
ADD.L	R1, SP, #0
LDK.L	R2, #1
LDK.L	R0, #16
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,359 :: 		}
L_end_ecg2_lead_off_negative_channel_select:
UNLINK	LR
RETURN	
; end of _ecg2_lead_off_negative_channel_select
_ecg2_lead_off_current_direction_select:
;ecg2_hw.c,361 :: 		void ecg2_lead_off_current_direction_select (uint8_t set)
; set start address is: 0 (R0)
LINK	LR, #4
; set end address is: 0 (R0)
; set start address is: 0 (R0)
;ecg2_hw.c,363 :: 		uint8_t tempbuff = set;
STI.B	SP, #0, R0
; set end address is: 0 (R0)
;ecg2_hw.c,364 :: 		ecg2_hal_write_bytes(LOFF_FLIP_REG, &tempbuff, 1);
ADD.L	R1, SP, #0
LDK.L	R2, #1
LDK.L	R0, #17
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,365 :: 		}
L_end_ecg2_lead_off_current_direction_select:
UNLINK	LR
RETURN	
; end of _ecg2_lead_off_current_direction_select
_ecg2_pace_detect_even_channels_select:
;ecg2_hw.c,367 :: 		int8_t ecg2_pace_detect_even_channels_select (pace_even_channels_t select)
; select start address is: 0 (R0)
LINK	LR, #8
; select end address is: 0 (R0)
; select start address is: 0 (R0)
;ecg2_hw.c,369 :: 		if (select > 3)
CMP.B	R0, #3
JMPC	R30, A, #0, L_ecg2_pace_detect_even_channels_select73
; select end address is: 0 (R0)
;ecg2_hw.c,370 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_pace_detect_even_channels_select
L_ecg2_pace_detect_even_channels_select73:
;ecg2_hw.c,374 :: 		uint8_t tempbuff = select;
; select start address is: 0 (R0)
STI.B	SP, #4, R0
;ecg2_hw.c,375 :: 		ecg2_hal_read_bytes(PACE_REG, &tempbuff, 1);
ADD.L	R1, SP, #4
STI.B	SP, #0, R0
LDK.L	R2, #1
LDK.L	R0, #21
CALL	_ecg2_hal_read_bytes+0
LDI.B	R0, SP, #0
;ecg2_hw.c,376 :: 		tempbuff &= ~(3 << 3);
LDI.B	R1, SP, #4
AND.L	R3, R1, #-25
STI.B	SP, #4, R3
;ecg2_hw.c,377 :: 		tempbuff |= select << 3;
BEXTU.L	R1, R0, #256
; select end address is: 0 (R0)
ASHL.L	R2, R1, #3
BEXTU.L	R2, R2, #0
BEXTU.L	R1, R3, #256
OR.L	R1, R1, R2
STI.B	SP, #4, R1
;ecg2_hw.c,378 :: 		ecg2_hal_write_bytes(PACE_REG, &tempbuff, 1 );
ADD.L	R1, SP, #4
LDK.L	R2, #1
LDK.L	R0, #21
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,379 :: 		return 0;
LDK.L	R0, #0
;ecg2_hw.c,381 :: 		}
L_end_ecg2_pace_detect_even_channels_select:
UNLINK	LR
RETURN	
; end of _ecg2_pace_detect_even_channels_select
_ecg2_pace_detect_odd_channels_select:
;ecg2_hw.c,383 :: 		int8_t ecg2_pace_detect_odd_channels_select (pace_odd_channels_t select)
; select start address is: 0 (R0)
LINK	LR, #8
; select end address is: 0 (R0)
; select start address is: 0 (R0)
;ecg2_hw.c,385 :: 		if (select > 3)
CMP.B	R0, #3
JMPC	R30, A, #0, L_ecg2_pace_detect_odd_channels_select75
; select end address is: 0 (R0)
;ecg2_hw.c,386 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_pace_detect_odd_channels_select
L_ecg2_pace_detect_odd_channels_select75:
;ecg2_hw.c,390 :: 		uint8_t tempbuff = select;
; select start address is: 0 (R0)
STI.B	SP, #4, R0
;ecg2_hw.c,391 :: 		ecg2_hal_read_bytes(PACE_REG, &tempbuff, 1 );
ADD.L	R1, SP, #4
STI.B	SP, #0, R0
LDK.L	R2, #1
LDK.L	R0, #21
CALL	_ecg2_hal_read_bytes+0
LDI.B	R0, SP, #0
;ecg2_hw.c,392 :: 		tempbuff &= ~(3 << 1);
LDI.B	R1, SP, #4
AND.L	R3, R1, #-7
STI.B	SP, #4, R3
;ecg2_hw.c,393 :: 		tempbuff |= select << 1;
BEXTU.L	R1, R0, #256
; select end address is: 0 (R0)
ASHL.L	R2, R1, #1
BEXTU.L	R2, R2, #0
BEXTU.L	R1, R3, #256
OR.L	R1, R1, R2
STI.B	SP, #4, R1
;ecg2_hw.c,394 :: 		ecg2_hal_write_bytes(PACE_REG, &tempbuff, 1 );
ADD.L	R1, SP, #4
LDK.L	R2, #1
LDK.L	R0, #21
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,395 :: 		return 0;
LDK.L	R0, #0
;ecg2_hw.c,397 :: 		}
L_end_ecg2_pace_detect_odd_channels_select:
UNLINK	LR
RETURN	
; end of _ecg2_pace_detect_odd_channels_select
_ecg2_pace_detect_buffer_enable:
;ecg2_hw.c,399 :: 		int8_t ecg2_pace_detect_buffer_enable ( bool enable )
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,401 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_pace_detect_buffer_enable77
; enable end address is: 0 (R0)
;ecg2_hw.c,402 :: 		register_bit_set(PACE_REG, 0, 1);
LDK.L	R2, #1
LDK.L	R1, #0
LDK.L	R0, #21
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_pace_detect_buffer_enable78
L_ecg2_pace_detect_buffer_enable77:
;ecg2_hw.c,404 :: 		register_bit_set(PACE_REG, 0, 0);
LDK.L	R2, #0
LDK.L	R1, #0
LDK.L	R0, #21
CALL	ecg2_hw_register_bit_set+0
L_ecg2_pace_detect_buffer_enable78:
;ecg2_hw.c,405 :: 		}
L_end_ecg2_pace_detect_buffer_enable:
RETURN	
; end of _ecg2_pace_detect_buffer_enable
_ecg2_single_shot_conversion_enable:
;ecg2_hw.c,407 :: 		void ecg2_single_shot_conversion_enable ( bool enable )
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,409 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_single_shot_conversion_enable79
; enable end address is: 0 (R0)
;ecg2_hw.c,410 :: 		register_bit_set(CONFIG4_REG, 3, 1);
LDK.L	R2, #1
LDK.L	R1, #3
LDK.L	R0, #23
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_single_shot_conversion_enable80
L_ecg2_single_shot_conversion_enable79:
;ecg2_hw.c,412 :: 		register_bit_set(CONFIG4_REG, 3, 0);
LDK.L	R2, #0
LDK.L	R1, #3
LDK.L	R0, #23
CALL	ecg2_hw_register_bit_set+0
L_ecg2_single_shot_conversion_enable80:
;ecg2_hw.c,413 :: 		}
L_end_ecg2_single_shot_conversion_enable:
RETURN	
; end of _ecg2_single_shot_conversion_enable
_ecg2_wct_to_rld_connection_enable:
;ecg2_hw.c,415 :: 		void ecg2_wct_to_rld_connection_enable ( bool enable )
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,417 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_wct_to_rld_connection_enable81
; enable end address is: 0 (R0)
;ecg2_hw.c,418 :: 		register_bit_set(CONFIG4_REG, 2, 1);
LDK.L	R2, #1
LDK.L	R1, #2
LDK.L	R0, #23
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_wct_to_rld_connection_enable82
L_ecg2_wct_to_rld_connection_enable81:
;ecg2_hw.c,420 :: 		register_bit_set(CONFIG4_REG, 2, 0);
LDK.L	R2, #0
LDK.L	R1, #2
LDK.L	R0, #23
CALL	ecg2_hw_register_bit_set+0
L_ecg2_wct_to_rld_connection_enable82:
;ecg2_hw.c,421 :: 		}
L_end_ecg2_wct_to_rld_connection_enable:
RETURN	
; end of _ecg2_wct_to_rld_connection_enable
_ecg2_lead_off_comparator_enable:
;ecg2_hw.c,423 :: 		void ecg2_lead_off_comparator_enable (bool enable )
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;ecg2_hw.c,425 :: 		if (enable)
CMP.B	R0, #0
JMPC	R30, Z, #1, L_ecg2_lead_off_comparator_enable83
; enable end address is: 0 (R0)
;ecg2_hw.c,426 :: 		register_bit_set(CONFIG4_REG, 1, 1);
LDK.L	R2, #1
LDK.L	R1, #1
LDK.L	R0, #23
CALL	ecg2_hw_register_bit_set+0
JMP	L_ecg2_lead_off_comparator_enable84
L_ecg2_lead_off_comparator_enable83:
;ecg2_hw.c,428 :: 		register_bit_set(CONFIG4_REG, 1, 0);
LDK.L	R2, #0
LDK.L	R1, #1
LDK.L	R0, #23
CALL	ecg2_hw_register_bit_set+0
L_ecg2_lead_off_comparator_enable84:
;ecg2_hw.c,429 :: 		}
L_end_ecg2_lead_off_comparator_enable:
RETURN	
; end of _ecg2_lead_off_comparator_enable
_ecg2_wilson_center_terminal_configure:
;ecg2_hw.c,431 :: 		void ecg2_wilson_center_terminal_configure (uint16_t set)
; set start address is: 0 (R0)
LINK	LR, #4
; set end address is: 0 (R0)
; set start address is: 0 (R0)
;ecg2_hw.c,434 :: 		tempbuff[0] = (uint8_t) set; // lsb
ADD.L	R3, SP, #0
BEXTU.L	R1, R0, #256
STI.B	R3, #0, R1
;ecg2_hw.c,435 :: 		tempbuff[1] = (uint8_t) (set >> 8); // msb
ADD.L	R2, R3, #1
BEXTU.L	R1, R0, #0
; set end address is: 0 (R0)
LSHR.L	R1, R1, #8
BEXTU.L	R1, R1, #256
STI.B	R2, #0, R1
;ecg2_hw.c,437 :: 		ecg2_hal_write_bytes(WCT1_REG, tempbuff, 2);
LDK.L	R2, #2
MOVE.L	R1, R3
LDK.L	R0, #24
CALL	_ecg2_hal_write_bytes+0
;ecg2_hw.c,438 :: 		}
L_end_ecg2_wilson_center_terminal_configure:
UNLINK	LR
RETURN	
; end of _ecg2_wilson_center_terminal_configure
