`define OR1200_DCFGR_NDP		3'h0	// Zero DVR/DCR pairs
`define OR1200_DCFGR_WPCI		1'b0	// WP counters not impl.
`define OR1200_DCFGR_RES1		28'h0000000
`define OR1200_M2R_BYTE0 4'b0000
`define OR1200_M2R_BYTE1 4'b0001
`define OR1200_M2R_BYTE2 4'b0010
`define OR1200_M2R_BYTE3 4'b0011
`define OR1200_M2R_EXTB0 4'b0100
`define OR1200_M2R_EXTB1 4'b0101
`define OR1200_M2R_EXTB2 4'b0110
`define OR1200_M2R_EXTB3 4'b0111
`define OR1200_M2R_ZERO  4'b0000
`define OR1200_ICCFGR_NCW		3'h0	// 1 cache way
`define OR1200_ICCFGR_NCS 9	// Num cache sets
`define OR1200_ICCFGR_CBS 9	// 16 byte cache block
`define OR1200_ICCFGR_CWS		1'b0	// Irrelevant
`define OR1200_ICCFGR_CCRI		1'b1	// Cache control reg impl.
`define OR1200_ICCFGR_CBIRI		1'b1	// Cache block inv reg impl.
`define OR1200_ICCFGR_CBPRI		1'b0	// Cache block prefetch reg not impl.
`define OR1200_ICCFGR_CBLRI		1'b0	// Cache block lock reg not impl.
`define OR1200_ICCFGR_CBFRI		1'b1	// Cache block flush reg impl.
`define OR1200_ICCFGR_CBWBRI		1'b0	// Irrelevant
`define OR1200_ICCFGR_RES1		17'h00000
//`define OR1200_ICCFGR_NCW_BITS		2:0
//`define OR1200_ICCFGR_NCS_BITS		6:3
`define OR1200_ICCFGR_CBS_BITS		7
`define OR1200_ICCFGR_CWS_BITS		8
`define OR1200_ICCFGR_CCRI_BITS		9
`define OR1200_ICCFGR_CBIRI_BITS	10
`define OR1200_ICCFGR_CBPRI_BITS	11
`define OR1200_ICCFGR_CBLRI_BITS	12
`define OR1200_ICCFGR_CBFRI_BITS	13
`define OR1200_ICCFGR_CBWBRI_BITS	14
//`define OR1200_ICCFGR_RES1_BITS	31:15
`define OR1200_DCCFGR_NCW		3'h0	// 1 cache way
`define OR1200_DCCFGR_NCS 9	// Num cache sets
`define OR1200_DCCFGR_CBS 9	// 16 byte cache block
`define OR1200_DCCFGR_CWS		1'b0	// Write-through strategy
`define OR1200_DCCFGR_CCRI		1'b1	// Cache control reg impl.
`define OR1200_DCCFGR_CBIRI		1'b1	// Cache block inv reg impl.
`define OR1200_DCCFGR_CBPRI		1'b0	// Cache block prefetch reg not impl.
`define OR1200_DCCFGR_CBLRI		1'b0	// Cache block lock reg not impl.
`define OR1200_DCCFGR_CBFRI		1'b1	// Cache block flush reg impl.
`define OR1200_DCCFGR_CBWBRI		1'b0	// Cache block WB reg not impl.
`define OR1200_DCCFGR_RES1		17'h00000
//`define OR1200_DCCFGR_NCW_BITS		2:0
//`define OR1200_DCCFGR_NCS_BITS		6:3
`define OR1200_DCCFGR_CBS_BITS		7
`define OR1200_DCCFGR_CWS_BITS		8
`define OR1200_DCCFGR_CCRI_BITS		9
`define OR1200_DCCFGR_CBIRI_BITS	10
`define OR1200_DCCFGR_CBPRI_BITS	11
`define OR1200_DCCFGR_CBLRI_BITS	12
`define OR1200_DCCFGR_CBFRI_BITS	13
`define OR1200_DCCFGR_CBWBRI_BITS	14
//`define OR1200_DCCFGR_RES1_BITS	31:15
`define OR1200_IMMUCFGR_NTW		2'h0	// 1 TLB way
`define OR1200_IMMUCFGR_NTS 3'b101	// Num TLB sets
`define OR1200_IMMUCFGR_NAE		3'h0	// No ATB entry
`define OR1200_IMMUCFGR_CRI		1'b0	// No control reg
`define OR1200_IMMUCFGR_PRI		1'b0	// No protection reg
`define OR1200_IMMUCFGR_TEIRI		1'b1	// TLB entry inv reg impl
`define OR1200_IMMUCFGR_HTR		1'b0	// No HW TLB reload
`define OR1200_IMMUCFGR_RES1		20'h00000
//`define OR1200_CPUCFGR_NSGF_BITS	3:0
`define OR1200_CPUCFGR_HGF_BITS	4
`define OR1200_CPUCFGR_OB32S_BITS	5
`define OR1200_CPUCFGR_OB64S_BITS	6
`define OR1200_CPUCFGR_OF32S_BITS	7
`define OR1200_CPUCFGR_OF64S_BITS	8
`define OR1200_CPUCFGR_OV64S_BITS	9
//`define OR1200_CPUCFGR_RES1_BITS	31:10
`define OR1200_CPUCFGR_NSGF		4'h0
`define OR1200_CPUCFGR_HGF		1'b0
`define OR1200_CPUCFGR_OB32S		1'b1
`define OR1200_CPUCFGR_OB64S		1'b0
`define OR1200_CPUCFGR_OF32S		1'b0
`define OR1200_CPUCFGR_OF64S		1'b0
`define OR1200_CPUCFGR_OV64S		1'b0
`define OR1200_CPUCFGR_RES1		22'h000000
`define OR1200_DMMUCFGR_NTW_BITS	1:0
`define OR1200_DMMUCFGR_NTS_BITS	4:2
`define OR1200_DMMUCFGR_NAE_BITS	7:5
`define OR1200_DMMUCFGR_CRI_BITS	8
`define OR1200_DMMUCFGR_PRI_BITS	9
`define OR1200_DMMUCFGR_TEIRI_BITS	10
`define OR1200_DMMUCFGR_HTR_BITS	11
//`define OR1200_DMMUCFGR_RES1_BITS	31:12
`define OR1200_DMMUCFGR_NTW		2'h0	// 1 TLB way
`define OR1200_DMMUCFGR_NTS 3'b110	// Num TLB sets
`define OR1200_DMMUCFGR_NAE		3'h0	// No ATB entries
`define OR1200_DMMUCFGR_CRI		1'b0	// No control register
`define OR1200_DMMUCFGR_PRI		1'b0	// No protection reg
`define OR1200_DMMUCFGR_TEIRI		1'b1	// TLB entry inv reg impl.
`define OR1200_DMMUCFGR_HTR		1'b0	// No HW TLB reload
`define OR1200_DMMUCFGR_RES1		20'h00000
`define OR1200_IMMUCFGR_NTW_BITS	1:0
`define OR1200_IMMUCFGR_NTS_BITS	4:2
`define OR1200_IMMUCFGR_NAE_BITS	7:5
`define OR1200_IMMUCFGR_CRI_BITS	8
`define OR1200_IMMUCFGR_PRI_BITS	9
`define OR1200_IMMUCFGR_TEIRI_BITS	10
`define OR1200_IMMUCFGR_HTR_BITS	11
//`define OR1200_IMMUCFGR_RES1_BITS	31:12
`define OR1200_SPRGRP_SYS_VR		4'h0
`define OR1200_SPRGRP_SYS_UPR		4'h1
`define OR1200_SPRGRP_SYS_CPUCFGR	4'h2
`define OR1200_SPRGRP_SYS_DMMUCFGR	4'h3
`define OR1200_SPRGRP_SYS_IMMUCFGR	4'h4
`define OR1200_SPRGRP_SYS_DCCFGR	4'h5
`define OR1200_SPRGRP_SYS_ICCFGR	4'h6
`define OR1200_SPRGRP_SYS_DCFGR	4'h7
`define OR1200_VR_REV_BITS		5:0
`define OR1200_VR_RES1_BITS		15:6
`define OR1200_VR_CFG_BITS		23:16
`define OR1200_VR_VER_BITS		31:24
`define OR1200_VR_REV			6'h01
`define OR1200_VR_RES1			10'h000
`define OR1200_VR_CFG			8'h00
`define OR1200_VR_VER			8'h12
`define OR1200_UPR_UP_BITS		0
`define OR1200_UPR_DCP_BITS		1
`define OR1200_UPR_ICP_BITS		2
`define OR1200_UPR_DMP_BITS		3
`define OR1200_UPR_IMP_BITS		4
`define OR1200_UPR_MP_BITS		5
`define OR1200_UPR_DUP_BITS		6
`define OR1200_UPR_PCUP_BITS		7
`define OR1200_UPR_PMP_BITS		8
`define OR1200_UPR_PICP_BITS		9
`define OR1200_UPR_TTP_BITS		10
`define OR1200_UPR_RES1_BITS		23:11
`define OR1200_UPR_CUP_BITS		31:24
`define OR1200_UPR_RES1			13'h0000
`define OR1200_UPR_CUP			8'h00
`define OR1200_DU_DSR_WIDTH 14
`define OR1200_EXCEPT_UNUSED		3'hf
`define OR1200_EXCEPT_TRAP		3'he
`define OR1200_EXCEPT_BREAK		3'hd
`define OR1200_EXCEPT_SYSCALL		3'hc
`define OR1200_EXCEPT_RANGE		3'hb
`define OR1200_EXCEPT_ITLBMISS		3'ha
`define OR1200_EXCEPT_DTLBMISS		3'h9
`define OR1200_EXCEPT_INT		3'h8
`define OR1200_EXCEPT_ILLEGAL		3'h7
`define OR1200_EXCEPT_ALIGN		3'h6
`define OR1200_EXCEPT_TICK		3'h5
`define OR1200_EXCEPT_IPF		3'h4
`define OR1200_EXCEPT_DPF		3'h3
`define OR1200_EXCEPT_BUSERR		3'h2
`define OR1200_EXCEPT_RESET		3'h1
`define OR1200_EXCEPT_NONE		3'h0
`define OR1200_OPERAND_WIDTH		32
`define OR1200_REGFILE_ADDR_WIDTH	5
`define OR1200_ALUOP_WIDTH	4
`define OR1200_ALUOP_NOP	4'b000
`define OR1200_ALUOP_ADD	4'b0000
`define OR1200_ALUOP_ADDC	4'b0001
`define OR1200_ALUOP_SUB	4'b0010
`define OR1200_ALUOP_AND	4'b0011
`define OR1200_ALUOP_OR		4'b0100
`define OR1200_ALUOP_XOR	4'b0101
`define OR1200_ALUOP_MUL	4'b0110
`define OR1200_ALUOP_CUST5	4'b0111
`define OR1200_ALUOP_SHROT	4'b1000
`define OR1200_ALUOP_DIV	4'b1001
`define OR1200_ALUOP_DIVU	4'b1010
`define OR1200_ALUOP_IMM	4'b1011
`define OR1200_ALUOP_MOVHI	4'b1100
`define OR1200_ALUOP_COMP	4'b1101
`define OR1200_ALUOP_MTSR	4'b1110
`define OR1200_ALUOP_MFSR	4'b1111
`define OR1200_ALUOP_CMOV 4'b1110
`define OR1200_ALUOP_FF1  4'b1111
`define OR1200_MACOP_WIDTH	2
`define OR1200_MACOP_NOP	2'b00
`define OR1200_MACOP_MAC	2'b01
`define OR1200_MACOP_MSB	2'b10
`define OR1200_SHROTOP_WIDTH	2
`define OR1200_SHROTOP_NOP	2'b00
`define OR1200_SHROTOP_SLL	2'b00
`define OR1200_SHROTOP_SRL	2'b01
`define OR1200_SHROTOP_SRA	2'b10
`define OR1200_SHROTOP_ROR	2'b11
`define OR1200_MULTICYCLE_WIDTH	2
`define OR1200_ONE_CYCLE		2'b00
`define OR1200_TWO_CYCLES		2'b01
`define OR1200_SEL_WIDTH		2
`define OR1200_SEL_RF			2'b00
`define OR1200_SEL_IMM			2'b01
`define OR1200_SEL_EX_FORW		2'b10
`define OR1200_SEL_WB_FORW		2'b11
`define OR1200_BRANCHOP_WIDTH		3
`define OR1200_BRANCHOP_NOP		3'b000
`define OR1200_BRANCHOP_J		3'b001
`define OR1200_BRANCHOP_JR		3'b010
`define OR1200_BRANCHOP_BAL		3'b011
`define OR1200_BRANCHOP_BF		3'b100
`define OR1200_BRANCHOP_BNF		3'b101
`define OR1200_BRANCHOP_RFE		3'b110
`define OR1200_LSUOP_WIDTH		4
`define OR1200_LSUOP_NOP		4'b0000
`define OR1200_LSUOP_LBZ		4'b0010
`define OR1200_LSUOP_LBS		4'b0011
`define OR1200_LSUOP_LHZ		4'b0100
`define OR1200_LSUOP_LHS		4'b0101
`define OR1200_LSUOP_LWZ		4'b0110
`define OR1200_LSUOP_LWS		4'b0111
`define OR1200_LSUOP_LD		4'b0001
`define OR1200_LSUOP_SD		4'b1000
`define OR1200_LSUOP_SB		4'b1010
`define OR1200_LSUOP_SH		4'b1100
`define OR1200_LSUOP_SW		4'b1110
`define OR1200_FETCHOP_WIDTH		1
`define OR1200_FETCHOP_NOP		1'b0
`define OR1200_FETCHOP_LW		1'b1
`define OR1200_RFWBOP_WIDTH		3
`define OR1200_RFWBOP_NOP		3'b000
`define OR1200_RFWBOP_ALU		3'b001
`define OR1200_RFWBOP_LSU		3'b011
`define OR1200_RFWBOP_SPRS		3'b101
`define OR1200_RFWBOP_LR		3'b111
`define OR1200_COP_SFEQ       3'b000
`define OR1200_COP_SFNE       3'b001
`define OR1200_COP_SFGT       3'b010
`define OR1200_COP_SFGE       3'b011
`define OR1200_COP_SFLT       3'b100
`define OR1200_COP_SFLE       3'b101
`define OR1200_COP_X          3'b111
`define OR1200_SIGNED_COMPARE 3'b011
`define OR1200_COMPOP_WIDTH	4
`define OR1200_ITAG_IDLE	4'h0	// idle bus
`define	OR1200_ITAG_NI		4'h1	// normal insn
`define OR1200_ITAG_BE		4'hb	// Bus error exception
`define OR1200_ITAG_PE		4'hc	// Page fault exception
`define OR1200_ITAG_TE		4'hd	// TLB miss exception
`define OR1200_DTAG_IDLE	4'h0	// idle bus
`define	OR1200_DTAG_ND		4'h1	// normal data
`define OR1200_DTAG_AE		4'ha	// Alignment exception
`define OR1200_DTAG_BE		4'hb	// Bus error exception
`define OR1200_DTAG_PE		4'hc	// Page fault exception
`define OR1200_DTAG_TE		4'hd	// TLB miss exception
`define OR1200_DU_DSR_RSTE	0
`define OR1200_DU_DSR_BUSEE	1
`define OR1200_DU_DSR_DPFE	2
`define OR1200_DU_DSR_IPFE	3
`define OR1200_DU_DSR_TTE	4
`define OR1200_DU_DSR_AE	5
`define OR1200_DU_DSR_IIE	6
`define OR1200_DU_DSR_IE	7
`define OR1200_DU_DSR_DME	8
`define OR1200_DU_DSR_IME	9
`define OR1200_DU_DSR_RE	10
`define OR1200_DU_DSR_SCE	11
`define OR1200_DU_DSR_BE	12
`define OR1200_DU_DSR_TE	13
//`define OR1200_SHROTOP_POS		7:6
//`define OR1200_ALUMCYC_POS		9:8
`define OR1200_OR32_J                 6'b000000
`define OR1200_OR32_JAL               6'b000001
`define OR1200_OR32_BNF               6'b000011
`define OR1200_OR32_BF                6'b000100
`define OR1200_OR32_NOP               6'b000101
`define OR1200_OR32_MOVHI             6'b000110
`define OR1200_OR32_XSYNC             6'b001000
`define OR1200_OR32_RFE               6'b001001
`define OR1200_OR32_JR                6'b010001
`define OR1200_OR32_JALR              6'b010010
`define OR1200_OR32_MACI              6'b010011
`define OR1200_OR32_LWZ               6'b100001
`define OR1200_OR32_LBZ               6'b100011
`define OR1200_OR32_LBS               6'b100100
`define OR1200_OR32_LHZ               6'b100101
`define OR1200_OR32_LHS               6'b100110
`define OR1200_OR32_ADDI              6'b100111
`define OR1200_OR32_ADDIC             6'b101000
`define OR1200_OR32_ANDI              6'b101001
`define OR1200_OR32_ORI               6'b101010
`define OR1200_OR32_XORI              6'b101011
`define OR1200_OR32_MULI              6'b101100
`define OR1200_OR32_MFSPR             6'b101101
`define OR1200_OR32_SH_ROTI 	      6'b101110
`define OR1200_OR32_SFXXI             6'b101111
`define OR1200_OR32_MTSPR             6'b110000
`define OR1200_OR32_MACMSB            6'b110001
`define OR1200_OR32_SW                6'b110101
`define OR1200_OR32_SB                6'b110110
`define OR1200_OR32_SH                6'b110111
`define OR1200_OR32_ALU               6'b111000
`define OR1200_OR32_SFXX              6'b111001
`define OR1200_OR32_CUST5             6'b111100
`define OR1200_EXCEPT_EPH0_P 20'h00000
`define OR1200_EXCEPT_EPH1_P 20'hF0000
`define OR1200_EXCEPT_V		   8'h00
`define OR1200_EXCEPT_WIDTH 4
`define OR1200_SPR_GROUP_SYS	5'b00000
`define OR1200_SPR_GROUP_DMMU	5'b00001
`define OR1200_SPR_GROUP_IMMU	5'b00010
`define OR1200_SPR_GROUP_DC	5'b00011
`define OR1200_SPR_GROUP_IC	5'b00100
`define OR1200_SPR_GROUP_MAC	5'b00101
`define OR1200_SPR_GROUP_DU	5'b00110
`define OR1200_SPR_GROUP_PM	5'b01000
`define OR1200_SPR_GROUP_PIC	5'b01001
`define OR1200_SPR_GROUP_TT	5'b01010
`define OR1200_SPR_CFGR		7'b0000000
`define OR1200_SPR_RF		6'b100000	// 1024 >> 5
`define OR1200_SPR_NPC		11'b00000010000
`define OR1200_SPR_SR		11'b00000010001
`define OR1200_SPR_PPC		11'b00000010010
`define OR1200_SPR_EPCR		11'b00000100000
`define OR1200_SPR_EEAR		11'b00000110000
`define OR1200_SPR_ESR		11'b00001000000
`define OR1200_SR_WIDTH 16
`define OR1200_SR_SM   0
`define OR1200_SR_TEE  1
`define OR1200_SR_IEE  2
`define OR1200_SR_DCE  3
`define OR1200_SR_ICE  4
`define OR1200_SR_DME  5
`define OR1200_SR_IME  6
`define OR1200_SR_LEE  7
`define OR1200_SR_CE   8
`define OR1200_SR_F    9
`define OR1200_SR_CY   10	// Unused
`define OR1200_SR_OV   11	// Unused
`define OR1200_SR_OVE  12	// Unused
`define OR1200_SR_DSX  13	// Unused
`define OR1200_SR_EPH  14
`define OR1200_SR_FO   15
`define OR1200_SR_EPH_DEF	1'b0
`define OR1200_PM_PMR_DME 4
`define OR1200_PM_PMR_SME 5
`define OR1200_PM_PMR_DCGE 6
`define OR1200_PM_OFS_PMR 11'b0
`define OR1200_SPRGRP_PM 5'b01000
`define OR1200_PIC_INTS 20
`define OR1200_PIC_OFS_PICMR 2'b00
`define OR1200_PIC_OFS_PICSR 2'b10
`define OR1200_TT_OFS_TTMR 1'b0
`define OR1200_TT_OFS_TTCR 1'b1
`define OR1200_TTOFS_BITS 0
`define OR1200_TT_TTMR_IP 28
`define OR1200_TT_TTMR_IE 29
`define OR1200_MAC_ADDR		0	// MACLO 0xxxxxxxx1, MACHI 0xxxxxxxx0
`define OR1200_MAC_SHIFTBY	0	// 0 = According to arch manual, 28 = obsolete backward compatibility
`define OR1200_DTLB_TM_ADDR	7
`define	OR1200_DTLBMR_V_BITS	0
`define	OR1200_DTLBTR_CC_BITS	0
`define	OR1200_DTLBTR_CI_BITS	1
`define	OR1200_DTLBTR_WBC_BITS	2
`define	OR1200_DTLBTR_WOM_BITS	3
`define	OR1200_DTLBTR_A_BITS	4
`define	OR1200_DTLBTR_D_BITS	5
`define	OR1200_DTLBTR_URE_BITS	6
`define	OR1200_DTLBTR_UWE_BITS	7
`define	OR1200_DTLBTR_SRE_BITS	8
`define	OR1200_DTLBTR_SWE_BITS	9
`define	OR1200_DMMU_PS		13					// 13 for 8KB page size
`define	OR1200_DTLB_INDXW	6							// +5 because of protection bits and CI
`define OR1200_ITLB_TM_ADDR	7
`define	OR1200_ITLBMR_V_BITS	0
`define	OR1200_ITLBTR_CC_BITS	0
`define	OR1200_ITLBTR_CI_BITS	1
`define	OR1200_ITLBTR_WBC_BITS	2
`define	OR1200_ITLBTR_WOM_BITS	3
`define	OR1200_ITLBTR_A_BITS	4
`define	OR1200_ITLBTR_D_BITS	5
`define	OR1200_ITLBTR_SXE_BITS	6
`define	OR1200_ITLBTR_UXE_BITS	7
`define	OR1200_IMMU_PS 13					
`define	OR1200_ITLB_INDXW	6			
`define OR1200_IMMU_CI			1'b0
`define OR1200_ICLS		4
`define OR1200_DCLS		4
// `define OR1200_DC_STORE_REFILL
`define OR1200_DCSIZE			12			// 4096
`define	OR1200_DCTAG_W			21
//`define OR1200_SB_IMPLEMENTED
`define OR1200_SB_LOG		2	// 2 or 3
`define OR1200_SB_ENTRIES	4	// 4 or 8
`define OR1200_QMEM_IADDR	32'h00800000
`define OR1200_QMEM_IMASK	32'hfff00000	// Max QMEM size 1MB
`define OR1200_QMEM_DADDR  32'h00800000
`define OR1200_QMEM_DMASK  32'hfff00000 // Max QMEM size 1MB
//`define OR1200_QMEM_BSEL
//`define OR1200_QMEM_ACK
`define OR1200_SPRGRP_SYS_VR		4'h0
`define OR1200_SPRGRP_SYS_UPR		4'h1
`define OR1200_SPRGRP_SYS_CPUCFGR	4'h2
`define OR1200_SPRGRP_SYS_DMMUCFGR	4'h3
`define OR1200_SPRGRP_SYS_IMMUCFGR	4'h4
`define OR1200_SPRGRP_SYS_DCCFGR	4'h5
`define OR1200_SPRGRP_SYS_ICCFGR	4'h6
`define OR1200_SPRGRP_SYS_DCFGR	4'h7
`define OR1200_VR_REV			6'h01
`define OR1200_VR_RES1			10'h000
`define OR1200_VR_CFG			8'h00
`define OR1200_VR_VER			8'h12
`define OR1200_UPR_UP			1'b1
`define OR1200_UPR_DCP			1'b1
`define OR1200_UPR_ICP			1'b1
`define OR1200_UPR_DMP			1'b1
`define OR1200_UPR_IMP			1'b1
`define OR1200_UPR_MP			1'b1	// MAC always present
`define OR1200_UPR_DUP			1'b1
`define OR1200_UPR_PCUP			1'b0	// Performance counters not present
`define OR1200_UPR_PMP			1'b1
`define OR1200_UPR_PICP			1'b1
`define OR1200_UPR_TTP			1'b1
`define OR1200_UPR_RES1			13'h0000
`define OR1200_UPR_CUP			8'h00
`define OR1200_CPUCFGR_HGF_BITS	4
`define OR1200_CPUCFGR_OB32S_BITS	5
`define OR1200_CPUCFGR_OB64S_BITS	6
`define OR1200_CPUCFGR_OF32S_BITS	7
`define OR1200_CPUCFGR_OF64S_BITS	8
`define OR1200_CPUCFGR_OV64S_BITS	9
`define OR1200_CPUCFGR_NSGF		4'h0
`define OR1200_CPUCFGR_HGF		1'b0
`define OR1200_CPUCFGR_OB32S		1'b1
`define OR1200_CPUCFGR_OB64S		1'b0
`define OR1200_CPUCFGR_OF32S		1'b0
`define OR1200_CPUCFGR_OF64S		1'b0
`define OR1200_CPUCFGR_OV64S		1'b0
`define OR1200_CPUCFGR_RES1		22'h000000
`define OR1200_DMMUCFGR_CRI_BITS	8
`define OR1200_DMMUCFGR_PRI_BITS	9
`define OR1200_DMMUCFGR_TEIRI_BITS	10
`define OR1200_DMMUCFGR_HTR_BITS	11
`define OR1200_DMMUCFGR_NTW		2'h0	// 1 TLB way
`define OR1200_DMMUCFGR_NAE		3'h0	// No ATB entries
`define OR1200_DMMUCFGR_CRI		1'b0	// No control register
`define OR1200_DMMUCFGR_PRI		1'b0	// No protection reg
`define OR1200_DMMUCFGR_TEIRI		1'b1	// TLB entry inv reg impl.
`define OR1200_DMMUCFGR_HTR		1'b0	// No HW TLB reload
`define OR1200_DMMUCFGR_RES1		20'h00000
`define OR1200_IMMUCFGR_CRI_BITS	8
`define OR1200_IMMUCFGR_PRI_BITS	9
`define OR1200_IMMUCFGR_TEIRI_BITS	10
`define OR1200_IMMUCFGR_HTR_BITS	11
`define OR1200_IMMUCFGR_NTW		2'h0	// 1 TLB way
`define OR1200_IMMUCFGR_NAE		3'h0	// No ATB entry
`define OR1200_IMMUCFGR_CRI		1'b0	// No control reg
`define OR1200_IMMUCFGR_PRI		1'b0	// No protection reg
`define OR1200_IMMUCFGR_TEIRI		1'b1	// TLB entry inv reg impl
`define OR1200_IMMUCFGR_HTR		1'b0	// No HW TLB reload
`define OR1200_IMMUCFGR_RES1		20'h00000
`define OR1200_DCCFGR_CBS_BITS		7
`define OR1200_DCCFGR_CWS_BITS		8
`define OR1200_DCCFGR_CCRI_BITS		9
`define OR1200_DCCFGR_CBIRI_BITS	10
`define OR1200_DCCFGR_CBPRI_BITS	11
`define OR1200_DCCFGR_CBLRI_BITS	12
`define OR1200_DCCFGR_CBFRI_BITS	13
`define OR1200_DCCFGR_CBWBRI_BITS	14
`define OR1200_DCCFGR_NCW		3'h0	// 1 cache way
`define OR1200_DCCFGR_CWS		1'b0	// Write-through strategy
`define OR1200_DCCFGR_CCRI		1'b1	// Cache control reg impl.
`define OR1200_DCCFGR_CBIRI		1'b1	// Cache block inv reg impl.
`define OR1200_DCCFGR_CBPRI		1'b0	// Cache block prefetch reg not impl.
`define OR1200_DCCFGR_CBLRI		1'b0	// Cache block lock reg not impl.
`define OR1200_DCCFGR_CBFRI		1'b1	// Cache block flush reg impl.
`define OR1200_DCCFGR_CBWBRI		1'b0	// Cache block WB reg not impl.
`define OR1200_DCCFGR_RES1		17'h00000
`define OR1200_ICCFGR_CBS_BITS		7
`define OR1200_ICCFGR_CWS_BITS		8
`define OR1200_ICCFGR_CCRI_BITS		9
`define OR1200_ICCFGR_CBIRI_BITS	10
`define OR1200_ICCFGR_CBPRI_BITS	11
`define OR1200_ICCFGR_CBLRI_BITS	12
`define OR1200_ICCFGR_CBFRI_BITS	13
`define OR1200_ICCFGR_CBWBRI_BITS	14
`define OR1200_ICCFGR_NCW		3'h0	// 1 cache way
`define OR1200_ICCFGR_CWS		1'b0	// Irrelevant
`define OR1200_ICCFGR_CCRI		1'b1	// Cache control reg impl.
`define OR1200_ICCFGR_CBIRI		1'b1	// Cache block inv reg impl.
`define OR1200_ICCFGR_CBPRI		1'b0	// Cache block prefetch reg not impl.
`define OR1200_ICCFGR_CBLRI		1'b0	// Cache block lock reg not impl.
`define OR1200_ICCFGR_CBFRI		1'b1	// Cache block flush reg impl.
`define OR1200_ICCFGR_CBWBRI		1'b0	// Irrelevant
`define OR1200_ICCFGR_RES1		17'h00000
`define OR1200_DCFGR_WPCI_BITS		3
`define OR1200_DCFGR_NDP		3'h0	// Zero DVR/DCR pairs
`define OR1200_DCFGR_WPCI		1'b0	// WP counters not impl.
`define OR1200_DCFGR_RES1		28'h0000000
`define SIMULATION_MEMORY
`define OR1200_ITAG_IDLE	4'h0	// idle bus
`define	OR1200_ITAG_NI		4'h1	// normal insn
`define OR1200_ITAG_BE		4'hb	// Bus error exception
`define OR1200_ITAG_PE		4'hc	// Page fault exception
`define OR1200_ITAG_TE		4'hd	// TLB miss exception
`define OR1200_BRANCHOP_WIDTH		3
`define OR1200_BRANCHOP_NOP		3'b000
`define OR1200_BRANCHOP_J		3'b001
`define OR1200_BRANCHOP_JR		3'b010
`define OR1200_BRANCHOP_BAL		3'b011
`define OR1200_BRANCHOP_BF		3'b100
`define OR1200_BRANCHOP_BNF		3'b101
`define OR1200_BRANCHOP_RFE		3'b110
`define OR1200_EXCEPT_WIDTH 4
`define OR1200_EXCEPT_EPH0_P 20'h00000
`define OR1200_EXCEPT_EPH1_P 20'hF0000
`define OR1200_EXCEPT_V		   8'h00
`define OR1200_ITAG_IDLE	4'h0	// idle bus
`define	OR1200_ITAG_NI		4'h1	// normal insn
`define OR1200_ITAG_BE		4'hb	// Bus error exception
`define OR1200_ITAG_PE		4'hc	// Page fault exception
`define OR1200_ITAG_TE		4'hd	// TLB miss exception
`define OR1200_OR32_J                 6'b000000
`define OR1200_OR32_JAL               6'b000001
`define OR1200_OR32_BNF               6'b000011
`define OR1200_OR32_BF                6'b000100
`define OR1200_OR32_NOP               6'b000101
`define OR1200_OR32_MOVHI             6'b000110
`define OR1200_OR32_XSYNC             6'b001000
`define OR1200_OR32_RFE               6'b001001
`define OR1200_OR32_JR                6'b010001
`define OR1200_OR32_JALR              6'b010010
`define OR1200_OR32_MACI              6'b010011
`define OR1200_OR32_LWZ               6'b100001
`define OR1200_OR32_LBZ               6'b100011
`define OR1200_OR32_LBS               6'b100100
`define OR1200_OR32_LHZ               6'b100101
`define OR1200_OR32_LHS               6'b100110
`define OR1200_OR32_ADDI              6'b100111
`define OR1200_OR32_ADDIC             6'b101000
`define OR1200_OR32_ANDI              6'b101001
`define OR1200_OR32_ORI               6'b101010
`define OR1200_OR32_XORI              6'b101011
`define OR1200_OR32_MULI              6'b101100
`define OR1200_OR32_MFSPR             6'b101101
`define OR1200_OR32_SH_ROTI 	      6'b101110
`define OR1200_OR32_SFXXI             6'b101111
`define OR1200_OR32_MTSPR             6'b110000
`define OR1200_OR32_MACMSB            6'b110001
`define OR1200_OR32_SW                6'b110101
`define OR1200_OR32_SB                6'b110110
`define OR1200_OR32_SH                6'b110111
`define OR1200_OR32_ALU               6'b111000
`define OR1200_OR32_SFXX              6'b111001
//`define OR1200_OR32_CUST5             6'b111100
`define OR1200_NO_FREEZE	3'b000
`define OR1200_FREEZE_BYDC	3'b001
`define OR1200_FREEZE_BYMULTICYCLE	3'b010
`define OR1200_WAIT_LSU_TO_FINISH	3'b011
`define OR1200_WAIT_IC			3'b100
`define OR1200_EXCEPTFSM_WIDTH 3
`define OR1200_EXCEPTFSM_IDLE	3'b000
`define OR1200_EXCEPTFSM_FLU1 	3'b001
`define OR1200_EXCEPTFSM_FLU2 	3'b010
`define OR1200_EXCEPTFSM_FLU3 	3'b011
`define OR1200_EXCEPTFSM_FLU5 	3'b101
`define OR1200_EXCEPTFSM_FLU4 	3'b100

module or1200_ctrl(
	// Clock and reset
	clk, rst,

	// Internal i/f
	id_freeze, ex_freeze, wb_freeze, flushpipe, if_insn, ex_insn, branch_op, branch_taken,
	rf_addra, rf_addrb, rf_rda, rf_rdb, alu_op, mac_op, shrot_op, comp_op, rf_addrw, rfwb_op,
	wb_insn, simm, branch_addrofs, lsu_addrofs, sel_a, sel_b, lsu_op,
	cust5_op, cust5_limm,
	multicycle, spr_addrimm, wbforw_valid, sig_syscall, sig_trap,
	force_dslot_fetch, no_more_dslot, ex_void, id_macrc_op, ex_macrc_op, rfe,du_hwbkpt, except_illegal
);

//
// I/O
//
input					clk;
input					rst;
input					id_freeze;
input					ex_freeze;
input					wb_freeze;
input					flushpipe;
input	[31:0]				if_insn;
output	[31:0]				ex_insn;
output	[`OR1200_BRANCHOP_WIDTH-1:0]		branch_op;
input						branch_taken;
output	[`OR1200_REGFILE_ADDR_WIDTH-1:0]	rf_addrw;
output	[`OR1200_REGFILE_ADDR_WIDTH-1:0]	rf_addra;
output	[`OR1200_REGFILE_ADDR_WIDTH-1:0]	rf_addrb;
output					rf_rda;
output					rf_rdb;
output	[`OR1200_ALUOP_WIDTH-1:0]		alu_op;
output	[`OR1200_MACOP_WIDTH-1:0]		mac_op;
output	[`OR1200_SHROTOP_WIDTH-1:0]		shrot_op;
output	[`OR1200_RFWBOP_WIDTH-1:0]		rfwb_op;
output	[31:0]				wb_insn;
output	[31:0]				simm;
output	[31:2]				branch_addrofs;
output	[31:0]				lsu_addrofs;
output	[`OR1200_SEL_WIDTH-1:0]		sel_a;
output	[`OR1200_SEL_WIDTH-1:0]		sel_b;
output	[`OR1200_LSUOP_WIDTH-1:0]		lsu_op;
output	[`OR1200_COMPOP_WIDTH-1:0]		comp_op;
output	[`OR1200_MULTICYCLE_WIDTH-1:0]		multicycle;
output	[4:0]				cust5_op;
output	[5:0]				cust5_limm;
output	[15:0]				spr_addrimm;
input					wbforw_valid;
input					du_hwbkpt;
output					sig_syscall;
output					sig_trap;
output					force_dslot_fetch;
output					no_more_dslot;
output					ex_void;
output					id_macrc_op;
output					ex_macrc_op;
output					rfe;
output					except_illegal;

//
// Internal wires and regs
//
reg	[`OR1200_BRANCHOP_WIDTH-1:0]		pre_branch_op;
reg	[`OR1200_BRANCHOP_WIDTH-1:0]		branch_op;
reg	[`OR1200_ALUOP_WIDTH-1:0]		alu_op;

reg	[`OR1200_MACOP_WIDTH-1:0]		mac_op;
reg					ex_macrc_op;

reg	[`OR1200_SHROTOP_WIDTH-1:0]		shrot_op;
reg	[31:0]				id_insn;
reg	[31:0]				ex_insn;
reg	[31:0]				wb_insn;
reg	[`OR1200_REGFILE_ADDR_WIDTH-1:0]	rf_addrw;
reg	[`OR1200_REGFILE_ADDR_WIDTH-1:0]	wb_rfaddrw;
reg	[`OR1200_RFWBOP_WIDTH-1:0]		rfwb_op;
reg	[31:0]				lsu_addrofs;
reg	[`OR1200_SEL_WIDTH-1:0]		sel_a;
reg	[`OR1200_SEL_WIDTH-1:0]		sel_b;
reg					sel_imm;
reg	[`OR1200_LSUOP_WIDTH-1:0]		lsu_op;
reg	[`OR1200_COMPOP_WIDTH-1:0]		comp_op;
reg	[`OR1200_MULTICYCLE_WIDTH-1:0]		multicycle;
reg					imm_signextend;
reg	[15:0]				spr_addrimm;
reg					sig_syscall;
reg					sig_trap;
reg					except_illegal;
wire					id_void;

//
// Register file read addresses
//
assign rf_addra = if_insn[20:16];
assign rf_addrb = if_insn[15:11];
assign rf_rda = if_insn[31];
assign rf_rdb = if_insn[30];

//
// Force fetch of delay slot instruction when jump/branch is preceeded by load/store
// instructions
//
// SIMON
// assign force_dslot_fetch = ((|pre_branch_op) & (|lsu_op));
assign force_dslot_fetch = 1'b0;
assign no_more_dslot = |branch_op & !id_void & branch_taken | (branch_op == `OR1200_BRANCHOP_RFE);
assign id_void = (id_insn[31:26] == `OR1200_OR32_NOP) & id_insn[16];
assign ex_void = (ex_insn[31:26] == `OR1200_OR32_NOP) & ex_insn[16];

//
// Sign/Zero extension of immediates
//
assign simm = (imm_signextend == 1'b1) ? {{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]},{id_insn[15]}, id_insn[15:0]} : {{16'b0}, id_insn[15:0]};

//
// Sign extension of branch offset
//
assign branch_addrofs = {{ex_insn[25]},{ex_insn[25]},{ex_insn[25]},{ex_insn[25]},{ex_insn[25]}, ex_insn[25:0]};

//
// l.macrc in ID stage
//

assign id_macrc_op = (id_insn[31:26] == `OR1200_OR32_MOVHI) & id_insn[16];

//
// cust5_op, cust5_limm (L immediate)
//
assign cust5_op = ex_insn[4:0];
assign cust5_limm = ex_insn[10:5];

//
//
//
assign rfe = (pre_branch_op == `OR1200_BRANCHOP_RFE) | (branch_op == `OR1200_BRANCHOP_RFE);

//
// Generation of sel_a
//
always @(rf_addrw or id_insn or rfwb_op or wbforw_valid or wb_rfaddrw)
	if ((id_insn[20:16] == rf_addrw) && rfwb_op[0])
		sel_a = `OR1200_SEL_EX_FORW;
	else if ((id_insn[20:16] == wb_rfaddrw) && wbforw_valid)
		sel_a = `OR1200_SEL_WB_FORW;
	else
		sel_a = `OR1200_SEL_RF;

//
// Generation of sel_b
//
always @(rf_addrw or sel_imm or id_insn or rfwb_op or wbforw_valid or wb_rfaddrw)
	if (sel_imm)
		sel_b = `OR1200_SEL_IMM;
	else if ((id_insn[15:11] == rf_addrw) && rfwb_op[0])
		sel_b = `OR1200_SEL_EX_FORW;
	else if ((id_insn[15:11] == wb_rfaddrw) && wbforw_valid)
		sel_b = `OR1200_SEL_WB_FORW;
	else
		sel_b = `OR1200_SEL_RF;

//
// l.macrc in EX stage
//

always @(posedge clk ) begin
	if (rst)
		ex_macrc_op <=  1'b0;
	else if (!ex_freeze & id_freeze | flushpipe)
		ex_macrc_op <=  1'b0;
	else if (!ex_freeze)
		ex_macrc_op <=  id_macrc_op;
end
//
// Decode of spr_addrimm
//
always @(posedge clk ) begin
	if (rst)
		spr_addrimm <=  16'h0000;
	else if (!ex_freeze & id_freeze | flushpipe)
		spr_addrimm <=  16'h0000;
	else if (!ex_freeze) begin
		case (id_insn[31:26])	// synopsys parallel_case
			// l.mfspr
			`OR1200_OR32_MFSPR: 
				spr_addrimm <=  id_insn[15:0];
			// l.mtspr
			default:
				spr_addrimm <=  {id_insn[25:21], id_insn[10:0]};
		endcase
	end
end

//
// Decode of multicycle
//
always @(id_insn) begin
  case (id_insn[31:26])		// synopsys parallel_case

    // l.lwz
    `OR1200_OR32_LWZ:
      multicycle = `OR1200_TWO_CYCLES;
    
    // l.lbz
    `OR1200_OR32_LBZ:
      multicycle = `OR1200_TWO_CYCLES;
    
    // l.lbs
    `OR1200_OR32_LBS:
      multicycle = `OR1200_TWO_CYCLES;
    
    // l.lhz
    `OR1200_OR32_LHZ:
      multicycle = `OR1200_TWO_CYCLES;
    
    // l.lhs
    `OR1200_OR32_LHS:
      multicycle = `OR1200_TWO_CYCLES;
    
    // l.sw
    `OR1200_OR32_SW:
      multicycle = `OR1200_TWO_CYCLES;
    
    // l.sb
    `OR1200_OR32_SB:
      multicycle = `OR1200_TWO_CYCLES;
    
    // l.sh
    `OR1200_OR32_SH:
      multicycle = `OR1200_TWO_CYCLES;

    // ALU instructions except the one with immediate
    `OR1200_OR32_ALU:
      multicycle = id_insn[9:8];
    
    // Single cycle instructions
    default: begin
      multicycle = `OR1200_ONE_CYCLE;
    end
    
  endcase
  
end

//
// Decode of imm_signextend
//
always @(id_insn) begin
  case (id_insn[31:26])		// synopsys parallel_case

	// l.addi
	`OR1200_OR32_ADDI:
		imm_signextend = 1'b1;

	// l.addic
	`OR1200_OR32_ADDIC:
		imm_signextend = 1'b1;

	// l.xori
	`OR1200_OR32_XORI:
		imm_signextend = 1'b1;

	// l.muli

	`OR1200_OR32_MULI:
		imm_signextend = 1'b1;


	// l.maci

	`OR1200_OR32_MACI:
		imm_signextend = 1'b1;


	// SFXX insns with immediate
	`OR1200_OR32_SFXXI:
		imm_signextend = 1'b1;

	// Instructions with no or zero extended immediate
	default: begin
		imm_signextend = 1'b0;
	end

endcase

end

//
// LSU addr offset
//
always @(lsu_op or ex_insn) begin
	lsu_addrofs[10:0] = ex_insn[10:0];
	case(lsu_op)	// synopsys parallel_case
		`OR1200_LSUOP_SB : 
			lsu_addrofs[31:11] = {{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}}, ex_insn[25:21]};
			`OR1200_LSUOP_SH : 
			lsu_addrofs[31:11] = {{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}}, ex_insn[25:21]};
		
		`OR1200_LSUOP_SW : 
			lsu_addrofs[31:11] = {{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}},{{ex_insn[25]}}, ex_insn[25:21]};
		
		default : 
			lsu_addrofs[31:11] = {{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}},{{ex_insn[15]}}, ex_insn[15:11]};
	endcase
end

//
// Register file write address
//
always @(posedge clk) begin
	if (rst)
		rf_addrw <=  5'b00000;
	else if (!ex_freeze & id_freeze)
		rf_addrw <=  5'b00000;
	else if (!ex_freeze)
		case (pre_branch_op)	// synopsys parallel_case
`OR1200_BRANCHOP_BAL:
				rf_addrw <=  5'b01001;	// link register r9
				`OR1200_BRANCHOP_JR:
				rf_addrw <=  5'b01001;
			default:
				rf_addrw <=  id_insn[25:21];
		endcase
end

//
// rf_addrw in wb stage (used in forwarding logic)
//
always @(posedge clk ) begin
	if (rst)
		wb_rfaddrw <=  5'b00000;
	else if (!wb_freeze)
		wb_rfaddrw <=  rf_addrw;
end

//
// Instruction latch in id_insn
//
always @(posedge clk ) begin
	if (rst)
		id_insn <=  {`OR1200_OR32_NOP, 26'h0410000};
        else if (flushpipe)
                id_insn <=  {`OR1200_OR32_NOP, 26'h0410000};        // id_insn[16] must be 1
	else if (!id_freeze) begin
		id_insn <=  if_insn;

	end
end

//
// Instruction latch in ex_insn
//
always @(posedge clk ) begin
	if (rst)
		ex_insn <=  {`OR1200_OR32_NOP, 26'h0410000};
	else if (!ex_freeze & id_freeze | flushpipe)
		ex_insn <=  {`OR1200_OR32_NOP, 26'h0410000};	// ex_insn[16] must be 1
	else if (!ex_freeze) begin
		ex_insn <=  id_insn;
	end
end

//
// Instruction latch in wb_insn
//
always @(posedge clk ) begin
	if (rst)
		wb_insn <=  {`OR1200_OR32_NOP, 26'h0410000};
	else if (flushpipe)
		wb_insn <=  {`OR1200_OR32_NOP, 26'h0410000};	// wb_insn[16] must be 1
	else if (!wb_freeze) begin
		wb_insn <=  ex_insn;
	end
end

//
// Decode of sel_imm
//
always @(posedge clk ) begin
	if (rst)
		sel_imm <=  1'b0;
	else if (!id_freeze) begin
	  case (if_insn[31:26])		// synopsys parallel_case

	    // j.jalr
	    `OR1200_OR32_JALR:
	      sel_imm <=  1'b0;
	    
	    // l.jr
	    `OR1200_OR32_JR:
	      sel_imm <=  1'b0;
	    
	    // l.rfe
	    `OR1200_OR32_RFE:
	      sel_imm <=  1'b0;
	    
	    // l.mfspr
	    `OR1200_OR32_MFSPR:
	      sel_imm <=  1'b0;
	    
	    // l.mtspr
	    `OR1200_OR32_MTSPR:
	      sel_imm <=  1'b0;
	    
	    // l.sys, l.brk and all three sync insns
	    `OR1200_OR32_XSYNC:
	      sel_imm <=  1'b0;
	    
	    // l.mac/l.msb

	    `OR1200_OR32_MACMSB:
	      sel_imm <=  1'b0;

	    // l.sw
	    `OR1200_OR32_SW:
	      sel_imm <=  1'b0;
	    
	    // l.sb
	    `OR1200_OR32_SB:
	      sel_imm <=  1'b0;
	    
	    // l.sh
	    `OR1200_OR32_SH:
	      sel_imm <=  1'b0;
	    
	    // ALU instructions except the one with immediate
	    `OR1200_OR32_ALU:
	      sel_imm <=  1'b0;
	    
	    // SFXX instructions
	    `OR1200_OR32_SFXX:
	      sel_imm <=  1'b0;


	    // l.cust5 instructions
	    `OR1200_OR32_CUST5:
	      sel_imm <=  1'b0;

	    
	    // l.nop
	    `OR1200_OR32_NOP:
	      sel_imm <=  1'b0;

	    // All instructions with immediates
	    default: begin
	      sel_imm <=  1'b1;
	    end
	    
	  endcase
	  
	end
end

//
// Decode of except_illegal
//
always @(posedge clk ) begin
	if (rst)
		except_illegal <=  1'b0;
	else if (!ex_freeze & id_freeze | flushpipe)
		except_illegal <=  1'b0;
	else if (!ex_freeze) begin
	      except_illegal <=  1'b1;
	end
end

//
// Decode of alu_op
//
always @(posedge clk ) begin
	if (rst)
		alu_op <=  `OR1200_ALUOP_NOP;
	else if (!ex_freeze & id_freeze | flushpipe)
		alu_op <=  `OR1200_ALUOP_NOP;
	else if (!ex_freeze) begin
	  case (id_insn[31:26])		// synopsys parallel_case
	    
	    // l.j
	    `OR1200_OR32_J:
	      alu_op <=  `OR1200_ALUOP_IMM;
	    
	    // j.jal
	    `OR1200_OR32_JAL:
	      alu_op <=  `OR1200_ALUOP_IMM;
	    
	    // l.bnf
	    `OR1200_OR32_BNF:
	      alu_op <=  `OR1200_ALUOP_NOP;
	    
	    // l.bf
	    `OR1200_OR32_BF:
	      alu_op <=  `OR1200_ALUOP_NOP;
	    
	    // l.movhi
	    `OR1200_OR32_MOVHI:
	      alu_op <=  `OR1200_ALUOP_MOVHI;
	    
	    // l.mfspr
	    `OR1200_OR32_MFSPR:
	      alu_op <=  `OR1200_ALUOP_MFSR;
	    
	    // l.mtspr
	    `OR1200_OR32_MTSPR:
	      alu_op <=  `OR1200_ALUOP_MTSR;
	    
	    // l.addi
	    `OR1200_OR32_ADDI:
	      alu_op <=  `OR1200_ALUOP_ADD;
	    
	    // l.addic
	    `OR1200_OR32_ADDIC:
	      alu_op <=  `OR1200_ALUOP_ADDC;
	    
	    // l.andi
	    `OR1200_OR32_ANDI:
	      alu_op <=  `OR1200_ALUOP_AND;
	    
	    // l.ori
	    `OR1200_OR32_ORI:
	      alu_op <=  `OR1200_ALUOP_OR;
	    
	    // l.xori
	    `OR1200_OR32_XORI:
	      alu_op <=  `OR1200_ALUOP_XOR;
	    
	    // l.muli

	    `OR1200_OR32_MULI:
	      alu_op <=  `OR1200_ALUOP_MUL;

	    
	    // Shift and rotate insns with immediate
	    `OR1200_OR32_SH_ROTI:
	      alu_op <=  `OR1200_ALUOP_SHROT;
	    
	    // SFXX insns with immediate
	    `OR1200_OR32_SFXXI:
	      alu_op <=  `OR1200_ALUOP_COMP;
	    
	    // ALU instructions except the one with immediate
	    `OR1200_OR32_ALU:
	      alu_op <=  id_insn[3:0];
	    
	    // SFXX instructions
	    `OR1200_OR32_SFXX:
	      alu_op <=  `OR1200_ALUOP_COMP;


	    // l.cust5 instructions
	    `OR1200_OR32_CUST5:
	      alu_op <=  `OR1200_ALUOP_CUST5;	    
	    // Default
	    default: begin
	      alu_op <=  `OR1200_ALUOP_NOP;
	    end
	      
	  endcase
	  
	end
end

//
// Decode of mac_op

always @(posedge clk ) begin
	if (rst)
		mac_op <=  `OR1200_MACOP_NOP;
	else if (!ex_freeze & id_freeze | flushpipe)
		mac_op <=  `OR1200_MACOP_NOP;
	else if (!ex_freeze)
	  case (id_insn[31:26])		// synopsys parallel_case

	    // l.maci
	    `OR1200_OR32_MACI:
	      mac_op <=  `OR1200_MACOP_MAC;

	    // l.nop
	    `OR1200_OR32_MACMSB:
	      mac_op <=  id_insn[1:0];

	    // Illegal and OR1200 unsupported instructions
	    default: begin
	      mac_op <=  `OR1200_MACOP_NOP;
	    end	      

	  endcase
	else
		mac_op <=  `OR1200_MACOP_NOP;
end

//
// Decode of shrot_op
//
always @(posedge clk ) begin
	if (rst)
		shrot_op <=  `OR1200_SHROTOP_NOP;
	else if (!ex_freeze & id_freeze | flushpipe)
		shrot_op <=  `OR1200_SHROTOP_NOP;
	else if (!ex_freeze) begin
		shrot_op <=  id_insn[7:6];
	end
end

//
// Decode of rfwb_op
//
always @(posedge clk ) begin
	if (rst)
		rfwb_op <=  `OR1200_RFWBOP_NOP;
	else  if (!ex_freeze & id_freeze | flushpipe)
		rfwb_op <=  `OR1200_RFWBOP_NOP;
	else  if (!ex_freeze) begin
		case (id_insn[31:26])		// synopsys parallel_case

		  // j.jal
		  `OR1200_OR32_JAL:
		    rfwb_op <=  `OR1200_RFWBOP_LR;
		  
		  // j.jalr
		  `OR1200_OR32_JALR:
		    rfwb_op <=  `OR1200_RFWBOP_LR;
		  
		  // l.movhi
		  `OR1200_OR32_MOVHI:
		    rfwb_op <=  `OR1200_RFWBOP_ALU;
		  
		  // l.mfspr
		  `OR1200_OR32_MFSPR:
		    rfwb_op <=  `OR1200_RFWBOP_SPRS;
		  
		  // l.lwz
		  `OR1200_OR32_LWZ:
		    rfwb_op <=  `OR1200_RFWBOP_LSU;
		  
		  // l.lbz
		  `OR1200_OR32_LBZ:
		    rfwb_op <=  `OR1200_RFWBOP_LSU;
		  
		  // l.lbs
		  `OR1200_OR32_LBS:
		    rfwb_op <=  `OR1200_RFWBOP_LSU;
		  
		  // l.lhz
		  `OR1200_OR32_LHZ:
		    rfwb_op <=  `OR1200_RFWBOP_LSU;
		  
		  // l.lhs
		  `OR1200_OR32_LHS:
		    rfwb_op <=  `OR1200_RFWBOP_LSU;
		  
		  // l.addi
		  `OR1200_OR32_ADDI:
		    rfwb_op <=  `OR1200_RFWBOP_ALU;
		  
		  // l.addic
		  `OR1200_OR32_ADDIC:
		    rfwb_op <=  `OR1200_RFWBOP_ALU;
		  
		  // l.andi
		  `OR1200_OR32_ANDI:
		    rfwb_op <=  `OR1200_RFWBOP_ALU;
		  
		  // l.ori
		  `OR1200_OR32_ORI:
		    rfwb_op <=  `OR1200_RFWBOP_ALU;
		  
		  // l.xori
		  `OR1200_OR32_XORI:
		    rfwb_op <=  `OR1200_RFWBOP_ALU;
		  
		  // l.muli

		  `OR1200_OR32_MULI:
		    rfwb_op <=  `OR1200_RFWBOP_ALU;

		  
		  // Shift and rotate insns with immediate
		  `OR1200_OR32_SH_ROTI:
		    rfwb_op <=  `OR1200_RFWBOP_ALU;
		  
		  // ALU instructions except the one with immediate
		  `OR1200_OR32_ALU:
		    rfwb_op <=  `OR1200_RFWBOP_ALU;


		  // l.cust5 instructions
		  `OR1200_OR32_CUST5:
		    rfwb_op <=  `OR1200_RFWBOP_ALU;


		  // Instructions w/o register-file write-back
		  default: begin
		    rfwb_op <=  `OR1200_RFWBOP_NOP;
		  end

		endcase
	end
end

//
// Decode of pre_branch_op
//
always @(posedge clk ) begin
	if (rst)
		pre_branch_op <=  `OR1200_BRANCHOP_NOP;
	else if (flushpipe)
		pre_branch_op <=  `OR1200_BRANCHOP_NOP;
	else if (!id_freeze) begin
		case (if_insn[31:26])		// synopsys parallel_case
		  
		  // l.j
		  `OR1200_OR32_J:
		    pre_branch_op <=  `OR1200_BRANCHOP_BAL;
		  
		  // j.jal
		  `OR1200_OR32_JAL:
		    pre_branch_op <=  `OR1200_BRANCHOP_BAL;
		  
		  // j.jalr
		  `OR1200_OR32_JALR:
		    pre_branch_op <=  `OR1200_BRANCHOP_JR;
		  
		  // l.jr
		  `OR1200_OR32_JR:
		    pre_branch_op <=  `OR1200_BRANCHOP_JR;
		  
		  // l.bnf
		  `OR1200_OR32_BNF:
		    pre_branch_op <=  `OR1200_BRANCHOP_BNF;
		  
		  // l.bf
		  `OR1200_OR32_BF:
		    pre_branch_op <=  `OR1200_BRANCHOP_BF;
		  
		  // l.rfe
		  `OR1200_OR32_RFE:
		    pre_branch_op <=  `OR1200_BRANCHOP_RFE;
		  
		  // Non branch instructions
		  default: begin
		    pre_branch_op <=  `OR1200_BRANCHOP_NOP;
		  end
		endcase
	end
end

//
// Generation of branch_op
//
always @(posedge clk )
	if (rst)
		branch_op <=  `OR1200_BRANCHOP_NOP;
	else if (!ex_freeze & id_freeze | flushpipe)
		branch_op <=  `OR1200_BRANCHOP_NOP;		
	else if (!ex_freeze)
		branch_op <=  pre_branch_op;

//
// Decode of lsu_op
//
always @(posedge clk ) begin
	if (rst)
		lsu_op <=  `OR1200_LSUOP_NOP;
	else if (!ex_freeze & id_freeze | flushpipe)
		lsu_op <=  `OR1200_LSUOP_NOP;
	else if (!ex_freeze)  begin
	  case (id_insn[31:26])		// synopsys parallel_case
	    
	    // l.lwz
	    `OR1200_OR32_LWZ:
	      lsu_op <=  `OR1200_LSUOP_LWZ;
	    
	    // l.lbz
	    `OR1200_OR32_LBZ:
	      lsu_op <=  `OR1200_LSUOP_LBZ;
	    
	    // l.lbs
	    `OR1200_OR32_LBS:
	      lsu_op <=  `OR1200_LSUOP_LBS;
	    
	    // l.lhz
	    `OR1200_OR32_LHZ:
	      lsu_op <=  `OR1200_LSUOP_LHZ;
	    
	    // l.lhs
	    `OR1200_OR32_LHS:
	      lsu_op <=  `OR1200_LSUOP_LHS;
	    
	    // l.sw
	    `OR1200_OR32_SW:
	      lsu_op <=  `OR1200_LSUOP_SW;
	    
	    // l.sb
	    `OR1200_OR32_SB:
	      lsu_op <=  `OR1200_LSUOP_SB;
	    
	    // l.sh
	    `OR1200_OR32_SH:
	      lsu_op <=  `OR1200_LSUOP_SH;
	    
	    // Non load/store instructions
	    default: begin
	      lsu_op <=  `OR1200_LSUOP_NOP;
	    end
	  endcase
	end
end

//
// Decode of comp_op
//
always @(posedge clk ) begin
	if (rst) begin
		comp_op <=  4'b0000;
	end else if (!ex_freeze & id_freeze | flushpipe)
		comp_op <=  4'b0000;
	else if (!ex_freeze)
		comp_op <=  id_insn[24:21];
end

//
// Decode of l.sys
//
always @(posedge clk ) begin
	if (rst)
		sig_syscall <=  1'b0;
	else if (!ex_freeze & id_freeze | flushpipe)
		sig_syscall <=  1'b0;
	else if (!ex_freeze) begin

		sig_syscall <=  (id_insn[31:23] == {`OR1200_OR32_XSYNC, 3'b000});
	end
end

//
// Decode of l.trap
//
always @(posedge clk ) begin
	if (rst)
		sig_trap <=  1'b0;
	else if (!ex_freeze & id_freeze | flushpipe)
		sig_trap <=  1'b0;
	else if (!ex_freeze) begin

		sig_trap <=  (id_insn[31:23] == {`OR1200_OR32_XSYNC, 3'b010})
			| du_hwbkpt;
	end
end

endmodule
