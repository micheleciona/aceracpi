/*
RSD PTR: Checksum=18, OEMID=ACER, RsdtAddress=0x1fee6205
 */
/*
RSDT: Length=48, Revision=1, Checksum=241,
	OEMID=ACER, OEM Table ID=Kestrel, OEM Revision=0x20020909,
	Creator ID= LTP, Creator Revision=0x0
 */
/*
	Entries={ 0x1feebf2c, 0x1feebfa0, 0x1feebfd8 }
 */
/*
	DSDT=0x1fee6235
	INT_MODEL=PIC
	SCI_INT=9
	SMI_CMD=0xb2, ACPI_ENABLE=0xf0, ACPI_DISABLE=0xf1, S4BIOS_REQ=0xf2
	PM1a_EVT_BLK=0x1000-0x1003
	PM1a_CNT_BLK=0x1004-0x1005
	PM2_CNT_BLK=0x1020-0x1020
	PM2_TMR_BLK=0x1008-0x100b
	PM2_GPE0_BLK=0x1028-0x102f
	P_LVL2_LAT=1ms, P_LVL3_LAT=85ms
	FLUSH_SIZE=0, FLUSH_STRIDE=0
	DUTY_OFFSET=1, DUTY_WIDTH=3
	DAY_ALRM=13, MON_ALRM=0, CENTURY=50
	Flags={WBINVD,PROC_C1,SLP_BUTTON}
 */
/*
DSDT: Length=23799, Revision=1, Checksum=111,
	OEMID=ACER, OEM Table ID=Kestrel, OEM Revision=0x20020909,
	Creator ID=MSFT, Creator Revision=0x100000e
 */
DefinitionBlock (
	"acpi_dsdt.aml",	//Output filename
	"DSDT",		//Signature
	0x1,			//DSDT Revision
	"ACER",			//OEMID
	"Kestrel",			//TABLE ID
	0x20020909			//OEM Revision
)

{
OperationRegion(PORT, SystemIO, 0x80, 0x2)
Field(PORT, ByteAcc, NoLock, Preserve) {
    P80H,	8,
    P81H,	8
}
OperationRegion(IO_T, SystemIO, 0x0800, 0x10)
Field(IO_T, ByteAcc, NoLock, Preserve) {
    TRP0,	8
}
OperationRegion(MNVS, SystemMemory, 0x1feece59, 0x60)
Field(MNVS, AnyAcc, Lock, Preserve) {
    OSYS,	16,
    SMIF,	8,
    SCIF,	8,
    PAR1,	8,
    PAR2,	8,
    ACPS,	8,
    DBGS,	8,
    DCKS,	4,
    CDCK,	4,
    IGDS,	8,
    SLID,	8,
    BRTC,	8,
    BRTS,	8,
    WRKF,	8,
    SW2L,	1,
    PNCS,	1,
    Offset(0xf),
    PRID,	8,
    CMAP,	8,
    CMBP,	8,
    LPTP,	8,
    FDCP,	8,
    Offset(0x15),
    PS2F,	8,
    Offset(0x18),
    ACTT,	8,
    PSVT,	8,
    TC1V,	8,
    TC2V,	8,
    TSPV,	8,
    CRTT,	8,
    Offset(0x20),
    BVAL,	32,
    DOFF,	8,
    CLNM,	8,
    TMP2,	8,
    SVCR,	8,
    TMP4,	32,
    TMP5,	32,
    CSTE,	16,
    NSTE,	16,
    SSTE,	16,
    CADL,	16,
    PADL,	16,
    BCAP,	8
}
Scope(_PR_) {
    Processor(CPU0, 0, 0x1010, 0x6) {
        Name(_PCT, Package(0x2) {
            Buffer(0x11) {0x82, 0xc, 0x0, 0x1, 0x8, 0x0, 0x0, 0xb2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 },
            Buffer(0x11) {0x82, 0xc, 0x0, 0x1, 0x8, 0x0, 0x0, 0xb3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 },
        })
        Method(_PSS) {
            If(CLNM) {
                Return(CPSS)
            }
            Return(PPSS)
        }
        Name(CPSS, Package(0x1) {
            Package(0x6) {
                0x0640,
                0x5dc0,
                0xa,
                0xa,
                0x89,
                0x0,
            },
        })
        Name(PPSS, Package(0x5) {
            Package(0x6) {
                0x0640,
                0x5dc0,
                0xa,
                0xa,
                0x89,
                0x0,
            },
            Package(0x6) {
                0x0578,
                0x4e20,
                0xa,
                0xa,
                0x8a,
                0x1,
            },
            Package(0x6) {
                0x04b0,
                0x4650,
                0xa,
                0xa,
                0x8b,
                0x2,
            },
            Package(0x6) {
                0x0320,
                0x3e80,
                0xa,
                0xa,
                0x8c,
                0x3,
            },
            Package(0x6) {
                0x0258,
                0x2ee0,
                0xa,
                0xa,
                0x8d,
                0x4,
            },
        })
        Method(_PPC) {
            Return(0x0)
        }
    }
}
Name(\DSEN, 0x1)
Scope(_SI_) {
    Method(_MSG, 1) {
        If(Arg0) {
            Store(One, \_SB_.PCI0.LPC0.BL27)
        }
        Else {
            Store(Zero, \_SB_.PCI0.LPC0.BL27)
        }
    }
}
Name(\_S0_, Package(0x2) {
    0x0,
    0x0,
})
Name(\_S3_, Package(0x2) {
    0x5,
    0x5,
})
Name(\_S4_, Package(0x2) {
    0x6,
    0x6,
})
Name(\_S5_, Package(0x2) {
    0x7,
    0x7,
})
Method(_PTS, 1) {
    Store(Arg0, \_SB_.STAT)
    Store(">>>> _PTS ------------", Debug)
    Store(Arg0, Debug)
    Store(Arg0, \_SB_.SLEE)
    Store(0x84, \_SB_.PCI0.LPC0.BCMD)
    Store(0x0, \_SB_.PCI0.LPC0.SMIC)
    If(Or(LEqual(Arg0, 0x3), LEqual(Arg0, 0x4), )) {
        Store(0x1, \_SB_.PCI0.LPC0.EC0_.APWR)
    }
    If(LEqual(Arg0, 0x3)) {
        Store(0xe6, P80H)
        Store(0x80, \_SB_.PCI0.LPC0.BCMD)
        Store(0x0, \_SB_.PCI0.LPC0.SMIC)
        Store(0x1, \_SB_.PCI0.LPC0.LV37)
        Sleep(0xc8)
        Store(0xe7, P80H)
    }
    If(LEqual(Arg0, 0x4)) {
        Store(0x1, \_SB_.S4WP)
        Store(0x82, \_SB_.PCI0.LPC0.BCMD)
        Store(0x0, \_SB_.PCI0.LPC0.SMIC)
        Store(One, \_SB_.PCI0.LPC0.EC0_.PFLG)
        Store(One, \_SB_.PCI0.LPC0.EC0_.S4LD)
    }
    If(LEqual(SizeOf(\_OS_), 0x27)) {
    }
    If(LEqual(Arg0, 0x5)) {
        Store(One, \_SB_.PCI0.LPC0.EC0_.S5LW)
        Store(0x0, \_SB_.ECOK)
    }
}
Method(_WAK, 1) {
    Store(Arg0, \_SB_.STAT)
    If(Or(LEqual(\_SB_.PCI0.MYOS, 0x3), LEqual(\_SB_.PCI0.MYOS, 0x1), )) {
        Store(\_SB_.WLES, \_SB_.PCI0.LPC0.EC0_.WEST)
        Store(\_SB_.BTES, \_SB_.PCI0.LPC0.EC0_.BEST)
        Store(One, \_SB_.PCI0.LPC0.EC0_.WBIN)
    }
    If(LEqual(Arg0, 0x4)) {
        Store(0x1, \_SB_.OKEC)
        Notify(\_SB_.SLPB, 0x2)
    }
    If(LEqual(SizeOf(\_OS_), 0x14)) {
        Store(0xe4, P80H)
        Store(\_SB_.PCI0.LPC0.RBID, Local0)
        Store(\_SB_.PCI0.IDE0.BAYR, Local1)
        Store(Local0, \_SB_.PCI0.IDE0.BAYR)
        If(LNot(LEqual(Local0, Local1))) {
            If(Or(LEqual(Local1, 0x1), LEqual(Local1, 0x2), )) {
                If(And(LEqual(\_SB_.PCI0.MYOS, 0x3), LEqual(Local0, 0x3), )) {
                    Notify(\_SB_.PCI0.IDE0.SECN.BAY1, 0x3)
                }
                Else {
                    Notify(\_SB_.PCI0.IDE0.SECN.BAY1, 0x1)
                }
            }
        }
        If(Or(LEqual(Local0, 0x1), LEqual(Local0, 0x2), )) {
            Notify(\_SB_.PCI0.IDE0.SECN.BAY1, 0x0)
        }
        Store(0xe5, P80H)
    }
    If(LEqual(SizeOf(\_OS_), 0x27)) {
    }
    Store(\_SB_.PCI0.LPC0.EC0_.ACDF, \_SB_.ACST)
    If(LEqual(SizeOf(\_OS_), 0x11)) {
        Notify(\_SB_.SLPB, 0x2)
    }
    Store(0x0, \_SB_.SLEE)
}
Scope(_GPE) {
    Method(_L05) {
        Notify(\_SB_.PCI0.MDM0, 0x2)
    }
    Method(_L0B) {
        Notify(\_SB_.PCI0.PCIB, 0x0)
        If(Or(LEqual(\_SB_.PCI0.MYOS, 0x1), LEqual(\_SB_.PCI0.MYOS, 0x3), )) {
            Notify(\_SB_.SLPB, 0x2)
        }
    }
    Method(_L03) {
        Notify(\_SB_.PCI0.USB1, 0x2)
    }
    Method(_L04) {
        Notify(\_SB_.PCI0.USB2, 0x2)
    }
    Method(_L0C) {
        Notify(\_SB_.PCI0.USB3, 0x2)
    }
    Method(_E18) {
        Sleep(0x1)
    }
}
Scope(_SB_) {
    Name(STAT, 0x0)
    Name(D1ST, 0x0)
    Name(D1SJ, 0x1)
    Name(OKEC, 0x0)
    Device(PCI0) {
        Name(MYOS, 0x2)
        Method(_INI) {
            Store(0x1, \_SB_.D1SJ)
            Store(0x2, MYOS)
            If(LEqual(SizeOf(\_OS_), 0x14)) {
                Store(0x1, MYOS)
                Store(0x07d0, OSYS)
                Store(0x1, \_SB_.W2KF)
                If(CondRefOf(_OSI, Local0)) {
                    If(\_OSI) {
                        "Windows 2001"
                        Store(0x3, MYOS)
                        Store(0x07d1, OSYS)
                        Store(0x3, \_SB_.W2KF)
                    }
                }
            }
            Else {
                If(LEqual(SizeOf(\_OS_), 0x11)) {
                    Store(0x0, MYOS)
                    Store(0x07ce, OSYS)
                    Store(0x0, \_SB_.W2KF)
                }
                Else {
                    If(LEqual(SizeOf(\_OS_), 0x27)) {
                        Store(0x2, MYOS)
                        Store(0x07cf, OSYS)
                        Store(0x2, \_SB_.W2KF)
                    }
                }
            }
        }
        Name(_HID, 0x030ad041)
        Name(_ADR, 0x0)
        Name(_BBN, 0x0)
        OperationRegion(HBUS, PCI_Config, 0x40, 0xc0)
        Field(HBUS, DWordAcc, NoLock, Preserve) {
            Offset(0x18),
            ,	7,
            HENA,	1,
            ,	4,
            PM0H,	2,
            Offset(0x1a),
            PM1L,	2,
            ,	2,
            PM1H,	2,
            Offset(0x1b),
            PM2L,	2,
            ,	2,
            PM2H,	2,
            Offset(0x1c),
            PM3L,	2,
            ,	2,
            PM3H,	2,
            Offset(0x1d),
            PM4L,	2,
            ,	2,
            PM4H,	2,
            Offset(0x1e),
            PM5L,	2,
            ,	2,
            PM5H,	2,
            Offset(0x1f),
            PM6L,	2,
            ,	2,
            PM6H,	2,
            Offset(0x20)
        }
        Name(BUF0, Buffer(0x0201) {0x88, 0xe, 0x0, 0x2, 0xc, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x87, 0x18, 0x0, 0x1, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xf7, 0xc, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xf8, 0xc, 0x0, 0x0, 0x0, 0x47, 0x1, 0xf8, 0xc, 0xf8, 0xc, 0x1, 0x8, 0x87, 0x18, 0x0, 0x1, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0xd, 0x0, 0x0, 0xff, 0xff, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xf3, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xa, 0x0, 0xff, 0xff, 0xb, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc, 0x0, 0xff, 0x3f, 0xc, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0xc, 0x0, 0xff, 0x7f, 0xc, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0xc, 0x0, 0xff, 0xbf, 0xc, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0, 0xc, 0x0, 0xff, 0xff, 0xc, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xd, 0x0, 0xff, 0x3f, 0xd, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0xd, 0x0, 0xff, 0x7f, 0xd, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0xd, 0x0, 0xff, 0xbf, 0xd, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0, 0xd, 0x0, 0xff, 0xff, 0xd, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xe, 0x0, 0xff, 0x3f, 0xe, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0xe, 0x0, 0xff, 0x7f, 0xe, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0xe, 0x0, 0xff, 0xbf, 0xe, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0, 0xe, 0x0, 0xff, 0xff, 0xe, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xf, 0x0, 0xff, 0xff, 0xf, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0xff, 0xbf, 0xfe, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x87, 0x18, 0x0, 0x0, 0xc, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 })
        Method(_CRS, 0, Serialized) {
            If(PM1L) {
                CreateDWordField(BUF0, 0x80, C0LN)
                Store(Zero, C0LN)
            }
            If(LEqual(PM1L, 0x1)) {
                CreateBitField(BUF0, 0x0378, C0RW)
                Store(Zero, C0RW)
            }
            If(PM1H) {
                CreateDWordField(BUF0, 0x9b, C4LN)
                Store(Zero, C4LN)
            }
            If(LEqual(PM1H, 0x1)) {
                CreateBitField(BUF0, 0x0450, C4RW)
                Store(Zero, C4RW)
            }
            If(PM2L) {
                CreateDWordField(BUF0, 0xb6, C8LN)
                Store(Zero, C8LN)
            }
            If(LEqual(PM2L, 0x1)) {
                CreateBitField(BUF0, 0x0528, C8RW)
                Store(Zero, C8RW)
            }
            If(PM2H) {
                CreateDWordField(BUF0, 0xd1, CCLN)
                Store(Zero, CCLN)
            }
            If(LEqual(PM2H, 0x1)) {
                CreateBitField(BUF0, 0x0600, CCRW)
                Store(Zero, CCRW)
            }
            If(PM3L) {
                CreateDWordField(BUF0, 0xec, D0LN)
                Store(Zero, D0LN)
            }
            If(LEqual(PM3L, 0x1)) {
                CreateBitField(BUF0, 0x06d8, D0RW)
                Store(Zero, D0RW)
            }
            If(PM3H) {
                CreateDWordField(BUF0, 0x0107, D4LN)
                Store(Zero, D4LN)
            }
            If(LEqual(PM3H, 0x1)) {
                CreateBitField(BUF0, 0x07b0, D4RW)
                Store(Zero, D4RW)
            }
            If(PM4L) {
                CreateDWordField(BUF0, 0x0122, D8LN)
                Store(Zero, D8LN)
            }
            If(LEqual(PM4L, 0x1)) {
                CreateBitField(BUF0, 0x0888, D8RW)
                Store(Zero, D8RW)
            }
            If(PM4H) {
                CreateDWordField(BUF0, 0x013d, DCLN)
                Store(Zero, DCLN)
            }
            If(LEqual(PM4H, 0x1)) {
                CreateBitField(BUF0, 0x0960, DCRW)
                Store(Zero, DCRW)
            }
            If(PM5L) {
                CreateDWordField(BUF0, 0x0158, E0LN)
                Store(Zero, E0LN)
            }
            If(LEqual(PM5L, 0x1)) {
                CreateBitField(BUF0, 0x0a38, E0RW)
                Store(Zero, E0RW)
            }
            If(PM5H) {
                CreateDWordField(BUF0, 0x0173, E4LN)
                Store(Zero, E4LN)
            }
            If(LEqual(PM5H, 0x1)) {
                CreateBitField(BUF0, 0x0b10, E4RW)
                Store(Zero, E4RW)
            }
            If(PM6L) {
                CreateDWordField(BUF0, 0x018e, E8LN)
                Store(Zero, E8LN)
            }
            If(LEqual(PM6L, 0x1)) {
                CreateBitField(BUF0, 0x0be8, E8RW)
                Store(Zero, E8RW)
            }
            If(PM6H) {
                CreateDWordField(BUF0, 0x01a9, ECLN)
                Store(Zero, ECLN)
            }
            If(LEqual(PM6H, 0x1)) {
                CreateBitField(BUF0, 0x0cc0, ECRW)
                Store(Zero, ECRW)
            }
            If(PM0H) {
                CreateDWordField(BUF0, 0x01c4, F0LN)
                Store(Zero, F0LN)
            }
            If(LEqual(PM0H, 0x1)) {
                CreateBitField(BUF0, 0x0d98, F0RW)
                Store(Zero, F0RW)
            }
            CreateDWordField(BUF0, 0x01d3, M1MN)
            CreateDWordField(BUF0, 0x01d7, M1MX)
            CreateDWordField(BUF0, 0x01df, M1LN)
            Multiply(0x02000000, \_SB_.PCI0.MBUS.DRB3, M1MN)
            Add(Subtract(M1MX, M1MN, ), 0x1, M1LN)
            ShiftRight(And(\_SB_.PCI0.LPC0.MTSE, 0x0380, ), 0x7, Local0)
            If(And(Local0, 0x4, )) {
                CreateDWordField(BUF0, 0x01ee, M2MN)
                CreateDWordField(BUF0, 0x01f2, M2MX)
                CreateDWordField(BUF0, 0x01fa, M2LN)
                Store(0xfed00000, M2MN)
                Store(0xfed003ff, M2MX)
                Store(0x0400, M2LN)
                If(LEqual(Local0, 0x5)) {
                    Store(0xfed01000, M2MN)
                    Store(0xfed013ff, M2MX)
                }
                If(LEqual(Local0, 0x6)) {
                    Store(0xfed02000, M2MN)
                    Store(0xfed023ff, M2MX)
                }
                If(LEqual(Local0, 0x7)) {
                    Store(0xfed03000, M2MN)
                    Store(0xfed033ff, M2MX)
                }
            }
            Return(BUF0)
        }
        Method(_PRT) {
            Return(Package(0x7) {
                Package(0x4) {
                    0x0001ffff,
                    0x0,
                    \_SB_.PCI0.LPC0.LNKA,
                    0x0,
                },
                Package(0x4) {
                    0x001dffff,
                    0x0,
                    \_SB_.PCI0.LPC0.LNKA,
                    0x0,
                },
                Package(0x4) {
                    0x001dffff,
                    0x1,
                    \_SB_.PCI0.LPC0.LNKD,
                    0x0,
                },
                Package(0x4) {
                    0x001dffff,
                    0x2,
                    \_SB_.PCI0.LPC0.LNKC,
                    0x0,
                },
                Package(0x4) {
                    0x001dffff,
                    0x3,
                    \_SB_.PCI0.LPC0.LNKH,
                    0x0,
                },
                Package(0x4) {
                    0x001fffff,
                    0x0,
                    \_SB_.PCI0.LPC0.LNKC,
                    0x0,
                },
                Package(0x4) {
                    0x001fffff,
                    0x1,
                    \_SB_.PCI0.LPC0.LNKB,
                    0x0,
                },
            })
        }
        Device(MBUS) {
            Name(_ADR, 0x1)
            OperationRegion(MBUS, PCI_Config, 0x40, 0xc0)
            Field(MBUS, DWordAcc, NoLock, Preserve) {
                DRB0,	8,
                DRB1,	8,
                DRB2,	8,
                DRB3,	8
            }
        }
        Device(AGP_) {
            Name(_ADR, 0x00010000)
            Name(_PRT, Package(0x1) {
                Package(0x4) {
                    0xffff,
                    0x0,
                    \_SB_.PCI0.LPC0.LNKA,
                    0x0,
                },
            })
            Device(VGA_) {
                Name(_ADR, 0x0)
                Name(SWIT, 0x1)
                Name(CRTA, 0x0)
                Name(LCDA, 0x1)
                Name(TV0A, 0x0)
                Name(DVIA, 0x0)
                Name(TOGF, 0x0)
                Name(LSTF, 0x0)
                Name(WDAS, 0x1)
                Method(_STA) {
                    Return(0xf)
                }
                Name(_PSC, 0x0)
                Name(USBF, 0x0)
                Method(_PS0) {
                    Store(0x0, _PSC)
                }
                Method(_PS3) {
                    Store(0x3, _PSC)
                }
                Method(_DOS, 1) {
                    Store(And(Arg0, 0x3, ), SWIT)
                }
                Method(_DOD) {
                    Return(Package(0x4) {
                        0x00010100,
                        0x00010110,
                        0x00010200,
                        0x00010210,
                    })
                }
                Device(CRT_) {
                    Name(_ADR, 0x0100)
                    Method(_DCS) {
                        If(CRTA) {
                            Return(0x1f)
                        }
                        Else {
                            Return(0x1d)
                        }
                    }
                    Method(_DGS) {
                        If(CRTA) {
                            Return(0x1)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                    Method(_DSS, 1) {
                        Store("CRT --_DSS", Debug)
                    }
                }
                Device(DVI_) {
                    Name(_ADR, 0x0210)
                    Method(_DCS) {
                        If(DVIA) {
                            Return(0x1f)
                        }
                        Else {
                            Return(0x1d)
                        }
                    }
                    Method(_DGS) {
                        If(DVIA) {
                            Return(0x1)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                    Method(_DSS, 1) {
                        Store("DVI --_DSS", Debug)
                    }
                }
                Device(TV0_) {
                    Name(_ADR, 0x0200)
                    Method(_DCS) {
                        If(TV0A) {
                            Return(0x1f)
                        }
                        Else {
                            Return(0x1d)
                        }
                    }
                    Method(_DGS) {
                        If(TV0A) {
                            Return(0x1)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                    Method(_DSS, 1) {
                        Store("TV --_DSS", Debug)
                    }
                }
                Device(LCD_) {
                    Name(_ADR, 0x0110)
                    Method(_DCS) {
                        If(LCDA) {
                            Return(0x1f)
                        }
                        Else {
                            Return(0x1d)
                        }
                    }
                    Method(_DGS) {
                        Store(LCDA, Local0)
                        If(LCDA) {
                            Return(0x1)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                    Method(_DSS, 1) {
                        Store("LCD --_DSS", Debug)
                    }
                }
                Method(SWIH) {
                    Store(0x97, \_SB_.PCI0.LPC0.BCMD)
                    Store(0x0, \_SB_.PCI0.LPC0.SMIC)
                    Store(\_SB_.DATS, WDAS)
                    Store(WDAS, P80H)
                    GETD()
                    If(LEqual(WDAS, 0xf)) {
                        Increment(TOGF)
                        If(LGreater(TOGF, 0x7)) {
                            Store(0x1, TOGF)
                        }
                        Store(TOGF, Local1)
                        If(LEqual(Local1, 0x1)) {
                            Store(0x1, LCDA)
                            Store(0x0, CRTA)
                            Store(0x0, TV0A)
                            Store(0x0, DVIA)
                        }
                        Else {
                            If(LEqual(Local1, 0x2)) {
                                Store(0x1, LCDA)
                                Store(0x1, CRTA)
                                Store(0x0, TV0A)
                                Store(0x0, DVIA)
                            }
                            Else {
                                If(LEqual(Local1, 0x3)) {
                                    Store(0x1, LCDA)
                                    Store(0x0, CRTA)
                                    Store(0x0, TV0A)
                                    Store(0x1, DVIA)
                                }
                                Else {
                                    If(LEqual(Local1, 0x4)) {
                                        Store(0x1, LCDA)
                                        Store(0x0, CRTA)
                                        Store(0x1, TV0A)
                                        Store(0x0, DVIA)
                                    }
                                    Else {
                                        If(LEqual(Local1, 0x5)) {
                                            Store(0x0, LCDA)
                                            Store(0x1, CRTA)
                                            Store(0x0, TV0A)
                                            Store(0x0, DVIA)
                                        }
                                        Else {
                                            If(LEqual(Local1, 0x6)) {
                                                Store(0x0, LCDA)
                                                Store(0x0, CRTA)
                                                Store(0x0, TV0A)
                                                Store(0x1, DVIA)
                                            }
                                            Else {
                                                If(LEqual(Local1, 0x7)) {
                                                    Store(0x0, LCDA)
                                                    Store(0x0, CRTA)
                                                    Store(0x1, TV0A)
                                                    Store(0x0, DVIA)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    If(LEqual(WDAS, 0xd)) {
                        Increment(TOGF)
                        If(LGreater(TOGF, 0x5)) {
                            Store(0x1, TOGF)
                        }
                        Store(TOGF, Local1)
                        If(LEqual(Local1, 0x1)) {
                            Store(0x1, LCDA)
                            Store(0x0, CRTA)
                            Store(0x0, TV0A)
                            Store(0x0, DVIA)
                        }
                        Else {
                            If(LEqual(Local1, 0x2)) {
                                Store(0x1, LCDA)
                                Store(0x0, CRTA)
                                Store(0x0, TV0A)
                                Store(0x1, DVIA)
                            }
                            Else {
                                If(LEqual(Local1, 0x3)) {
                                    Store(0x1, LCDA)
                                    Store(0x0, CRTA)
                                    Store(0x1, TV0A)
                                    Store(0x0, DVIA)
                                }
                                Else {
                                    If(LEqual(Local1, 0x4)) {
                                        Store(0x0, LCDA)
                                        Store(0x0, CRTA)
                                        Store(0x0, TV0A)
                                        Store(0x1, DVIA)
                                    }
                                    Else {
                                        If(LEqual(Local1, 0x5)) {
                                            Store(0x0, LCDA)
                                            Store(0x0, CRTA)
                                            Store(0x1, TV0A)
                                            Store(0x0, DVIA)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    If(LEqual(WDAS, 0xb)) {
                        Increment(TOGF)
                        If(LGreater(TOGF, 0x5)) {
                            Store(0x1, TOGF)
                        }
                        Store(TOGF, Local1)
                        If(LEqual(Local1, 0x1)) {
                            Store(0x1, LCDA)
                            Store(0x0, CRTA)
                            Store(0x0, TV0A)
                            Store(0x0, DVIA)
                        }
                        Else {
                            If(LEqual(Local1, 0x2)) {
                                Store(0x1, LCDA)
                                Store(0x1, CRTA)
                                Store(0x0, TV0A)
                                Store(0x0, DVIA)
                            }
                            Else {
                                If(LEqual(Local1, 0x3)) {
                                    Store(0x1, LCDA)
                                    Store(0x0, CRTA)
                                    Store(0x0, TV0A)
                                    Store(0x1, DVIA)
                                }
                                Else {
                                    If(LEqual(Local1, 0x4)) {
                                        Store(0x0, LCDA)
                                        Store(0x1, CRTA)
                                        Store(0x0, TV0A)
                                        Store(0x0, DVIA)
                                    }
                                    Else {
                                        If(LEqual(Local1, 0x5)) {
                                            Store(0x0, LCDA)
                                            Store(0x0, CRTA)
                                            Store(0x0, TV0A)
                                            Store(0x1, DVIA)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    If(LEqual(WDAS, 0x9)) {
                        Increment(TOGF)
                        If(LGreater(TOGF, 0x3)) {
                            Store(0x1, TOGF)
                        }
                        Store(TOGF, Local1)
                        If(LEqual(Local1, 0x1)) {
                            Store(0x1, LCDA)
                            Store(0x0, CRTA)
                            Store(0x0, TV0A)
                            Store(0x0, DVIA)
                        }
                        Else {
                            If(LEqual(Local1, 0x2)) {
                                Store(0x1, LCDA)
                                Store(0x0, CRTA)
                                Store(0x0, TV0A)
                                Store(0x1, DVIA)
                            }
                            Else {
                                If(LEqual(Local1, 0x3)) {
                                    Store(0x0, LCDA)
                                    Store(0x0, CRTA)
                                    Store(0x0, TV0A)
                                    Store(0x1, DVIA)
                                }
                            }
                        }
                    }
                    If(LOr(LEqual(WDAS, 0x5), LEqual(WDAS, 0x7))) {
                        Increment(TOGF)
                        If(LGreater(TOGF, 0x5)) {
                            Store(0x1, TOGF)
                        }
                        Store(TOGF, Local1)
                        If(LEqual(Local1, 0x1)) {
                            Store(0x1, LCDA)
                            Store(0x0, CRTA)
                            Store(0x0, TV0A)
                            Store(0x0, DVIA)
                        }
                        Else {
                            If(LEqual(Local1, 0x2)) {
                                Store(0x1, LCDA)
                                Store(0x1, CRTA)
                                Store(0x0, TV0A)
                                Store(0x0, DVIA)
                            }
                            Else {
                                If(LEqual(Local1, 0x3)) {
                                    Store(0x1, LCDA)
                                    Store(0x0, CRTA)
                                    Store(0x1, TV0A)
                                    Store(0x0, DVIA)
                                }
                                Else {
                                    If(LEqual(Local1, 0x4)) {
                                        Store(0x0, LCDA)
                                        Store(0x1, CRTA)
                                        Store(0x0, TV0A)
                                        Store(0x0, DVIA)
                                    }
                                    Else {
                                        If(LEqual(Local1, 0x5)) {
                                            Store(0x0, LCDA)
                                            Store(0x0, CRTA)
                                            Store(0x1, TV0A)
                                            Store(0x0, DVIA)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    If(LNot(LGreater(WDAS, 0x3))) {
                        Increment(TOGF)
                        If(LGreater(TOGF, 0x3)) {
                            Store(0x1, TOGF)
                        }
                        Store(TOGF, Local1)
                        If(LEqual(Local1, 0x1)) {
                            Store(0x1, LCDA)
                            Store(0x0, CRTA)
                            Store(0x0, TV0A)
                            Store(0x0, DVIA)
                        }
                        Else {
                            If(LEqual(Local1, 0x2)) {
                                Store(0x1, LCDA)
                                Store(0x1, CRTA)
                                Store(0x0, TV0A)
                                Store(0x0, DVIA)
                            }
                            Else {
                                If(LEqual(Local1, 0x3)) {
                                    Store(0x0, LCDA)
                                    Store(0x1, CRTA)
                                    Store(0x0, TV0A)
                                    Store(0x0, DVIA)
                                }
                            }
                        }
                    }
                    Notify(\_SB_.PCI0.AGP_.VGA_, 0x80)
                }
                Method(GETD) {
                    Store(0x98, \_SB_.PCI0.LPC0.BCMD)
                    Store(0x0, \_SB_.PCI0.LPC0.SMIC)
                    Store(\_SB_.DISD, Local0)
                    If(LEqual(WDAS, 0xf)) {
                        If(LEqual(Local0, 0x7)) {
                            Store(0x7, TOGF)
                        }
                        If(LEqual(Local0, 0x6)) {
                            Store(0x6, TOGF)
                        }
                        If(LEqual(Local0, 0x5)) {
                            Store(0x5, TOGF)
                        }
                        If(LEqual(Local0, 0x4)) {
                            Store(0x4, TOGF)
                        }
                        If(LEqual(Local0, 0x3)) {
                            Store(0x3, TOGF)
                        }
                        If(LEqual(Local0, 0x2)) {
                            Store(0x2, TOGF)
                        }
                        If(LEqual(Local0, 0x1)) {
                            Store(0x1, TOGF)
                        }
                        If(LEqual(Local0, 0x0)) {
                            Store(0x0, TOGF)
                        }
                    }
                    If(LEqual(WDAS, 0xd)) {
                        If(LEqual(Local0, 0x7)) {
                            Store(0x5, TOGF)
                        }
                        If(LEqual(Local0, 0x6)) {
                            Store(0x4, TOGF)
                        }
                        If(LEqual(Local0, 0x4)) {
                            Store(0x3, TOGF)
                        }
                        If(LEqual(Local0, 0x3)) {
                            Store(0x2, TOGF)
                        }
                        If(LEqual(Local0, 0x1)) {
                            Store(0x1, TOGF)
                        }
                        If(LEqual(Local0, 0x0)) {
                            Store(0x0, TOGF)
                        }
                    }
                    If(LEqual(WDAS, 0xb)) {
                        If(LEqual(Local0, 0x6)) {
                            Store(0x5, TOGF)
                        }
                        If(LEqual(Local0, 0x5)) {
                            Store(0x4, TOGF)
                        }
                        If(LEqual(Local0, 0x3)) {
                            Store(0x3, TOGF)
                        }
                        If(LEqual(Local0, 0x2)) {
                            Store(0x2, TOGF)
                        }
                        If(LEqual(Local0, 0x1)) {
                            Store(0x1, TOGF)
                        }
                        If(LEqual(Local0, 0x0)) {
                            Store(0x0, TOGF)
                        }
                    }
                    If(LEqual(WDAS, 0x9)) {
                        If(LEqual(Local0, 0x6)) {
                            Store(0x3, TOGF)
                        }
                        If(LEqual(Local0, 0x3)) {
                            Store(0x2, TOGF)
                        }
                        If(LEqual(Local0, 0x1)) {
                            Store(0x1, TOGF)
                        }
                        If(LEqual(Local0, 0x0)) {
                            Store(0x0, TOGF)
                        }
                    }
                    If(LOr(LEqual(WDAS, 0x5), LEqual(WDAS, 0x7))) {
                        If(LEqual(Local0, 0x7)) {
                            Store(0x5, TOGF)
                        }
                        If(LEqual(Local0, 0x5)) {
                            Store(0x4, TOGF)
                        }
                        If(LEqual(Local0, 0x4)) {
                            Store(0x3, TOGF)
                        }
                        If(LEqual(Local0, 0x2)) {
                            Store(0x2, TOGF)
                        }
                        If(LEqual(Local0, 0x1)) {
                            Store(0x1, TOGF)
                        }
                        If(LEqual(Local0, 0x0)) {
                            Store(0x0, TOGF)
                        }
                        If(LEqual(TOGF, LSTF)) {
                            Increment(TOGF)
                        }
                        Store(TOGF, LSTF)
                    }
                    If(LNot(LGreater(WDAS, 0x3))) {
                        If(LEqual(Local0, 0x5)) {
                            Store(0x3, TOGF)
                        }
                        If(LEqual(Local0, 0x2)) {
                            Store(0x2, TOGF)
                        }
                        If(LEqual(Local0, 0x1)) {
                            Store(0x1, TOGF)
                        }
                        If(LEqual(Local0, 0x0)) {
                            Store(0x0, TOGF)
                        }
                    }
                }
            }
        }
        Device(PCIB) {
            Name(_ADR, 0x001e0000)
            Device(GLAN) {
                Name(_ADR, 0x00020000)
                Name(_PRW, Package(0x2) {
                    0xb,
                    0x5,
                })
            }
            Device(MPCI) {
                Name(_ADR, 0x00040000)
                Name(_PRW, Package(0x2) {
                    0xb,
                    0x4,
                })
            }
            Device(T394) {
                Name(_ADR, 0x00060002)
                Name(_PRW, Package(0x2) {
                    0xb,
                    0x4,
                })
            }
            Method(_PRT) {
                Return(Package(0x6) {
                    Package(0x4) {
                        0x0002ffff,
                        0x0,
                        \_SB_.PCI0.LPC0.LNKD,
                        0x0,
                    },
                    Package(0x4) {
                        0x0004ffff,
                        0x0,
                        \_SB_.PCI0.LPC0.LNKB,
                        0x0,
                    },
                    Package(0x4) {
                        0x0004ffff,
                        0x1,
                        \_SB_.PCI0.LPC0.LNKC,
                        0x0,
                    },
                    Package(0x4) {
                        0x0006ffff,
                        0x0,
                        \_SB_.PCI0.LPC0.LNKE,
                        0x0,
                    },
                    Package(0x4) {
                        0x0006ffff,
                        0x1,
                        \_SB_.PCI0.LPC0.LNKF,
                        0x0,
                    },
                    Package(0x4) {
                        0x0006ffff,
                        0x2,
                        \_SB_.PCI0.LPC0.LNKG,
                        0x0,
                    },
                })
            }
        }
        Device(LPC0) {
            Name(_ADR, 0x001f0000)
            Method(DECD, 4) {
                Store(Arg0, Debug)
            }
            OperationRegion(REGS, PCI_Config, 0x40, 0xc0)
            Field(REGS, DWordAcc, NoLock, Preserve) {
                PMBA,	16,
                Offset(0x18),
                GPBA,	16,
                Offset(0x90),
                POSD,	1,
                Offset(0x91),
                MTSE,	16,
                Offset(0x94),
                Offset(0xa0),
                CMAD,	3,
                ,	1,
                CMBD,	3,
                Offset(0xa1),
                LPTD,	2,
                ,	2,
                FDDD,	1,
                Offset(0xa6),
                ECO1,	1,
                ECO2,	1,
                ELPT,	1,
                EFDD,	1
            }
            OperationRegion(PIRX, PCI_Config, 0x60, 0xc)
            Field(PIRX, DWordAcc, NoLock, Preserve) {
                AccessAs(ByteAcc, 0),
                PIRA,	8,
                PIRB,	8,
                PIRC,	8,
                PIRD,	8,
                Offset(0x8),
                PIRE,	8,
                PIRF,	8,
                PIRG,	8,
                PIRH,	8
            }
            Device(TIMR) {
                Name(_HID, 0x0001d041)
                Name(BUF0, Buffer(0x12) {0x47, 0x1, 0x40, 0x0, 0x40, 0x0, 0x1, 0x4, 0x47, 0x1, 0x50, 0x0, 0x50, 0x0, 0x10, 0x4, 0x79, 0x0 })
                Name(BUF1, Buffer(0x15) {0x47, 0x1, 0x40, 0x0, 0x40, 0x0, 0x1, 0x4, 0x47, 0x1, 0x50, 0x0, 0x50, 0x0, 0x10, 0x4, 0x22, 0x1, 0x0, 0x79, 0x0 })
                Method(_CRS, 0, Serialized) {
                    If(And(MTSE, 0x0200, )) {
                        Return(BUF0)
                    }
                    Return(BUF1)
                }
            }
            Device(IPIC) {
                Name(_HID, 0xd041)
                Name(_CRS, Buffer(0x8d) {0x47, 0x1, 0x20, 0x0, 0x20, 0x0, 0x1, 0x2, 0x47, 0x1, 0x24, 0x0, 0x24, 0x0, 0x1, 0x2, 0x47, 0x1, 0x28, 0x0, 0x28, 0x0, 0x1, 0x2, 0x47, 0x1, 0x2c, 0x0, 0x2c, 0x0, 0x1, 0x2, 0x47, 0x1, 0x30, 0x0, 0x30, 0x0, 0x1, 0x2, 0x47, 0x1, 0x34, 0x0, 0x34, 0x0, 0x1, 0x2, 0x47, 0x1, 0x38, 0x0, 0x38, 0x0, 0x1, 0x2, 0x47, 0x1, 0x3c, 0x0, 0x3c, 0x0, 0x1, 0x2, 0x47, 0x1, 0xa0, 0x0, 0xa0, 0x0, 0x1, 0x2, 0x47, 0x1, 0xa4, 0x0, 0xa4, 0x0, 0x1, 0x2, 0x47, 0x1, 0xa8, 0x0, 0xa8, 0x0, 0x1, 0x2, 0x47, 0x1, 0xac, 0x0, 0xac, 0x0, 0x1, 0x2, 0x47, 0x1, 0xb0, 0x0, 0xb0, 0x0, 0x1, 0x2, 0x47, 0x1, 0xb4, 0x0, 0xb4, 0x0, 0x1, 0x2, 0x47, 0x1, 0xb8, 0x0, 0xb8, 0x0, 0x1, 0x2, 0x47, 0x1, 0xbc, 0x0, 0xbc, 0x0, 0x1, 0x2, 0x47, 0x1, 0xd0, 0x4, 0xd0, 0x4, 0x1, 0x2, 0x22, 0x4, 0x0, 0x79, 0x0 })
            }
            Device(RTC_) {
                Name(_HID, 0x000bd041)
                Name(BUF0, Buffer(0xa) {0x47, 0x1, 0x70, 0x0, 0x70, 0x0, 0x1, 0x8, 0x79, 0x0 })
                Name(BUF1, Buffer(0xd) {0x47, 0x1, 0x70, 0x0, 0x70, 0x0, 0x1, 0x8, 0x22, 0x0, 0x1, 0x79, 0x0 })
                Method(_CRS, 0, Serialized) {
                    If(And(MTSE, 0x0200, )) {
                        Return(BUF0)
                    }
                    Return(BUF1)
                }
            }
            Device(MATH) {
                Name(_HID, 0x040cd041)
                Name(_CRS, Buffer(0xd) {0x47, 0x1, 0xf0, 0x0, 0xf0, 0x0, 0x1, 0x1, 0x22, 0x0, 0x20, 0x79, 0x0 })
            }
            Device(DMAC) {
                Name(_HID, 0x0002d041)
                Name(_CRS, Buffer(0x2d) {0x47, 0x1, 0x0, 0x0, 0x0, 0x0, 0x1, 0x20, 0x47, 0x1, 0x81, 0x0, 0x81, 0x0, 0x1, 0xf, 0x47, 0x1, 0x90, 0x0, 0x90, 0x0, 0x1, 0x2, 0x47, 0x1, 0x93, 0x0, 0x93, 0x0, 0x1, 0xd, 0x47, 0x1, 0xc0, 0x0, 0xc0, 0x0, 0x1, 0x20, 0x2a, 0x10, 0x1, 0x79, 0x0 })
            }
            Device(MBRD) {
                Name(_HID, 0x020cd041)
                Name(_UID, 0x1f)
                Name(_CRS, Buffer(0x018e) {0x47, 0x1, 0x10, 0x0, 0x10, 0x0, 0x1, 0x10, 0x47, 0x1, 0x24, 0x0, 0x24, 0x0, 0x1, 0x2, 0x47, 0x1, 0x28, 0x0, 0x28, 0x0, 0x1, 0x2, 0x47, 0x1, 0x2c, 0x0, 0x2c, 0x0, 0x1, 0x2, 0x47, 0x1, 0x4e, 0x16, 0x4e, 0x16, 0x1, 0x2, 0x47, 0x1, 0x30, 0x0, 0x30, 0x0, 0x1, 0x2, 0x47, 0x1, 0x34, 0x0, 0x34, 0x0, 0x1, 0x2, 0x47, 0x1, 0x38, 0x0, 0x38, 0x0, 0x1, 0x2, 0x47, 0x1, 0x3c, 0x0, 0x3c, 0x0, 0x1, 0x2, 0x47, 0x1, 0x50, 0x0, 0x50, 0x0, 0x1, 0x4, 0x47, 0x1, 0x61, 0x0, 0x61, 0x0, 0x1, 0x1, 0x47, 0x1, 0x63, 0x0, 0x63, 0x0, 0x1, 0x1, 0x47, 0x1, 0x65, 0x0, 0x65, 0x0, 0x1, 0x1, 0x47, 0x1, 0x67, 0x0, 0x67, 0x0, 0x1, 0x1, 0x47, 0x1, 0x72, 0x0, 0x72, 0x0, 0x1, 0x6, 0x47, 0x1, 0x80, 0x0, 0x80, 0x0, 0x1, 0x1, 0x47, 0x1, 0x90, 0x0, 0x90, 0x0, 0x1, 0x10, 0x47, 0x1, 0x92, 0x0, 0x92, 0x0, 0x1, 0x1, 0x47, 0x1, 0xa4, 0x0, 0xa4, 0x0, 0x1, 0x2, 0x47, 0x1, 0xa8, 0x0, 0xa8, 0x0, 0x1, 0x2, 0x47, 0x1, 0xac, 0x0, 0xac, 0x0, 0x1, 0x2, 0x47, 0x1, 0xb0, 0x0, 0xb0, 0x0, 0x1, 0x6, 0x47, 0x1, 0xb2, 0x0, 0xb2, 0x0, 0x1, 0x2, 0x47, 0x1, 0xb8, 0x0, 0xb8, 0x0, 0x1, 0x2, 0x47, 0x1, 0xbc, 0x0, 0xbc, 0x0, 0x1, 0x2, 0x47, 0x1, 0x0, 0x6, 0x0, 0x6, 0x1, 0x10, 0x47, 0x1, 0x0, 0x7, 0x0, 0x7, 0x1, 0x10, 0x47, 0x1, 0x0, 0x8, 0x0, 0x8, 0x1, 0x10, 0x47, 0x1, 0x0, 0x10, 0x0, 0x10, 0x1, 0x80, 0x47, 0x1, 0x80, 0x11, 0x80, 0x11, 0x1, 0x40, 0x47, 0x1, 0xc0, 0x1, 0xc0, 0x1, 0x1, 0x10, 0x47, 0x1, 0x2e, 0x0, 0x2e, 0x0, 0x1, 0x2, 0x47, 0x1, 0x68, 0x0, 0x68, 0x0, 0x1, 0x1, 0x47, 0x1, 0x6c, 0x0, 0x6c, 0x0, 0x1, 0x1, 0x47, 0x1, 0x0, 0xfe, 0x0, 0xfe, 0x0, 0x1, 0x47, 0x1, 0xd0, 0x4, 0xd0, 0x4, 0x1, 0x2, 0x47, 0x1, 0x10, 0x6, 0x10, 0x6, 0x1, 0x10, 0x47, 0x1, 0x68, 0x0, 0x68, 0x0, 0x1, 0x1, 0x47, 0x1, 0x6c, 0x0, 0x6c, 0x0, 0x1, 0x1, 0x86, 0x9, 0x0, 0x1, 0x0, 0x0, 0xc1, 0xfe, 0x0, 0x0, 0x1, 0x0, 0x86, 0x9, 0x0, 0x0, 0x0, 0x0, 0x80, 0xff, 0x0, 0x0, 0x40, 0x0, 0x86, 0x9, 0x0, 0x0, 0x0, 0x0, 0xf0, 0xff, 0x0, 0x0, 0x10, 0x0, 0x86, 0x9, 0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xa, 0x0, 0x86, 0x9, 0x0, 0x0, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, 0x86, 0x9, 0x0, 0x0, 0x0, 0xf8, 0xd, 0x0, 0x0, 0x8, 0x0, 0x0, 0x86, 0x9, 0x0, 0x1, 0x0, 0x0, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 })
            }
            Device(FWHD) {
                Name(_HID, 0x0008d425)
                Name(_CRS, Buffer(0xe) {0x86, 0x9, 0x0, 0x0, 0x0, 0x0, 0x80, 0xff, 0x0, 0x0, 0x80, 0x0, 0x79, 0x0 })
            }
            Device(HPET) {
                Name(_HID, 0x0301d041)
                Name(BUF0, Buffer(0x14) {0x22, 0x1, 0x0, 0x22, 0x0, 0x1, 0x86, 0x9, 0x0, 0x0, 0x0, 0x0, 0xd0, 0xfe, 0x0, 0x4, 0x0, 0x0, 0x79, 0x0 })
                Method(_STA) {
                    ShiftRight(And(MTSE, 0x0380, ), 0x7, Local0)
                    If(LEqual(OSYS, 0x07d1)) {
                        If(And(Local0, 0x4, )) {
                            Return(0xf)
                        }
                    }
                    Else {
                        If(And(Local0, 0x4, )) {
                            Return(0xb)
                        }
                    }
                    Return(0x0)
                }
                Method(_CRS, 0, Serialized) {
                    ShiftRight(And(MTSE, 0x0380, ), 0x7, Local0)
                    If(And(Local0, 0x4, )) {
                        CreateDWordField(BUF0, 0xa, HPT0)
                        If(LEqual(Local0, 0x5)) {
                            Store(0xfed01000, HPT0)
                        }
                        If(LEqual(Local0, 0x6)) {
                            Store(0xfed02000, HPT0)
                        }
                        If(LEqual(Local0, 0x7)) {
                            Store(0xfed03000, HPT0)
                        }
                    }
                    Return(BUF0)
                }
            }
            Device(LNKA) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x1)
                Method(_DIS, 0, Serialized) {
                    Store(0x80, PIRA)
                }
                Name(_PRS, Buffer(0x6) {0x23, 0x40, 0x0, 0x18, 0x79, 0x0 })
                Method(_CRS, 0, Serialized) {
                    Name(RTLA, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                    CreateWordField(RTLA, 0x1, IRQ0)
                    Store(Zero, IRQ0)
                    ShiftLeft(0x1, And(PIRA, 0xf, ), IRQ0)
                    Return(RTLA)
                }
                Method(_SRS, 1, Serialized) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Store(Local0, PIRA)
                }
                Method(_STA, 0, Serialized) {
                    If(And(PIRA, 0x80, )) {
                        Return(0x9)
                    }
                    Else {
                        Return(0xb)
                    }
                }
            }
            Device(LNKB) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x2)
                Method(_DIS, 0, Serialized) {
                    Store(0x80, PIRB)
                }
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Method(_CRS, 0, Serialized) {
                    Name(RTLB, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                    CreateWordField(RTLB, 0x1, IRQ0)
                    Store(Zero, IRQ0)
                    ShiftLeft(0x1, And(PIRB, 0xf, ), IRQ0)
                    Return(RTLB)
                }
                Method(_SRS, 1, Serialized) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Store(Local0, PIRB)
                }
                Method(_STA, 0, Serialized) {
                    If(And(PIRB, 0x80, )) {
                        Return(0x9)
                    }
                    Else {
                        Return(0xb)
                    }
                }
            }
            Device(LNKC) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x3)
                Method(_DIS, 0, Serialized) {
                    Store(0x80, PIRC)
                }
                Name(_PRS, Buffer(0x6) {0x23, 0x40, 0x0, 0x18, 0x79, 0x0 })
                Method(_CRS, 0, Serialized) {
                    Name(RTLC, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                    CreateWordField(RTLC, 0x1, IRQ0)
                    Store(Zero, IRQ0)
                    ShiftLeft(0x1, And(PIRC, 0xf, ), IRQ0)
                    Return(RTLC)
                }
                Method(_SRS, 1, Serialized) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Store(Local0, PIRC)
                }
                Method(_STA, 0, Serialized) {
                    If(And(PIRC, 0x80, )) {
                        Return(0x9)
                    }
                    Else {
                        Return(0xb)
                    }
                }
            }
            Device(LNKD) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x4)
                Method(_DIS, 0, Serialized) {
                    Store(0x80, PIRD)
                }
                Name(_PRS, Buffer(0x6) {0x23, 0x40, 0x0, 0x18, 0x79, 0x0 })
                Method(_CRS, 0, Serialized) {
                    Name(RTLD, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                    CreateWordField(RTLD, 0x1, IRQ0)
                    Store(Zero, IRQ0)
                    ShiftLeft(0x1, And(PIRD, 0xf, ), IRQ0)
                    Return(RTLD)
                }
                Method(_SRS, 1, Serialized) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Store(Local0, PIRD)
                }
                Method(_STA, 0, Serialized) {
                    If(And(PIRD, 0x80, )) {
                        Return(0x9)
                    }
                    Else {
                        Return(0xb)
                    }
                }
            }
            Device(LNKE) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x5)
                Method(_DIS, 0, Serialized) {
                    Store(0x80, PIRE)
                }
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Method(_CRS, 0, Serialized) {
                    Name(RTLE, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                    CreateWordField(RTLE, 0x1, IRQ0)
                    Store(Zero, IRQ0)
                    ShiftLeft(0x1, And(PIRE, 0xf, ), IRQ0)
                    Return(RTLE)
                }
                Method(_SRS, 1, Serialized) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Store(Local0, PIRE)
                }
                Method(_STA, 0, Serialized) {
                    If(And(PIRE, 0x80, )) {
                        Return(0x9)
                    }
                    Else {
                        Return(0xb)
                    }
                }
            }
            Device(LNKF) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x6)
                Method(_DIS, 0, Serialized) {
                    Store(0x80, PIRF)
                }
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Method(_CRS, 0, Serialized) {
                    Name(RTLF, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                    CreateWordField(RTLF, 0x1, IRQ0)
                    Store(Zero, IRQ0)
                    ShiftLeft(0x1, And(PIRF, 0xf, ), IRQ0)
                    Return(RTLF)
                }
                Method(_SRS, 1, Serialized) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Store(Local0, PIRF)
                }
                Method(_STA, 0, Serialized) {
                    If(And(PIRF, 0x80, )) {
                        Return(0x9)
                    }
                    Else {
                        Return(0xb)
                    }
                }
            }
            Device(LNKG) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x7)
                Method(_DIS, 0, Serialized) {
                    Store(0x80, PIRG)
                }
                Name(_PRS, Buffer(0x6) {0x23, 0x40, 0x0, 0x18, 0x79, 0x0 })
                Method(_CRS, 0, Serialized) {
                    Name(RTLG, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                    CreateWordField(RTLG, 0x1, IRQ0)
                    Store(Zero, IRQ0)
                    ShiftLeft(0x1, And(PIRG, 0xf, ), IRQ0)
                    Return(RTLG)
                }
                Method(_SRS, 1, Serialized) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Store(Local0, PIRG)
                }
                Method(_STA, 0, Serialized) {
                    If(And(PIRG, 0x80, )) {
                        Return(0x9)
                    }
                    Else {
                        Return(0xb)
                    }
                }
            }
            Device(LNKH) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x8)
                Method(_DIS, 0, Serialized) {
                    Store(0x80, PIRH)
                }
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Method(_CRS, 0, Serialized) {
                    Name(RTLH, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                    CreateWordField(RTLH, 0x1, IRQ0)
                    Store(Zero, IRQ0)
                    ShiftLeft(0x1, And(PIRH, 0xf, ), IRQ0)
                    Return(RTLH)
                }
                Method(_SRS, 1, Serialized) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Store(Local0, PIRH)
                }
                Method(_STA, 0, Serialized) {
                    If(And(PIRH, 0x80, )) {
                        Return(0x9)
                    }
                    Else {
                        Return(0xb)
                    }
                }
            }
            OperationRegion(GPOX, SystemIO, 0x1180, 0x40)
            Field(GPOX, DWordAcc, Lock, Preserve) {
                Offset(0x7),
                ,	1,
                IO25,	1,
                ,	1,
                IO27,	1,
                Offset(0xe),
                LV16,	1,
                LV17,	1,
                Offset(0xf),
                ,	1,
                LV25,	1,
                ,	1,
                LV27,	1,
                Offset(0x1b),
                ,	1,
                BL25,	1,
                ,	1,
                BL27,	1,
                Offset(0x38),
                RBID,	2,
                MBTP,	3,
                LV37,	1,
                LV38,	1,
                LV39,	1
            }
            OperationRegion(PMIO, SystemIO, 0x1000, 0x51)
            Field(PMIO, WordAcc, Lock, Preserve) {
                AccessAs(DWordAcc, 0),
                Offset(0x29),
                ,	3,
                PMES,	1,
                Offset(0x2b),
                ,	3,
                PMEE,	1,
                Offset(0x2c),
                GPI0,	1,
                GPI1,	1,
                GPI2,	1,
                GPI3,	1,
                GPI4,	1,
                GPI5,	1,
                GPI6,	1,
                GPI7,	1,
                GPI8,	1,
                GPI9,	1,
                GPIA,	1,
                GPIB,	1,
                GPIC,	1,
                GPID,	1,
                GPIE,	1,
                GPIF,	1,
                ,	6,
                GPEE,	1
            }
            Device(KBC_) {
                Name(_HID, 0x0303d041)
                Name(_CRS, Buffer(0x15) {0x47, 0x1, 0x60, 0x0, 0x60, 0x0, 0x1, 0x1, 0x47, 0x1, 0x64, 0x0, 0x64, 0x0, 0x1, 0x1, 0x22, 0x2, 0x0, 0x79, 0x0 })
                Method(_STA) {
                    Return(0xf)
                }
            }
            Device(MOUE) {
                Name(_HID, 0x80374d24)
                Name(_CID, 0x03102e4f)
                Name(_CRS, Buffer(0x5) {0x22, 0x0, 0x10, 0x79, 0x0 })
                Method(_STA) {
                    If(LEqual(SizeOf(\_OS_), 0x14)) {
                        Return(0x0)
                    }
                    Else {
                        If(PS2F) {
                            Return(0xf)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                }
            }
            Device(MOU2) {
                Name(_HID, 0x03102e4f)
                Name(_CID, Package(0x3) {
                    0x02102e4f,
                    0x00102e4f,
                    0x130fd041,
                })
                Name(_CRS, Buffer(0x5) {0x22, 0x0, 0x10, 0x79, 0x0 })
                Method(_STA) {
                    If(LEqual(SizeOf(\_OS_), 0x14)) {
                        If(PS2F) {
                            Store(PS2F, Local0)
                            Return(0xf)
                        }
                        Else {
                            Store(PS2F, Local0)
                            Return(0x0)
                        }
                    }
                    Else {
                        Store(PS2F, Local0)
                        Return(0x0)
                    }
                }
            }
            Device(SIO_) {
                Name(_HID, 0x050ad041)
                OperationRegion(SIIO, SystemIO, 0x164e, 0x2)
                Field(SIIO, ByteAcc, NoLock, Preserve) {
                    INDX,	8,
                    DATA,	8
                }
                Mutex(N393, 0)
                Method(SETD, 1, Serialized) {
                    Store(0x7, INDX)
                    Store(Arg0, DATA)
                }
                Method(READ, 1, Serialized) {
                    Store(Arg0, INDX)
                    Store(DATA, Local0)
                    Return(Local0)
                }
                Method(WRIT, 2, Serialized) {
                    Store(Arg0, INDX)
                    Store(Arg1, DATA)
                }
                Method(LDRS, 3) {
                    Acquire(N393, 0xffff)
                    Store(0x7, INDX)
                    Store(Arg0, DATA)
                    Store(Arg1, INDX)
                    Store(Arg2, DATA)
                    Release(N393)
                }
                Method(LDRG, 2) {
                    Acquire(N393, 0xffff)
                    Store(0x7, INDX)
                    Store(Arg0, DATA)
                    Store(Arg1, INDX)
                    Store(DATA, Local0)
                    Release(N393)
                    Return(Local0)
                }
                Method(RCF6, 1) {
                    Acquire(N393, 0xffff)
                    Store(0x26, INDX)
                    Store(DATA, Local0)
                    And(Local0, Arg0, Local0)
                    Release(N393)
                    Return(XOr(Local0, Arg0, ))
                }
                Method(PDRS, 2) {
                    If(\_SB_.PCI0.LPC0.POSD) {
                        If(LEqual(Arg0, 0x0)) {
                            If(LEqual(Arg1, 0x03f0)) {
                                Store(0x0, Local0)
                            }
                            Else {
                                If(LEqual(Arg1, 0x0370)) {
                                    Store(0x1, Local0)
                                }
                            }
                            Store(Local0, \_SB_.PCI0.LPC0.FDDD)
                        }
                        Else {
                            If(LEqual(Arg0, 0x1)) {
                                If(LEqual(Arg1, 0x0378)) {
                                    Store(0x0, Local0)
                                }
                                Else {
                                    If(LEqual(Arg1, 0x0278)) {
                                        Store(0x1, Local0)
                                    }
                                    Else {
                                        If(LEqual(Arg1, 0x03bc)) {
                                            Store(0x2, Local0)
                                        }
                                    }
                                }
                                Store(Local0, \_SB_.PCI0.LPC0.LPTD)
                            }
                            Else {
                                If(LEqual(Arg1, 0x03f8)) {
                                    Store(0x0, Local0)
                                }
                                Else {
                                    If(LEqual(Arg1, 0x02f8)) {
                                        Store(0x1, Local0)
                                    }
                                    Else {
                                        If(LEqual(Arg1, 0x0220)) {
                                            Store(0x2, Local0)
                                        }
                                        Else {
                                            If(LEqual(Arg1, 0x0228)) {
                                                Store(0x3, Local0)
                                            }
                                            Else {
                                                If(LEqual(Arg1, 0x0238)) {
                                                    Store(0x4, Local0)
                                                }
                                                Else {
                                                    If(LEqual(Arg1, 0x02e8)) {
                                                        Store(0x5, Local0)
                                                    }
                                                    Else {
                                                        If(LEqual(Arg1, 0x0338)) {
                                                            Store(0x6, Local0)
                                                        }
                                                        Else {
                                                            If(LEqual(Arg1, 0x03e8)) {
                                                                Store(0x7, Local0)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                If(LEqual(Arg0, 0x2)) {
                                    Store(Local0, \_SB_.PCI0.LPC0.CMBD)
                                }
                                Else {
                                    If(LEqual(Arg0, 0x3)) {
                                        Store(Local0, \_SB_.PCI0.LPC0.CMAD)
                                    }
                                }
                            }
                        }
                        Return(0x1)
                    }
                    Else {
                        Return(0x0)
                    }
                }
                Device(ECP_) {
                    Name(_HID, 0x0104d041)
                    Name(_UID, 0x3)
                    Method(_STA) {
                        Store(LDRG(0x1, 0xf0), Local0)
                        ShiftRight(Local0, 0x5, Local0)
                        If(LGreater(\_SB_.PCI0.LPC0.MBTP, 0x1)) {
                            Return(0x0)
                        }
                        If(LAnd(RCF6(0x2), LOr(LEqual(Local0, 0x4), LEqual(Local0, 0x7)))) {
                            ShiftLeft(LDRG(0x1, 0x30), 0x1, Local1)
                            Add(0xd, Local1, Local1)
                            Return(Local1)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                    Method(_PS0) {
                        LDRS(0x1, 0x30, 0x1)
                    }
                    Method(_PS3) {
                        LDRS(0x1, 0x30, 0x0)
                    }
                    Method(_PRS) {
                        Return(Buffer(0xbb) {0x30, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x80, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x8, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x8, 0x22, 0x20, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x20, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x8, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x8, 0x22, 0x80, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x80, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x8, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x8, 0x22, 0x20, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x20, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x8, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x8, 0x22, 0x80, 0x0, 0x2a, 0x2, 0x0, 0x38, 0x79, 0x0 })
                    }
                    Method(_DIS) {
                        LDRS(0x1, 0x30, 0x0)
                    }
                    Method(_CRS) {
                        Name(DCRS, Buffer(0x18) {0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x80, 0x0, 0x2a, 0x8, 0x0, 0x79, 0x0 })
                        Store(LDRG(0x1, 0x60), Local1)
                        Store(LDRG(0x1, 0x61), Local0)
                        Store(Local0, Index(DCRS, 0x2, ))
                        Store(Local0, Index(DCRS, 0xa, ))
                        Store(Local0, Index(DCRS, 0x4, ))
                        Store(Local0, Index(DCRS, 0xc, ))
                        Store(Local1, Index(DCRS, 0x3, ))
                        Store(Local1, Index(DCRS, 0x5, ))
                        Add(Local1, 0x4, Local1)
                        Store(Local1, Index(DCRS, 0xb, ))
                        Store(Local1, Index(DCRS, 0xd, ))
                        ShiftLeft(0x1, LDRG(0x1, 0x70), Local0)
                        Store(Local0, Index(DCRS, 0x11, ))
                        ShiftRight(Local0, 0x8, Local1)
                        Store(Local1, Index(DCRS, 0x12, ))
                        ShiftLeft(0x1, LDRG(0x1, 0x74), Local0)
                        Store(Local0, Index(DCRS, 0x14, ))
                        ShiftRight(Local0, 0x8, Local1)
                        Store(Local1, Index(DCRS, 0x15, ))
                        Return(DCRS)
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, ADRL)
                        CreateByteField(Arg0, 0x3, ADRM)
                        CreateWordField(Arg0, 0x11, IRQM)
                        CreateWordField(Arg0, 0x14, DMAM)
                        FindSetRightBit(IRQM, Local0)
                        Decrement(Local0)
                        FindSetRightBit(DMAM, Local1)
                        Decrement(Local1)
                        LDRS(0x1, 0x70, Local0)
                        LDRS(0x1, 0x74, Local1)
                        LDRS(0x1, 0x60, ADRM)
                        LDRS(0x1, 0x61, ADRL)
                        LDRS(0x1, 0x30, 0x1)
                    }
                }
                Device(EPP_) {
                    Name(_HID, 0x0004d041)
                    Name(_UID, 0x2)
                    Method(_STA) {
                        Store(LDRG(0x1, 0xf0), Local0)
                        ShiftRight(Local0, 0x5, Local0)
                        If(LGreater(\_SB_.PCI0.LPC0.MBTP, 0x1)) {
                            Return(0x0)
                        }
                        If(LAnd(RCF6(0x2), LOr(LEqual(Local0, 0x2), LEqual(Local0, 0x3)))) {
                            ShiftLeft(LDRG(0x1, 0x30), 0x1, Local1)
                            Add(0xd, Local1, Local1)
                            Return(Local1)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                    Method(_PS0) {
                        LDRS(0x1, 0x30, 0x1)
                    }
                    Method(_PS3) {
                        LDRS(0x1, 0x30, 0x0)
                    }
                    Method(_PRS) {
                        Return(Buffer(0x7b) {0x30, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x80, 0x0, 0x30, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x8, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x8, 0x22, 0x20, 0x0, 0x30, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x20, 0x0, 0x30, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x8, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x8, 0x22, 0x80, 0x0, 0x30, 0x47, 0x1, 0x78, 0x1, 0x78, 0x1, 0x8, 0x8, 0x47, 0x1, 0x78, 0x5, 0x78, 0x5, 0x8, 0x8, 0x22, 0x80, 0x0, 0x30, 0x47, 0x1, 0x78, 0x1, 0x78, 0x1, 0x8, 0x8, 0x47, 0x1, 0x78, 0x5, 0x78, 0x5, 0x8, 0x8, 0x22, 0x20, 0x0, 0x38, 0x79, 0x0 })
                    }
                    Method(_DIS) {
                        LDRS(0x1, 0x30, 0x0)
                    }
                    Method(_CRS) {
                        Name(DCRS, Buffer(0x15) {0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x80, 0x0, 0x79, 0x0 })
                        Store(LDRG(0x1, 0x60), Local1)
                        Store(LDRG(0x1, 0x61), Local0)
                        Store(Local0, Index(DCRS, 0x2, ))
                        Store(Local0, Index(DCRS, 0xa, ))
                        Store(Local0, Index(DCRS, 0x4, ))
                        Store(Local0, Index(DCRS, 0xc, ))
                        Store(Local1, Index(DCRS, 0x3, ))
                        Store(Local1, Index(DCRS, 0x5, ))
                        Add(Local1, 0x4, Local1)
                        Store(Local1, Index(DCRS, 0xb, ))
                        Store(Local1, Index(DCRS, 0xd, ))
                        ShiftLeft(0x1, LDRG(0x1, 0x70), Local0)
                        Store(Local0, Index(DCRS, 0x11, ))
                        ShiftRight(Local0, 0x8, Local1)
                        Store(Local1, Index(DCRS, 0x12, ))
                        Return(DCRS)
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, ADRL)
                        CreateByteField(Arg0, 0x3, ADRM)
                        CreateWordField(Arg0, 0x11, IRQM)
                        FindSetRightBit(IRQM, Local0)
                        Decrement(Local0)
                        LDRS(0x1, 0x70, Local0)
                        LDRS(0x1, 0x60, ADRM)
                        LDRS(0x1, 0x61, ADRL)
                        LDRS(0x1, 0x30, 0x1)
                    }
                }
                Device(LPTB) {
                    Name(_HID, 0x0004d041)
                    Name(_UID, 0x1)
                    Method(_STA) {
                        Store(LDRG(0x1, 0xf0), Local0)
                        ShiftRight(Local0, 0x5, Local0)
                        If(LGreater(\_SB_.PCI0.LPC0.MBTP, 0x1)) {
                            Return(0x0)
                        }
                        If(LAnd(RCF6(0x2), LEqual(Local0, 0x1))) {
                            ShiftLeft(LDRG(0x1, 0x30), 0x1, Local1)
                            Add(0xd, Local1, Local1)
                            Return(Local1)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                    Method(_PS0) {
                        LDRS(0x1, 0x30, 0x1)
                    }
                    Method(_PS3) {
                        LDRS(0x1, 0x30, 0x0)
                    }
                    Method(_PRS) {
                        Return(Buffer(0x7b) {0x30, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x80, 0x0, 0x30, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x8, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x8, 0x22, 0x20, 0x0, 0x30, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x20, 0x0, 0x30, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x8, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x8, 0x22, 0x80, 0x0, 0x30, 0x47, 0x1, 0xbc, 0x3, 0xbc, 0x3, 0x4, 0x4, 0x47, 0x1, 0xbc, 0x7, 0xbc, 0x7, 0x4, 0x4, 0x22, 0x80, 0x0, 0x30, 0x47, 0x1, 0xbc, 0x3, 0xbc, 0x3, 0x4, 0x4, 0x47, 0x1, 0xbc, 0x7, 0xbc, 0x7, 0x4, 0x4, 0x22, 0x20, 0x0, 0x38, 0x79, 0x0 })
                    }
                    Method(_DIS) {
                        LDRS(0x1, 0x30, 0x0)
                    }
                    Method(_CRS) {
                        Name(DCRS, Buffer(0x15) {0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x80, 0x0, 0x79, 0x0 })
                        Store(LDRG(0x1, 0x60), Local1)
                        Store(LDRG(0x1, 0x61), Local0)
                        Store(Local0, Index(DCRS, 0x2, ))
                        Store(Local0, Index(DCRS, 0xa, ))
                        Store(Local0, Index(DCRS, 0x4, ))
                        Store(Local0, Index(DCRS, 0xc, ))
                        Store(Local1, Index(DCRS, 0x3, ))
                        Store(Local1, Index(DCRS, 0x5, ))
                        Add(Local1, 0x4, Local1)
                        Store(Local1, Index(DCRS, 0xb, ))
                        Store(Local1, Index(DCRS, 0xd, ))
                        If(And(Local0, 0x4, )) {
                            Store(0x4, Local0)
                        }
                        Else {
                            Store(0x8, Local0)
                        }
                        Store(Local0, Index(DCRS, 0x6, ))
                        Store(Local0, Index(DCRS, 0x7, ))
                        Store(Local0, Index(DCRS, 0xe, ))
                        Store(Local0, Index(DCRS, 0xf, ))
                        ShiftLeft(0x1, LDRG(0x1, 0x70), Local0)
                        Store(Local0, Index(DCRS, 0x11, ))
                        ShiftRight(Local0, 0x8, Local1)
                        Store(Local1, Index(DCRS, 0x12, ))
                        Return(DCRS)
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, ADRL)
                        CreateByteField(Arg0, 0x3, ADRM)
                        CreateWordField(Arg0, 0x11, IRQM)
                        FindSetRightBit(IRQM, Local0)
                        Decrement(Local0)
                        LDRS(0x1, 0x70, Local0)
                        LDRS(0x1, 0x60, ADRM)
                        LDRS(0x1, 0x61, ADRL)
                        LDRS(0x1, 0x30, 0x1)
                    }
                }
                Device(LPT_) {
                    Name(_HID, 0x0004d041)
                    Name(_UID, 0x0)
                    Method(_STA) {
                        Store(LDRG(0x1, 0xf0), Local0)
                        ShiftRight(Local0, 0x5, Local0)
                        If(LGreater(\_SB_.PCI0.LPC0.MBTP, 0x1)) {
                            Return(0x0)
                        }
                        If(LAnd(RCF6(0x2), LEqual(Local0, 0x0))) {
                            ShiftLeft(LDRG(0x1, 0x30), 0x1, Local1)
                            Add(0xd, Local1, Local1)
                            Return(Local1)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                    Method(_PS0) {
                        LDRS(0x1, 0x30, 0x1)
                    }
                    Method(_PS3) {
                        LDRS(0x1, 0x30, 0x0)
                    }
                    Method(_PRS) {
                        Return(Buffer(0x7b) {0x30, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x80, 0x0, 0x30, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x8, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x8, 0x22, 0x20, 0x0, 0x30, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x20, 0x0, 0x30, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x8, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x8, 0x22, 0x80, 0x0, 0x30, 0x47, 0x1, 0xbc, 0x3, 0xbc, 0x3, 0x4, 0x4, 0x47, 0x1, 0xbc, 0x7, 0xbc, 0x7, 0x4, 0x4, 0x22, 0x80, 0x0, 0x30, 0x47, 0x1, 0xbc, 0x3, 0xbc, 0x3, 0x4, 0x4, 0x47, 0x1, 0xbc, 0x7, 0xbc, 0x7, 0x4, 0x4, 0x22, 0x20, 0x0, 0x38, 0x79, 0x0 })
                    }
                    Method(_DIS) {
                        LDRS(0x1, 0x30, 0x0)
                    }
                    Method(_CRS) {
                        Name(DCRS, Buffer(0x15) {0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x8, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x8, 0x22, 0x80, 0x0, 0x79, 0x0 })
                        Store(LDRG(0x1, 0x60), Local1)
                        Store(LDRG(0x1, 0x61), Local0)
                        Store(Local0, Index(DCRS, 0x2, ))
                        Store(Local0, Index(DCRS, 0xa, ))
                        Store(Local0, Index(DCRS, 0x4, ))
                        Store(Local0, Index(DCRS, 0xc, ))
                        Store(Local1, Index(DCRS, 0x3, ))
                        Store(Local1, Index(DCRS, 0x5, ))
                        Add(Local1, 0x4, Local1)
                        Store(Local1, Index(DCRS, 0xb, ))
                        Store(Local1, Index(DCRS, 0xd, ))
                        If(And(Local0, 0x4, )) {
                            Store(0x4, Local0)
                        }
                        Else {
                            Store(0x8, Local0)
                        }
                        Store(Local0, Index(DCRS, 0x6, ))
                        Store(Local0, Index(DCRS, 0x7, ))
                        Store(Local0, Index(DCRS, 0xe, ))
                        Store(Local0, Index(DCRS, 0xf, ))
                        ShiftLeft(0x1, LDRG(0x1, 0x70), Local0)
                        Store(Local0, Index(DCRS, 0x11, ))
                        ShiftRight(Local0, 0x8, Local1)
                        Store(Local1, Index(DCRS, 0x12, ))
                        Return(DCRS)
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, ADRL)
                        CreateByteField(Arg0, 0x3, ADRM)
                        CreateWordField(Arg0, 0x11, IRQM)
                        FindSetRightBit(IRQM, Local0)
                        Decrement(Local0)
                        LDRS(0x1, 0x70, Local0)
                        LDRS(0x1, 0x60, ADRM)
                        LDRS(0x1, 0x61, ADRL)
                        LDRS(0x1, 0x30, 0x1)
                    }
                }
                Device(COMA) {
                    Name(_HID, 0x0105d041)
                    Name(_UID, 0x0)
                    Method(_STA) {
                        If(LGreater(\_SB_.PCI0.LPC0.MBTP, 0x1)) {
                            Return(0x0)
                        }
                        If(RCF6(0x8)) {
                            ShiftLeft(LDRG(0x3, 0x30), 0x1, Local1)
                            Add(0xd, Local1, Local1)
                            Return(Local1)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                    Method(_PS0) {
                        LDRS(0x3, 0x30, 0x1)
                    }
                    Method(_PS3) {
                        LDRS(0x3, 0x30, 0x0)
                    }
                    Method(_PRS) {
                        Return(Buffer(0x63) {0x30, 0x47, 0x1, 0xf8, 0x3, 0xf8, 0x3, 0x8, 0x8, 0x22, 0x10, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x8, 0x8, 0x22, 0x8, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x3, 0xe8, 0x3, 0x8, 0x8, 0x22, 0x10, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x2, 0xe8, 0x2, 0x8, 0x8, 0x22, 0x8, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x3, 0xf8, 0x3, 0x8, 0x8, 0x22, 0x8, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x8, 0x8, 0x22, 0x10, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x3, 0xe8, 0x3, 0x8, 0x8, 0x22, 0x8, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x2, 0xe8, 0x2, 0x8, 0x8, 0x22, 0x10, 0x0, 0x38, 0x79, 0x0 })
                    }
                    Method(_DIS) {
                        LDRS(0x3, 0x30, 0x0)
                    }
                    Method(_CRS) {
                        Name(DCRS, Buffer(0xd) {0x47, 0x1, 0xf8, 0x3, 0xf8, 0x3, 0x8, 0x8, 0x22, 0x10, 0x0, 0x79, 0x0 })
                        Store(LDRG(0x3, 0x60), Local1)
                        Store(LDRG(0x3, 0x61), Local0)
                        Store(Local0, Index(DCRS, 0x2, ))
                        Store(Local0, Index(DCRS, 0x4, ))
                        Store(Local1, Index(DCRS, 0x3, ))
                        Store(Local1, Index(DCRS, 0x5, ))
                        ShiftLeft(0x1, LDRG(0x3, 0x70), Local0)
                        Store(Local0, Index(DCRS, 0x9, ))
                        ShiftRight(Local0, 0x8, Local1)
                        Store(Local1, Index(DCRS, 0xa, ))
                        Return(DCRS)
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, ADRL)
                        CreateByteField(Arg0, 0x3, ADRM)
                        CreateWordField(Arg0, 0x9, IRQM)
                        FindSetRightBit(IRQM, Local0)
                        Decrement(Local0)
                        LDRS(0x3, 0x70, Local0)
                        LDRS(0x3, 0x60, ADRM)
                        LDRS(0x3, 0x61, ADRL)
                        LDRS(0x3, 0x30, 0x1)
                    }
                }
                Device(FIR_) {
                    Method(_HID) {
                        If(LOr(LEqual(MYOS, 0x1), LEqual(MYOS, 0x3))) {
                            Return(0x0160633a)
                        }
                        Else {
                            Return(0x0160633a)
                        }
                    }
                    Name(_UID, 0x0)
                    Method(_STA) {
                        Store(LDRG(0x2, 0x74), Local0)
                        If(LAnd(RCF6(0x4), LNot(LEqual(Local0, 0x4)))) {
                            ShiftLeft(LDRG(0x2, 0x30), 0x1, Local1)
                            Add(0xd, Local1, Local1)
                            Return(Local1)
                        }
                        Else {
                            Return(0x0)
                        }
                    }
                    Method(_PS0) {
                        LDRS(0x2, 0x30, 0x1)
                    }
                    Method(_PS3) {
                        LDRS(0x2, 0x30, 0x0)
                    }
                    Method(_PRS) {
                        Return(Buffer(0x016b) {0x30, 0x47, 0x1, 0xf8, 0x3, 0xf8, 0x3, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x1, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x1, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x3, 0xe8, 0x3, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x1, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x2, 0xe8, 0x2, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x1, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x3, 0xf8, 0x3, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x1, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x1, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x3, 0xe8, 0x3, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x1, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x2, 0xe8, 0x2, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x1, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x3, 0xf8, 0x3, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x3, 0xe8, 0x3, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x2, 0xe8, 0x2, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x3, 0xf8, 0x3, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x3, 0xe8, 0x3, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x2, 0xe8, 0x2, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x2, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x3, 0xf8, 0x3, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x3, 0xe8, 0x3, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x2, 0xe8, 0x2, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x3, 0xf8, 0x3, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x3, 0xe8, 0x3, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x8, 0x0, 0x30, 0x47, 0x1, 0xe8, 0x2, 0xe8, 0x2, 0x8, 0x8, 0x22, 0x10, 0x0, 0x2a, 0x8, 0x0, 0x38, 0x79, 0x0 })
                    }
                    Method(_DIS) {
                        LDRS(0x2, 0x30, 0x0)
                    }
                    Method(_CRS) {
                        Name(DCRS, Buffer(0x10) {0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x8, 0x8, 0x22, 0x8, 0x0, 0x2a, 0x1, 0x0, 0x79, 0x0 })
                        Store(LDRG(0x2, 0x60), Local1)
                        Store(LDRG(0x2, 0x61), Local0)
                        Store(Local0, Index(DCRS, 0x2, ))
                        Store(Local0, Index(DCRS, 0x4, ))
                        Store(Local1, Index(DCRS, 0x3, ))
                        Store(Local1, Index(DCRS, 0x5, ))
                        ShiftLeft(0x1, LDRG(0x2, 0x70), Local0)
                        Store(Local0, Index(DCRS, 0x9, ))
                        ShiftRight(Local0, 0x8, Local1)
                        Store(Local1, Index(DCRS, 0xa, ))
                        ShiftLeft(0x1, LDRG(0x2, 0x74), Local0)
                        Store(Local0, Index(DCRS, 0xc, ))
                        ShiftRight(Local0, 0x8, Local1)
                        Store(Local1, Index(DCRS, 0xd, ))
                        Return(DCRS)
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, ADRL)
                        CreateByteField(Arg0, 0x3, ADRM)
                        CreateWordField(Arg0, 0x9, IRQM)
                        CreateWordField(Arg0, 0xc, DMAM)
                        FindSetRightBit(IRQM, Local0)
                        Decrement(Local0)
                        FindSetRightBit(DMAM, Local1)
                        Decrement(Local1)
                        LDRS(0x2, 0x70, Local0)
                        LDRS(0x2, 0x74, Local1)
                        LDRS(0x2, 0x60, ADRM)
                        LDRS(0x2, 0x61, ADRL)
                        PDRS(0x2, Add(ShiftLeft(ADRM, 0x8, ), ADRL, ))
                        LDRS(0x2, 0x30, 0x1)
                    }
                }
            }
            Device(EC0_) {
                Name(_HID, 0x090cd041)
                Name(_CRS, Buffer(0x12) {0x47, 0x1, 0x62, 0x0, 0x62, 0x0, 0x1, 0x1, 0x47, 0x1, 0x66, 0x0, 0x66, 0x0, 0x1, 0x1, 0x79, 0x0 })
                Name(_GPE, 0x1d)
                Name(OSEJ, 0x0)
                Device(SMBC) {
                    Name(_HID, "ACPI0001")
                    Name(_EC_, 0x1820)
                    Device(SBS0) {
                        Name(_HID, "ACPI0002")
                        Name(_SBS, 0x2)
                    }
                }
                Method(_REG, 2) {
                    If(LEqual(Arg0, 0x3)) {
                        Store(Arg1, \_SB_.OKEC)
                        Store(Arg1, \_SB_.ECOK)
                        If(Or(LEqual(\_SB_.PCI0.MYOS, 0x3), LEqual(\_SB_.PCI0.MYOS, 0x1), )) {
                            If(Arg1) {
                                Store(0x1, \_SB_.PCI0.LPC0.EC0_.RG57)
                            }
                            Store(\_SB_.WLES, \_SB_.PCI0.LPC0.EC0_.WEST)
                            Store(\_SB_.BTES, \_SB_.PCI0.LPC0.EC0_.BEST)
                            Store(One, \_SB_.PCI0.LPC0.EC0_.WBIN)
                            Store(DOFF, \_SB_.PCI0.LPC0.EC0_.TMOF)
                        }
                    }
                }
                OperationRegion(ERAM, EmbeddedControl, 0x0, 0xff)
                Field(ERAM, ByteAcc, NoLock, Preserve) {
                    Offset(0x4),
                    CMCM,	8,
                    CMD1,	8,
                    CMD2,	8,
                    CMD3,	8,
                    Offset(0x18),
                    SMPR,	8,
                    SMST,	8,
                    SMAD,	8,
                    SMCM,	8,
                    SMD0,	256,
                    BCNT,	8,
                    SMAA,	8,
                    BATD,	16,
                    ACDF,	1,
                    Offset(0x41),
                    ,	4,
                    FPR1,	1,
                    S4LD,	1,
                    S5LW,	1,
                    PFLG,	1,
                    Offset(0x43),
                    TMSS,	2,
                    ,	2,
                    BANK,	4,
                    Offset(0x45),
                    VFAN,	1,
                    Offset(0x46),
                    RL01,	1,
                    RD01,	1,
                    RF01,	1,
                    RP01,	1,
                    RB01,	1,
                    RC01,	1,
                    ,	1,
                    R701,	1,
                    R801,	1,
                    RM01,	1,
                    RI01,	1,
                    ,	1,
                    ,	1,
                    ,	1,
                    RA01,	1,
                    RR01,	1,
                    RL10,	1,
                    RD10,	1,
                    RF10,	1,
                    RP10,	1,
                    RB10,	1,
                    RC10,	1,
                    ,	1,
                    R710,	1,
                    R810,	1,
                    RM10,	1,
                    RI10,	1,
                    ,	1,
                    ,	1,
                    ,	1,
                    RA10,	1,
                    RR10,	1,
                    LIDE,	1,
                    DB2E,	1,
                    RPTE,	1,
                    WP01,	1,
                    WB01,	1,
                    WC01,	1,
                    ,	1,
                    W701,	1,
                    W801,	1,
                    WM01,	1,
                    WI01,	1,
                    ,	1,
                    ,	1,
                    ,	1,
                    WA01,	1,
                    WR01,	1,
                    LIDS,	1,
                    DB2S,	1,
                    RPTS,	1,
                    WP10,	1,
                    WB10,	1,
                    WC10,	1,
                    ,	1,
                    W710,	1,
                    W810,	1,
                    WM10,	1,
                    WI10,	1,
                    ,	1,
                    ,	1,
                    ,	1,
                    WA10,	1,
                    WR10,	1,
                    ,	1,
                    BAYE,	1,
                    EFDE,	1,
                    PRDE,	1,
                    BRBE,	1,
                    ADIM,	1,
                    ,	1,
                    W7BE,	1,
                    W8BE,	1,
                    PMEE,	1,
                    INTE,	1,
                    ,	1,
                    ,	1,
                    ,	1,
                    ,	1,
                    DB3E,	1,
                    Offset(0x52),
                    ,	1,
                    BAYS,	1,
                    EFDS,	1,
                    PRDS,	1,
                    BRBS,	1,
                    CRTS,	1,
                    ,	1,
                    W7BS,	1,
                    TMOF,	8,
                    Offset(0x57),
                    RG57,	8,
                    CTMP,	8,
                    RG59,	8,
                    RG5A,	8,
                    RG5B,	8,
                    FSPD,	16,
                    Offset(0x5f),
                    WEST,	1,
                    BEST,	1,
                    WBIN,	1,
                    Offset(0x60),
                    ,	1,
                    FANC,	1,
                    Offset(0x70),
                    MBID,	8,
                    MBTS,	1,
                    MBTF,	1,
                    Offset(0x72),
                    MBTC,	1,
                    Offset(0x77),
                    BA1C,	8,
                    MBVG,	16,
                    MCUR,	16,
                    Offset(0x80),
                    SBID,	8,
                    SBTS,	1,
                    SBTF,	1,
                    Offset(0x82),
                    SBTC,	1,
                    Offset(0x87),
                    BA2C,	8,
                    ABVG,	16,
                    ACUR,	16,
                    Offset(0xc3),
                    MBRM,	16,
                    Offset(0xca),
                    ABRM,	16,
                    Offset(0xd0),
                    EBPL,	1,
                    Offset(0xd2),
                    ,	6,
                    APWR,	1,
                    Offset(0xd6),
                    DBPL,	8,
                    Offset(0xe7),
                    GQKS,	7
                }
                Field(ERAM, ByteAcc, NoLock, Preserve) {
                    Offset(0x1c),
                    SMW0,	16
                }
                Field(ERAM, ByteAcc, NoLock, Preserve) {
                    Offset(0x1c),
                    SMB0,	8
                }
                Field(ERAM, ByteAcc, NoLock, Preserve) {
                    Offset(0x1c),
                    FLD0,	64
                }
                Field(ERAM, ByteAcc, NoLock, Preserve) {
                    Offset(0x1c),
                    FLD1,	128
                }
                Field(ERAM, ByteAcc, NoLock, Preserve) {
                    Offset(0x1c),
                    FLD2,	192
                }
                Field(ERAM, ByteAcc, NoLock, Preserve) {
                    Offset(0x1c),
                    FLD3,	256
                }
                Method(BPOL, 1) {
                    Store(Arg0, DBPL)
                    Store(0x1, EBPL)
                }
                Name(ECUS, 0x0)
                Name(BATO, 0x0)
                Name(BATN, 0x0)
                Name(BATF, 0xc0)
                Method(_Q09) {
                    If(LEqual(SizeOf(\_OS_), 0x14)) {
                    }
                    If(LEqual(SizeOf(\_OS_), 0x14)) {
                        BPOL(0x3c)
                    }
                }
                Method(_Q20) {
                    If(And(SMST, 0x40, )) {
                        Store(SMAA, Local0)
                        If(LEqual(Local0, 0x14)) {
                            And(SMST, 0xbf, SMST)
                        }
                    }
                }
                Method(SELE) {
                    Store(BATD, BATN)
                    Store(0x0, BATF)
                    If(And(0xc0, BATN, )) {
                        Or(BATF, 0x1, BATF)
                    }
                    If(And(0x0300, BATN, )) {
                        Or(BATF, 0x4, BATF)
                    }
                    And(BATN, 0x1, Local0)
                    And(BATO, 0x1, Local1)
                    If(Local0) {
                        Or(BATF, 0x0100, BATF)
                    }
                    Else {
                        And(BATF, 0xfeff, BATF)
                    }
                    If(Not(LEqual(Local0, Local1), )) {
                        Or(BATF, 0x40, BATF)
                    }
                    And(BATN, 0x2, Local0)
                    And(BATO, 0x2, Local1)
                    If(Local0) {
                        Or(BATF, 0x0200, BATF)
                    }
                    Else {
                        And(BATF, 0xfdff, BATF)
                    }
                    If(Not(LEqual(Local0, Local1), )) {
                        Or(BATF, 0x80, BATF)
                    }
                    And(BATN, 0xc0, Local0)
                    And(BATO, 0xc0, Local1)
                    If(Not(LEqual(Local0, Local1), )) {
                        Or(BATF, 0x2, BATF)
                    }
                    If(And(0x1, BATF, )) {
                        If(And(0x4, BATF, )) {
                            If(And(BATN, 0x20, )) {
                                Or(BATF, 0x10, BATF)
                            }
                            Else {
                                Or(BATF, 0x20, BATF)
                            }
                        }
                    }
                }
                Method(_Q0D) {
                    Store("Sleep Button Query: Fn+F4", Debug)
                    Notify(\_SB_.SLPB, 0x80)
                }
                Method(_Q0E) {
                    \_SB_.PCI0.AGP_.VGA_.SWIH()
                }
                Method(_Q13) {
                    Store("Brightness Up: Fn+->", Debug)
                    Store(0x8c, \_SB_.PCI0.LPC0.BCMD)
                    Store(0x0, \_SB_.PCI0.LPC0.SMIC)
                }
                Method(_Q12) {
                    Store("Brightness Down: Fn+<-", Debug)
                    Store(0x8d, \_SB_.PCI0.LPC0.BCMD)
                    Store(0x0, \_SB_.PCI0.LPC0.SMIC)
                }
                Method(_Q80) {
                    Store("Temperature increasing: _Q80", Debug)
                    Notify(\_TZ_.THRM, 0x80)
                }
                Method(_Q81) {
                    Store("Temperature decreasing: _Q81", Debug)
                    Notify(\_TZ_.THRM, 0x80)
                }
                Event(EJT1)
                Method(_Q8A) {
                    Mutex(MUT0, 0)
                    Mutex(MUT1, 0)
                    Store("------------------_Q0x8A --------------------------------------", Debug)
                    If(LIDE) {
                        Store(0x1, LIDE)
                        Notify(\_SB_.LID_, 0x80)
                    }
                    If(DB2E) {
                        Store("-------- Device R-Bay Event ------", Debug)
                        Store(0x1, DB2E)
                        Store(0xb1, P80H)
                        If(Or(LEqual(\_SB_.PCI0.MYOS, 0x1), LEqual(\_SB_.PCI0.MYOS, 0x3), )) {
                            If(DB2S) {
                                Store(0xb2, P80H)
                                Store("----------- Device Bay Change Status ---------- IN ", Debug)
                                Store(\_SB_.PCI0.LPC0.RBID, Local0)
                                Store(Local0, \_SB_.PCI0.IDE0.BAYR)
                                If(LEqual(Local0, 0x0)) {
                                    Store(0xb4, P80H)
                                    Store(0x0, \_SB_.PCI0.LPC0.LV37)
                                    Sleep(0xc8)
                                }
                                Else {
                                    Store(0xb5, P80H)
                                    Store(0x0, \_SB_.PCI0.LPC0.LV37)
                                    Sleep(0x64)
                                    Store(0x0, \_SB_.PCI0.LPC0.LV39)
                                    Sleep(0xc8)
                                    Store(0x1, \_SB_.PCI0.LPC0.LV39)
                                    Sleep(0x09c4)
                                    Sleep(0xc8)
                                    Sleep(0xc8)
                                    Sleep(0x64)
                                    Store(0x1, \_SB_.PCI0.IDE0.SSIG)
                                    Store(0x1, \_SB_.PCI0.IDE0.UDC1)
                                    Store(0x2, \_SB_.PCI0.IDE0.UDT1)
                                    Or(\_SB_.PCI0.IDE0.FSCB, 0x4, \_SB_.PCI0.IDE0.FSCB)
                                    Store(0xe303, \_SB_.PCI0.IDE0.ITM1)
                                    Store(0x0, \_SB_.PCI0.IDE0.SSIG)
                                    Notify(\_SB_.PCI0.IDE0.SECN.BAY1, 0x0)
                                    Store(0xb6, P80H)
                                }
                            }
                            Else {
                                Store(0xb7, P80H)
                                Store("-------- Device Bay Event ------ OUT ", Debug)
                                Store(\_SB_.PCI0.IDE0.BAYR, Local0)
                                Store(0x1, \_SB_.PCI0.LPC0.LV37)
                                Sleep(0xc8)
                                If(Or(LEqual(Local0, 0x1), LEqual(Local0, 0x2), )) {
                                    Notify(\_SB_.PCI0.IDE0.SECN.BAY1, 0x1)
                                    Store(0xb8, P80H)
                                }
                            }
                        }
                    }
                }
            }
            OperationRegion(SMI0, SystemIO, 0x0000fe00, 0x00000002)
            Field(SMI0, AnyAcc, NoLock, Preserve) {
                SMIC,	8
            }
            OperationRegion(SMI1, SystemMemory, 0x1fefcebd, 0x00000090)
            Field(SMI1, AnyAcc, NoLock, Preserve) {
                BCMD,	8,
                DID_,	32,
                INFO,	1024
            }
            Field(SMI1, AnyAcc, NoLock, Preserve) {
                AccessAs(ByteAcc, 0),
                Offset(0x5),
                INF_,	8
            }
        }
        Device(MDM0) {
            Name(_ADR, 0x001f0006)
            Name(_PRW, Package(0x2) {
                0x5,
                0x3,
            })
        }
        Device(IDE0) {
            Name(_ADR, 0x001f0001)
            OperationRegion(PCI_, PCI_Config, 0x0, 0x58)
            Field(PCI_, DWordAcc, NoLock, Preserve) {
                Offset(0x3),
                ,	7,
                SIDE,	1,
                Offset(0x42),
                ,	1,
                EIOR,	1,
                ,	13,
                ESID,	1,
                Offset(0x48),
                UMA0,	1,
                UMA1,	1,
                UMA2,	1,
                UMA3,	1,
                Offset(0x56),
                PSIG,	2,
                SSIG,	2
            }
            Field(PCI_, DWordAcc, NoLock, Preserve) {
                Offset(0x40),
                ITM0,	16,
                ITM1,	16,
                SIT0,	4,
                SIT1,	4,
                Offset(0x48),
                UDC0,	2,
                UDC1,	2,
                Offset(0x4a),
                UDT0,	8,
                UDT1,	8,
                Offset(0x54),
                ICF0,	2,
                ICF1,	2,
                CB80,	4,
                ,	2,
                WPPE,	1,
                ,	1,
                FSCB,	4,
                TRIP,	2,
                TRIS,	2,
                FATS,	4
            }
            Name(TIM0, Package(0x1) {
                Package(0x5) {
                    0x78,
                    0xb4,
                    0xf0,
                    0x0186,
                    0x0258,
                },
            })
            Name(TIM1, Package(0x1) {
                Package(0x3) {
                    0x78,
                    0x96,
                    0x01fe,
                },
            })
            Name(TIM2, Package(0x1) {
                Package(0x6) {
                    0x18,
                    0x1e,
                    0x2d,
                    0x3c,
                    0x5a,
                    0x78,
                },
            })
            Name(AT01, Buffer(0x7) {0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0xef })
            Name(AT02, Buffer(0x7) {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x90 })
            Name(AT03, Buffer(0x7) {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc6 })
            Name(AT04, Buffer(0x7) {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x91 })
            Name(ATA0, Buffer(0x1d) { })
            Name(ATA1, Buffer(0x1d) { })
            Name(ATA2, Buffer(0x1d) { })
            Name(ATA3, Buffer(0x1d) { })
            Name(ATAB, Buffer(0xe) { })
            Name(CMDC, 0x0)
            Name(BAYR, 0x0)
            Method(_INI) {
                Store(\_SB_.PCI0.LPC0.RBID, BAYR)
            }
            Method(GTFB, 3, Serialized) {
                Multiply(CMDC, 0x38, Local0)
                CreateField(ATAB, Local0, 0x38, CMDX)
                Multiply(CMDC, 0x7, Local0)
                CreateByteField(ATAB, Add(Local0, 0x1, ), A001)
                CreateByteField(ATAB, Add(Local0, 0x5, ), A005)
                Store(Arg0, CMDX)
                Store(Arg1, A001)
                Store(Arg2, A005)
                Increment(CMDC)
            }
            Mutex(GTFM, 0)
            Method(GTF_, 3, Serialized) {
                Acquire(GTFM, 0xffff)
                CreateDWordField(Arg2, 0x0, PIO0)
                CreateDWordField(Arg2, 0x4, DMA0)
                CreateDWordField(Arg2, 0x8, PIO1)
                CreateDWordField(Arg2, 0xc, DMA1)
                CreateDWordField(Arg2, 0x10, CHNF)
                Store(0x0, CMDC)
                Name(ID00, 0x80)
                Name(ID49, 0x0c00)
                Name(ID59, 0x0)
                Name(ID53, 0x4)
                Name(ID63, 0x0f00)
                Name(ID88, 0x0f00)
                Name(IRDY, 0x1)
                Name(PIOT, 0x0)
                Name(DMAT, 0x0)
                If(LEqual(SizeOf(Arg1), 0x0200)) {
                    CreateByteField(Arg1, 0x0, IB00)
                    Store(IB00, ID00)
                    CreateWordField(Arg1, 0x62, IW49)
                    Store(IW49, ID49)
                    CreateWordField(Arg1, 0x6a, IW53)
                    Store(IW53, ID53)
                    CreateWordField(Arg1, 0x7e, IW63)
                    Store(IW63, ID63)
                    CreateWordField(Arg1, 0x76, IW59)
                    Store(IW59, ID59)
                    CreateWordField(Arg1, 0xb0, IW88)
                    Store(IW88, ID88)
                }
                Else {
                    Return(ATAB)
                }
                Store(0xa0, Local7)
                If(Arg0) {
                    Store(0xb0, Local7)
                    And(CHNF, 0x8, IRDY)
                    If(And(CHNF, 0x10, )) {
                        Store(PIO1, PIOT)
                    }
                    Else {
                        Store(PIO0, PIOT)
                    }
                    If(And(CHNF, 0x4, )) {
                        If(And(CHNF, 0x10, )) {
                            Store(DMA1, DMAT)
                        }
                        Else {
                            Store(DMA0, DMAT)
                        }
                    }
                }
                Else {
                    And(CHNF, 0x2, IRDY)
                    Store(PIO0, PIOT)
                    If(And(CHNF, 0x1, )) {
                        Store(DMA0, DMAT)
                    }
                }
                If(LAnd(And(ID53, 0x4, ), And(ID88, 0xff, ))) {
                    Store(0x0, Local1)
                    And(ID88, 0xff, Local2)
                    While(ShiftRight(Local2, Local1, )) {
                        Increment(Local1)
                    }
                    Decrement(Local1)
                    GTFB(AT01, Or(0x40, Local1, ), Local7)
                }
                If(IRDY) {
                    Store(Match(DerefOf(Index(TIM0, 0x0, )), MGE, PIOT, MTR, 0x0, 0x0), Local1)
                    If(LEqual(Local1, Ones)) {
                        Store(0x4, Local1)
                    }
                    Subtract(0x4, Local1, Local1)
                    GTFB(AT01, Or(0x8, Local1, ), Local7)
                }
                Else {
                    If(And(ID49, 0x0400, )) {
                        GTFB(AT01, 0x1, Local7)
                    }
                }
                Release(GTFM)
                Return(ATAB)
            }
            Method(RATA, 1) {
                CreateByteField(Arg0, 0x0, CMDN)
                Multiply(CMDN, 0x38, Local0)
                CreateField(Arg0, 0x8, Local0, RETB)
                Return(RETB)
            }
            Name(REGF, 0x1)
            Method(_REG, 2) {
                If(LEqual(Arg0, 0x2)) {
                    Store(Arg1, REGF)
                }
            }
            Name(BAYD, 0x0)
            Method(_STA) {
                Return(0xf)
            }
            Method(GTM_, 6) {
                Store(Buffer(0x14) { }, Local0)
                CreateDWordField(Local0, 0x0, PIO0)
                CreateDWordField(Local0, 0x4, DMA0)
                CreateDWordField(Local0, 0x8, PIO1)
                CreateDWordField(Local0, 0xc, DMA1)
                CreateDWordField(Local0, 0x10, FLAG)
                If(LOr(And(Arg0, 0x8, ), LNot(And(Arg0, 0x1, )))) {
                    Store(0x0384, PIO0)
                }
                Else {
                    Add(ShiftRight(And(Arg0, 0x0300, ), 0x8, ), ShiftRight(And(Arg0, 0x3000, ), 0xc, ), Local1)
                    Multiply(Subtract(0x9, Local1, ), 0x1e, PIO0)
                }
                If(And(Arg0, 0x4000, )) {
                    If(LOr(And(Arg0, 0x80, ), LNot(And(Arg0, 0x10, )))) {
                        Store(0x0384, PIO1)
                    }
                    Else {
                        Add(And(Arg1, 0x3, ), ShiftRight(And(Arg1, 0xc, ), 0x2, ), Local1)
                        Multiply(Subtract(0x9, Local1, ), 0x1e, PIO1)
                    }
                }
                Else {
                    Store(PIO0, PIO1)
                }
                If(And(Arg2, 0x1, )) {
                    If(And(Arg5, 0x1, )) {
                        Store(0x8, DMA0)
                    }
                    Else {
                        Subtract(0x4, And(Arg3, 0x3, ), Local1)
                        If(And(Arg4, 0x1, )) {
                            Multiply(Local1, 0xf, DMA0)
                        }
                        Else {
                            Multiply(Local1, 0x1e, DMA0)
                        }
                    }
                }
                Else {
                    Store(PIO0, DMA0)
                }
                If(And(Arg0, 0x4000, )) {
                    If(And(Arg2, 0x2, )) {
                        If(And(Arg5, 0x2, )) {
                            Store(0x8, DMA1)
                        }
                        Else {
                            Subtract(0x4, ShiftRight(And(Arg3, 0x30, ), 0x4, ), Local1)
                            If(And(Arg4, 0x2, )) {
                                Multiply(Local1, 0xf, DMA1)
                            }
                            Else {
                                Multiply(Local1, 0x1e, DMA1)
                            }
                        }
                    }
                    Else {
                        Store(PIO1, DMA1)
                    }
                }
                Else {
                    Store(DMA0, DMA1)
                }
                Store(Zero, FLAG)
                If(And(Arg0, 0x1, )) {
                    Or(FLAG, 0x10, FLAG)
                }
                If(And(Arg2, 0x1, )) {
                    Or(FLAG, 0x1, FLAG)
                }
                If(And(Arg0, 0x2, )) {
                    Or(FLAG, 0x2, FLAG)
                }
                If(And(Arg2, 0x2, )) {
                    Or(FLAG, 0x4, FLAG)
                }
                If(And(Arg0, 0x20, )) {
                    Or(FLAG, 0x8, FLAG)
                }
                Return(Local0)
            }
            Method(STMS, 3) {
                Store(Buffer(0x18) { }, Local7)
                CreateDWordField(Local7, 0x0, ITM_)
                CreateDWordField(Local7, 0x4, SIT_)
                CreateDWordField(Local7, 0x8, UDC_)
                CreateDWordField(Local7, 0xc, UDT_)
                CreateDWordField(Local7, 0x10, ICF_)
                CreateDWordField(Local7, 0x14, A100)
                Store(0x1, WPPE)
                CreateDWordField(Arg0, 0x0, PIO0)
                CreateDWordField(Arg0, 0x4, DMA0)
                CreateDWordField(Arg0, 0x8, PIO1)
                CreateDWordField(Arg0, 0xc, DMA1)
                CreateDWordField(Arg0, 0x10, FLAG)
                Store(FLAG, Local4)
                Store(0x4000, Local0)
                Name(W49M, 0x0)
                Name(W53M, 0x0)
                Name(W62M, 0x0)
                Name(W64M, 0x0)
                Name(W88M, 0x0)
                If(LEqual(SizeOf(Arg1), 0x0200)) {
                    CreateDWordField(Arg1, 0x0, W00A)
                    CreateDWordField(Arg1, 0x62, W49A)
                    CreateDWordField(Arg1, 0x6a, W53A)
                    CreateDWordField(Arg1, 0x7c, W62A)
                    CreateDWordField(Arg1, 0x80, W64A)
                    CreateDWordField(Arg1, 0xb0, W88A)
                    Store(W49A, W49M)
                    Store(W53A, W53M)
                    Store(W62A, W62M)
                    Store(W64A, W64M)
                    Store(W88A, W88M)
                    If(W00A) {
                        Or(Local0, 0x8000, Local0)
                    }
                    If(LNot(And(W00A, 0x80, ))) {
                        Or(Local0, 0x4, Local0)
                    }
                }
                Else {
                    Store(0x0, W49M)
                    Store(0x0, W53M)
                    Store(0x0, W62M)
                    Store(0x0, W64M)
                    Store(0x0, W88M)
                }
                Name(W49S, 0x0)
                Name(W53S, 0x0)
                Name(W62S, 0x0)
                Name(W64S, 0x0)
                Name(W88S, 0x0)
                If(LEqual(SizeOf(Arg2), 0x0200)) {
                    CreateDWordField(Arg2, 0x0, W00B)
                    CreateDWordField(Arg2, 0x62, W49B)
                    CreateDWordField(Arg2, 0x6a, W53B)
                    CreateDWordField(Arg2, 0x7c, W62B)
                    CreateDWordField(Arg2, 0x80, W64B)
                    CreateDWordField(Arg2, 0xb0, W88B)
                    Store(W49B, W49S)
                    Store(W53B, W53S)
                    Store(W62B, W62S)
                    Store(W64B, W64S)
                    Store(W88B, W88S)
                    If(W00B) {
                        Or(Local0, 0x8000, Local0)
                    }
                    If(LNot(And(W00B, 0x80, ))) {
                        Or(Local0, 0x40, Local0)
                    }
                }
                Else {
                    Store(0x0, W49S)
                    Store(0x0, W53S)
                    Store(0x0, W62S)
                    Store(0x0, W64S)
                    Store(0x0, W88S)
                }
                Store(0x0, A100)
                If(And(0x38, W88M, )) {
                    If(And(0x20, W88M, )) {
                        Store(0x8, DMA0)
                        Or(A100, 0x00100010, A100)
                    }
                    Else {
                        If(And(0x10, W88M, )) {
                            Store(0x1e, DMA0)
                            Or(A100, 0x10, A100)
                        }
                        Else {
                            Store(0x2d, DMA0)
                        }
                    }
                }
                Else {
                    If(And(0x7, W88M, )) {
                        Or(0x0100, A100, A100)
                        If(And(0x4, W88M, )) {
                            Store(0x3c, DMA0)
                        }
                        Else {
                            If(And(0x2, W88M, )) {
                                Store(0x5a, DMA0)
                            }
                            Else {
                                Store(0x78, DMA0)
                            }
                        }
                    }
                }
                If(And(0x3f, W88S, )) {
                    If(And(0x20, W88S, )) {
                        Store(0x8, DMA1)
                        Or(A100, 0x00200020, A100)
                    }
                    Else {
                        If(And(0x10, W88S, )) {
                            Store(0x1e, DMA1)
                            Or(A100, 0x20, A100)
                        }
                        Else {
                            Store(0x2d, DMA1)
                        }
                    }
                }
                If(LAnd(And(W49M, 0x0800, ), And(Local4, 0x2, ))) {
                    Or(Local0, 0x2, Local0)
                }
                If(LLess(PIO0, 0x0384)) {
                    Or(Local0, 0x1, Local0)
                }
                If(LAnd(And(W49S, 0x0800, ), And(Local4, 0x8, ))) {
                    Or(Local0, 0x20, Local0)
                }
                If(LLess(PIO1, 0x0384)) {
                    Or(Local0, 0x10, Local0)
                }
                If(And(Local4, 0x1, )) {
                    Store(PIO0, Local1)
                }
                Else {
                    Store(DMA0, Local1)
                }
                If(LNot(LLess(Local1, 0xf0))) {
                    Or(Local0, 0x8, Local0)
                }
                Else {
                    If(And(W53M, 0x2, )) {
                        If(LAnd(And(W64M, 0x2, ), LNot(LGreater(Local1, 0x78)))) {
                            Or(Local0, 0x2301, Local0)
                        }
                        Else {
                            If(LAnd(And(W64M, 0x1, ), LNot(LGreater(Local1, 0xb4)))) {
                                Or(Local0, 0x2101, Local0)
                            }
                        }
                    }
                    Else {
                        Or(Local0, 0x1001, Local0)
                    }
                }
                Store(Local0, ITM_)
                Store(Zero, Local0)
                If(And(Local4, 0x4, )) {
                    Store(PIO1, Local1)
                }
                Else {
                    Store(DMA1, Local1)
                }
                If(And(Local4, 0x10, )) {
                    If(LNot(LLess(Local1, 0xf0))) {
                        Or(0x80, ITM_, ITM_)
                    }
                    Else {
                        Or(0x10, ITM_, ITM_)
                        If(And(W53S, 0x2, )) {
                            If(LAnd(And(W64S, 0x2, ), LNot(LGreater(Local1, 0x78)))) {
                                Store(0xb, Local0)
                            }
                            Else {
                                If(LAnd(And(W64S, 0x1, ), LNot(LGreater(Local1, 0xb4)))) {
                                    Store(0x9, Local0)
                                }
                            }
                        }
                        Else {
                            Store(0x4, Local0)
                        }
                    }
                }
                Store(Local0, SIT_)
                Store(0x0, Local0)
                If(LAnd(And(0x3f, W88M, ), And(Local4, 0x1, ))) {
                    Or(Local0, 0x1, Local0)
                }
                If(And(Local4, 0x4, )) {
                    Or(Local0, 0x2, Local0)
                }
                Store(Local0, UDC_)
                Store(0x0, Local0)
                If(And(Local4, 0x1, )) {
                    If(LLess(DMA0, 0x1e)) {
                        Or(A100, 0x1000, A100)
                        Or(Local0, 0x1, Local0)
                    }
                    Else {
                        If(LLess(DMA0, 0x3c)) {
                            Divide(DMA0, 0xf, , Local1)
                        }
                        Else {
                            Divide(DMA0, 0x1e, , Local1)
                        }
                        Subtract(0x4, Local1, Local0)
                    }
                }
                If(And(Local4, 0x4, )) {
                    If(LLess(DMA1, 0x1e)) {
                        Or(A100, 0x2000, A100)
                        Or(Local0, 0x10, Local0)
                    }
                    Else {
                        If(LLess(DMA1, 0x3c)) {
                            Divide(DMA1, 0xf, , Local1)
                        }
                        Else {
                            Divide(DMA1, 0x1e, , Local1)
                        }
                        Subtract(0x4, Local1, Local1)
                        ShiftLeft(Local1, 0x4, Local1)
                        Or(Local0, Local1, Local0)
                    }
                }
                Store(Local0, UDT_)
                Store(0x0, Local0)
                If(LLess(DMA0, 0x3c)) {
                    Or(Local0, 0x1, Local0)
                }
                If(LLess(DMA1, 0x3c)) {
                    Or(Local0, 0x2, Local0)
                }
                Store(Local0, ICF_)
                Return(Local7)
            }
            Method(GTF0, 7) {
                Store(Buffer(0x7) {0x3, 0x0, 0x0, 0x0, 0x0, 0xa0, 0xef }, Local7)
                CreateByteField(Local7, 0x1, MODE)
                If(And(Arg2, 0x1, )) {
                    If(And(Arg6, 0x1, )) {
                        Store(0x45, MODE)
                    }
                    Else {
                        And(Arg3, 0x3, Local0)
                        If(And(Arg4, 0x1, )) {
                            Add(Local0, 0x2, Local0)
                        }
                        Or(Local0, 0x40, MODE)
                    }
                }
                Else {
                    Add(ShiftRight(And(Arg0, 0x0300, ), 0x8, ), ShiftRight(And(Arg0, 0x3000, ), 0xc, ), Local0)
                    If(LNot(LLess(Local0, 0x5))) {
                        Store(0x22, MODE)
                    }
                    Else {
                        If(LNot(LLess(Local0, 0x3))) {
                            Store(0x21, MODE)
                        }
                        Else {
                            Store(0x20, MODE)
                        }
                    }
                }
                Concatenate(Local7, Local7, Local6)
                If(LOr(And(Arg0, 0x8, ), LNot(And(Arg0, 0x1, )))) {
                    If(And(Arg0, 0x2, )) {
                        Store(0x0, MODE)
                    }
                    Else {
                        Store(0x8, MODE)
                    }
                }
                Else {
                    Add(ShiftRight(And(Arg0, 0x0300, ), 0x8, ), ShiftRight(And(Arg0, 0x3000, ), 0xc, ), Local0)
                    If(LNot(LLess(Local0, 0x5))) {
                        Store(0xc, MODE)
                    }
                    Else {
                        If(LNot(LLess(Local0, 0x3))) {
                            Store(0xb, MODE)
                        }
                        Else {
                            Store(0xa, MODE)
                        }
                    }
                }
                Concatenate(Local6, Local7, Local5)
                Return(Local5)
            }
            Name(B04_, Buffer(0x4) { })
            Name(B20_, Buffer(0x4) { })
            Name(B40_, Buffer(0x4) { })
            Device(PRIM) {
                Name(_ADR, 0x0)
                Name(_PSC, 0x0)
                Method(_PS0) {
                    Store(0x0, _PSC)
                }
                Method(_PS3) {
                    Store(0x3, _PSC)
                }
                Method(_GTM) {
                    Store(Buffer(0x14) {0x0 }, Local0)
                    Store(^^GTM_(^^ITM0, ^^SIT0, ^^UDC0, ^^UDT0, ^^ICF0, ^^FSCB), Local0)
                    Return(Local0)
                }
                Method(_STM, 3) {
                    Store(GTF_(0x0, Arg1, Arg0), ATA0)
                    Store(GTF_(0x1, Arg2, Arg0), ATA1)
                    Store(^^STMS(Arg0, Arg1, Arg2), Local0)
                    CreateDWordField(Local0, 0x0, ITM_)
                    CreateDWordField(Local0, 0x4, SIT_)
                    CreateDWordField(Local0, 0x8, UDC_)
                    CreateDWordField(Local0, 0xc, UDT_)
                    CreateDWordField(Local0, 0x10, ICF_)
                    Store(ITM_, ^^ITM0)
                    Store(SIT_, ^^SIT0)
                    Store(UDC_, ^^UDC0)
                    Store(UDT_, ^^UDT0)
                    CreateDWordField(Local0, 0x14, A100)
                    Or(And(^^CB80, 0xc, ), ShiftRight(And(0x30, A100, ), 0x4, ), ^^CB80)
                    Or(And(^^FSCB, 0xc, ), ShiftRight(And(0x3000, A100, ), 0xc, ), ^^FSCB)
                    Or(And(^^FATS, 0xc, ), ShiftRight(And(0x00300000, A100, ), 0x14, ), ^^FATS)
                    Store(ICF_, ^^ICF0)
                }
                Device(MAST) {
                    Name(_ADR, 0x0)
                    Name(H15F, Zero)
                    Method(_GTF) {
                        Return(RATA(ATA0))
                    }
                }
            }
            Device(SECN) {
                Name(_ADR, 0x1)
                Name(FAST, 0x63)
                Method(_STA) {
                    If(ESID) {
                        Return(0xf)
                    }
                    Else {
                        Return(0x8)
                    }
                }
                Name(_PSC, 0x0)
                Method(_PS0) {
                    Store(0x0, _PSC)
                }
                Method(_PS3) {
                    Store(0x3, _PSC)
                }
                Method(_GTM) {
                    Store(Buffer(0x14) {0x0 }, Local0)
                    Store(^^FSCB, Local1)
                    ShiftRight(Local1, 0x2, Local1)
                    Store(^^GTM_(^^ITM1, ^^SIT1, ^^UDC1, ^^UDT1, ^^ICF1, Local1), Local0)
                    Return(Local0)
                }
                Method(_STM, 3) {
                    Store(GTF_(0x0, Arg1, Arg0), ATA2)
                    Store(GTF_(0x1, Arg2, Arg0), ATA3)
                    Store(^^STMS(Arg0, Arg1, Arg2), Local0)
                    CreateDWordField(Local0, 0x0, ITM_)
                    CreateDWordField(Local0, 0x4, SIT_)
                    CreateDWordField(Local0, 0x8, UDC_)
                    CreateDWordField(Local0, 0xc, UDT_)
                    CreateDWordField(Local0, 0x10, ICF_)
                    Store(ITM_, ^^ITM1)
                    Store(SIT_, ^^SIT1)
                    Store(UDC_, ^^UDC1)
                    Store(UDT_, ^^UDT1)
                    CreateDWordField(Local0, 0x14, A100)
                    Or(And(^^CB80, 0x3, ), ShiftRight(And(0x30, A100, ), 0x2, ), ^^CB80)
                    Or(And(^^FSCB, 0x3, ), ShiftRight(And(0x3000, A100, ), 0xa, ), ^^FSCB)
                    Or(And(^^FATS, 0x3, ), ShiftRight(And(0x00300000, A100, ), 0x12, ), ^^FATS)
                    Store(ICF_, ^^ICF1)
                }
                Device(BAY1) {
                    Name(_ADR, 0x0)
                    Name(H15F, Zero)
                    Name(EJ0F, 0x0)
                    Method(_GTF) {
                        Return(RATA(ATA2))
                    }
                    Method(_STA) {
                        If(\_SB_.PCI0.IDE0.ESID) {
                            \_SB_.PCI0.IDE0.SECN.CBAY()
                            Store(^^BFLG, Local0)
                            If(LEqual(^^BNUM, 0x1)) {
                                If(And(Local0, 0x1, )) {
                                    If(\_SB_.PCI0.LPC0.LV37) {
                                        Return(0x8)
                                    }
                                    Else {
                                        Return(0xf)
                                    }
                                }
                            }
                            Else {
                                If(LEqual(^^BNUM, 0x2)) {
                                    If(\_SB_.PCI0.LPC0.LV37) {
                                        Return(0x8)
                                    }
                                    Else {
                                        Return(0xf)
                                    }
                                }
                                Else {
                                    Return(0x8)
                                }
                            }
                        }
                        Else {
                            Return(0x8)
                        }
                    }
                    Method(_EJ0, 1) {
                        If(Arg0) {
                            If(LGreater(\_SB_.PCI0.LPC0.MBTP, 0x1)) {
                                Sleep(0x32)
                            }
                            Else {
                                Store(0x1, ^^^SSIG)
                                Sleep(0x32)
                                Store(0xc000, ^^^ITM1)
                                Store(0x1, \_SB_.PCI0.LPC0.LV37)
                                Sleep(0xc8)
                                Store(0x0, \_SB_.PCI0.LPC0.LV39)
                                Sleep(0xc8)
                            }
                        }
                    }
                }
                Name(BNUM, 0x0)
                Name(BFLG, 0x0)
                Method(CBAY) {
                    Store(0x0, BNUM)
                    Store(0x0, BFLG)
                    Store(\_SB_.PCI0.LPC0.RBID, Local0)
                    If(Or(LEqual(Local0, 0x1), LEqual(Local0, 0x2), )) {
                        Increment(BNUM)
                        Or(BFLG, 0x1, BFLG)
                    }
                }
            }
            Method(_PS0) {
                If(And(LEqual(_PSC, 0x3), LEqual(\_SB_.STAT, 0x3), )) {
                    Store(0x89, \_SB_.PCI0.LPC0.BCMD)
                    Store(0x0, \_SB_.PCI0.LPC0.SMIC)
                    Store(0xb0, P80H)
                }
                Store(0x0, _PSC)
            }
            Method(_PS3) {
                Store(0x3, _PSC)
                Store(0xb3, P80H)
            }
            Name(_PSC, 0x0)
        }
        Device(USB1) {
            Name(_ADR, 0x001d0000)
            OperationRegion(USBO, PCI_Config, 0xc4, 0x4)
            Field(USBO, ByteAcc, NoLock, Preserve) {
                RSEN,	2
            }
            Name(_PRW, Package(0x2) {
                0x3,
                0x3,
            })
            Method(_PSW, 1) {
                If(Arg0) {
                    Store(0x3, \_SB_.PCI0.USB1.RSEN)
                }
                Else {
                    Store(0x0, \_SB_.PCI0.USB1.RSEN)
                }
            }
        }
        Device(USB2) {
            Name(_ADR, 0x001d0001)
            OperationRegion(USBO, PCI_Config, 0xc4, 0x4)
            Field(USBO, ByteAcc, NoLock, Preserve) {
                RSEN,	2
            }
            Name(_PRW, Package(0x2) {
                0x4,
                0x3,
            })
            Method(_PSW, 1) {
                If(Arg0) {
                    Store(0x3, \_SB_.PCI0.USB2.RSEN)
                }
                Else {
                    Store(0x0, \_SB_.PCI0.USB2.RSEN)
                }
            }
        }
        Device(USB3) {
            Name(_ADR, 0x001d0002)
            OperationRegion(USBO, PCI_Config, 0xc4, 0x4)
            Field(USBO, ByteAcc, NoLock, Preserve) {
                RSEN,	2
            }
            Name(_PRW, Package(0x2) {
                0xc,
                0x3,
            })
            Method(_PSW, 1) {
                If(Arg0) {
                    Store(0x3, \_SB_.PCI0.USB3.RSEN)
                }
                Else {
                    Store(0x0, \_SB_.PCI0.USB3.RSEN)
                }
            }
        }
    }
    Device(LID_) {
        Name(_HID, 0x0d0cd041)
        Name(LSTS, 0x0)
        Method(_LID) {
            If(\_SB_.OKEC) {
                If(\_SB_.PCI0.LPC0.EC0_.LIDS) {
                    Store(Zero, LSTS)
                }
                Else {
                    Store(One, LSTS)
                }
            }
            Else {
                Store(Zero, LSTS)
            }
            Return(LSTS)
        }
    }
    Scope(\_TZ_) {
        Name(TPL_, 0x0ca0)
        Name(TAC1, 0x0d0e)
        Name(TAC0, 0x0d54)
        Name(TPAS, 0x0e44)
        Name(TPC_, 0x0e94)
        Name(TPTM, 0x0c3c)
        Name(TBSE, 0x0aac)
        Name(LTMP, 0x0ca0)
        Name(TVAR, Buffer(0x5) {0x0, 0x20, 0x1f, 0xc, 0x1f })
        CreateByteField(TVAR, 0x0, PLCY)
        CreateWordField(TVAR, 0x1, CTOS)
        CreateWordField(TVAR, 0x3, CTHY)
        Device(FAN0) {
            Name(_HID, 0x0b0cd041)
            Name(_UID, 0x1)
            Name(_PR0, Package(0x1) {
                PFN0,
            })
            Method(_PS0) {
                Store("Low Speed FAN - _PS0", Debug)
            }
            Method(_PS3) {
                Store("Low Speed FAN - _PS3", Debug)
            }
        }
        PowerResource(PFN0, 0, 0) {
            Name(FNS1, 0x0)
            Name(FFST, 0x1)
            Method(_STA) {
                Store(FNS1, Local1)
                Return(Local1)
            }
            Method(_ON_) {
                Store(0x1, FNS1)
                If(\_TZ_.PFN1.FNS2) {
                    Store("FAN 1 (High speed already turn on) ", Debug)
                }
                Else {
                    If(\_SB_.OKEC) {
                        Store(0xb4, \_SB_.PCI0.LPC0.EC0_.FSPD)
                        Store(0x1, \_SB_.PCI0.LPC0.EC0_.FPR1)
                    }
                }
                If(Or(LEqual(\_SB_.PCI0.MYOS, 0x1), LEqual(\_SB_.PCI0.MYOS, 0x3), )) {
                    \_TZ_.THRM._SCP(0x1)
                }
            }
            Method(_OFF) {
                Store(0x0, FNS1)
                If(LEqual(SizeOf(\_OS_), 0x14)) {
                    If(\_SB_.OKEC) {
                        If(\_TZ_.PFN1.FNS2) {
                            Store(One, \_SB_.PCI0.LPC0.EC0_.FPR1)
                        }
                        Else {
                            Store(Zero, \_SB_.PCI0.LPC0.EC0_.FPR1)
                        }
                    }
                }
                Else {
                    If(LLess(FFST, 0x2)) {
                        Store(0x86, \_SB_.PCI0.LPC0.BCMD)
                        Store(0x0, \_SB_.PCI0.LPC0.SMIC)
                        Increment(FFST)
                    }
                    Else {
                        If(\_SB_.OKEC) {
                            Store(0x0, \_SB_.PCI0.LPC0.EC0_.FPR1)
                        }
                    }
                }
                If(Or(LEqual(\_SB_.PCI0.MYOS, 0x1), LEqual(\_SB_.PCI0.MYOS, 0x3), )) {
                    \_TZ_.THRM._SCP(0x1)
                }
            }
        }
        Device(FAN1) {
            Name(_HID, 0x0b0cd041)
            Name(_UID, 0x2)
            Name(_PR0, Package(0x2) {
                PFN0,
                PFN1,
            })
            Method(_PS0) {
                Store("High Speed FAN - _PS0", Debug)
            }
            Method(_PS3) {
                Store("High Speed FAN - _PS3", Debug)
            }
        }
        PowerResource(PFN1, 0, 0) {
            Name(FNS2, 0x0)
            Method(_STA) {
                Return(FNS2)
            }
            Method(_ON_) {
                Store(0x1, FNS2)
                If(\_SB_.OKEC) {
                    Store(0xff, \_SB_.PCI0.LPC0.EC0_.FSPD)
                    Store(0x1, \_SB_.PCI0.LPC0.EC0_.FPR1)
                }
                If(Or(LEqual(\_SB_.PCI0.MYOS, 0x1), LEqual(\_SB_.PCI0.MYOS, 0x3), )) {
                    \_TZ_.THRM._SCP(0x1)
                }
            }
            Method(_OFF) {
                Store(Zero, FNS2)
                Store(0x0, FNS2)
                If(\_TZ_.PFN0.FNS1) {
                    If(\_SB_.OKEC) {
                        Store(0xb4, \_SB_.PCI0.LPC0.EC0_.FSPD)
                        Store(0x1, \_SB_.PCI0.LPC0.EC0_.FPR1)
                    }
                }
                Else {
                    If(\_SB_.OKEC) {
                        Store(0x0, \_SB_.PCI0.LPC0.EC0_.FPR1)
                    }
                }
                If(Or(LEqual(\_SB_.PCI0.MYOS, 0x1), LEqual(\_SB_.PCI0.MYOS, 0x3), )) {
                    \_TZ_.THRM._SCP(0x1)
                }
            }
        }
        ThermalZone(THRM) {
            Name(_AL0, Package(0x1) {
                FAN1,
            })
            Method(_AC0) {
                Return(TAC0)
            }
            Name(_AL1, Package(0x1) {
                FAN0,
            })
            Method(_AC1) {
                Return(TAC1)
            }
            Method(_CRT) {
                Return(TPC_)
            }
            Method(_PSV) {
                Return(TPAS)
            }
            Name(_TSP, 0x64)
            Method(_TMP) {
                If(\_SB_.OKEC) {
                    Store(\_SB_.PCI0.LPC0.EC0_.CTMP, Local1)
                    Store("Dothan B1 CPU temperature offset value = ", Debug)
                    Store(DOFF, Debug)
                    Store(Local1, Debug)
                    Store("Current Temperature is ----------- ", Debug)
                    Store(Local1, Debug)
                    Add(Multiply(Local1, 0xa, ), TBSE, Local1)
                }
                Else {
                    Store(LTMP, Local1)
                }
                Return(Local1)
            }
            Name(_PSL, Package(0x1) {
                \_PR_.CPU0,
            })
            Name(_TC1, 0x2)
            Name(_TC2, 0x3)
            Method(_SCP, 1) {
                Store(Zero, PLCY)
                If(\_TZ_.PFN0.FNS1) {
                    If(LEqual(\_TZ_.PFN1.FNS2, 0x0)) {
                        Store(0x0d22, TAC1)
                        Store(0x0d86, TAC0)
                    }
                    Else {
                        Store(0x0d22, TAC1)
                        Store(0x0d40, TAC0)
                    }
                }
                Else {
                    If(\_TZ_.PFN1.FNS2) {
                        Store(0x0d22, TAC1)
                        Store(0x0d40, TAC0)
                    }
                    Else {
                        Store(0x0d40, TAC1)
                        Store(0x0d86, TAC0)
                    }
                }
                Store(0x0e44, TPAS)
                Notify(\_TZ_.THRM, 0x81)
            }
        }
    }
    Device(SLPB) {
        Name(_HID, 0x0e0cd041)
    }
    OperationRegion(EXCO, SystemIO, 0x72, 0x2)
    Field(EXCO, ByteAcc, NoLock, Preserve) {
        INDX,	8,
        DATA,	8
    }
    IndexField(INDX, DATA, ByteAcc, NoLock, Preserve) {
        Offset(0x20),
        ACST,	1,
        ECOK,	1,
        WLES,	1,
        BTES,	1,
        W2KF,	2,
        S4WP,	1,
        FLA7,	1,
        LSFG,	1,
        LD10,	1,
        PS2M,	1,
        DISD,	3,
        OVRL,	1,
        Offset(0x22),
        SLEE,	8,
        BPFG,	8,
        PWST,	8,
        DATS,	8,
        CM26,	8,
        CM27,	8,
        CM28,	16,
        CM2A,	16,
        F4FG,	1,
        Offset(0x30),
        CM30,	8,
        CM31,	8,
        CM32,	8
    }
}

}
/*
HPET: Length=56, Revision=1, Checksum=6,
	OEMID=ACER, OEM Table ID=Kestrel, OEM Revision=0x20020909,
	Creator ID=PTL, Creator Revision=0x0
 */
/*
BOOT: Length=40, Revision=1, Checksum=210,
	OEMID=ACER, OEM Table ID=Kestrel, OEM Revision=0x20020909,
	Creator ID= LTP, Creator Revision=0x1
 */
