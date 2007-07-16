/*
RSD PTR: Checksum=177, OEMID=OID_00, RsdtAddress=0x0effa8e0
 */
/*
RSDT: Length=56, Revision=1, Checksum=59,
	OEMID=INSYDE, OEM Table ID=RSDT_000, OEM Revision=0x1,
	Creator ID=_CSI, Creator Revision=0x10101
 */
/*
	Entries={ 0x0efffaa0, 0x0efffb90, 0x0efffbc0, 0x0efffb30, 0x0effa920 }
 */
/*
	DSDT=0xeffad60
	INT_MODEL=PIC
	SCI_INT=9
	SMI_CMD=0xb2, ACPI_ENABLE=0xe0, ACPI_DISABLE=0xe1, S4BIOS_REQ=0xe2
	PM1a_EVT_BLK=0x1000-0x1003
	PM1a_CNT_BLK=0x1004-0x1005
	PM2_CNT_BLK=0x1020-0x1020
	PM2_TMR_BLK=0x1008-0x100b
	PM2_GPE0_BLK=0x1028-0x102f
	P_LVL2_LAT=1ms, P_LVL3_LAT=133ms
	FLUSH_SIZE=0, FLUSH_STRIDE=0
	DUTY_OFFSET=1, DUTY_WIDTH=3
	DAY_ALRM=13, MON_ALRM=0, CENTURY=50
	Flags={WBINVD,PROC_C1,SLP_BUTTON,RTC_S4}
 */
/*
DSDT: Length=19765, Revision=1, Checksum=37,
	OEMID=ACER, OEM Table ID=TM4050, OEM Revision=0x6,
	Creator ID=MSFT, Creator Revision=0x100000e
 */
DefinitionBlock (
	"acpi_dsdt.aml",	//Output filename
	"DSDT",		//Signature
	0x1,			//DSDT Revision
	"ACER",			//OEMID
	"TM4050",			//TABLE ID
	0x6			//OEM Revision
)

{
OperationRegion(MNVS, SystemMemory, 0x0efffc00, 0x0150)
Field(MNVS, AnyAcc, Lock, Preserve) {
    OSYS,	16,
    CMAP,	8,
    BAYS,	8,
    FDCP,	8,
    LPTP,	8,
    BTEN,	8,
    IGDS,	8,
    LCDA,	16,
    TLST,	8,
    CADL,	16,
    PADL,	16,
    CSTE,	16,
    NSTE,	16,
    SSTE,	16,
    BRAD,	8,
    Offset(0x130),
    ,	7,
    CPUC,	1
}
Scope(\_PR_) {
    Processor(CPU0, 0, 0x1010, 0x6) {
        Method(_CST) {
            If(CPUC) {
                Return(Package(0x4) {
                    0x3,
                    Package(0x4) {
                        Buffer(0x11) {0x82, 0xc, 0x0, 0x7f, 0x8, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 },
                        0x1,
                        0x1,
                        0x03e8,
                    },
                    Package(0x4) {
                        Buffer(0x11) {0x82, 0xc, 0x0, 0x1, 0x8, 0x0, 0x0, 0x14, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 },
                        0x2,
                        0x1,
                        0x01f4,
                    },
                    Package(0x4) {
                        Buffer(0x11) {0x82, 0xc, 0x0, 0x1, 0x8, 0x0, 0x0, 0x15, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 },
                        0x3,
                        0x55,
                        0xfa,
                    },
                })
            }
            Else {
                Return(Package(0x5) {
                    0x4,
                    Package(0x4) {
                        Buffer(0x11) {0x82, 0xc, 0x0, 0x7f, 0x8, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 },
                        0x1,
                        0x1,
                        0x03e8,
                    },
                    Package(0x4) {
                        Buffer(0x11) {0x82, 0xc, 0x0, 0x1, 0x8, 0x0, 0x0, 0x14, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 },
                        0x2,
                        0x1,
                        0x01f4,
                    },
                    Package(0x4) {
                        Buffer(0x11) {0x82, 0xc, 0x0, 0x1, 0x8, 0x0, 0x0, 0x15, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 },
                        0x3,
                        0x55,
                        0xfa,
                    },
                    Package(0x4) {
                        Buffer(0x11) {0x82, 0xc, 0x0, 0x1, 0x8, 0x0, 0x0, 0x16, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x79, 0x0 },
                        0x3,
                        0xb9,
                        0x64,
                    },
                })
            }
        }
    }
}
Name(_S0_, Package(0x2) {
    0x0,
    0x0,
})
Name(_S1_, Package(0x2) {
    0x2,
    0x2,
})
Name(_S3_, Package(0x2) {
    0x5,
    0x5,
})
Name(_S4_, Package(0x2) {
    0x6,
    0x6,
})
Name(_S5_, Package(0x2) {
    0x7,
    0x7,
})
OperationRegion(PORT, SystemIO, 0x80, 0x1)
Field(PORT, ByteAcc, NoLock, Preserve) {
    P80H,	8
}
Name(ECDY, 0x3)
Name(OSTP, 0x0)
Name(\GPIC, 0x0)
Name(ACPS, 0x0)
Name(\DSEN, 0x1)
Name(BATN, 0x1)
Method(\_PIC, 1) {
    Store(Arg0, GPIC)
}
Method(_PTS, 1) {
    If(LEqual(Arg0, 0x3)) {
        \_SB_.PCI0.LPC0.PHSS(0x80)
        \_SB_.PCI0.LPC0.PHSS(0x84)
    }
    If(LEqual(Arg0, 0x4)) {
        \_SB_.PCI0.LPC0.PHSS(0xe)
    }
}
Method(_WAK, 1) {
    Store(0x1, BATN)
    If(LEqual(Arg0, 0x3)) {
        \_SB_.PCI0.LPC0.PHSS(0x85)
        \_SB_.PCI0.LPC0.PHSS(0x86)
    }
    If(LEqual(Arg0, 0x4)) {
        Notify(\_SB_.PWRB, 0x2)
        \_SB_.PCI0.LPC0.PHSS(0xf)
    }
}
Method(MIN_, 2) {
    If(LLess(Arg0, Arg1)) {
        Return(Arg0)
    }
    Else {
        Return(Arg1)
    }
}
Method(SLEN, 1) {
    Return(SizeOf(Arg0))
}
Method(S2BF, 1, Serialized) {
    Add(SLEN(Arg0), One, Local0)
    Name(BUFF, Buffer(Local0) { })
    Store(Arg0, BUFF)
    Return(BUFF)
}
Method(SCMP, 2) {
    Store(S2BF(Arg0), Local0)
    Store(S2BF(Arg1), Local1)
    Store(Zero, Local4)
    Store(SLEN(Arg0), Local5)
    Store(SLEN(Arg1), Local6)
    Store(MIN_(Local5, Local6), Local7)
    While(LLess(Local4, Local7)) {
        Store(DerefOf(Index(Local0, Local4, )), Local2)
        Store(DerefOf(Index(Local1, Local4, )), Local3)
        If(LGreater(Local2, Local3)) {
            Return(One)
        }
        Else {
            If(LLess(Local2, Local3)) {
                Return(Ones)
            }
        }
        Increment(Local4)
    }
    If(LLess(Local4, Local5)) {
        Return(One)
    }
    Else {
        If(LLess(Local4, Local6)) {
            Return(Ones)
        }
        Else {
            Return(Zero)
        }
    }
}
Scope(_GPE) {
    Method(_L03) {
        Notify(\_SB_.PCI0.USB1, 0x2)
    }
    Method(_L04) {
        Notify(\_SB_.PCI0.USB2, 0x2)
    }
    Method(_L05) {
        Notify(\_SB_.PCI0.MODM, 0x2)
    }
    Method(_L08) {
        Notify(\_SB_.PCI0.HUB_, 0x2)
    }
    Method(_L0B) {
        Notify(\_SB_.PCI0.HUB_, 0x2)
    }
    Method(_L0C) {
        Notify(\_SB_.PCI0.USB3, 0x2)
    }
    Method(_L0D) {
        Notify(\_SB_.PCI0.EUSB, 0x2)
    }
    Method(_L1D) {
        Not(\_SB_.PCI0.LPC0.LPOL, \_SB_.PCI0.LPC0.LPOL)
        Notify(\_SB_.LID_, 0x80)
    }
}
Scope(\_SB_) {
    Device(LID_) {
        Name(_HID, 0x0d0cd041)
        Method(_LID) {
            Return(\_SB_.PCI0.LPC0.LPOL)
        }
    }
    Device(PWRB) {
        Name(_HID, 0x0c0cd041)
    }
    Device(SLPB) {
        Name(_HID, 0x0e0cd041)
    }
    Device(PCI0) {
        Name(_HID, 0x030ad041)
        Name(_BBN, 0x0)
        Name(_ADR, 0x0)
        Method(_INI) {
            Store(0x1, BATN)
            If(CondRefOf(\_OSI, Local0)) {
                If(\_OSI) {
                    "Windows 2001"
                    Store(0x3, OSTP)
                }
            }
            Else {
                If(LEqual(SCMP(\_OS_, "Microsoft Windows NT"), Zero)) {
                    Store(0x1, OSTP)
                }
                If(LEqual(SCMP(\_OS_, "Microsoft Windows"), Zero)) {
                    Store(0x0, OSTP)
                    Store(0x0, ECDY)
                }
                If(LEqual(SCMP(\_OS_, "Microsoft WindowsME: Millennium Edition"), Zero)) {
                    Store(0x2, OSTP)
                }
            }
        }
        Method(_S1D) {
            Return(0x2)
        }
        Method(_S3D) {
            Return(0x2)
        }
        Method(_S4D) {
            Return(0x2)
        }
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
            ShiftRight(And(\_SB_.PCI0.LPC0.HPTE, 0x00038000, ), 0xf, Local0)
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
            If(GPIC) {
                Return(Package(0x7) {
                    Package(0x4) {
                        0x0002ffff,
                        0x0,
                        0x0,
                        0x10,
                    },
                    Package(0x4) {
                        0x001dffff,
                        0x0,
                        0x0,
                        0x10,
                    },
                    Package(0x4) {
                        0x001dffff,
                        0x1,
                        0x0,
                        0x13,
                    },
                    Package(0x4) {
                        0x001dffff,
                        0x2,
                        0x0,
                        0x12,
                    },
                    Package(0x4) {
                        0x001dffff,
                        0x3,
                        0x0,
                        0x17,
                    },
                    Package(0x4) {
                        0x001fffff,
                        0x0,
                        0x0,
                        0x12,
                    },
                    Package(0x4) {
                        0x001fffff,
                        0x1,
                        0x0,
                        0x11,
                    },
                })
            }
            Else {
                Return(Package(0x7) {
                    Package(0x4) {
                        0x0002ffff,
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
        Device(AGPB) {
            Name(_ADR, 0x00010000)
            Method(_PRT) {
                If(GPIC) {
                    Return(Package(0x2) {
                        Package(0x4) {
                            0xffff,
                            0x0,
                            0x0,
                            0x10,
                        },
                        Package(0x4) {
                            0xffff,
                            0x1,
                            0x0,
                            0x11,
                        },
                    })
                }
                Else {
                    Return(Package(0x2) {
                        Package(0x4) {
                            0xffff,
                            0x0,
                            \_SB_.PCI0.LPC0.LNKA,
                            0x0,
                        },
                        Package(0x4) {
                            0xffff,
                            0x1,
                            \_SB_.PCI0.LPC0.LNKB,
                            0x0,
                        },
                    })
                }
            }
        }
        Device(GFX0) {
            Name(_ADR, 0x00020000)
            OperationRegion(VNVS, SystemMemory, 0xffff0000, 0xffffc000)
            Field(VNVS, AnyAcc, Lock, Preserve) {
                RSIZ,	32,
                RBUF,	524288
            }
            Method(_DOS, 1) {
                Store(And(Arg0, 0x3, ), DSEN)
            }
            Method(_DOD) {
                Return(Package(0x2) {
                    0x00010100,
                    0x00010110,
                })
            }
            Method(_ROM, 2) {
                Store(Arg0, Local0)
                Store(Arg1, Local1)
                If(LGreater(Local1, 0x1000)) {
                    Store(0x1000, Local1)
                }
                If(LGreater(Add(Local0, Local1, ), RSIZ)) {
                    Store(0x0, Local0)
                }
                Multiply(Local0, 0x8, Local2)
                Multiply(Local1, 0x8, Local3)
                Name(ROM1, Buffer(RSIZ) { })
                Name(ROM2, Buffer(Local1) { })
                Store(RBUF, ROM1)
                CreateField(ROM1, Local2, Local3, TMPB)
                Store(TMPB, ROM2)
                Return(ROM2)
            }
            Device(CRT1) {
                Name(_ADR, 0x0100)
                Method(_DCS) {
                    \_SB_.PCI0.LPC0.PHSS(0xc)
                    If(And(CSTE, 0x0101, )) {
                        Return(0x1f)
                    }
                    Return(0x1d)
                }
                Method(_DGS) {
                    If(And(NSTE, 0x0101, )) {
                        Return(0x1)
                    }
                    Return(0x0)
                }
                Method(_DSS, 1) {
                    If(LEqual(And(Arg0, 0xc0000000, ), 0xc0000000)) {
                        Store(NSTE, CSTE)
                    }
                }
            }
            Device(LCD_) {
                Method(_ADR) {
                    Return(0x0110)
                }
                Method(_DCS) {
                    \_SB_.PCI0.LPC0.PHSS(0xc)
                    If(And(CSTE, 0x0808, )) {
                        Return(0x1f)
                    }
                    Return(0x1d)
                }
                Method(_DGS) {
                    If(And(NSTE, 0x0808, )) {
                        Return(0x1)
                    }
                    Return(0x0)
                }
                Method(_DSS, 1) {
                    If(LEqual(And(Arg0, 0xc0000000, ), 0xc0000000)) {
                        Store(NSTE, CSTE)
                    }
                }
                Method(_BCL) {
                    Return(Package(0x8) {
                        0x50,
                        0x3c,
                        0x0,
                        0x14,
                        0x28,
                        0x3c,
                        0x50,
                        0x64,
                    })
                }
                Method(_BCM, 1) {
                    Store(Arg0, P80H)
                }
            }
            Method(DSSW) {
                \_SB_.PCI0.LPC0.PHSS(0xc)
                If(LEqual(CADL, 0xa)) {
                    If(LEqual(CSTE, 0x2)) {
                        Store(0x0a00, NSTE)
                    }
                }
                If(LEqual(CADL, 0xb)) {
                    If(LEqual(CSTE, 0x0800)) {
                        Store(0x1, NSTE)
                    }
                    If(LEqual(CSTE, 0x1)) {
                        Store(0x0801, NSTE)
                    }
                    If(LEqual(CSTE, 0x8001)) {
                        Store(0x0800, NSTE)
                    }
                }
                DSSM()
            }
            Method(DSSC) {
                Store(0x1, CSTE)
                Store(0x1, NSTE)
                DSSM()
            }
            Method(DSSL) {
                Store(0x0800, CSTE)
                Store(0x0800, NSTE)
                DSSM()
            }
            Method(DSSB) {
                Store(0x0801, CSTE)
                Store(0x0801, NSTE)
                DSSM()
            }
            Method(DSSM) {
                If(LEqual(0x0, DSEN)) {
                    Store(CADL, PADL)
                    If(LEqual(OSTP, 0x3)) {
                        Notify(\_SB_.PCI0, 0x0)
                    }
                    Else {
                        Notify(\_SB_.PCI0.GFX0, 0x0)
                    }
                    Sleep(0x03e8)
                    Notify(\_SB_.PCI0.GFX0, 0x80)
                }
                If(LEqual(0x1, DSEN)) {
                    \_SB_.PCI0.LPC0.PHSS(0x1)
                    Notify(\_SB_.PCI0.GFX0, 0x81)
                }
            }
            Method(STBL, 1) {
                If(LEqual(And(Arg0, 0x7, ), 0x0)) {
                    Store(0x0800, NSTE)
                }
                Else {
                    If(LEqual(Arg0, 0x1)) {
                        Store(0x0800, NSTE)
                    }
                    If(LEqual(Arg0, 0x2)) {
                        Store(0x1, NSTE)
                    }
                    If(LEqual(Arg0, 0x3)) {
                        Store(0x0801, NSTE)
                    }
                    If(LEqual(Arg0, 0x4)) {
                        Store(0x2, NSTE)
                    }
                    If(LEqual(Arg0, 0x5)) {
                        Store(0x0802, NSTE)
                    }
                    If(LEqual(Arg0, 0x6)) {
                        Store(0x3, NSTE)
                    }
                    If(LEqual(Arg0, 0x7)) {
                        Store(0x0803, NSTE)
                    }
                }
                DSSM()
            }
        }
        Device(HUB_) {
            Name(_ADR, 0x001e0000)
            Method(_PRT) {
                If(GPIC) {
                    Return(Package(0x4) {
                        Package(0x4) {
                            0xffff,
                            0x0,
                            0x0,
                            0x14,
                        },
                        Package(0x4) {
                            0x0001ffff,
                            0x0,
                            0x0,
                            0x15,
                        },
                        Package(0x4) {
                            0x0002ffff,
                            0x0,
                            0x0,
                            0x16,
                        },
                        Package(0x4) {
                            0x0004ffff,
                            0x0,
                            0x0,
                            0x10,
                        },
                    })
                }
                Else {
                    Return(Package(0x4) {
                        Package(0x4) {
                            0xffff,
                            0x0,
                            \_SB_.PCI0.LPC0.LNKE,
                            0x0,
                        },
                        Package(0x4) {
                            0x0001ffff,
                            0x0,
                            \_SB_.PCI0.LPC0.LNKF,
                            0x0,
                        },
                        Package(0x4) {
                            0x0002ffff,
                            0x0,
                            \_SB_.PCI0.LPC0.LNKG,
                            0x0,
                        },
                        Package(0x4) {
                            0x0004ffff,
                            0x0,
                            \_SB_.PCI0.LPC0.LNKA,
                            0x0,
                        },
                    })
                }
            }
            Device(ELAN) {
                Name(_ADR, 0x00010000)
                Method(_STA) {
                    Return(0xf)
                }
                Name(_PRW, Package(0x2) {
                    0x8,
                    0x4,
                })
            }
        }
        Device(LPC0) {
            Name(_ADR, 0x001f0000)
            Name(DVEN, 0x0)
            OperationRegion(REGS, PCI_Config, 0x40, 0xc0)
            Field(REGS, DWordAcc, Lock, Preserve) {
                PMBA,	16,
                Offset(0x18),
                GPBA,	16,
                Offset(0xb0),
                ,	5,
                FUND,	2
            }
            Method(DECD, 4, Serialized) {
                Store(Arg0, Debug)
            }
            Device(MBRD) {
                Name(_HID, 0x020cd041)
                Name(_UID, 0x1f)
                Name(RSRC, Buffer(0xd2) {0x47, 0x1, 0x10, 0x0, 0x10, 0x0, 0x1, 0x10, 0x47, 0x1, 0x24, 0x0, 0x24, 0x0, 0x1, 0x2, 0x47, 0x1, 0x28, 0x0, 0x28, 0x0, 0x1, 0x2, 0x47, 0x1, 0x2c, 0x0, 0x2c, 0x0, 0x1, 0x2, 0x47, 0x1, 0x30, 0x0, 0x30, 0x0, 0x1, 0x2, 0x47, 0x1, 0x34, 0x0, 0x34, 0x0, 0x1, 0x2, 0x47, 0x1, 0x38, 0x0, 0x38, 0x0, 0x1, 0x2, 0x47, 0x1, 0x3c, 0x0, 0x3c, 0x0, 0x1, 0x2, 0x47, 0x1, 0x50, 0x0, 0x50, 0x0, 0x1, 0x4, 0x47, 0x1, 0x72, 0x0, 0x72, 0x0, 0x1, 0x6, 0x47, 0x1, 0x80, 0x0, 0x80, 0x0, 0x1, 0x1, 0x47, 0x1, 0x90, 0x0, 0x90, 0x0, 0x1, 0x10, 0x47, 0x1, 0xa4, 0x0, 0xa4, 0x0, 0x1, 0x2, 0x47, 0x1, 0xa8, 0x0, 0xa8, 0x0, 0x1, 0x2, 0x47, 0x1, 0xac, 0x0, 0xac, 0x0, 0x1, 0x2, 0x47, 0x1, 0xb0, 0x0, 0xb0, 0x0, 0x1, 0x6, 0x47, 0x1, 0xb8, 0x0, 0xb8, 0x0, 0x1, 0x2, 0x47, 0x1, 0xbc, 0x0, 0xbc, 0x0, 0x1, 0x2, 0x47, 0x1, 0x0, 0x10, 0x0, 0x10, 0x1, 0x80, 0x47, 0x1, 0x0, 0x13, 0x0, 0x13, 0x1, 0x40, 0x47, 0x1, 0x2e, 0x0, 0x2e, 0x0, 0x1, 0x2, 0x47, 0x1, 0x4c, 0x0, 0x4c, 0x0, 0x1, 0x4, 0x47, 0x1, 0x0, 0x2, 0x0, 0x2, 0x1, 0x10, 0x47, 0x1, 0xd0, 0x4, 0xd0, 0x4, 0x1, 0x2, 0x47, 0x1, 0x0, 0xfe, 0x0, 0xfe, 0x1, 0x1, 0x47, 0x1, 0x2c, 0xff, 0x2c, 0xff, 0x1, 0x4, 0x79, 0x0 })
                Method(_CRS) {
                    CreateWordField(RSRC, 0x92, PMMN)
                    CreateWordField(RSRC, 0x94, PMMX)
                    And(^^PMBA, 0xff80, PMMN)
                    Store(PMMN, PMMX)
                    CreateWordField(RSRC, 0x9a, GPMN)
                    CreateWordField(RSRC, 0x9c, GPMX)
                    And(^^GPBA, 0xff80, GPMN)
                    Store(GPMN, GPMX)
                    Return(RSRC)
                }
            }
            Device(DMAC) {
                Name(_HID, 0x0002d041)
                Name(_CRS, Buffer(0x1d) {0x47, 0x1, 0x0, 0x0, 0x0, 0x0, 0x1, 0x10, 0x47, 0x1, 0x81, 0x0, 0x81, 0x0, 0x1, 0xf, 0x47, 0x1, 0xc0, 0x0, 0xc0, 0x0, 0x1, 0x20, 0x2a, 0x10, 0x2, 0x79, 0x0 })
            }
            Device(MATH) {
                Name(_HID, 0x040cd041)
                Name(_CRS, Buffer(0xe) {0x47, 0x1, 0xf0, 0x0, 0xf0, 0x0, 0x1, 0xf, 0x23, 0x0, 0x20, 0x1, 0x79, 0x0 })
            }
            Device(PIC_) {
                Name(_HID, 0xd041)
                Name(_CRS, Buffer(0x16) {0x47, 0x1, 0x20, 0x0, 0x20, 0x0, 0x1, 0x2, 0x47, 0x1, 0xa0, 0x0, 0xa0, 0x0, 0x1, 0x2, 0x23, 0x4, 0x0, 0x1, 0x79, 0x0 })
            }
            Device(RTC_) {
                Name(_HID, 0x000bd041)
                Name(_CRS, Buffer(0xe) {0x47, 0x1, 0x70, 0x0, 0x70, 0x0, 0x1, 0x2, 0x23, 0x0, 0x1, 0x1, 0x79, 0x0 })
            }
            Device(SPKR) {
                Name(_HID, 0x0008d041)
                Name(_CRS, Buffer(0xa) {0x47, 0x1, 0x61, 0x0, 0x61, 0x0, 0x1, 0x1, 0x79, 0x0 })
            }
            Device(TIME) {
                Name(_HID, 0x0001d041)
                Name(_CRS, Buffer(0xe) {0x47, 0x1, 0x40, 0x0, 0x40, 0x0, 0x1, 0x4, 0x23, 0x1, 0x0, 0x1, 0x79, 0x0 })
            }
            Device(KBC0) {
                Name(_HID, 0x0303d041)
                Name(_CRS, Buffer(0x16) {0x47, 0x1, 0x60, 0x0, 0x60, 0x0, 0x1, 0x1, 0x47, 0x1, 0x64, 0x0, 0x64, 0x0, 0x1, 0x1, 0x23, 0x2, 0x0, 0x1, 0x79, 0x0 })
            }
            Device(MSE0) {
                Name(_HID, 0x02072e4f)
                Name(_CID, Package(0x2) {
                    0x00072e4f,
                    0x130fd041,
                })
                Name(_CRS, Buffer(0x6) {0x23, 0x0, 0x10, 0x1, 0x79, 0x0 })
            }
            Device(LNKA) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x1)
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Name(RSRC, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                Method(_DIS) {
                    Or(PIRA, 0x80, PIRA)
                }
                Method(_CRS) {
                    CreateWordField(RSRC, 0x1, IRQ0)
                    And(PIRA, 0xf, Local0)
                    ShiftLeft(0x1, Local0, IRQ0)
                    Store(RSRC, Debug)
                    Return(RSRC)
                }
                Method(_SRS, 1) {
                    Store(Arg0, Debug)
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Or(Local0, And(PIRA, 0x70, ), PIRA)
                }
                Method(_STA) {
                    If(And(PIRA, 0x80, )) {
                        Return(0x9)
                    }
                    Return(0xb)
                }
            }
            Device(LNKB) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x2)
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Name(RSRC, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                Method(_DIS) {
                    Or(PIRB, 0x80, PIRB)
                }
                Method(_CRS) {
                    CreateWordField(RSRC, 0x1, IRQ0)
                    And(PIRB, 0xf, Local0)
                    ShiftLeft(0x1, Local0, IRQ0)
                    Return(RSRC)
                }
                Method(_SRS, 1) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Or(Local0, And(PIRB, 0x70, ), PIRB)
                }
                Method(_STA) {
                    If(And(PIRB, 0x80, )) {
                        Return(0x9)
                    }
                    Return(0xb)
                }
            }
            Device(LNKC) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x3)
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Name(RSRC, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                Method(_DIS) {
                    Or(PIRC, 0x80, PIRC)
                }
                Method(_CRS) {
                    CreateWordField(RSRC, 0x1, IRQ0)
                    And(PIRC, 0xf, Local0)
                    ShiftLeft(0x1, Local0, IRQ0)
                    Return(RSRC)
                }
                Method(_SRS, 1) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Or(Local0, And(PIRC, 0x70, ), PIRC)
                }
                Method(_STA) {
                    If(And(PIRC, 0x80, )) {
                        Return(0x9)
                    }
                    Return(0xb)
                }
            }
            Device(LNKD) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x4)
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Name(RSRC, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                Method(_DIS) {
                    Or(PIRD, 0x80, PIRD)
                }
                Method(_CRS) {
                    CreateWordField(RSRC, 0x1, IRQ0)
                    And(PIRD, 0xf, Local0)
                    ShiftLeft(0x1, Local0, IRQ0)
                    Return(RSRC)
                }
                Method(_SRS, 1) {
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Or(Local0, And(PIRD, 0x70, ), PIRD)
                }
                Method(_STA) {
                    If(And(PIRD, 0x80, )) {
                        Return(0x9)
                    }
                    Return(0xb)
                }
            }
            Device(LNKE) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x5)
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Name(RSRC, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                Method(_DIS) {
                    Or(PIRE, 0x80, PIRE)
                }
                Method(_CRS) {
                    CreateWordField(RSRC, 0x1, IRQ0)
                    And(PIRE, 0xf, Local0)
                    ShiftLeft(0x1, Local0, IRQ0)
                    Store(RSRC, Debug)
                    Return(RSRC)
                }
                Method(_SRS, 1) {
                    Store(Arg0, Debug)
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Or(Local0, And(PIRE, 0x70, ), PIRE)
                }
                Method(_STA) {
                    If(And(PIRE, 0x80, )) {
                        Return(0x9)
                    }
                    Return(0xb)
                }
            }
            Device(LNKF) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x6)
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Name(RSRC, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                Method(_DIS) {
                    Or(PIRF, 0x80, PIRF)
                }
                Method(_CRS) {
                    CreateWordField(RSRC, 0x1, IRQ0)
                    And(PIRF, 0xf, Local0)
                    ShiftLeft(0x1, Local0, IRQ0)
                    Store(RSRC, Debug)
                    Return(RSRC)
                }
                Method(_SRS, 1) {
                    Store(Arg0, Debug)
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Or(Local0, And(PIRF, 0x70, ), PIRF)
                }
                Method(_STA) {
                    If(And(PIRF, 0x80, )) {
                        Return(0x9)
                    }
                    Return(0xb)
                }
            }
            Device(LNKG) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x7)
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Name(RSRC, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                Method(_DIS) {
                    Or(PIRG, 0x80, PIRG)
                }
                Method(_CRS) {
                    CreateWordField(RSRC, 0x1, IRQ0)
                    And(PIRG, 0xf, Local0)
                    ShiftLeft(0x1, Local0, IRQ0)
                    Store(RSRC, Debug)
                    Return(RSRC)
                }
                Method(_SRS, 1) {
                    Store(Arg0, Debug)
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Or(Local0, And(PIRG, 0x70, ), PIRG)
                }
                Method(_STA) {
                    If(And(PIRG, 0x80, )) {
                        Return(0x9)
                    }
                    Return(0xb)
                }
            }
            Device(LNKH) {
                Name(_HID, 0x0f0cd041)
                Name(_UID, 0x8)
                Name(_PRS, Buffer(0x6) {0x23, 0x0, 0x4, 0x18, 0x79, 0x0 })
                Name(RSRC, Buffer(0x6) {0x23, 0x0, 0x0, 0x18, 0x79, 0x0 })
                Method(_DIS) {
                    Or(PIRH, 0x80, PIRH)
                }
                Method(_CRS) {
                    CreateWordField(RSRC, 0x1, IRQ0)
                    And(PIRH, 0xf, Local0)
                    ShiftLeft(0x1, Local0, IRQ0)
                    Store(RSRC, Debug)
                    Return(RSRC)
                }
                Method(_SRS, 1) {
                    Store(Arg0, Debug)
                    CreateWordField(Arg0, 0x1, IRQ0)
                    FindSetRightBit(IRQ0, Local0)
                    Decrement(Local0)
                    Or(Local0, And(PIRH, 0x70, ), PIRH)
                }
                Method(_STA) {
                    If(And(PIRH, 0x80, )) {
                        Return(0x9)
                    }
                    Return(0xb)
                }
            }
            OperationRegion(PIRX, PCI_Config, 0x60, 0x4)
            Field(PIRX, DWordAcc, Lock, Preserve) {
                AccessAs(ByteAcc, 0),
                PIRA,	8,
                PIRB,	8,
                PIRC,	8,
                PIRD,	8
            }
            OperationRegion(PIRY, PCI_Config, 0x68, 0x4)
            Field(PIRY, DWordAcc, Lock, Preserve) {
                AccessAs(ByteAcc, 0),
                PIRE,	8,
                PIRF,	8,
                PIRG,	8,
                PIRH,	8
            }
            OperationRegion(PMIO, SystemIO, 0x1000, 0x30)
            Field(PMIO, WordAcc, Lock, Preserve) {
                AccessAs(DWordAcc, 0),
                Offset(0x2a),
                ,	11,
                ACPW,	1
            }
            OperationRegion(GPIO, SystemIO, 0x1300, 0x3c)
            Field(GPIO, DWordAcc, Lock, Preserve) {
                Offset(0xe),
                ,	1,
                SRST,	1,
                Offset(0xf),
                ,	4,
                USBE,	1,
                Offset(0x2d),
                ,	5,
                LPOL,	1,
                Offset(0x38),
                ,	1,
                SPWR,	1,
                CPEN,	1
            }
            OperationRegion(LPCR, PCI_Config, 0x0, 0xff)
            Field(LPCR, ByteAcc, NoLock, Preserve) {
                Offset(0xd0),
                HPTE,	32,
                Offset(0xe6),
                CMAD,	1
            }
            Device(SIO_) {
                Name(_HID, 0x050ad041)
                Method(_INI) {
                    Store(0x0, \_SB_.PCI0.LPC0.CMAD)
                }
                OperationRegion(SIIO, SystemIO, 0x2e, 0x2)
                Field(SIIO, ByteAcc, NoLock, Preserve) {
                    INDX,	8,
                    DATA,	8
                }
                Mutex(S227, 0)
                Method(ENTR) {
                    Store(0x55, INDX)
                }
                Method(EXIT) {
                    Store(0xaa, INDX)
                }
                Method(RDRG, 1) {
                    ENTR()
                    Store(Arg0, INDX)
                    Store(DATA, Local0)
                    EXIT()
                    Return(Local0)
                }
                Method(WRRG, 2) {
                    ENTR()
                    Store(Arg0, INDX)
                    Store(Arg1, DATA)
                    EXIT()
                }
                Method(READ, 3) {
                    Acquire(S227, 0xffff)
                    If(LEqual(Arg0, 0x0)) {
                        Store(RDRG(Arg1), Local1)
                    }
                    And(Local1, Arg2, Local1)
                    Release(S227)
                    Return(Local1)
                }
                Method(WRIT, 3) {
                    Acquire(S227, 0xffff)
                    If(LEqual(Arg0, 0x0)) {
                        WRRG(Arg1, Arg2)
                    }
                    Release(S227)
                }
                Device(FIR_) {
                    Name(_HID, 0x10f0a34d)
                    Name(FENA, 0x1)
                    Name(BUF0, Buffer(0x18) {0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x1, 0x8, 0x47, 0x1, 0xf8, 0x6, 0xf8, 0x6, 0x1, 0x8, 0x22, 0xa, 0x0, 0x2a, 0xa, 0x0, 0x79, 0x0 })
                    Name(RSRC, Buffer(0x18) {0x47, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x47, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x22, 0x1, 0x0, 0x2a, 0xa, 0x0, 0x79, 0x0 })
                    Method(_STA) {
                        Store(READ(0x0, 0x25, 0xff), Local0)
                        If(LEqual(Local0, 0x0)) {
                            Return(0x0)
                        }
                        If(LEqual(Local0, 0xff)) {
                            Return(0x0)
                        }
                        Store(READ(0x0, 0x2b, 0xff), Local0)
                        If(LEqual(Local0, 0x0)) {
                            Return(0x0)
                        }
                        If(LEqual(Local0, 0xff)) {
                            Return(0x0)
                        }
                        Store(FENA, Local0)
                        If(LEqual(Local0, 0x0)) {
                            Return(0xd)
                        }
                        Else {
                            Return(0xf)
                        }
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, IOLO)
                        CreateByteField(Arg0, 0x3, IOHI)
                        CreateByteField(Arg0, 0xa, I2LO)
                        CreateByteField(Arg0, 0xb, I2HI)
                        CreateByteField(Arg0, 0x11, IRQL)
                        CreateByteField(Arg0, 0x14, DMAC)
                        WRIT(0x0, 0x25, 0x0)
                        FindSetRightBit(IRQL, Local0)
                        Decrement(Local0)
                        Store(READ(0x0, 0x28, 0xf0), Local1)
                        Or(Local0, Local1, Local0)
                        WRIT(0x0, 0x28, Local0)
                        Store(IOLO, Local0)
                        ShiftRight(Local0, 0x2, Local0)
                        And(Local0, 0xfe, Local0)
                        Store(IOHI, Local1)
                        ShiftLeft(Local1, 0x6, Local1)
                        Or(Local0, Local1, Local0)
                        WRIT(0x0, 0x25, Local0)
                        Store(I2LO, Local0)
                        ShiftRight(Local0, 0x3, Local0)
                        Store(I2HI, Local1)
                        ShiftLeft(Local1, 0x5, Local1)
                        Or(Local0, Local1, Local0)
                        WRIT(0x0, 0x2b, Local0)
                        FindSetRightBit(DMAC, Local0)
                        Decrement(Local0)
                        WRIT(0x0, 0x2c, Local0)
                        Store(READ(0x0, 0xa, 0xff), Local0)
                        Not(0xc0, Local1)
                        And(Local0, Local1, Local0)
                        Or(Local0, 0x40, Local0)
                        WRIT(0x0, 0xa, Local0)
                        Store(READ(0x0, 0xc, 0xff), Local0)
                        Not(0x38, Local1)
                        And(Local0, Local1, Local0)
                        Or(Local0, 0x8, Local0)
                        WRIT(0x0, 0xc, Local0)
                        Store(READ(0x0, 0x2, 0xff), Local0)
                        Or(Local0, 0x80, Local0)
                        WRIT(0x0, 0x2, Local0)
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Not(0x20, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x7, Local0)
                        Store(0x1, FENA)
                    }
                    Method(_CRS) {
                        And(_STA(), 0x2, Local0)
                        If(LEqual(Local0, Zero)) {
                            Return(RSRC)
                        }
                        CreateByteField(BUF0, 0x2, IOLO)
                        CreateByteField(BUF0, 0x3, IOHI)
                        CreateByteField(BUF0, 0x4, IORL)
                        CreateByteField(BUF0, 0x5, IORH)
                        CreateByteField(BUF0, 0xa, I2LO)
                        CreateByteField(BUF0, 0xb, I2HI)
                        CreateByteField(BUF0, 0xc, I2RL)
                        CreateByteField(BUF0, 0xd, I2RH)
                        CreateByteField(BUF0, 0x11, IRQL)
                        CreateByteField(BUF0, 0x12, IRQH)
                        CreateByteField(BUF0, 0x14, DMAC)
                        Store(READ(0x0, 0x25, 0xff), Local0)
                        Store(Local0, Local1)
                        And(Local1, 0xc0, Local1)
                        ShiftRight(Local1, 0x6, Local1)
                        ShiftLeft(Local0, 0x2, Local0)
                        And(Local0, 0xff, Local0)
                        Store(Local0, IOLO)
                        Store(Local1, IOHI)
                        Store(IOLO, IORL)
                        Store(IOHI, IORH)
                        Store(IOHI, Local0)
                        Add(Local0, 0x4, Local0)
                        Store(Local0, I2HI)
                        Store(Local0, I2RH)
                        Store(IOLO, Local0)
                        Store(Local0, I2LO)
                        Store(Local0, I2RL)
                        Store(READ(0x0, 0x28, 0xf), Local0)
                        Store(0x1, Local1)
                        ShiftLeft(Local1, Local0, IRQL)
                        Store(0x0, IRQH)
                        Store(READ(0x0, 0x2c, 0xf), Local0)
                        Store(0x1, Local1)
                        ShiftLeft(Local1, Local0, DMAC)
                        Return(BUF0)
                    }
                    Name(_PRS, Buffer(0x63) {0x31, 0x4, 0x47, 0x1, 0xf8, 0x2, 0xf8, 0x2, 0x1, 0x8, 0x47, 0x1, 0xf8, 0x6, 0xf8, 0x6, 0x1, 0x8, 0x22, 0x18, 0x0, 0x2a, 0xa, 0x0, 0x31, 0x4, 0x47, 0x1, 0xf8, 0x3, 0xf8, 0x3, 0x1, 0x8, 0x47, 0x1, 0xf8, 0x7, 0xf8, 0x7, 0x1, 0x8, 0x22, 0x18, 0x0, 0x2a, 0xa, 0x0, 0x31, 0x4, 0x47, 0x1, 0xe8, 0x3, 0xe8, 0x3, 0x1, 0x8, 0x47, 0x1, 0xe8, 0x7, 0xe8, 0x7, 0x1, 0x8, 0x22, 0x18, 0x0, 0x2a, 0xa, 0x0, 0x31, 0x4, 0x47, 0x1, 0xe8, 0x2, 0xe8, 0x2, 0x1, 0x8, 0x47, 0x1, 0xe8, 0x6, 0xe8, 0x6, 0x1, 0x8, 0x22, 0x18, 0x0, 0x2a, 0xa, 0x0, 0x38, 0x79, 0x0 })
                    Method(_DIS) {
                        Store(0x0, FENA)
                    }
                    Method(_PS0) {
                        Store(READ(0x0, 0x2, 0xff), Local0)
                        Or(Local0, 0x80, Local0)
                        WRIT(0x0, 0x2, Local0)
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Not(0x20, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x7, Local0)
                    }
                    Method(_PS1) {
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Or(Local0, 0x20, Local0)
                        WRIT(0x0, 0x7, Local0)
                    }
                    Method(_PS3) {
                        Store(READ(0x0, 0x2, 0xff), Local0)
                        Not(0x80, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x2, Local0)
                    }
                }
                Device(LPT_) {
                    Name(_HID, 0x0004d041)
                    Name(_UID, 0x1)
                    Name(LPTN, 0x1)
                    Method(_STA) {
                        If(LEqual(LPTN, 0x1)) {
                            Store(READ(0x0, 0x1, 0x4), Local0)
                            If(LEqual(Local0, 0x0)) {
                                Return(0x0)
                            }
                        }
                        Store(READ(0x0, 0x1, 0x8), Local0)
                        If(LEqual(Local0, 0x0)) {
                            Return(0x0)
                        }
                        Store(READ(0x0, 0x23, 0xc0), Local0)
                        If(LEqual(Local0, 0x0)) {
                            Return(0xd)
                        }
                        Else {
                            Return(0xf)
                        }
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, IOLO)
                        CreateByteField(Arg0, 0x3, IOHI)
                        CreateByteField(Arg0, 0x9, IRQL)
                        WRIT(0x0, 0x23, 0x0)
                        FindSetRightBit(IRQL, Local0)
                        If(Local0) {
                            Decrement(Local0)
                            Store(READ(0x0, 0x27, 0xf0), Local1)
                            Or(Local0, Local1, Local0)
                            WRIT(0x0, 0x27, Local0)
                        }
                        Else {
                            Store(READ(0x0, 0x27, 0xf0), Local0)
                            WRIT(0x0, 0x27, Local0)
                        }
                        Store(IOLO, Local0)
                        ShiftRight(Local0, 0x2, Local0)
                        Store(IOHI, Local1)
                        ShiftLeft(Local1, 0x6, Local1)
                        Or(Local0, Local1, Local0)
                        WRIT(0x0, 0x23, Local0)
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Or(Local0, 0xc, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x1, LPTN)
                    }
                    Method(_CRS) {
                        Name(BUF0, Buffer(0xd) {0x47, 0x1, 0x0, 0x0, 0x0, 0x0, 0x1, 0x8, 0x22, 0x0, 0x0, 0x79, 0x0 })
                        CreateByteField(BUF0, 0x2, IOLO)
                        CreateByteField(BUF0, 0x3, IOHI)
                        CreateByteField(BUF0, 0x4, IORL)
                        CreateByteField(BUF0, 0x5, IORH)
                        CreateByteField(BUF0, 0x7, LNA1)
                        CreateByteField(BUF0, 0x9, IRQL)
                        Store(READ(0x0, 0x23, 0xff), Local0)
                        Store(Local0, Local1)
                        And(Local1, 0xc0, Local1)
                        ShiftRight(Local1, 0x6, Local1)
                        And(Local0, 0x3f, Local0)
                        ShiftLeft(Local0, 0x2, Local0)
                        Store(Local0, IOLO)
                        Store(Local1, IOHI)
                        Store(IOLO, IORL)
                        Store(IOHI, IORH)
                        If(Local0) {
                            If(LEqual(Local0, 0xbc)) {
                                Store(0x4, LNA1)
                            }
                            Else {
                                Store(0x8, LNA1)
                            }
                        }
                        Else {
                            Store(0x0, LNA1)
                        }
                        If(Local0) {
                            Store(READ(0x0, 0x27, 0xff), Local0)
                            And(Local0, 0xf, Local0)
                            Store(0x1, Local1)
                            ShiftLeft(Local1, Local0, IRQL)
                        }
                        Return(BUF0)
                    }
                    Name(_PRS, Buffer(0x2a) {0x31, 0x0, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x1, 0x8, 0x22, 0xa0, 0x0, 0x31, 0x5, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x1, 0x8, 0x22, 0xa0, 0x0, 0x31, 0xa, 0x47, 0x1, 0xbc, 0x3, 0xbc, 0x3, 0x1, 0x4, 0x22, 0xa0, 0x0, 0x38, 0x79, 0x0 })
                    Method(_DIS) {
                        WRIT(0x0, 0x23, 0x0)
                        Store(READ(0x0, 0x27, 0xff), Local0)
                        And(Local0, 0xf0, Local0)
                        WRIT(0x0, 0x27, Local0)
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        And(Local0, 0xfb, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x0, LPTN)
                    }
                    Method(_PS3) {
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Not(0x4, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x0, LPTN)
                    }
                    Method(_PS0) {
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Not(0x4, Local1)
                        And(Local0, Local1, Local0)
                        Or(Local0, 0x4, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x1, LPTN)
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Not(0x10, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x7, Local0)
                    }
                    Method(_PS2) {
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Not(0x10, Local1)
                        And(Local0, Local1, Local0)
                        Or(Local0, 0x10, Local0)
                        WRIT(0x0, 0x7, Local0)
                    }
                }
                Device(LPBI) {
                    Name(_HID, 0x0004d041)
                    Name(_UID, 0x2)
                    Name(LPTB, 0x1)
                    Method(_STA) {
                        If(LEqual(LPTB, 0x1)) {
                            Store(READ(0x0, 0x1, 0x4), Local0)
                            If(LEqual(Local0, 0x0)) {
                                Return(0x0)
                            }
                        }
                        Store(READ(0x0, 0x1, 0x8), Local0)
                        If(LNot(LEqual(Local0, 0x0))) {
                            Return(0x0)
                        }
                        Store(READ(0x0, 0x4, 0x3), Local0)
                        If(LNot(LEqual(Local0, 0x0))) {
                            Return(0x0)
                        }
                        Store(READ(0x0, 0x23, 0xc0), Local0)
                        If(LEqual(Local0, 0x0)) {
                            Return(0xd)
                        }
                        Else {
                            Return(0xf)
                        }
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, IOLO)
                        CreateByteField(Arg0, 0x3, IOHI)
                        CreateByteField(Arg0, 0x9, IRQL)
                        WRIT(0x0, 0x23, 0x0)
                        FindSetRightBit(IRQL, Local0)
                        If(Local0) {
                            Decrement(Local0)
                            Store(READ(0x0, 0x27, 0xf0), Local1)
                            Or(Local0, Local1, Local0)
                            WRIT(0x0, 0x27, Local0)
                        }
                        Else {
                            Store(READ(0x0, 0x27, 0xf0), Local0)
                            WRIT(0x0, 0x27, Local0)
                        }
                        Store(IOLO, Local0)
                        ShiftRight(Local0, 0x2, Local0)
                        Store(IOHI, Local1)
                        ShiftLeft(Local1, 0x6, Local1)
                        Or(Local0, Local1, Local0)
                        WRIT(0x0, 0x23, Local0)
                        Store(READ(0x0, 0x4, 0xfc), Local0)
                        WRIT(0x0, 0x4, Local0)
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Or(Local0, 0x4, Local0)
                        And(Local0, 0xf7, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x1, LPTB)
                    }
                    Method(_CRS) {
                        Name(BUF0, Buffer(0xd) {0x47, 0x1, 0x0, 0x0, 0x0, 0x0, 0x1, 0x8, 0x22, 0x0, 0x0, 0x79, 0x0 })
                        CreateByteField(BUF0, 0x2, IOLO)
                        CreateByteField(BUF0, 0x3, IOHI)
                        CreateByteField(BUF0, 0x4, IORL)
                        CreateByteField(BUF0, 0x5, IORH)
                        CreateByteField(BUF0, 0x7, LNA1)
                        CreateByteField(BUF0, 0x9, IRQL)
                        Store(READ(0x0, 0x23, 0xff), Local0)
                        Store(Local0, Local1)
                        And(Local1, 0xc0, Local1)
                        ShiftRight(Local1, 0x6, Local1)
                        And(Local0, 0x3f, Local0)
                        ShiftLeft(Local0, 0x2, Local0)
                        Store(Local0, IOLO)
                        Store(Local1, IOHI)
                        Store(IOLO, IORL)
                        Store(IOHI, IORH)
                        If(Local0) {
                            If(LEqual(Local0, 0xbc)) {
                                Store(0x4, LNA1)
                            }
                            Else {
                                Store(0x8, LNA1)
                            }
                        }
                        Else {
                            Store(0x0, LNA1)
                        }
                        If(Local0) {
                            Store(READ(0x0, 0x27, 0xff), Local0)
                            And(Local0, 0xf, Local0)
                            Store(0x1, Local1)
                            ShiftLeft(Local1, Local0, IRQL)
                        }
                        Return(BUF0)
                    }
                    Name(_PRS, Buffer(0x2a) {0x31, 0x0, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x1, 0x8, 0x22, 0xa0, 0x0, 0x31, 0x5, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x1, 0x8, 0x22, 0xa0, 0x0, 0x31, 0xa, 0x47, 0x1, 0xbc, 0x3, 0xbc, 0x3, 0x1, 0x4, 0x22, 0xa0, 0x0, 0x38, 0x79, 0x0 })
                    Method(_DIS) {
                        WRIT(0x0, 0x23, 0x0)
                        Store(READ(0x0, 0x27, 0xff), Local0)
                        And(Local0, 0xf0, Local0)
                        WRIT(0x0, 0x27, Local0)
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        And(Local0, 0xfb, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x0, LPTB)
                    }
                    Method(_PS3) {
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Not(0x4, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x0, LPTB)
                    }
                    Method(_PS0) {
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Not(0x4, Local1)
                        And(Local0, Local1, Local0)
                        Or(Local0, 0x4, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x1, LPTB)
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Not(0x10, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x7, Local0)
                    }
                    Method(_PS2) {
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Not(0x10, Local1)
                        And(Local0, Local1, Local0)
                        Or(Local0, 0x10, Local0)
                        WRIT(0x0, 0x7, Local0)
                    }
                }
                Device(ECP_) {
                    Name(_HID, 0x0104d041)
                    Name(LECP, 0x1)
                    Method(_STA) {
                        If(LEqual(LECP, 0x1)) {
                            Store(READ(0x0, 0x1, 0x4), Local0)
                            If(LEqual(Local0, 0x0)) {
                                Return(0x0)
                            }
                        }
                        Store(READ(0x0, 0x1, 0x8), Local0)
                        If(LNot(LEqual(Local0, 0x0))) {
                            Return(0x0)
                        }
                        Store(READ(0x0, 0x4, 0x3), Local0)
                        If(LNot(LEqual(Local0, 0x2))) {
                            Return(0x0)
                        }
                        Store(READ(0x0, 0x23, 0xc0), Local0)
                        If(LEqual(Local0, 0x0)) {
                            Return(0xd)
                        }
                        Else {
                            Return(0xf)
                        }
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, IOLO)
                        CreateByteField(Arg0, 0x3, IOHI)
                        CreateByteField(Arg0, 0x11, IRQL)
                        CreateByteField(Arg0, 0x14, DMAC)
                        WRIT(0x0, 0x23, 0x0)
                        FindSetRightBit(IRQL, Local0)
                        If(Local0) {
                            Decrement(Local0)
                            Store(READ(0x0, 0x27, 0xf0), Local1)
                            Or(Local0, Local1, Local0)
                            WRIT(0x0, 0x27, Local0)
                        }
                        Else {
                            Store(READ(0x0, 0x27, 0xf0), Local0)
                            WRIT(0x0, 0x27, Local0)
                        }
                        Store(IOLO, Local0)
                        ShiftRight(Local0, 0x2, Local0)
                        Store(IOHI, Local1)
                        ShiftLeft(Local1, 0x6, Local1)
                        Or(Local0, Local1, Local0)
                        WRIT(0x0, 0x23, Local0)
                        FindSetRightBit(DMAC, Local0)
                        If(Local0) {
                            Decrement(Local0)
                            Store(READ(0x0, 0x26, 0xf0), Local1)
                            Or(Local0, Local1, Local0)
                            WRIT(0x0, 0x26, Local0)
                        }
                        Else {
                            Store(READ(0x0, 0x26, 0xf0), Local0)
                            WRIT(0x0, 0x26, Local0)
                        }
                        Store(READ(0x0, 0x4, 0xfc), Local0)
                        Or(Local0, 0x2, Local0)
                        WRIT(0x0, 0x4, Local0)
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Or(Local0, 0x4, Local0)
                        And(Local0, 0xf7, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x1, LECP)
                    }
                    Method(_CRS) {
                        Name(BUF0, Buffer(0x18) {0x47, 0x1, 0x0, 0x0, 0x0, 0x0, 0x8, 0x4, 0x47, 0x1, 0x0, 0x0, 0x0, 0x0, 0x8, 0x4, 0x22, 0x0, 0x0, 0x2a, 0x0, 0x0, 0x79, 0x0 })
                        CreateByteField(BUF0, 0x2, IOLO)
                        CreateByteField(BUF0, 0x3, IOHI)
                        CreateByteField(BUF0, 0x4, IORL)
                        CreateByteField(BUF0, 0x5, IORH)
                        CreateByteField(BUF0, 0x7, LNA1)
                        CreateByteField(BUF0, 0xa, DALO)
                        CreateByteField(BUF0, 0xb, DAHI)
                        CreateByteField(BUF0, 0xc, DRLO)
                        CreateByteField(BUF0, 0xd, DRHI)
                        CreateByteField(BUF0, 0xf, LNA2)
                        CreateByteField(BUF0, 0x11, IRQL)
                        CreateByteField(BUF0, 0x14, DMAC)
                        Store(READ(0x0, 0x23, 0xff), Local0)
                        Store(Local0, Local1)
                        And(Local1, 0xc0, Local1)
                        ShiftRight(Local1, 0x6, Local1)
                        And(Local0, 0x3f, Local0)
                        ShiftLeft(Local0, 0x2, Local0)
                        Store(Local0, IOLO)
                        Store(Local1, IOHI)
                        Store(IOLO, IORL)
                        Store(IOHI, IORH)
                        Add(Local1, 0x4, Local1)
                        Store(IOLO, DALO)
                        Store(Local1, DAHI)
                        Store(DALO, DRLO)
                        Store(DAHI, DRHI)
                        If(LEqual(Local0, 0x0)) {
                            Store(0x0, LNA1)
                            Store(0x0, LNA2)
                        }
                        If(Local0) {
                            Store(READ(0x0, 0x27, 0xff), Local0)
                            And(Local0, 0xf, Local0)
                            Store(0x1, Local1)
                            ShiftLeft(Local1, Local0, IRQL)
                        }
                        If(Local0) {
                            Store(READ(0x0, 0x26, 0xff), Local0)
                            And(Local0, 0xf, Local0)
                            Store(0x1, Local1)
                            ShiftLeft(Local1, Local0, DMAC)
                        }
                        Return(BUF0)
                    }
                    Name(_PRS, Buffer(0x4b) {0x31, 0x0, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x8, 0x4, 0x47, 0x1, 0x78, 0x7, 0x78, 0x7, 0x8, 0x4, 0x22, 0xa0, 0x0, 0x2a, 0xa, 0x0, 0x31, 0x5, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x8, 0x4, 0x47, 0x1, 0x78, 0x6, 0x78, 0x6, 0x8, 0x4, 0x22, 0xa0, 0x0, 0x2a, 0xa, 0x0, 0x31, 0xa, 0x47, 0x1, 0xbc, 0x3, 0xbc, 0x3, 0x8, 0x4, 0x47, 0x1, 0xbc, 0x7, 0xbc, 0x7, 0x8, 0x4, 0x22, 0xa0, 0x0, 0x2a, 0xa, 0x0, 0x38, 0x79, 0x0 })
                    Method(_DIS) {
                        WRIT(0x0, 0x23, 0x0)
                        Store(READ(0x0, 0x27, 0xff), Local0)
                        And(Local0, 0xf0, Local0)
                        WRIT(0x0, 0x27, Local0)
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        And(Local0, 0xfb, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x0, LECP)
                    }
                    Method(_PS3) {
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Not(0x4, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x0, LECP)
                    }
                    Method(_PS0) {
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Not(0x4, Local1)
                        And(Local0, Local1, Local0)
                        Or(Local0, 0x4, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x1, LECP)
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Not(0x10, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x7, Local0)
                    }
                    Method(_PS2) {
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Not(0x10, Local1)
                        And(Local0, Local1, Local0)
                        Or(Local0, 0x10, Local0)
                        WRIT(0x0, 0x7, Local0)
                    }
                }
                Device(EPP_) {
                    Name(_HID, 0x0004d041)
                    Name(_UID, 0x3)
                    Name(LEPP, 0x1)
                    Method(_STA) {
                        If(LEqual(LEPP, 0x1)) {
                            Store(READ(0x0, 0x1, 0x4), Local0)
                            If(LEqual(Local0, 0x0)) {
                                Return(0x0)
                            }
                        }
                        Store(READ(0x0, 0x1, 0x8), Local0)
                        If(LNot(LEqual(Local0, 0x0))) {
                            Return(0x0)
                        }
                        Store(READ(0x0, 0x4, 0x3), Local0)
                        If(LNot(LEqual(Local0, 0x1))) {
                            Return(0x0)
                        }
                        Store(READ(0x0, 0x23, 0xc0), Local0)
                        If(LEqual(Local0, 0x0)) {
                            Return(0xd)
                        }
                        Else {
                            Return(0xf)
                        }
                    }
                    Method(_SRS, 1) {
                        CreateByteField(Arg0, 0x2, IOLO)
                        CreateByteField(Arg0, 0x3, IOHI)
                        CreateByteField(Arg0, 0x9, IRQL)
                        WRIT(0x0, 0x23, 0x0)
                        FindSetRightBit(IRQL, Local0)
                        If(Local0) {
                            Decrement(Local0)
                            Store(READ(0x0, 0x27, 0xf0), Local1)
                            Or(Local0, Local1, Local0)
                            WRIT(0x0, 0x27, Local0)
                        }
                        Else {
                            Store(READ(0x0, 0x27, 0xf0), Local0)
                            WRIT(0x0, 0x27, Local0)
                        }
                        Store(IOLO, Local0)
                        ShiftRight(Local0, 0x2, Local0)
                        Store(IOHI, Local1)
                        ShiftLeft(Local1, 0x6, Local1)
                        Or(Local0, Local1, Local0)
                        WRIT(0x0, 0x23, Local0)
                        Store(READ(0x0, 0x4, 0xfc), Local0)
                        Or(Local0, 0x1, Local0)
                        And(Local0, 0xbf, Local0)
                        WRIT(0x0, 0x4, Local0)
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Or(Local0, 0x4, Local0)
                        And(Local0, 0xf7, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x1, LEPP)
                    }
                    Method(_CRS) {
                        Name(BUF0, Buffer(0xd) {0x47, 0x1, 0x0, 0x0, 0x0, 0x0, 0x1, 0x8, 0x22, 0x0, 0x0, 0x79, 0x0 })
                        CreateByteField(BUF0, 0x2, IOLO)
                        CreateByteField(BUF0, 0x3, IOHI)
                        CreateByteField(BUF0, 0x4, IORL)
                        CreateByteField(BUF0, 0x5, IORH)
                        CreateByteField(BUF0, 0x7, LNA1)
                        CreateByteField(BUF0, 0x9, IRQL)
                        Store(READ(0x0, 0x23, 0xff), Local0)
                        Store(Local0, Local1)
                        And(Local1, 0xc0, Local1)
                        ShiftRight(Local1, 0x6, Local1)
                        And(Local0, 0x3f, Local0)
                        ShiftLeft(Local0, 0x2, Local0)
                        Store(Local0, IOLO)
                        Store(Local1, IOHI)
                        Store(IOLO, IORL)
                        Store(IOHI, IORH)
                        If(Local0) {
                            If(LEqual(Local0, 0xbc)) {
                                Store(0x4, LNA1)
                            }
                            Else {
                                Store(0x8, LNA1)
                            }
                        }
                        Else {
                            Store(0x0, LNA1)
                        }
                        If(Local0) {
                            Store(READ(0x0, 0x27, 0xff), Local0)
                            And(Local0, 0xf, Local0)
                            Store(0x1, Local1)
                            ShiftLeft(Local1, Local0, IRQL)
                        }
                        Return(BUF0)
                    }
                    Name(_PRS, Buffer(0x2a) {0x31, 0x0, 0x47, 0x1, 0x78, 0x3, 0x78, 0x3, 0x1, 0x8, 0x22, 0xa0, 0x0, 0x31, 0x5, 0x47, 0x1, 0x78, 0x2, 0x78, 0x2, 0x1, 0x8, 0x22, 0xa0, 0x0, 0x31, 0xa, 0x47, 0x1, 0xbc, 0x3, 0xbc, 0x3, 0x1, 0x4, 0x22, 0xa0, 0x0, 0x38, 0x79, 0x0 })
                    Method(_DIS) {
                        WRIT(0x0, 0x23, 0x0)
                        Store(READ(0x0, 0x27, 0xff), Local0)
                        And(Local0, 0xf0, Local0)
                        WRIT(0x0, 0x27, Local0)
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        And(Local0, 0xfb, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x0, LEPP)
                    }
                    Method(_PS3) {
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Not(0x4, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x0, LEPP)
                    }
                    Method(_PS0) {
                        Store(READ(0x0, 0x1, 0xff), Local0)
                        Not(0x4, Local1)
                        And(Local0, Local1, Local0)
                        Or(Local0, 0x4, Local0)
                        WRIT(0x0, 0x1, Local0)
                        Store(0x1, LEPP)
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Not(0x10, Local1)
                        And(Local0, Local1, Local0)
                        WRIT(0x0, 0x7, Local0)
                    }
                    Method(_PS2) {
                        Store(READ(0x0, 0x7, 0xff), Local0)
                        Not(0x10, Local1)
                        And(Local0, Local1, Local0)
                        Or(Local0, 0x10, Local0)
                        WRIT(0x0, 0x7, Local0)
                    }
                }
            }
            OperationRegion(SMIO, SystemIO, 0xb2, 0x2)
            Field(SMIO, ByteAcc, NoLock, Preserve) {
                APMC,	8,
                APMD,	8
            }
            Method(PHSS, 1) {
                Store(Arg0, APMD)
                Store(0xe3, APMC)
                Stall(0xff)
                Stall(0xff)
                Stall(0xff)
                Stall(0xff)
                Stall(0xff)
                Stall(0xff)
            }
            Method(ECOK) {
                If(LEqual(\_SB_.PCI0.LPC0.EC0_.ECOK, 0x1)) {
                    Return(0x1)
                }
                Else {
                    Return(0x0)
                }
            }
            Device(EC0_) {
                Name(_HID, 0x090cd041)
                Name(_GPE, 0x1c)
                Name(ECOK, Zero)
                Name(_CRS, Buffer(0x12) {0x47, 0x1, 0x62, 0x0, 0x62, 0x0, 0x1, 0x1, 0x47, 0x1, 0x66, 0x0, 0x66, 0x0, 0x1, 0x1, 0x79, 0x0 })
                Method(_REG, 2) {
                    If(LEqual(Arg0, 0x3)) {
                        Store(Arg1, ECOK)
                    }
                }
                OperationRegion(ERAM, EmbeddedControl, 0x0, 0xff)
                Field(ERAM, AnyAcc, Lock, Preserve) {
                    Offset(0x60),
                    SMPR,	8,
                    SMST,	8,
                    SMAD,	8,
                    SMCM,	8,
                    SMD0,	256,
                    BCNT,	8,
                    SMAA,	8,
                    Offset(0x90),
                    CHGM,	16,
                    CHGS,	16,
                    CHGC,	16,
                    CHGV,	16,
                    CHGA,	16,
                    BAL0,	1,
                    BAL1,	1,
                    BAL2,	1,
                    BAL3,	1,
                    Offset(0x9c),
                    PHDD,	1,
                    FDD_,	1,
                    DVD0,	1,
                    SHDD,	1,
                    L120,	1,
                    EXFD,	1,
                    CRT_,	1,
                    Offset(0x9d),
                    SBTN,	1,
                    VIDO,	1,
                    VOLD,	1,
                    VOLU,	1,
                    MUTE,	1,
                    CONT,	1,
                    BRGT,	1,
                    HBTN,	1,
                    S4S_,	1,
                    SKEY,	1,
                    BKEY,	1,
                    Offset(0xa3),
                    S1LD,	1,
                    S3LD,	1,
                    VGAQ,	1,
                    PCMQ,	1,
                    PCMR,	1,
                    ADP_,	1,
                    SYS6,	1,
                    SYS7,	1,
                    PWAK,	1,
                    MWAK,	1,
                    LWAK,	1,
                    Offset(0xa5),
                    TST0,	8,
                    TST1,	8,
                    TST2,	8,
                    TST3,	8,
                    TST4,	8,
                    TST5,	8,
                    TST6,	8,
                    TST7,	8,
                    Offset(0xb0),
                    CTMP,	8,
                    Offset(0xb8),
                    BTDT,	1,
                    BTPW,	1,
                    BTDS,	1,
                    BTPS,	1,
                    BTSW,	1,
                    Offset(0xb9),
                    BRTS,	8,
                    Offset(0xbb),
                    WLAT,	1,
                    BTAT,	1,
                    WLEX,	1,
                    BTEX,	1,
                    KLSW,	1,
                    Offset(0xc0),
                    ,	4,
                    BMF0,	3,
                    BTY0,	1,
                    BDCH,	1,
                    BTCH,	1,
                    BLLB,	1,
                    BST0,	5,
                    BRC0,	16,
                    BSN0,	16,
                    BPV0,	16,
                    BDV0,	16,
                    BDC0,	16,
                    BFC0,	16,
                    GAU0,	8,
                    Offset(0xd0),
                    ,	4,
                    BMF1,	3,
                    BTY1,	1,
                    BST1,	8,
                    BRC1,	16,
                    BSN1,	16,
                    BPV1,	16,
                    BDV1,	16,
                    BDC1,	16,
                    BFC1,	16,
                    GAU1,	8
                }
                Method(_Q11) {
                    Store("=====QUERY_11=====", Debug)
                    If(\_SB_.PCI0.LPC0.EC0_.BRGT) {
                        PHSS(0x8)
                        Store(0x0, \_SB_.PCI0.LPC0.EC0_.BRGT)
                    }
                }
                Method(_Q16) {
                    Store("=====QUERY_07=====", Debug)
                    \_SB_.PCI0.LPC0.PHSS(0x6)
                    Sleep(0x32)
                    Store(CADL, Local0)
                    If(And(0x2, Local0, )) {
                        \_SB_.PCI0.LPC0.PHSS(0x7)
                        Sleep(0x64)
                    }
                    Else {
                        Notify(\_SB_.LID_, 0x80)
                        Sleep(0x64)
                    }
                }
                Method(_Q1C) {
                    Store("=====QUERY_1C=====", Debug)
                    If(\_SB_.PCI0.LPC0.EC0_.VIDO) {
                        \_SB_.PCI0.GFX0.DSSW()
                        Store(0x0, \_SB_.PCI0.LPC0.EC0_.VIDO)
                    }
                }
                Method(_Q1D) {
                    \_SB_.PCI0.LPC0.EC0_.PCLK()
                }
                Method(_Q1E) {
                    Store("=====QUERY_1E=====", Debug)
                    \_SB_.PCI0.GFX0.DSSC()
                }
                Method(_Q4E) {
                    Store("=====QUERY_4E=====", Debug)
                    \_SB_.PCI0.GFX0.DSSL()
                }
                Method(_Q4F) {
                    Store("=====QUERY_4F=====", Debug)
                    \_SB_.PCI0.GFX0.DSSB()
                }
                Method(_Q22) {
                    Store("=====QUERY_22=====", Debug)
                    Notify(\_SB_.PCI0.LPC0.BAT1, 0x80)
                }
                Method(_Q25) {
                    Store("=====QUERY_25=====", Debug)
                    Sleep(0x03e8)
                    Notify(\_SB_.PCI0.LPC0.BAT1, 0x81)
                    Sleep(0x03e8)
                    Notify(\_SB_.PCI0.LPC0.BAT1, 0x80)
                }
                Method(_Q27) {
                }
                Method(_Q30) {
                    Store("=====QUERY_30=====", Debug)
                    If(\_SB_.PCI0.LPC0.EC0_.SKEY) {
                        PHSS(0x70)
                        Store(0x0, \_SB_.PCI0.LPC0.EC0_.SKEY)
                    }
                }
                Method(_Q34) {
                    Store("=====QUERY_34=====", Debug)
                    If(\_SB_.PCI0.LPC0.EC0_.BKEY) {
                        PHSS(0x71)
                        Store(0x0, \_SB_.PCI0.LPC0.EC0_.BKEY)
                    }
                }
                Method(_Q35) {
                    Store("=====QUERY_35=====", Debug)
                    Sleep(0x03e8)
                    Notify(\_SB_.PCI0.LPC0.BAT1, 0x80)
                }
                Method(_Q37) {
                    Store("=====QUERY_37=====", Debug)
                    \_SB_.PCI0.LPC0.PHSS(0xd)
                    Notify(\_SB_.PCI0.LPC0.ACAD, 0x0)
                    Sleep(0x03e8)
                    Notify(\_SB_.PCI0.LPC0.BAT1, 0x80)
                }
                Method(_Q23) {
                    Notify(\_SB_.PCI0.LPC0.BAT1, 0x80)
                }
                Method(_Q38) {
                    Store("=====QUERY_38=====", Debug)
                    \_SB_.PCI0.LPC0.PHSS(0xd)
                    Notify(\_SB_.PCI0.LPC0.ACAD, 0x1)
                    Sleep(0x03e8)
                    Notify(\_SB_.PCI0.LPC0.BAT1, 0x80)
                }
                Method(_Q42) {
                    Store("=====QUERY_42=====", Debug)
                    \_SB_.PCI0.LPC0.PHSS(0xa)
                }
                OperationRegion(CCLK, SystemIO, 0x1010, 0x4)
                Field(CCLK, DWordAcc, NoLock, Preserve) {
                    ,	1,
                    DUTY,	3,
                    THEN,	1,
                    Offset(0x1),
                    ,	9,
                    TSTS,	1
                }
                OperationRegion(ECRM, EmbeddedControl, 0x0, 0xff)
                Field(ECRM, ByteAcc, Lock, Preserve) {
                    Offset(0x94),
                    ERIB,	16,
                    ERBD,	8,
                    Offset(0xac),
                    SDTM,	8,
                    FSSN,	4,
                    FANU,	4,
                    PTVL,	3,
                    ,	4,
                    TTHR,	1,
                    Offset(0xbc),
                    PJID,	8,
                    Offset(0xbe),
                    Offset(0xf9),
                    RFRD,	8,
                    Offset(0xfb)
                }
                Mutex(FAMX, 0)
                Method(FANG, 1) {
                    Acquire(FAMX, 0xffff)
                    Store(Arg0, ERIB)
                    Store(ERBD, Local0)
                    Release(FAMX)
                    Return(Local0)
                }
                Method(FANW, 2) {
                    Acquire(FAMX, 0xffff)
                    Store(Arg1, ERBD)
                    Store(Arg0, ERIB)
                    Release(FAMX)
                    Return(Arg1)
                }
                Method(TUVR, 1) {
                    Return(0x3)
                }
                Method(THRO, 1) {
                    If(LEqual(Arg0, 0x0)) {
                        Return(THEN)
                    }
                    Else {
                        If(LEqual(Arg0, 0x1)) {
                            Return(DUTY)
                        }
                        Else {
                            If(LEqual(Arg0, 0x2)) {
                                Return(TTHR)
                            }
                            Else {
                                Return(0xff)
                            }
                        }
                    }
                }
                Method(PCLK) {
                    Store(PTVL, Local0)
                    If(LEqual(Local0, 0x0)) {
                        Store(0x0, THEN)
                    }
                    Else {
                        Not(Local0, Local0)
                        Add(Local0, 0x1, Local0)
                        And(Local0, 0x7, Local0)
                        Store(Local0, DUTY)
                        If(LEqual(Local0, 0x0)) {
                            Store(0x0, THEN)
                        }
                        Else {
                            Store(0x1, THEN)
                        }
                    }
                }
                Method(CLCK, 1) {
                    If(LEqual(Arg0, 0x0)) {
                        Store(0x0, THEN)
                    }
                    Else {
                        Store(Arg0, DUTY)
                        Store(0x1, THEN)
                    }
                    Return(THEN)
                }
            }
            Device(ACAD) {
                Name(_HID, "ACPI0003")
                Name(_PCL, Package(0x1) {
                    \_SB_,
                })
                Method(_PSR) {
                    If(LAnd(\_SB_.PCI0.LPC0.EC0_.ECOK, LEqual(ECDY, 0x0))) {
                        If(\_SB_.PCI0.LPC0.EC0_.BTCH) {
                            Return(0x1)
                        }
                        If(\_SB_.PCI0.LPC0.EC0_.BDCH) {
                            Return(0x0)
                        }
                        Return(0x1)
                    }
                    Else {
                        Return(0x0)
                    }
                }
            }
            Device(BAT1) {
                Name(_HID, 0x0a0cd041)
                Name(_UID, 0x1)
                Name(_PCL, Package(0x1) {
                    \_SB_,
                })
                Name(PBIF, Package(0xd) {
                    0x1,
                    0x10cc,
                    0x10cc,
                    0x1,
                    0x39d0,
                    0x01ae,
                    0x81,
                    0x0108,
                    0x0ec4,
                    "Li_Ion 4300mA ",
                    "",
                    "LiON",
                    "COMPAL ",
                })
                Name(PBST, Package(0x4) {
                    0x1,
                    0xffffffff,
                    0xffffffff,
                    0x39d0,
                })
                Method(_STA) {
                    If(LAnd(ECOK(), LEqual(ECDY, 0x0))) {
                        Store("== Main Battery _STA==", Debug)
                        If(\_SB_.PCI0.LPC0.EC0_.BAL0) {
                            Sleep(0x14)
                            Return(0x1f)
                        }
                        Else {
                            Sleep(0x14)
                            Return(0xf)
                        }
                    }
                    Else {
                        Sleep(0x14)
                        Return(0x1f)
                    }
                }
                Method(_BIF) {
                    If(LAnd(ECOK(), LEqual(ECDY, 0x0))) {
                        Store("==Main Battery Information _BIF==", Debug)
                        Sleep(0x14)
                        Store(\_SB_.PCI0.LPC0.EC0_.BDC0, Local0)
                        Sleep(0x14)
                        Store(Local0, Index(PBIF, 0x1, ))
                        Sleep(0x14)
                        If(LEqual(Local0, 0x0866)) {
                            Store(0x41, Local1)
                        }
                        Else {
                            Store(0x81, Local1)
                        }
                        Store(Local1, Index(PBIF, 0x6, ))
                        Store(\_SB_.PCI0.LPC0.EC0_.BFC0, Local2)
                        Sleep(0x14)
                        Store(Local2, Index(PBIF, 0x2, ))
                        Store(\_SB_.PCI0.LPC0.EC0_.BMF0, Local1)
                        Sleep(0x14)
                        If(LEqual(Local1, 0x1)) {
                            Store("GC86508SAT0 ", Index(PBIF, 0x9, ))
                            Store("SANYO ", Index(PBIF, 0xc, ))
                        }
                        Else {
                            If(LEqual(Local1, 0x2)) {
                                Store("GC86503SY90 ", Index(PBIF, 0x9, ))
                                Store("SONY ", Index(PBIF, 0xc, ))
                            }
                            Else {
                                If(LEqual(Local1, 0x4)) {
                                    Store("GC86503PAG0 ", Index(PBIF, 0x9, ))
                                    Store("PANASONIC ", Index(PBIF, 0xc, ))
                                }
                                Else {
                                    If(LEqual(Local1, 0x5)) {
                                        Store("GC86508SM60 ", Index(PBIF, 0x9, ))
                                        Store("SAMSUNG ", Index(PBIF, 0xc, ))
                                    }
                                    Else {
                                        Store("BCL3100LiON ", Index(PBIF, 0x9, ))
                                        Store("COMPAL ", Index(PBIF, 0xc, ))
                                    }
                                }
                            }
                        }
                    }
                    Return(PBIF)
                }
                Method(_BST) {
                    Store("==Main Battery Status _BST==", Debug)
                    If(LGreater(ECDY, 0x0)) {
                        Decrement(ECDY)
                        Notify(\_SB_.PCI0.LPC0.BAT1, 0x81)
                    }
                    If(LAnd(ECOK(), LEqual(ECDY, 0x0))) {
                        If(\_SB_.PCI0.LPC0.EC0_.BTCH) {
                            Store(0x2, Local0)
                        }
                        Else {
                            Store(0x1, Local0)
                        }
                        Sleep(0x14)
                        Store(\_SB_.PCI0.LPC0.EC0_.GAU0, Local2)
                        Sleep(0x14)
                        Store(\_SB_.PCI0.LPC0.EC0_.BPV0, Local3)
                        Sleep(0x14)
                        Store(\_SB_.PCI0.LPC0.EC0_.BFC0, Local1)
                        Sleep(0x14)
                        Store(Local2, Local4)
                        Multiply(Local2, Local1, Local2)
                        If(Local2) {
                            Divide(Local2, 0x64, Local6, Local2)
                            If(LNot(LGreater(Local4, 0x63))) {
                                Increment(Local2)
                            }
                        }
                        If(\_SB_.PCI0.LPC0.ACPW) {
                            If(LEqual(Local4, 0x64)) {
                                Store(0x0, Local0)
                            }
                        }
                        Store(Local0, Index(PBST, 0x0, ))
                        Store(0x0, Index(PBST, 0x1, ))
                        Store(Local2, Index(PBST, 0x2, ))
                        Store(Local3, Index(PBST, 0x3, ))
                    }
                    Return(PBST)
                }
            }
        }
        Name(NATA, Package(0x1) {
            0x001f0001,
        })
        Device(IDEC) {
            Name(_ADR, 0x001f0001)
            OperationRegion(IDEC, PCI_Config, 0x40, 0x18)
            Field(IDEC, DWordAcc, NoLock, Preserve) {
                PRIT,	16,
                SECT,	16,
                PSIT,	4,
                SSIT,	4,
                Offset(0x8),
                SDMA,	4,
                Offset(0xa),
                SDT0,	2,
                ,	2,
                SDT1,	2,
                Offset(0xb),
                SDT2,	2,
                ,	2,
                SDT3,	2,
                Offset(0x14),
                ICR0,	4,
                ICR1,	4,
                ICR2,	4,
                ICR3,	4,
                ICR4,	4,
                ICR5,	4
            }
            Method(GETP, 1) {
                Noop
                If(LEqual(And(Arg0, 0x9, ), 0x0)) {
                    Return(0xffffffff)
                }
                If(LEqual(And(Arg0, 0x9, ), 0x8)) {
                    Return(0x0384)
                }
                ShiftRight(And(Arg0, 0x0300, ), 0x8, Local0)
                ShiftRight(And(Arg0, 0x3000, ), 0xc, Local1)
                Return(Multiply(0x1e, Subtract(0x9, Add(Local0, Local1, ), ), ))
            }
            Method(GETD, 4) {
                Noop
                If(Arg0) {
                    If(Arg1) {
                        Return(0x14)
                    }
                    If(Arg2) {
                        Return(Multiply(Subtract(0x4, Arg3, ), 0xf, ))
                    }
                    Return(Multiply(Subtract(0x4, Arg3, ), 0x1e, ))
                }
                Return(0xffffffff)
            }
            Method(GETT, 1) {
                Noop
                Return(Multiply(0x1e, Subtract(0x9, Add(And(ShiftRight(Arg0, 0x2, ), 0x3, ), And(Arg0, 0x3, ), ), ), ))
            }
            Method(GETF, 3) {
                Noop
                Name(TMPF, 0x0)
                If(Arg0) {
                    Or(TMPF, 0x1, TMPF)
                }
                If(And(Arg2, 0x2, )) {
                    Or(TMPF, 0x2, TMPF)
                }
                If(Arg1) {
                    Or(TMPF, 0x4, TMPF)
                }
                If(And(Arg2, 0x20, )) {
                    Or(TMPF, 0x8, TMPF)
                }
                If(And(Arg2, 0x4000, )) {
                    Or(TMPF, 0x10, TMPF)
                }
                Return(TMPF)
            }
            Method(SETP, 3) {
                Noop
                If(LNot(LLess(Arg0, 0xf0))) {
                    Return(0x8)
                }
                Else {
                    If(And(Arg1, 0x2, )) {
                        If(LAnd(LNot(LGreater(Arg0, 0x78)), And(Arg2, 0x2, ))) {
                            Return(0x2301)
                        }
                        If(LAnd(LNot(LGreater(Arg0, 0xb4)), And(Arg2, 0x1, ))) {
                            Return(0x2101)
                        }
                    }
                    Return(0x1001)
                }
            }
            Method(SETD, 1) {
                Noop
                If(LNot(LGreater(Arg0, 0x14))) {
                    Return(0x1)
                }
                If(LNot(LGreater(Arg0, 0x1e))) {
                    Return(0x2)
                }
                If(LNot(LGreater(Arg0, 0x2d))) {
                    Return(0x1)
                }
                If(LNot(LGreater(Arg0, 0x3c))) {
                    Return(0x2)
                }
                If(LNot(LGreater(Arg0, 0x5a))) {
                    Return(0x1)
                }
                Return(0x0)
            }
            Method(SETT, 3) {
                Noop
                If(And(Arg1, 0x2, )) {
                    If(LAnd(LNot(LGreater(Arg0, 0x78)), And(Arg2, 0x2, ))) {
                        Return(0xb)
                    }
                    If(LAnd(LNot(LGreater(Arg0, 0xb4)), And(Arg2, 0x1, ))) {
                        Return(0x9)
                    }
                }
                Return(0x4)
            }
            Device(PRID) {
                Name(_ADR, 0x0)
                Method(_GTM) {
                    Noop
                    Name(PBUF, Buffer(0x14) {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 })
                    CreateDWordField(PBUF, 0x0, PIO0)
                    CreateDWordField(PBUF, 0x4, DMA0)
                    CreateDWordField(PBUF, 0x8, PIO1)
                    CreateDWordField(PBUF, 0xc, DMA1)
                    CreateDWordField(PBUF, 0x10, FLAG)
                    Store(GETP(PRIT), PIO0)
                    Store(GETD(And(SDMA, 0x1, ), And(ICR3, 0x1, ), And(ICR0, 0x1, ), SDT0), DMA0)
                    If(LEqual(DMA0, 0xffffffff)) {
                        Store(PIO0, DMA0)
                    }
                    If(And(PRIT, 0x4000, )) {
                        If(LEqual(And(PRIT, 0x90, ), 0x80)) {
                            Store(0x0384, PIO1)
                        }
                        Else {
                            Store(GETT(PSIT), PIO1)
                        }
                    }
                    Else {
                        Store(0xffffffff, PIO1)
                    }
                    Store(GETD(And(SDMA, 0x2, ), And(ICR3, 0x2, ), And(ICR0, 0x2, ), SDT1), DMA1)
                    If(LEqual(DMA1, 0xffffffff)) {
                        Store(PIO1, DMA1)
                    }
                    Store(GETF(And(SDMA, 0x1, ), And(SDMA, 0x2, ), PRIT), FLAG)
                    Return(PBUF)
                }
                Method(_STM, 3) {
                    Noop
                    CreateDWordField(Arg0, 0x0, PIO0)
                    CreateDWordField(Arg0, 0x4, DMA0)
                    CreateDWordField(Arg0, 0x8, PIO1)
                    CreateDWordField(Arg0, 0xc, DMA1)
                    CreateDWordField(Arg0, 0x10, FLAG)
                    Store(0x4, ICR2)
                    If(LEqual(SizeOf(Arg1), 0x0200)) {
                        And(PRIT, 0x4cf0, PRIT)
                        And(SDMA, 0xe, SDMA)
                        Store(0x0, SDT0)
                        And(ICR0, 0xe, ICR0)
                        And(ICR1, 0xe, ICR1)
                        And(ICR3, 0xe, ICR3)
                        And(ICR5, 0xe, ICR5)
                        CreateWordField(Arg1, 0x62, W490)
                        CreateWordField(Arg1, 0x6a, W530)
                        CreateWordField(Arg1, 0x7e, W630)
                        CreateWordField(Arg1, 0x80, W640)
                        CreateWordField(Arg1, 0xb0, W880)
                        Or(PRIT, 0x8004, PRIT)
                        If(LAnd(And(FLAG, 0x2, ), And(W490, 0x0800, ))) {
                            Or(PRIT, 0x2, PRIT)
                        }
                        Or(PRIT, SETP(PIO0, W530, W640), PRIT)
                        If(And(FLAG, 0x1, )) {
                            Or(SDMA, 0x1, SDMA)
                            Store(SETD(DMA0), SDT0)
                            If(And(W880, 0x20, )) {
                                Or(ICR1, 0x1, ICR1)
                                Or(ICR5, 0x1, ICR5)
                            }
                            If(And(W880, 0x10, )) {
                                Or(ICR1, 0x1, ICR1)
                            }
                            If(LLess(DMA0, 0x1e)) {
                                Or(ICR3, 0x1, ICR3)
                            }
                            If(LLess(DMA0, 0x3c)) {
                                Or(ICR0, 0x1, ICR0)
                            }
                        }
                    }
                    If(LEqual(SizeOf(Arg2), 0x0200)) {
                        And(PRIT, 0x3f0f, PRIT)
                        Store(0x0, PSIT)
                        And(SDMA, 0xd, SDMA)
                        Store(0x0, SDT1)
                        And(ICR0, 0xd, ICR0)
                        And(ICR1, 0xd, ICR1)
                        And(ICR3, 0xd, ICR3)
                        And(ICR5, 0xd, ICR5)
                        CreateWordField(Arg2, 0x62, W491)
                        CreateWordField(Arg2, 0x6a, W531)
                        CreateWordField(Arg2, 0x7e, W631)
                        CreateWordField(Arg2, 0x80, W641)
                        CreateWordField(Arg2, 0xb0, W881)
                        Or(PRIT, 0x8040, PRIT)
                        If(LAnd(And(FLAG, 0x8, ), And(W491, 0x0800, ))) {
                            Or(PRIT, 0x20, PRIT)
                        }
                        If(And(FLAG, 0x10, )) {
                            Or(PRIT, 0x4000, PRIT)
                            If(LGreater(PIO1, 0xf0)) {
                                Or(PRIT, 0x80, PRIT)
                            }
                            Else {
                                Or(PRIT, 0x10, PRIT)
                                Store(SETT(PIO1, W531, W641), PSIT)
                            }
                        }
                        If(And(FLAG, 0x4, )) {
                            Or(SDMA, 0x2, SDMA)
                            Store(SETD(DMA1), SDT1)
                            If(And(W881, 0x20, )) {
                                Or(ICR1, 0x2, ICR1)
                                Or(ICR5, 0x2, ICR5)
                            }
                            If(And(W881, 0x10, )) {
                                Or(ICR1, 0x2, ICR1)
                            }
                            If(LLess(DMA0, 0x1e)) {
                                Or(ICR3, 0x2, ICR3)
                            }
                            If(LLess(DMA0, 0x3c)) {
                                Or(ICR0, 0x2, ICR0)
                            }
                        }
                    }
                }
                Method(_PS0) {
                    Noop
                }
                Method(_PS3) {
                    Noop
                }
                Device(P_D0) {
                    Name(_ADR, 0x0)
                    Method(_GTF) {
                        Noop
                        Name(PIB0, Buffer(0xe) {0x3, 0x0, 0x0, 0x0, 0x0, 0xa0, 0xef, 0x3, 0x0, 0x0, 0x0, 0x0, 0xa0, 0xef })
                        CreateByteField(PIB0, 0x1, PMD0)
                        CreateByteField(PIB0, 0x8, DMD0)
                        If(And(PRIT, 0x2, )) {
                            If(LEqual(And(PRIT, 0x9, ), 0x8)) {
                                Store(0x8, PMD0)
                            }
                            Else {
                                Store(0xa, PMD0)
                                ShiftRight(And(PRIT, 0x0300, ), 0x8, Local0)
                                ShiftRight(And(PRIT, 0x3000, ), 0xc, Local1)
                                Add(Local0, Local1, Local2)
                                If(LEqual(0x3, Local2)) {
                                    Store(0xb, PMD0)
                                }
                                If(LEqual(0x5, Local2)) {
                                    Store(0xc, PMD0)
                                }
                            }
                        }
                        Else {
                            Store(0x1, PMD0)
                        }
                        If(And(SDMA, 0x1, )) {
                            Store(Or(SDT0, 0x40, ), DMD0)
                            If(And(ICR0, 0x1, )) {
                                Add(DMD0, 0x2, DMD0)
                            }
                            If(And(ICR3, 0x1, )) {
                                Store(0x45, DMD0)
                            }
                        }
                        Else {
                            Or(Subtract(And(PMD0, 0x7, ), 0x2, ), 0x20, DMD0)
                        }
                        Return(PIB0)
                    }
                }
                Device(P_D1) {
                    Name(_ADR, 0x1)
                    Method(_GTF) {
                        Noop
                        Name(PIB1, Buffer(0xe) {0x3, 0x0, 0x0, 0x0, 0x0, 0xb0, 0xef, 0x3, 0x0, 0x0, 0x0, 0x0, 0xb0, 0xef })
                        CreateByteField(PIB1, 0x1, PMD1)
                        CreateByteField(PIB1, 0x8, DMD1)
                        If(And(PRIT, 0x20, )) {
                            If(LEqual(And(PRIT, 0x90, ), 0x80)) {
                                Store(0x8, PMD1)
                            }
                            Else {
                                Add(And(PSIT, 0x3, ), ShiftRight(And(PSIT, 0xc, ), 0x2, ), Local0)
                                If(LEqual(0x5, Local0)) {
                                    Store(0xc, PMD1)
                                }
                                Else {
                                    If(LEqual(0x3, Local0)) {
                                        Store(0xb, PMD1)
                                    }
                                    Else {
                                        Store(0xa, PMD1)
                                    }
                                }
                            }
                        }
                        Else {
                            Store(0x1, PMD1)
                        }
                        If(And(SDMA, 0x2, )) {
                            Store(Or(SDT1, 0x40, ), DMD1)
                            If(And(ICR0, 0x2, )) {
                                Add(DMD1, 0x2, DMD1)
                            }
                            If(And(ICR3, 0x2, )) {
                                Store(0x45, DMD1)
                            }
                        }
                        Else {
                            Or(Subtract(And(PMD1, 0x7, ), 0x2, ), 0x20, DMD1)
                        }
                        Return(PIB1)
                    }
                }
            }
            Device(SECD) {
                Name(_ADR, 0x1)
                Method(_GTM) {
                    Noop
                    Name(SBUF, Buffer(0x14) {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 })
                    CreateDWordField(SBUF, 0x0, PIO0)
                    CreateDWordField(SBUF, 0x4, DMA0)
                    CreateDWordField(SBUF, 0x8, PIO1)
                    CreateDWordField(SBUF, 0xc, DMA1)
                    CreateDWordField(SBUF, 0x10, FLAG)
                    Store(GETP(SECT), PIO0)
                    Store(GETD(And(SDMA, 0x4, ), And(ICR3, 0x4, ), And(ICR0, 0x4, ), SDT2), DMA0)
                    If(LEqual(DMA0, 0xffffffff)) {
                        Store(PIO0, DMA0)
                    }
                    If(And(SECT, 0x4000, )) {
                        If(LEqual(And(SECT, 0x90, ), 0x80)) {
                            Store(0x0384, PIO1)
                        }
                        Else {
                            Store(GETT(SSIT), PIO1)
                        }
                    }
                    Else {
                        Store(0xffffffff, PIO1)
                    }
                    Store(GETD(And(SDMA, 0x8, ), And(ICR3, 0x8, ), And(ICR0, 0x8, ), SDT3), DMA1)
                    If(LEqual(DMA1, 0xffffffff)) {
                        Store(PIO1, DMA1)
                    }
                    Store(GETF(And(SDMA, 0x4, ), And(SDMA, 0x8, ), SECT), FLAG)
                    Return(SBUF)
                }
                Method(_STM, 3) {
                    Noop
                    CreateDWordField(Arg0, 0x0, PIO0)
                    CreateDWordField(Arg0, 0x4, DMA0)
                    CreateDWordField(Arg0, 0x8, PIO1)
                    CreateDWordField(Arg0, 0xc, DMA1)
                    CreateDWordField(Arg0, 0x10, FLAG)
                    Store(0x4, ICR2)
                    If(LEqual(SizeOf(Arg1), 0x0200)) {
                        And(SECT, 0x4cf0, SECT)
                        And(SDMA, 0xb, SDMA)
                        Store(0x0, SDT2)
                        And(ICR0, 0xb, ICR0)
                        And(ICR1, 0xb, ICR1)
                        And(ICR3, 0xb, ICR3)
                        And(ICR5, 0xb, ICR5)
                        CreateWordField(Arg1, 0x62, W490)
                        CreateWordField(Arg1, 0x6a, W530)
                        CreateWordField(Arg1, 0x7e, W630)
                        CreateWordField(Arg1, 0x80, W640)
                        CreateWordField(Arg1, 0xb0, W880)
                        Or(SECT, 0x8004, SECT)
                        If(LAnd(And(FLAG, 0x2, ), And(W490, 0x0800, ))) {
                            Or(SECT, 0x2, SECT)
                        }
                        Or(SECT, SETP(PIO0, W530, W640), SECT)
                        If(And(FLAG, 0x1, )) {
                            Or(SDMA, 0x4, SDMA)
                            Store(SETD(DMA0), SDT2)
                            If(And(W880, 0x20, )) {
                                Or(ICR1, 0x4, ICR1)
                                Or(ICR5, 0x4, ICR5)
                            }
                            If(And(W880, 0x10, )) {
                                Or(ICR1, 0x4, ICR1)
                            }
                            If(LLess(DMA0, 0x1e)) {
                                Or(ICR3, 0x4, ICR3)
                            }
                            If(LLess(DMA0, 0x3c)) {
                                Or(ICR0, 0x4, ICR0)
                            }
                        }
                    }
                    If(LEqual(SizeOf(Arg2), 0x0200)) {
                        And(SECT, 0x3f0f, SECT)
                        Store(0x0, SSIT)
                        And(SDMA, 0x7, SDMA)
                        Store(0x0, SDT3)
                        And(ICR0, 0x7, ICR0)
                        And(ICR1, 0x7, ICR1)
                        And(ICR3, 0x7, ICR3)
                        And(ICR5, 0x7, ICR5)
                        CreateWordField(Arg2, 0x62, W491)
                        CreateWordField(Arg2, 0x6a, W531)
                        CreateWordField(Arg2, 0x7e, W631)
                        CreateWordField(Arg2, 0x80, W641)
                        CreateWordField(Arg2, 0xb0, W881)
                        Or(SECT, 0x8040, SECT)
                        If(LAnd(And(FLAG, 0x8, ), And(W491, 0x0800, ))) {
                            Or(SECT, 0x20, SECT)
                        }
                        If(And(FLAG, 0x10, )) {
                            Or(SECT, 0x4000, SECT)
                            If(LGreater(PIO1, 0xf0)) {
                                Or(SECT, 0x80, SECT)
                            }
                            Else {
                                Or(SECT, 0x10, SECT)
                                Store(SETT(PIO1, W531, W641), SSIT)
                            }
                        }
                        If(And(FLAG, 0x4, )) {
                            Or(SDMA, 0x8, SDMA)
                            Store(SETD(DMA1), SDT3)
                            If(And(W881, 0x20, )) {
                                Or(ICR1, 0x8, ICR1)
                                Or(ICR5, 0x8, ICR5)
                            }
                            If(And(W881, 0x10, )) {
                                Or(ICR1, 0x8, ICR1)
                            }
                            If(LLess(DMA0, 0x1e)) {
                                Or(ICR3, 0x8, ICR3)
                            }
                            If(LLess(DMA0, 0x3c)) {
                                Or(ICR0, 0x8, ICR0)
                            }
                        }
                    }
                }
                Method(_PS0) {
                    Noop
                }
                Method(_PS3) {
                    Noop
                }
                Device(S_D0) {
                    Name(_ADR, 0x0)
                    Method(_GTF) {
                        Noop
                        Name(SIB0, Buffer(0xe) {0x3, 0x0, 0x0, 0x0, 0x0, 0xa0, 0xef, 0x3, 0x0, 0x0, 0x0, 0x0, 0xa0, 0xef })
                        CreateByteField(SIB0, 0x1, PMD0)
                        CreateByteField(SIB0, 0x8, DMD0)
                        If(And(SECT, 0x2, )) {
                            If(LEqual(And(SECT, 0x9, ), 0x8)) {
                                Store(0x8, PMD0)
                            }
                            Else {
                                Store(0xa, PMD0)
                                ShiftRight(And(SECT, 0x0300, ), 0x8, Local0)
                                ShiftRight(And(SECT, 0x3000, ), 0xc, Local1)
                                Add(Local0, Local1, Local2)
                                If(LEqual(0x3, Local2)) {
                                    Store(0xb, PMD0)
                                }
                                If(LEqual(0x5, Local2)) {
                                    Store(0xc, PMD0)
                                }
                            }
                        }
                        Else {
                            Store(0x1, PMD0)
                        }
                        If(And(SDMA, 0x4, )) {
                            Store(Or(SDT2, 0x40, ), DMD0)
                            If(And(ICR0, 0x4, )) {
                                Add(DMD0, 0x2, DMD0)
                            }
                            If(And(ICR3, 0x4, )) {
                                Store(0x45, DMD0)
                            }
                        }
                        Else {
                            Or(Subtract(And(PMD0, 0x7, ), 0x2, ), 0x20, DMD0)
                        }
                        Return(SIB0)
                    }
                }
                Device(S_D1) {
                    Name(_ADR, 0x1)
                    Method(_GTF) {
                        Noop
                        Name(SIB1, Buffer(0xe) {0x3, 0x0, 0x0, 0x0, 0x0, 0xb0, 0xef, 0x3, 0x0, 0x0, 0x0, 0x0, 0xb0, 0xef })
                        CreateByteField(SIB1, 0x1, PMD1)
                        CreateByteField(SIB1, 0x8, DMD1)
                        If(And(SECT, 0x20, )) {
                            If(LEqual(And(SECT, 0x90, ), 0x80)) {
                                Store(0x8, PMD1)
                            }
                            Else {
                                Add(And(SSIT, 0x3, ), ShiftRight(And(SSIT, 0xc, ), 0x2, ), Local0)
                                If(LEqual(0x5, Local0)) {
                                    Store(0xc, PMD1)
                                }
                                Else {
                                    If(LEqual(0x3, Local0)) {
                                        Store(0xb, PMD1)
                                    }
                                    Else {
                                        Store(0xa, PMD1)
                                    }
                                }
                            }
                        }
                        Else {
                            Store(0x1, PMD1)
                        }
                        If(And(SDMA, 0x2, )) {
                            Store(Or(SDT3, 0x40, ), DMD1)
                            If(And(ICR0, 0x8, )) {
                                Add(DMD1, 0x2, DMD1)
                            }
                            If(And(ICR3, 0x8, )) {
                                Store(0x45, DMD1)
                            }
                        }
                        Else {
                            Or(Subtract(And(PMD1, 0x7, ), 0x2, ), 0x20, DMD1)
                        }
                        Return(SIB1)
                    }
                }
            }
        }
        Device(USB1) {
            Name(_ADR, 0x001d0000)
            OperationRegion(USBO, PCI_Config, 0xc4, 0x4)
            Field(USBO, DWordAcc, Lock, Preserve) {
                RSEN,	2
            }
            Name(_PRW, Package(0x2) {
                0x3,
                0x3,
            })
            Method(_PSW, 1) {
                If(Arg0) {
                    Store(0x3, RSEN)
                }
                Else {
                    Store(0x0, RSEN)
                }
            }
            Method(_S1D) {
                Return(0x2)
            }
            Method(_S3D) {
                Return(0x2)
            }
            Method(_S4D) {
                Return(0x2)
            }
        }
        Device(USB2) {
            Name(_ADR, 0x001d0001)
            OperationRegion(USBO, PCI_Config, 0xc4, 0x4)
            Field(USBO, DWordAcc, Lock, Preserve) {
                RSEN,	2
            }
            Name(_PRW, Package(0x2) {
                0x4,
                0x3,
            })
            Method(_PSW, 1) {
                If(Arg0) {
                    Store(0x3, RSEN)
                }
                Else {
                    Store(0x0, RSEN)
                }
            }
            Method(_S1D) {
                Return(0x2)
            }
            Method(_S3D) {
                Return(0x2)
            }
            Method(_S4D) {
                Return(0x2)
            }
        }
        Device(USB3) {
            Name(_ADR, 0x001d0002)
            OperationRegion(USBO, PCI_Config, 0xc4, 0x4)
            Field(USBO, DWordAcc, Lock, Preserve) {
                RSEN,	2
            }
            Name(_PRW, Package(0x2) {
                0xc,
                0x3,
            })
            Method(_PSW, 1) {
                If(Arg0) {
                    Store(0x3, RSEN)
                }
                Else {
                    Store(0x0, RSEN)
                }
            }
            Method(_S1D) {
                Return(0x2)
            }
            Method(_S3D) {
                Return(0x2)
            }
            Method(_S4D) {
                Return(0x2)
            }
        }
        Device(EUSB) {
            Name(_ADR, 0x001d0007)
            Name(_S1D, 0x2)
            Name(_S3D, 0x2)
            Name(_S4D, 0x2)
            Name(_PRW, Package(0x2) {
                0xd,
                0x3,
            })
        }
        Device(SMBS) {
            Name(_ADR, 0x001f0003)
        }
        Device(AUDI) {
            Name(_ADR, 0x001f0005)
            Method(_S1D) {
                Return(0x2)
            }
            Method(_S3D) {
                Return(0x2)
            }
            Method(_S4D) {
                Return(0x2)
            }
        }
        Device(MODM) {
            Name(_ADR, 0x001f0006)
            Name(_PRW, Package(0x2) {
                0x5,
                0x3,
            })
        }
    }
}

}
/*
BOOT: Length=40, Revision=1, Checksum=59,
	OEMID=INSYDE, OEM Table ID=BOOT_000, OEM Revision=0x1,
	Creator ID=_CSI, Creator Revision=0x10101
 */
/*
DBGP: Length=52, Revision=1, Checksum=148,
	OEMID=INSYDE, OEM Table ID=DBGP_000, OEM Revision=0x1,
	Creator ID=_CSI, Creator Revision=0x10101
 */
/*
APIC: Length=90, Revision=1, Checksum=115,
	OEMID=INSYDE, OEM Table ID=APIC_000, OEM Revision=0x30303030,
	Creator ID=0000, Creator Revision=0x30303030
 */
/*
SSDT: Length=666, Revision=1, Checksum=209,
	OEMID=INSYDE, OEM Table ID=GV3Ref, OEM Revision=0x2000,
	Creator ID=INTL, Creator Revision=0x20021002
 */
