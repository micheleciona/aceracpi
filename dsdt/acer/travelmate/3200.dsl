/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of 3200.asl, Tue Jul 31 14:55:56 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000047D0 (18384)
 *     Revision         0x01
 *     OEM ID           "ACER  "
 *     OEM Table ID     "Kestrel "
 *     OEM Revision     0x20020803 (537004035)
 *     Creator ID       "INTL"
 *     Creator Revision 0x20050902 (537200898)
 */
DefinitionBlock ("3200.aml", "DSDT", 1, "ACER  ", "Kestrel ", 0x20020803)
{
    OperationRegion (PORT, SystemIO, 0x80, 0x02)
    Field (PORT, ByteAcc, NoLock, Preserve)
    {
        P80H,   8, 
        P81H,   8
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
        TRP0,   8
    }

    OperationRegion (MNVS, SystemMemory, 0x1DEECE59, 0x60)
    Field (MNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        SCIF,   8, 
        PAR1,   8, 
        PAR2,   8, 
        ACPS,   8, 
        DBGS,   8, 
        DCKS,   4, 
        CDCK,   4, 
        IGDS,   8, 
        SLID,   8, 
        BRTC,   8, 
        BRTS,   8, 
        WRKF,   8, 
        SW2L,   1, 
        PNCS,   1, 
                Offset (0x0F), 
        PRID,   8, 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
        FDCP,   8, 
                Offset (0x15), 
        PS2F,   8, 
                Offset (0x18), 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
                Offset (0x20), 
        BVAL,   32, 
        DOFF,   8, 
        TMP1,   8, 
        TMP2,   8, 
        SVCR,   8, 
        TMP4,   32, 
        TMP5,   32, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        CADL,   16, 
        PADL,   16, 
        BCAP,   8
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06)
        {
            Name (_PCT, Package (0x02)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x00000000000000B2, // Address
                        ,)
                }, 

                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x00000000000000B3, // Address
                        ,)
                }
            })
            Method (_PPC, 0, NotSerialized)
            {
                Return (Zero)
            }
        }
    }

    Name (DSEN, One)
    Scope (_SI)
    {
        Method (_MSG, 1, NotSerialized)
        {
            If (Arg0)
            {
                Store (One, \_SB.PCI0.LPC0.BL27)
            }
            Else
            {
                Store (Zero, \_SB.PCI0.LPC0.BL27)
            }
        }
    }

    Name (_S0, Package (0x02)
    {
        Zero, 
        Zero
    })
    Name (_S3, Package (0x02)
    {
        0x05, 
        0x05
    })
    Name (_S4, Package (0x02)
    {
        0x06, 
        0x06
    })
    Name (_S5, Package (0x02)
    {
        0x07, 
        0x07
    })
    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, \_SB.STAT)
        Store (">>>> _PTS ------------", Debug)
        Store (Arg0, Debug)
        Store (Arg0, \_SB.SLEE)
        Store (0x84, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        If (Or (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            Store (One, \_SB.PCI0.LPC0.EC0.APWR)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0xE6, P80H)
            Store (0x80, \_SB.PCI0.LPC0.BCMD)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
            Store (0xE7, P80H)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (One, \_SB.S4WP)
            Store (0x82, \_SB.PCI0.LPC0.BCMD)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
            Store (One, \_SB.PCI0.LPC0.EC0.PFLG)
            Store (One, \_SB.PCI0.LPC0.EC0.S4LD)
        }

        If (LEqual (SizeOf (_OS), 0x27)) {}
        If (LEqual (Arg0, 0x05))
        {
            Store (One, \_SB.PCI0.LPC0.EC0.S5LW)
            Store (Zero, \_SB.ECOK)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (Arg0, \_SB.STAT)
        If (Or (LEqual (\_SB.PCI0.MYOS, 0x03), LEqual (\_SB.PCI0.MYOS, One)))
        {
            Store (\_SB.WLES, \_SB.PCI0.LPC0.EC0.WEST)
            Store (\_SB.BTES, \_SB.PCI0.LPC0.EC0.BEST)
            Store (One, \_SB.PCI0.LPC0.EC0.WBIN)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (One, \_SB.OKEC)
            Notify (\_SB.SLPB, 0x02)
        }

        If (LEqual (SizeOf (_OS), 0x14))
        {
            Store (0xE4, P80H)
            Store (0xE5, P80H)
        }

        If (LEqual (SizeOf (_OS), 0x27)) {}
        Store (\_SB.PCI0.LPC0.EC0.ACDF, \_SB.ACST)
        If (LEqual (SizeOf (_OS), 0x11))
        {
            Notify (\_SB.SLPB, 0x02)
        }

        Store (Zero, \_SB.SLEE)
    }

    Scope (_GPE)
    {
        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MDM0, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PCIB, Zero)
            If (Or (LEqual (\_SB.PCI0.MYOS, One), LEqual (\_SB.PCI0.MYOS, 0x03)))
            {
                Notify (\_SB.SLPB, 0x02)
            }
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB3, 0x02)
        }

        Method (_E18, 0, NotSerialized)
        {
            Sleep (One)
        }
    }

    Scope (_SB)
    {
        Name (STAT, Zero)
        Name (D1ST, Zero)
        Name (D1SJ, One)
        Name (OKEC, Zero)
        Device (PCI0)
        {
            Name (MYOS, 0x02)
            Method (_INI, 0, NotSerialized)
            {
                Store (One, D1SJ)
                Store (0x02, MYOS)
                If (LEqual (SizeOf (_OS), 0x14))
                {
                    Store (One, MYOS)
                    Store (0x07D0, OSYS)
                    Store (One, W2KF)
                    If (CondRefOf (_OSI, Local0))
                    {
                        If (_OSI ("Windows 2001"))
                        {
                            Store (0x03, MYOS)
                            Store (0x07D1, OSYS)
                            Store (0x03, W2KF)
                        }
                    }
                }
                Else
                {
                    If (LEqual (SizeOf (_OS), 0x11))
                    {
                        Store (Zero, MYOS)
                        Store (0x07CE, OSYS)
                        Store (Zero, W2KF)
                    }
                    Else
                    {
                        If (LEqual (SizeOf (_OS), 0x27))
                        {
                            Store (0x02, MYOS)
                            Store (0x07CF, OSYS)
                            Store (0x02, W2KF)
                        }
                    }
                }
            }

            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, Zero)
            Name (_BBN, Zero)
            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                        Offset (0x18), 
                    ,   7, 
                HENA,   1, 
                    ,   4, 
                PM0H,   2, 
                        Offset (0x1A), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                        Offset (0x1B), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                        Offset (0x1C), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                        Offset (0x1D), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                        Offset (0x1E), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                        Offset (0x1F), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                        Offset (0x20)
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, 0x80, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, One))
                {
                    CreateBitField (BUF0, 0x0378, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, 0x9B, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._MIN, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, 0xB6, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, One))
                {
                    CreateBitField (BUF0, 0x0528, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, 0xD1, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, One))
                {
                    CreateBitField (BUF0, 0x0600, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, 0xEC, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, One))
                {
                    CreateBitField (BUF0, 0x06D8, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._RW, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._MAX, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._GRA, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, One))
                {
                    CreateBitField (BUF0, 0x0888, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, 0x013D, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, One))
                {
                    CreateBitField (BUF0, 0x0960, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, 0x0158, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, One))
                {
                    CreateBitField (BUF0, 0x0A38, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, 0x0173, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._TRA, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._MIN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, One))
                {
                    CreateBitField (BUF0, 0x0BE8, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, 0x01A9, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, One))
                {
                    CreateBitField (BUF0, 0x0CC0, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, 0x01C4, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, One))
                {
                    CreateBitField (BUF0, 0x0D98, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, 0x01D3, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y06._RW, M1MX)
                CreateDWordField (BUF0, 0x01DF, M1LN)
                Multiply (0x02000000, ^MBUS.DRB3, M1MN)
                Add (Subtract (M1MX, M1MN), One, M1LN)
                ShiftRight (And (^LPC0.MTSE, 0x0380), 0x07, Local0)
                If (And (Local0, 0x04))
                {
                    CreateDWordField (BUF0, 0x01EE, M2MN)
                    CreateDWordField (BUF0, 0x01F2, M2MX)
                    CreateDWordField (BUF0, 0x01FA, M2LN)
                    Store (0xFED00000, M2MN)
                    Store (0xFED003FF, M2MX)
                    Store (0x0400, M2LN)
                    If (LEqual (Local0, 0x05))
                    {
                        Store (0xFED01000, M2MN)
                        Store (0xFED013FF, M2MX)
                    }

                    If (LEqual (Local0, 0x06))
                    {
                        Store (0xFED02000, M2MN)
                        Store (0xFED023FF, M2MX)
                    }

                    If (LEqual (Local0, 0x07))
                    {
                        Store (0xFED03000, M2MN)
                        Store (0xFED033FF, M2MX)
                    }
                }

                Return (BUF0)
            }

            Method (_PRT, 0, NotSerialized)
            {
                Return (Package (0x07)
                {
                    Package (0x04)
                    {
                        0x0002FFFF, 
                        Zero, 
                        ^LPC0.LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        Zero, 
                        ^LPC0.LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        One, 
                        ^LPC0.LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x02, 
                        ^LPC0.LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x03, 
                        ^LPC0.LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        Zero, 
                        ^LPC0.LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        One, 
                        ^LPC0.LNKB, 
                        Zero
                    }
                })
            }

            Device (MBUS)
            {
                Name (_ADR, One)
                OperationRegion (MBUS, PCI_Config, 0x40, 0xC0)
                Field (MBUS, DWordAcc, NoLock, Preserve)
                {
                    DRB0,   8, 
                    DRB1,   8, 
                    DRB2,   8, 
                    DRB3,   8
                }
            }

            Device (GFX0)
            {
                Name (_ADR, 0x00020000)
                OperationRegion (VNVS, SystemMemory, 0x1DEECEB9, 0x00010004)
                Field (VNVS, AnyAcc, Lock, Preserve)
                {
                    RSIZ,   32, 
                    RBUF,   524288
                }

                OperationRegion (LBPR, PCI_Config, 0xF4, 0x04)
                Field (LBPR, AnyAcc, NoLock, Preserve)
                {
                    LBBC,   8
                }

                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x03), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x04)
                    {
                        0x00010100, 
                        0x00010200, 
                        0x00010300, 
                        0x00010400
                    })
                }

                Method (_ROM, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg1, Local1)
                    If (LGreater (Local1, 0x1000))
                    {
                        Store (0x1000, Local1)
                    }

                    If (LGreater (Add (Local0, Local1), RSIZ))
                    {
                        Store (Zero, Local0)
                    }

                    Multiply (Local0, 0x08, Local2)
                    Multiply (Local1, 0x08, Local3)
                    Name (ROM1, Buffer (RSIZ) {})
                    Name (ROM2, Buffer (Local1) {})
                    Store (RBUF, ROM1)
                    CreateField (ROM1, Local2, Local3, TMPB)
                    Store (TMPB, ROM2)
                    Return (ROM2)
                }

                Device (CRT1)
                {
                    Name (_ADR, 0x0100)
                    Name (_PSC, Zero)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (Zero, _PSC)
                    }

                    Method (_PS1, 0, NotSerialized)
                    {
                        Store (One, _PSC)
                    }

                    Method (_PS2, 0, NotSerialized)
                    {
                        Store (0x02, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (One, SMIF)
                        Store (Zero, TRP0)
                        If (And (CSTE, 0x0101))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0101))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DTV1)
                {
                    Name (_ADR, 0x0200)
                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (One, SMIF)
                        Store (Zero, TRP0)
                        If (And (CSTE, 0x0202))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0202))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DFP1)
                {
                    Name (_ADR, 0x0300)
                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (One, SMIF)
                        Store (Zero, TRP0)
                        If (And (CSTE, 0x0404))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0404))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (LCD)
                {
                    Name (_ADR, 0x0400)
                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (One, SMIF)
                        Store (Zero, TRP0)
                        If (And (CSTE, 0x0808))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0808))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }

                    Method (_BCL, 0, NotSerialized)
                    {
                        Return (Package (0x08)
                        {
                            0x50, 
                            0x3C, 
                            Zero, 
                            0x14, 
                            0x28, 
                            0x3C, 
                            0x50, 
                            0x64
                        })
                    }

                    Method (_BCM, 1, NotSerialized)
                    {
                        Store (Arg0, P80H)
                    }
                }
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)
                Device (GLAN)
                {
                    Name (_ADR, 0x00020000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x05
                    })
                }

                Device (MPCI)
                {
                    Name (_ADR, 0x00040000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Device (T394)
                {
                    Name (_ADR, 0x00060002)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    Return (Package (0x06)
                    {
                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            ^^LPC0.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            Zero, 
                            ^^LPC0.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            One, 
                            ^^LPC0.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            Zero, 
                            ^^LPC0.LNKE, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            One, 
                            ^^LPC0.LNKF, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            ^^LPC0.LNKG, 
                            Zero
                        }
                    })
                }
            }

            Method (HKDS, 1, Serialized)
            {
                If (LEqual (Zero, DSEN))
                {
                    Store (Arg0, SMIF)
                    Store (Zero, TRP0)
                    If (LEqual (SMIF, Zero))
                    {
                        If (LOr (LNotEqual (CADL, PADL), LEqual (NSTE, One)))
                        {
                            Store (CADL, PADL)
                            If (LEqual (OSYS, 0x07D1))
                            {
                                Notify (PCI0, Zero)
                            }
                            Else
                            {
                                Notify (GFX0, Zero)
                            }

                            Sleep (0x02EE)
                        }

                        Notify (GFX0, 0x80)
                    }
                }

                If (LEqual (One, DSEN))
                {
                    Store (Increment (Arg0), SMIF)
                    Store (Zero, TRP0)
                    If (LEqual (SMIF, Zero))
                    {
                        Notify (GFX0, 0x81)
                    }
                }

                If (LEqual (0x02, DSEN)) {}
            }

            Device (LPC0)
            {
                Name (_ADR, 0x001F0000)
                Method (DECD, 4, NotSerialized)
                {
                    Store (Arg0, Debug)
                }

                OperationRegion (REGS, PCI_Config, 0x40, 0xC0)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    PMBA,   16, 
                            Offset (0x18), 
                    GPBA,   16, 
                            Offset (0x90), 
                    POSD,   1, 
                            Offset (0x91), 
                    MTSE,   16, 
                            Offset (0x94), 
                            Offset (0xA0), 
                    CMAD,   3, 
                        ,   1, 
                    CMBD,   3, 
                            Offset (0xA1), 
                    LPTD,   2, 
                        ,   2, 
                    FDDD,   1, 
                            Offset (0xA6), 
                    ECO1,   1, 
                    ECO2,   1, 
                    ELPT,   1, 
                    EFDD,   1
                }

                OperationRegion (PIRX, PCI_Config, 0x60, 0x0C)
                Field (PIRX, DWordAcc, NoLock, Preserve)
                {
                            AccessAs (ByteAcc, 0x00), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                            Offset (0x08), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (And (MTSE, 0x0200))
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (And (MTSE, 0x0200))
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0093,             // Range Minimum
                            0x0093,             // Range Maximum
                            0x01,               // Alignment
                            0x0D,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (MBRD)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x1F)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x164E,             // Range Minimum
                            0x164E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0600,             // Range Minimum
                            0x0600,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0700,             // Range Minimum
                            0x0700,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1180,             // Range Minimum
                            0x1180,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        IO (Decode16,
                            0x01C0,             // Range Minimum
                            0x01C0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x006C,             // Range Minimum
                            0x006C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0610,             // Range Minimum
                            0x0610,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x006C,             // Range Minimum
                            0x006C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEC10000,         // Address Base
                            0x00010000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFF800000,         // Address Base
                            0x00400000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFFF00000,         // Address Base
                            0x00100000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x000A0000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x000DF800,         // Address Base
                            0x00000800,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00100000,         // Address Base
                            0x00000000,         // Address Length
                            )
                    })
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF800000,         // Address Base
                            0x00800000,         // Address Length
                            )
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y07)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        ShiftRight (And (MTSE, 0x0380), 0x07, Local0)
                        If (LEqual (OSYS, 0x07D1))
                        {
                            If (And (Local0, 0x04))
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            If (And (Local0, 0x04))
                            {
                                Return (0x0B)
                            }
                        }

                        Return (Zero)
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        ShiftRight (And (MTSE, 0x0380), 0x07, Local0)
                        If (And (Local0, 0x04))
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPC0.HPET._Y07._BAS, HPT0)
                            If (LEqual (Local0, 0x05))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (Local0, 0x06))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (Local0, 0x07))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
                    }
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, One)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRA)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLA, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLA, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PIRA, 0x0F), IRQ0)
                        Return (RTLA)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRA)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRA, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRB)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLB, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLB, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PIRB, 0x0F), IRQ0)
                        Return (RTLB)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRB)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRB, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLC, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLC, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PIRC, 0x0F), IRQ0)
                        Return (RTLC)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRD)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLD, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLD, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PIRD, 0x0F), IRQ0)
                        Return (RTLD)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRD)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRD, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRE)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLE, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLE, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PIRE, 0x0F), IRQ0)
                        Return (RTLE)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRE)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRE, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRF)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLF, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLF, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PIRF, 0x0F), IRQ0)
                        Return (RTLF)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRF)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRF, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRG)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {6}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLG, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLG, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PIRG, 0x0F), IRQ0)
                        Return (RTLG)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRG)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRG, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PIRH)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLH, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLH, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PIRH, 0x0F), IRQ0)
                        Return (RTLH)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRH)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PIRH, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                OperationRegion (GPOX, SystemIO, 0x1180, 0x40)
                Field (GPOX, DWordAcc, Lock, Preserve)
                {
                            Offset (0x07), 
                        ,   1, 
                    IO25,   1, 
                        ,   1, 
                    IO27,   1, 
                            Offset (0x0E), 
                    LV16,   1, 
                    LV17,   1, 
                            Offset (0x0F), 
                        ,   1, 
                    LV25,   1, 
                        ,   1, 
                    LV27,   1, 
                            Offset (0x1B), 
                        ,   1, 
                    BL25,   1, 
                        ,   1, 
                    BL27,   1, 
                            Offset (0x38), 
                    RBID,   2, 
                    MBTP,   3, 
                    LV37,   1, 
                    LV38,   1, 
                    LV39,   1
                }

                OperationRegion (PMIO, SystemIO, 0x1000, 0x51)
                Field (PMIO, WordAcc, Lock, Preserve)
                {
                            AccessAs (DWordAcc, 0x00), 
                            Offset (0x29), 
                        ,   3, 
                    PMES,   1, 
                            Offset (0x2B), 
                        ,   3, 
                    PMEE,   1, 
                            Offset (0x2C), 
                    GPI0,   1, 
                    GPI1,   1, 
                    GPI2,   1, 
                    GPI3,   1, 
                    GPI4,   1, 
                    GPI5,   1, 
                    GPI6,   1, 
                    GPI7,   1, 
                    GPI8,   1, 
                    GPI9,   1, 
                    GPIA,   1, 
                    GPIB,   1, 
                    GPIC,   1, 
                    GPID,   1, 
                    GPIE,   1, 
                    GPIF,   1, 
                        ,   6, 
                    GPEE,   1
                }

                Device (KBC)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (MOUE)
                {
                    Name (_HID, EisaId ("IBM3780"))
                    Name (_CID, 0x03102E4F)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (SizeOf (_OS), 0x14))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            If (PS2F)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Device (MOU2)
                {
                    Name (_HID, EisaId ("SYN1003"))
                    Name (_CID, Package (0x03)
                    {
                        0x02102E4F, 
                        0x00102E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (SizeOf (_OS), 0x14))
                        {
                            If (PS2F)
                            {
                                Store (PS2F, Local0)
                                Return (0x0F)
                            }
                            Else
                            {
                                Store (PS2F, Local0)
                                Return (Zero)
                            }
                        }
                        Else
                        {
                            Store (PS2F, Local0)
                            Return (Zero)
                        }
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Name (_GPE, 0x1D)
                    Name (OSEJ, Zero)
                    Device (SMBC)
                    {
                        Name (_HID, "ACPI0001")
                        Name (_EC, 0x1820)
                        Device (SBS0)
                        {
                            Name (_HID, "ACPI0002")
                            Name (_SBS, One)
                        }
                    }

                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, OKEC)
                            Store (Arg1, ECOK)
                            If (Or (LEqual (MYOS, 0x03), LEqual (MYOS, One)))
                            {
                                If (Arg1)
                                {
                                    Store (One, RG57)
                                }

                                Store (WLES, WEST)
                                Store (BTES, BEST)
                                Store (One, WBIN)
                                Store (DOFF, TMOF)
                            }
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x04), 
                        CMCM,   8, 
                        CMD1,   8, 
                        CMD2,   8, 
                        CMD3,   8, 
                                Offset (0x18), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   256, 
                        BCNT,   8, 
                        SMAA,   8, 
                        BATD,   16, 
                        ACDF,   1, 
                                Offset (0x41), 
                            ,   4, 
                        FPR1,   1, 
                        S4LD,   1, 
                        S5LW,   1, 
                        PFLG,   1, 
                                Offset (0x43), 
                        TMSS,   2, 
                            ,   2, 
                        BANK,   4, 
                                Offset (0x45), 
                        VFAN,   1, 
                                Offset (0x46), 
                        RL01,   1, 
                        RD01,   1, 
                        RF01,   1, 
                        RP01,   1, 
                        RB01,   1, 
                        RC01,   1, 
                            ,   1, 
                        R701,   1, 
                        R801,   1, 
                        RM01,   1, 
                        RI01,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        RA01,   1, 
                        RR01,   1, 
                        RL10,   1, 
                        RD10,   1, 
                        RF10,   1, 
                        RP10,   1, 
                        RB10,   1, 
                        RC10,   1, 
                            ,   1, 
                        R710,   1, 
                        R810,   1, 
                        RM10,   1, 
                        RI10,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        RA10,   1, 
                        RR10,   1, 
                        LIDE,   1, 
                        DB2E,   1, 
                        RPTE,   1, 
                        WP01,   1, 
                        WB01,   1, 
                        WC01,   1, 
                            ,   1, 
                        W701,   1, 
                        W801,   1, 
                        WM01,   1, 
                        WI01,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        WA01,   1, 
                        WR01,   1, 
                        LIDS,   1, 
                        DB2S,   1, 
                        RPTS,   1, 
                        WP10,   1, 
                        WB10,   1, 
                        WC10,   1, 
                            ,   1, 
                        W710,   1, 
                        W810,   1, 
                        WM10,   1, 
                        WI10,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        WA10,   1, 
                        WR10,   1, 
                            ,   1, 
                        BAYE,   1, 
                        EFDE,   1, 
                        PRDE,   1, 
                        BRBE,   1, 
                        ADIM,   1, 
                            ,   1, 
                        W7BE,   1, 
                        W8BE,   1, 
                        PMEE,   1, 
                        INTE,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        DB3E,   1, 
                                Offset (0x52), 
                            ,   1, 
                        BAYS,   1, 
                        EFDS,   1, 
                        PRDS,   1, 
                        BRBS,   1, 
                        CRTS,   1, 
                            ,   1, 
                        W7BS,   1, 
                        TMOF,   8, 
                                Offset (0x57), 
                        RG57,   8, 
                        CTMP,   8, 
                        RG59,   8, 
                        RG5A,   8, 
                        RG5B,   8, 
                        FSPD,   16, 
                                Offset (0x5F), 
                        WEST,   1, 
                        BEST,   1, 
                        WBIN,   1, 
                                Offset (0x60), 
                            ,   1, 
                        FANC,   1, 
                                Offset (0x70), 
                        MBID,   8, 
                        MBTS,   1, 
                        MBTF,   1, 
                                Offset (0x72), 
                        MBTC,   1, 
                                Offset (0x77), 
                        BA1C,   8, 
                        MBVG,   16, 
                        MCUR,   16, 
                                Offset (0x80), 
                        SBID,   8, 
                        SBTS,   1, 
                        SBTF,   1, 
                                Offset (0x82), 
                        SBTC,   1, 
                                Offset (0x87), 
                        BA2C,   8, 
                        ABVG,   16, 
                        ACUR,   16, 
                                Offset (0xC3), 
                        MBRM,   16, 
                                Offset (0xCA), 
                        ABRM,   16, 
                                Offset (0xD0), 
                        EBPL,   1, 
                                Offset (0xD2), 
                            ,   6, 
                        APWR,   1, 
                                Offset (0xD6), 
                        DBPL,   8, 
                                Offset (0xE7), 
                        GQKS,   7
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD0,   64
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD1,   128
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD2,   192
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD3,   256
                    }

                    Method (BPOL, 1, NotSerialized)
                    {
                        Store (Arg0, DBPL)
                        Store (One, EBPL)
                    }

                    Name (ECUS, Zero)
                    Method (_Q0D, 0, NotSerialized)
                    {
                        Store ("Sleep Button Query: Fn+F4", Debug)
                        Notify (SLPB, 0x80)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                        Store ("Switch Display: Fn+F5", Debug)
                        If (IGDS)
                        {
                            Store (One, PAR2)
                            HKDS (0x10)
                        }
                    }

                    Name (DSID, One)
                    Name (SDST, Zero)
                    Method (_Q0F, 0, NotSerialized)
                    {
                        Store ("NMB Switch Display: Ny NMB Utility", Debug)
                        If (IGDS)
                        {
                            Store (DISD, Local0)
                            If (LEqual (Local0, DSID))
                            {
                                Store (Increment (SDST), SDST)
                            }
                            Else
                            {
                                Store (Zero, SDST)
                            }

                            If (LLessEqual (SDST, 0x06))
                            {
                                If (LEqual (Local0, One))
                                {
                                    Store (0x0909, CSTE)
                                    Store (0x0808, NSTE)
                                    Store (0x02, PAR2)
                                    HKDS (0x10)
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x02))
                                    {
                                        Store (0x0808, CSTE)
                                        Store (0x0101, NSTE)
                                        Store (0x03, PAR2)
                                        HKDS (0x10)
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x03))
                                        {
                                            Store (0x0101, CSTE)
                                            Store (0x0909, NSTE)
                                            Store (0x04, PAR2)
                                            HKDS (0x10)
                                        }
                                        Else
                                        {
                                            Store (0x0909, CSTE)
                                            Store (0x0808, NSTE)
                                            Store (0x04, PAR2)
                                            HKDS (0x10)
                                        }
                                    }
                                }
                            }

                            Store (Local0, DSID)
                        }
                    }

                    Method (_Q13, 0, NotSerialized)
                    {
                        Store ("Brightness Up: Fn+->", Debug)
                        Store (0x8C, BCMD)
                        Store (Zero, SMIC)
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store ("Brightness Down: Fn+<-", Debug)
                        Store (0x8D, BCMD)
                        Store (Zero, SMIC)
                    }

                    Method (_Q80, 0, NotSerialized)
                    {
                        Store ("Temperature increasing: _Q80", Debug)
                        Notify (\_TZ.THRM, 0x80)
                    }

                    Method (_Q81, 0, NotSerialized)
                    {
                        Store ("Temperature decreasing: _Q81", Debug)
                        Notify (\_TZ.THRM, 0x80)
                    }

                    Event (EJT1)
                    Method (_Q8A, 0, NotSerialized)
                    {
                        Mutex (MUT0, 0x00)
                        Mutex (MUT1, 0x00)
                        Store ("------------------_Q0x8A --------------------------------------", Debug)
                        If (LIDE)
                        {
                            Store (One, LIDE)
                            Notify (LID, 0x80)
                        }

                        If (DB2E)
                        {
                            Store ("-------- Device R-Bay Event ------", Debug)
                            Store (One, DB2E)
                            Store (0xB1, P80H)
                        }
                    }
                }

                OperationRegion (SMI0, SystemIO, 0xFE00, 0x02)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x1DEFCEBD, 0x90)
                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    BCMD,   8, 
                    DID,    32, 
                    INFO,   1024
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            AccessAs (ByteAcc, 0x00), 
                            Offset (0x05), 
                    INF,    8
                }
            }

            Device (MDM0)
            {
                Name (_ADR, 0x001F0006)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (IDE0)
            {
                Name (_ADR, 0x001F0001)
                OperationRegion (PCI, PCI_Config, Zero, 0x58)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x03), 
                        ,   7, 
                    SIDE,   1, 
                            Offset (0x42), 
                        ,   1, 
                    EIOR,   1, 
                        ,   13, 
                    ESID,   1, 
                            Offset (0x48), 
                    UMA0,   1, 
                    UMA1,   1, 
                    UMA2,   1, 
                    UMA3,   1, 
                            Offset (0x56), 
                    PSIG,   2, 
                    SSIG,   2
                }

                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x40), 
                    ITM0,   16, 
                    ITM1,   16, 
                    SIT0,   4, 
                    SIT1,   4, 
                            Offset (0x48), 
                    UDC0,   2, 
                    UDC1,   2, 
                            Offset (0x4A), 
                    UDT0,   8, 
                    UDT1,   8, 
                            Offset (0x54), 
                    ICF0,   2, 
                    ICF1,   2, 
                    CB80,   4, 
                        ,   2, 
                    WPPE,   1, 
                        ,   1, 
                    FSCB,   4, 
                    TRIP,   2, 
                    TRIS,   2, 
                    FATS,   4
                }

                Name (TIM0, Package (0x01)
                {
                    Package (0x05)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0186, 
                        0x0258
                    }
                })
                Name (TIM1, Package (0x01)
                {
                    Package (0x03)
                    {
                        0x78, 
                        0x96, 
                        0x01FE
                    }
                })
                Name (TIM2, Package (0x01)
                {
                    Package (0x06)
                    {
                        0x18, 
                        0x1E, 
                        0x2D, 
                        0x3C, 
                        0x5A, 
                        0x78
                    }
                })
                Name (AT01, Buffer (0x07)
                {
                    0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF
                })
                Name (AT02, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90
                })
                Name (AT03, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6
                })
                Name (AT04, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91
                })
                Name (ATA0, Buffer (0x1D) {})
                Name (ATA1, Buffer (0x1D) {})
                Name (ATA2, Buffer (0x1D) {})
                Name (ATA3, Buffer (0x1D) {})
                Name (ATAB, Buffer (0x0E) {})
                Name (CMDC, Zero)
                Name (BAYR, Zero)
                Method (_INI, 0, NotSerialized)
                {
                    Store (^^LPC0.RBID, BAYR)
                }

                Method (GTFB, 3, Serialized)
                {
                    Multiply (CMDC, 0x38, Local0)
                    CreateField (ATAB, Local0, 0x38, CMDX)
                    Multiply (CMDC, 0x07, Local0)
                    CreateByteField (ATAB, Add (Local0, One), A001)
                    CreateByteField (ATAB, Add (Local0, 0x05), A005)
                    Store (Arg0, CMDX)
                    Store (Arg1, A001)
                    Store (Arg2, A005)
                    Increment (CMDC)
                }

                Mutex (GTFM, 0x00)
                Method (GTF, 3, Serialized)
                {
                    Acquire (GTFM, 0xFFFF)
                    CreateDWordField (Arg2, Zero, PIO0)
                    CreateDWordField (Arg2, 0x04, DMA0)
                    CreateDWordField (Arg2, 0x08, PIO1)
                    CreateDWordField (Arg2, 0x0C, DMA1)
                    CreateDWordField (Arg2, 0x10, CHNF)
                    Store (Zero, CMDC)
                    Name (ID00, 0x80)
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If (LEqual (SizeOf (Arg1), 0x0200))
                    {
                        CreateByteField (Arg1, Zero, IB00)
                        Store (IB00, ID00)
                        CreateWordField (Arg1, 0x62, IW49)
                        Store (IW49, ID49)
                        CreateWordField (Arg1, 0x6A, IW53)
                        Store (IW53, ID53)
                        CreateWordField (Arg1, 0x7E, IW63)
                        Store (IW63, ID63)
                        CreateWordField (Arg1, 0x76, IW59)
                        Store (IW59, ID59)
                        CreateWordField (Arg1, 0xB0, IW88)
                        Store (IW88, ID88)
                    }
                    Else
                    {
                        Return (ATAB)
                    }

                    Store (0xA0, Local7)
                    If (Arg0)
                    {
                        Store (0xB0, Local7)
                        And (CHNF, 0x08, IRDY)
                        If (And (CHNF, 0x10))
                        {
                            Store (PIO1, PIOT)
                        }
                        Else
                        {
                            Store (PIO0, PIOT)
                        }

                        If (And (CHNF, 0x04))
                        {
                            If (And (CHNF, 0x10))
                            {
                                Store (DMA1, DMAT)
                            }
                            Else
                            {
                                Store (DMA0, DMAT)
                            }
                        }
                    }
                    Else
                    {
                        And (CHNF, 0x02, IRDY)
                        Store (PIO0, PIOT)
                        If (And (CHNF, One))
                        {
                            Store (DMA0, DMAT)
                        }
                    }

                    If (LAnd (And (ID53, 0x04), And (ID88, 0xFF)))
                    {
                        Store (Zero, Local1)
                        And (ID88, 0xFF, Local2)
                        While (ShiftRight (Local2, Local1))
                        {
                            Increment (Local1)
                        }

                        Decrement (Local1)
                        GTFB (AT01, Or (0x40, Local1), Local7)
                    }

                    If (IRDY)
                    {
                        Store (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                            Zero, Zero), Local1)
                        If (LEqual (Local1, Ones))
                        {
                            Store (0x04, Local1)
                        }

                        Subtract (0x04, Local1, Local1)
                        GTFB (AT01, Or (0x08, Local1), Local7)
                    }
                    Else
                    {
                        If (And (ID49, 0x0400))
                        {
                            GTFB (AT01, One, Local7)
                        }
                    }

                    Release (GTFM)
                    Return (ATAB)
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Multiply (CMDN, 0x38, Local0)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Return (RETB)
                }

                Name (REGF, One)
                Method (_REG, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, REGF)
                    }
                }

                Name (BAYD, Zero)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (GTM, 6, NotSerialized)
                {
                    Store (Buffer (0x14) {}, Local0)
                    CreateDWordField (Local0, Zero, PIO0)
                    CreateDWordField (Local0, 0x04, DMA0)
                    CreateDWordField (Local0, 0x08, PIO1)
                    CreateDWordField (Local0, 0x0C, DMA1)
                    CreateDWordField (Local0, 0x10, FLAG)
                    If (LOr (And (Arg0, 0x08), LNot (And (Arg0, One
                        ))))
                    {
                        Store (0x0384, PIO0)
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (
                            Arg0, 0x3000), 0x0C), Local1)
                        Multiply (Subtract (0x09, Local1), 0x1E, PIO0)
                    }

                    If (And (Arg0, 0x4000))
                    {
                        If (LOr (And (Arg0, 0x80), LNot (And (Arg0, 0x10
                            ))))
                        {
                            Store (0x0384, PIO1)
                        }
                        Else
                        {
                            Add (And (Arg1, 0x03), ShiftRight (And (Arg1, 0x0C), 
                                0x02), Local1)
                            Multiply (Subtract (0x09, Local1), 0x1E, PIO1)
                        }
                    }
                    Else
                    {
                        Store (PIO0, PIO1)
                    }

                    If (And (Arg2, One))
                    {
                        If (And (Arg5, One))
                        {
                            Store (0x08, DMA0)
                        }
                        Else
                        {
                            Subtract (0x04, And (Arg3, 0x03), Local1)
                            If (And (Arg4, One))
                            {
                                Multiply (Local1, 0x0F, DMA0)
                            }
                            Else
                            {
                                Multiply (Local1, 0x1E, DMA0)
                            }
                        }
                    }
                    Else
                    {
                        Store (PIO0, DMA0)
                    }

                    If (And (Arg0, 0x4000))
                    {
                        If (And (Arg2, 0x02))
                        {
                            If (And (Arg5, 0x02))
                            {
                                Store (0x08, DMA1)
                            }
                            Else
                            {
                                Subtract (0x04, ShiftRight (And (Arg3, 0x30), 0x04), Local1)
                                If (And (Arg4, 0x02))
                                {
                                    Multiply (Local1, 0x0F, DMA1)
                                }
                                Else
                                {
                                    Multiply (Local1, 0x1E, DMA1)
                                }
                            }
                        }
                        Else
                        {
                            Store (PIO1, DMA1)
                        }
                    }
                    Else
                    {
                        Store (DMA0, DMA1)
                    }

                    Store (Zero, FLAG)
                    If (And (Arg0, One))
                    {
                        Or (FLAG, 0x10, FLAG)
                    }

                    If (And (Arg2, One))
                    {
                        Or (FLAG, One, FLAG)
                    }

                    If (And (Arg0, 0x02))
                    {
                        Or (FLAG, 0x02, FLAG)
                    }

                    If (And (Arg2, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                    }

                    If (And (Arg0, 0x20))
                    {
                        Or (FLAG, 0x08, FLAG)
                    }

                    Return (Local0)
                }

                Method (STMS, 3, NotSerialized)
                {
                    Store (Buffer (0x18) {}, Local7)
                    CreateDWordField (Local7, Zero, ITM)
                    CreateDWordField (Local7, 0x04, SIT)
                    CreateDWordField (Local7, 0x08, UDC)
                    CreateDWordField (Local7, 0x0C, UDT)
                    CreateDWordField (Local7, 0x10, ICF)
                    CreateDWordField (Local7, 0x14, A100)
                    Store (One, WPPE)
                    CreateDWordField (Arg0, Zero, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Store (FLAG, Local4)
                    Store (0x4000, Local0)
                    Name (W49M, Zero)
                    Name (W53M, Zero)
                    Name (W62M, Zero)
                    Name (W64M, Zero)
                    Name (W88M, Zero)
                    If (LEqual (SizeOf (Arg1), 0x0200))
                    {
                        CreateDWordField (Arg1, Zero, W00A)
                        CreateDWordField (Arg1, 0x62, W49A)
                        CreateDWordField (Arg1, 0x6A, W53A)
                        CreateDWordField (Arg1, 0x7C, W62A)
                        CreateDWordField (Arg1, 0x80, W64A)
                        CreateDWordField (Arg1, 0xB0, W88A)
                        Store (W49A, W49M)
                        Store (W53A, W53M)
                        Store (W62A, W62M)
                        Store (W64A, W64M)
                        Store (W88A, W88M)
                        If (W00A)
                        {
                            Or (Local0, 0x8000, Local0)
                        }

                        If (LNot (And (W00A, 0x80)))
                        {
                            Or (Local0, 0x04, Local0)
                        }
                    }
                    Else
                    {
                        Store (Zero, W49M)
                        Store (Zero, W53M)
                        Store (Zero, W62M)
                        Store (Zero, W64M)
                        Store (Zero, W88M)
                    }

                    Name (W49S, Zero)
                    Name (W53S, Zero)
                    Name (W62S, Zero)
                    Name (W64S, Zero)
                    Name (W88S, Zero)
                    If (LEqual (SizeOf (Arg2), 0x0200))
                    {
                        CreateDWordField (Arg2, Zero, W00B)
                        CreateDWordField (Arg2, 0x62, W49B)
                        CreateDWordField (Arg2, 0x6A, W53B)
                        CreateDWordField (Arg2, 0x7C, W62B)
                        CreateDWordField (Arg2, 0x80, W64B)
                        CreateDWordField (Arg2, 0xB0, W88B)
                        Store (W49B, W49S)
                        Store (W53B, W53S)
                        Store (W62B, W62S)
                        Store (W64B, W64S)
                        Store (W88B, W88S)
                        If (W00B)
                        {
                            Or (Local0, 0x8000, Local0)
                        }

                        If (LNot (And (W00B, 0x80)))
                        {
                            Or (Local0, 0x40, Local0)
                        }
                    }
                    Else
                    {
                        Store (Zero, W49S)
                        Store (Zero, W53S)
                        Store (Zero, W62S)
                        Store (Zero, W64S)
                        Store (Zero, W88S)
                    }

                    Store (Zero, A100)
                    If (And (0x38, W88M))
                    {
                        If (And (0x20, W88M))
                        {
                            Store (0x08, DMA0)
                            Or (A100, 0x00100010, A100)
                        }
                        Else
                        {
                            If (And (0x10, W88M))
                            {
                                Store (0x1E, DMA0)
                                Or (A100, 0x10, A100)
                            }
                            Else
                            {
                                Store (0x2D, DMA0)
                            }
                        }
                    }
                    Else
                    {
                        If (And (0x07, W88M))
                        {
                            Or (0x0100, A100, A100)
                            If (And (0x04, W88M))
                            {
                                Store (0x3C, DMA0)
                            }
                            Else
                            {
                                If (And (0x02, W88M))
                                {
                                    Store (0x5A, DMA0)
                                }
                                Else
                                {
                                    Store (0x78, DMA0)
                                }
                            }
                        }
                    }

                    If (And (0x3F, W88S))
                    {
                        If (And (0x20, W88S))
                        {
                            Store (0x08, DMA1)
                            Or (A100, 0x00200020, A100)
                        }
                        Else
                        {
                            If (And (0x10, W88S))
                            {
                                Store (0x1E, DMA1)
                                Or (A100, 0x20, A100)
                            }
                            Else
                            {
                                Store (0x2D, DMA1)
                            }
                        }
                    }

                    If (LAnd (And (W49M, 0x0800), And (Local4, 0x02)))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    If (LLess (PIO0, 0x0384))
                    {
                        Or (Local0, One, Local0)
                    }

                    If (LAnd (And (W49S, 0x0800), And (Local4, 0x08)))
                    {
                        Or (Local0, 0x20, Local0)
                    }

                    If (LLess (PIO1, 0x0384))
                    {
                        Or (Local0, 0x10, Local0)
                    }

                    If (And (Local4, One))
                    {
                        Store (PIO0, Local1)
                    }
                    Else
                    {
                        Store (DMA0, Local1)
                    }

                    If (LGreaterEqual (Local1, 0xF0))
                    {
                        Or (Local0, 0x08, Local0)
                    }
                    Else
                    {
                        If (And (W53M, 0x02))
                        {
                            If (LAnd (And (W64M, 0x02), LLessEqual (Local1, 0x78)))
                            {
                                Or (Local0, 0x2301, Local0)
                            }
                            Else
                            {
                                If (LAnd (And (W64M, One), LLessEqual (Local1, 0xB4)))
                                {
                                    Or (Local0, 0x2101, Local0)
                                }
                            }
                        }
                        Else
                        {
                            Or (Local0, 0x1001, Local0)
                        }
                    }

                    Store (Local0, ITM)
                    Store (Zero, Local0)
                    If (And (Local4, 0x04))
                    {
                        Store (PIO1, Local1)
                    }
                    Else
                    {
                        Store (DMA1, Local1)
                    }

                    If (And (Local4, 0x10))
                    {
                        If (LGreaterEqual (Local1, 0xF0))
                        {
                            Or (0x80, ITM, ITM)
                        }
                        Else
                        {
                            Or (0x10, ITM, ITM)
                            If (And (W53S, 0x02))
                            {
                                If (LAnd (And (W64S, 0x02), LLessEqual (Local1, 0x78)))
                                {
                                    Store (0x0B, Local0)
                                }
                                Else
                                {
                                    If (LAnd (And (W64S, One), LLessEqual (Local1, 0xB4)))
                                    {
                                        Store (0x09, Local0)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x04, Local0)
                            }
                        }
                    }

                    Store (Local0, SIT)
                    Store (Zero, Local0)
                    If (LAnd (And (0x3F, W88M), And (Local4, One)))
                    {
                        Or (Local0, One, Local0)
                    }

                    If (And (Local4, 0x04))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    Store (Local0, UDC)
                    Store (Zero, Local0)
                    If (And (Local4, One))
                    {
                        If (LLess (DMA0, 0x1E))
                        {
                            Or (A100, 0x1000, A100)
                            Or (Local0, One, Local0)
                        }
                        Else
                        {
                            If (LLess (DMA0, 0x3C))
                            {
                                Divide (DMA0, 0x0F, , Local1)
                            }
                            Else
                            {
                                Divide (DMA0, 0x1E, , Local1)
                            }

                            Subtract (0x04, Local1, Local0)
                        }
                    }

                    If (And (Local4, 0x04))
                    {
                        If (LLess (DMA1, 0x1E))
                        {
                            Or (A100, 0x2000, A100)
                            Or (Local0, 0x10, Local0)
                        }
                        Else
                        {
                            If (LLess (DMA1, 0x3C))
                            {
                                Divide (DMA1, 0x0F, , Local1)
                            }
                            Else
                            {
                                Divide (DMA1, 0x1E, , Local1)
                            }

                            Subtract (0x04, Local1, Local1)
                            ShiftLeft (Local1, 0x04, Local1)
                            Or (Local0, Local1, Local0)
                        }
                    }

                    Store (Local0, UDT)
                    Store (Zero, Local0)
                    If (LLess (DMA0, 0x3C))
                    {
                        Or (Local0, One, Local0)
                    }

                    If (LLess (DMA1, 0x3C))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    Store (Local0, ICF)
                    Return (Local7)
                }

                Method (GTF0, 7, NotSerialized)
                {
                    Store (Buffer (0x07)
                        {
                            0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                        }, Local7)
                    CreateByteField (Local7, One, MODE)
                    If (And (Arg2, One))
                    {
                        If (And (Arg6, One))
                        {
                            Store (0x45, MODE)
                        }
                        Else
                        {
                            And (Arg3, 0x03, Local0)
                            If (And (Arg4, One))
                            {
                                Add (Local0, 0x02, Local0)
                            }

                            Or (Local0, 0x40, MODE)
                        }
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (
                            Arg0, 0x3000), 0x0C), Local0)
                        If (LGreaterEqual (Local0, 0x05))
                        {
                            Store (0x22, MODE)
                        }
                        Else
                        {
                            If (LGreaterEqual (Local0, 0x03))
                            {
                                Store (0x21, MODE)
                            }
                            Else
                            {
                                Store (0x20, MODE)
                            }
                        }
                    }

                    Concatenate (Local7, Local7, Local6)
                    If (LOr (And (Arg0, 0x08), LNot (And (Arg0, One
                        ))))
                    {
                        If (And (Arg0, 0x02))
                        {
                            Store (Zero, MODE)
                        }
                        Else
                        {
                            Store (0x08, MODE)
                        }
                    }
                    Else
                    {
                        Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (
                            Arg0, 0x3000), 0x0C), Local0)
                        If (LGreaterEqual (Local0, 0x05))
                        {
                            Store (0x0C, MODE)
                        }
                        Else
                        {
                            If (LGreaterEqual (Local0, 0x03))
                            {
                                Store (0x0B, MODE)
                            }
                            Else
                            {
                                Store (0x0A, MODE)
                            }
                        }
                    }

                    Concatenate (Local6, Local7, Local5)
                    Return (Local5)
                }

                Name (B04, Buffer (0x04) {})
                Name (B20, Buffer (0x04) {})
                Name (B40, Buffer (0x04) {})
                Device (PRIM)
                {
                    Name (_ADR, Zero)
                    Name (_PSC, Zero)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (Zero, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (Buffer (0x14)
                            {
                                0x00
                            }, Local0)
                        Store (GTM (ITM0, SIT0, UDC0, UDT0, ICF0, FSCB), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (GTF (Zero, Arg1, Arg0), ATA0)
                        Store (GTF (One, Arg2, Arg0), ATA1)
                        Store (STMS (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        Store (ITM, ITM0)
                        Store (SIT, SIT0)
                        Store (UDC, UDC0)
                        Store (UDT, UDT0)
                        CreateDWordField (Local0, 0x14, A100)
                        Or (And (CB80, 0x0C), ShiftRight (And (0x30, A100), 
                            0x04), CB80)
                        Or (And (FSCB, 0x0C), ShiftRight (And (0x3000, A100), 
                            0x0C), FSCB)
                        Or (And (FATS, 0x0C), ShiftRight (And (0x00300000, A100), 
                            0x14), FATS)
                        Store (ICF, ICF0)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, Zero)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA0))
                        }
                    }
                }

                Device (SECN)
                {
                    Name (_ADR, One)
                    Name (FAST, 0x63)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (ESID)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x08)
                        }
                    }

                    Name (_PSC, Zero)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (Zero, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (Buffer (0x14)
                            {
                                0x00
                            }, Local0)
                        Store (FSCB, Local1)
                        ShiftRight (Local1, 0x02, Local1)
                        Store (GTM (ITM1, SIT1, UDC1, UDT1, ICF1, Local1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (GTF (Zero, Arg1, Arg0), ATA2)
                        Store (GTF (One, Arg2, Arg0), ATA3)
                        Store (STMS (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        Store (ITM, ITM1)
                        Store (SIT, SIT1)
                        Store (UDC, UDC1)
                        Store (UDT, UDT1)
                        CreateDWordField (Local0, 0x14, A100)
                        Or (And (CB80, 0x03), ShiftRight (And (0x30, A100), 
                            0x02), CB80)
                        Or (And (FSCB, 0x03), ShiftRight (And (0x3000, A100), 
                            0x0A), FSCB)
                        Or (And (FATS, 0x03), ShiftRight (And (0x00300000, A100), 
                            0x12), FATS)
                        Store (ICF, ICF1)
                    }

                    Device (BAY1)
                    {
                        Name (_ADR, Zero)
                        Name (H15F, Zero)
                        Name (EJ0F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA2))
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            If (ESID)
                            {
                                CBAY ()
                                Store (BFLG, Local0)
                                If (LEqual (BNUM, One))
                                {
                                    If (And (Local0, One))
                                    {
                                        If (^^^^LPC0.LV37)
                                        {
                                            Return (0x08)
                                        }
                                        Else
                                        {
                                            Return (0x0F)
                                        }
                                    }
                                }
                                Else
                                {
                                    If (LEqual (BNUM, 0x02))
                                    {
                                        If (^^^^LPC0.LV37)
                                        {
                                            Return (0x08)
                                        }
                                        Else
                                        {
                                            Return (0x0F)
                                        }
                                    }
                                    Else
                                    {
                                        Return (0x08)
                                    }
                                }
                            }
                            Else
                            {
                                Return (0x08)
                            }
                        }
                    }

                    Name (BNUM, Zero)
                    Name (BFLG, Zero)
                    Method (CBAY, 0, NotSerialized)
                    {
                        Store (Zero, BNUM)
                        Store (Zero, BFLG)
                        Store (^^^LPC0.RBID, Local0)
                        If (Or (LEqual (Local0, One), LEqual (Local0, 0x02)))
                        {
                            Increment (BNUM)
                            Or (BFLG, One, BFLG)
                        }
                    }
                }

                Method (_PS0, 0, NotSerialized)
                {
                    If (And (LEqual (_PSC, 0x03), LEqual (STAT, 0x03)))
                    {
                        Store (0x89, ^^LPC0.BCMD)
                        Store (Zero, ^^LPC0.SMIC)
                        Store (0xB0, P80H)
                    }

                    Store (Zero, _PSC)
                }

                Method (_PS3, 0, NotSerialized)
                {
                    Store (0x03, _PSC)
                    Store (0xB3, P80H)
                }

                Name (_PSC, Zero)
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0000)
                OperationRegion (USBO, PCI_Config, 0xC4, 0x04)
                Field (USBO, ByteAcc, NoLock, Preserve)
                {
                    RSEN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, RSEN)
                    }
                    Else
                    {
                        Store (Zero, RSEN)
                    }
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0001)
                OperationRegion (USBO, PCI_Config, 0xC4, 0x04)
                Field (USBO, ByteAcc, NoLock, Preserve)
                {
                    RSEN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, RSEN)
                    }
                    Else
                    {
                        Store (Zero, RSEN)
                    }
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0002)
                OperationRegion (USBO, PCI_Config, 0xC4, 0x04)
                Field (USBO, ByteAcc, NoLock, Preserve)
                {
                    RSEN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, RSEN)
                    }
                    Else
                    {
                        Store (Zero, RSEN)
                    }
                }
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Name (LSTS, Zero)
            Method (_LID, 0, NotSerialized)
            {
                If (OKEC)
                {
                    If (^^PCI0.LPC0.EC0.LIDS)
                    {
                        Store (Zero, LSTS)
                    }
                    Else
                    {
                        Store (One, LSTS)
                    }
                }
                Else
                {
                    Store (Zero, LSTS)
                }

                Return (LSTS)
            }
        }

        Scope (\_TZ)
        {
            Name (TPL, 0x0CA0)
            Name (TAC1, 0x0D0E)
            Name (TAC0, 0x0D54)
            Name (TPAS, 0x0E44)
            Name (TPC, 0x0E94)
            Name (TPTM, 0x0C3C)
            Name (TBSE, 0x0AAC)
            Name (LTMP, 0x0CA0)
            Name (TVAR, Buffer (0x05)
            {
                0x00, 0x20, 0x1F, 0x0C, 0x1F
            })
            CreateByteField (TVAR, Zero, PLCY)
            CreateWordField (TVAR, One, CTOS)
            CreateWordField (TVAR, 0x03, CTHY)
            Device (FAN0)
            {
                Name (_HID, EisaId ("PNP0C0B"))
                Name (_UID, One)
                Name (_PR0, Package (0x01)
                {
                    PFN0
                })
                Method (_PS0, 0, NotSerialized)
                {
                    Store ("Low Speed FAN - _PS0", Debug)
                }

                Method (_PS3, 0, NotSerialized)
                {
                    Store ("Low Speed FAN - _PS3", Debug)
                }
            }

            PowerResource (PFN0, 0x00, 0x0000)
            {
                Name (FNS1, Zero)
                Name (FFST, One)
                Method (_STA, 0, NotSerialized)
                {
                    Store (FNS1, Local1)
                    Return (Local1)
                }

                Method (_ON, 0, NotSerialized)
                {
                    Store (One, FNS1)
                    If (^^PFN1.FNS2)
                    {
                        Store ("FAN 1 (High speed already turn on) ", Debug)
                    }
                    Else
                    {
                        If (\_SB.OKEC)
                        {
                            Store (0xB4, \_SB.PCI0.LPC0.EC0.FSPD)
                            Store (One, \_SB.PCI0.LPC0.EC0.FPR1)
                        }
                    }

                    If (Or (LEqual (\_SB.PCI0.MYOS, One), LEqual (\_SB.PCI0.MYOS, 0x03)))
                    {
                        ^^THRM._SCP (One)
                    }
                }

                Method (_OFF, 0, NotSerialized)
                {
                    Store (Zero, FNS1)
                    If (LEqual (SizeOf (_OS), 0x14))
                    {
                        If (\_SB.OKEC)
                        {
                            If (^^PFN1.FNS2)
                            {
                                Store (One, \_SB.PCI0.LPC0.EC0.FPR1)
                            }
                            Else
                            {
                                Store (Zero, \_SB.PCI0.LPC0.EC0.FPR1)
                            }
                        }
                    }
                    Else
                    {
                        If (LLess (FFST, 0x02))
                        {
                            Store (0x86, \_SB.PCI0.LPC0.BCMD)
                            Store (Zero, \_SB.PCI0.LPC0.SMIC)
                            Increment (FFST)
                        }
                        Else
                        {
                            If (\_SB.OKEC)
                            {
                                Store (Zero, \_SB.PCI0.LPC0.EC0.FPR1)
                            }
                        }
                    }

                    If (Or (LEqual (\_SB.PCI0.MYOS, One), LEqual (\_SB.PCI0.MYOS, 0x03)))
                    {
                        ^^THRM._SCP (One)
                    }
                }
            }

            Device (FAN1)
            {
                Name (_HID, EisaId ("PNP0C0B"))
                Name (_UID, 0x02)
                Name (_PR0, Package (0x02)
                {
                    PFN0, 
                    PFN1
                })
                Method (_PS0, 0, NotSerialized)
                {
                    Store ("High Speed FAN - _PS0", Debug)
                }

                Method (_PS3, 0, NotSerialized)
                {
                    Store ("High Speed FAN - _PS3", Debug)
                }
            }

            PowerResource (PFN1, 0x00, 0x0000)
            {
                Name (FNS2, Zero)
                Method (_STA, 0, NotSerialized)
                {
                    Return (FNS2)
                }

                Method (_ON, 0, NotSerialized)
                {
                    Store (One, FNS2)
                    If (\_SB.OKEC)
                    {
                        Store (0xFF, \_SB.PCI0.LPC0.EC0.FSPD)
                        Store (One, \_SB.PCI0.LPC0.EC0.FPR1)
                    }

                    If (Or (LEqual (\_SB.PCI0.MYOS, One), LEqual (\_SB.PCI0.MYOS, 0x03)))
                    {
                        ^^THRM._SCP (One)
                    }
                }

                Method (_OFF, 0, NotSerialized)
                {
                    Store (Zero, FNS2)
                    Store (Zero, FNS2)
                    If (^^PFN0.FNS1)
                    {
                        If (\_SB.OKEC)
                        {
                            Store (0xB4, \_SB.PCI0.LPC0.EC0.FSPD)
                            Store (One, \_SB.PCI0.LPC0.EC0.FPR1)
                        }
                    }
                    Else
                    {
                        If (\_SB.OKEC)
                        {
                            Store (Zero, \_SB.PCI0.LPC0.EC0.FPR1)
                        }
                    }

                    If (Or (LEqual (\_SB.PCI0.MYOS, One), LEqual (\_SB.PCI0.MYOS, 0x03)))
                    {
                        ^^THRM._SCP (One)
                    }
                }
            }

            ThermalZone (THRM)
            {
                Name (_AL0, Package (0x01)
                {
                    FAN1
                })
                Method (_AC0, 0, NotSerialized)
                {
                    Return (TAC0)
                }

                Name (_AL1, Package (0x01)
                {
                    FAN0
                })
                Method (_AC1, 0, NotSerialized)
                {
                    Return (TAC1)
                }

                Method (_CRT, 0, NotSerialized)
                {
                    Return (TPC)
                }

                Method (_PSV, 0, NotSerialized)
                {
                    Return (TPAS)
                }

                Name (_TSP, 0x64)
                Method (_TMP, 0, NotSerialized)
                {
                    If (\_SB.OKEC)
                    {
                        Store (\_SB.PCI0.LPC0.EC0.CTMP, Local1)
                        Store ("Dothan B1 CPU temperature offset value = ", Debug)
                        Store (DOFF, Debug)
                        Store (Local1, Debug)
                        Store ("Current Temperature is ----------- ", Debug)
                        Store (Local1, Debug)
                        Add (Multiply (Local1, 0x0A), TBSE, Local1)
                    }
                    Else
                    {
                        Store (LTMP, Local1)
                    }

                    Return (Local1)
                }

                Name (_PSL, Package (0x01)
                {
                    \_PR.CPU0
                })
                Name (_TC1, 0x02)
                Name (_TC2, 0x03)
                Method (_SCP, 1, NotSerialized)
                {
                    Store (Zero, PLCY)
                    If (^^PFN0.FNS1)
                    {
                        If (LEqual (^^PFN1.FNS2, Zero))
                        {
                            Store (0x0D22, TAC1)
                            Store (0x0D86, TAC0)
                        }
                        Else
                        {
                            Store (0x0D22, TAC1)
                            Store (0x0D40, TAC0)
                        }
                    }
                    Else
                    {
                        If (^^PFN1.FNS2)
                        {
                            Store (0x0D22, TAC1)
                            Store (0x0D40, TAC0)
                        }
                        Else
                        {
                            Store (0x0D40, TAC1)
                            Store (0x0D86, TAC0)
                        }
                    }

                    Store (0x0E44, TPAS)
                    Notify (THRM, 0x81)
                }
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        OperationRegion (EXCO, SystemIO, 0x72, 0x02)
        Field (EXCO, ByteAcc, NoLock, Preserve)
        {
            INDX,   8, 
            DATA,   8
        }

        IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
        {
                    Offset (0x20), 
            ACST,   1, 
            ECOK,   1, 
            WLES,   1, 
            BTES,   1, 
            W2KF,   2, 
            S4WP,   1, 
            FLA7,   1, 
            LSFG,   1, 
            LD10,   1, 
            PS2M,   1, 
            DISD,   3, 
            OVRL,   1, 
                    Offset (0x22), 
            SLEE,   8, 
            BPFG,   8, 
            PWST,   8, 
            DATS,   8, 
            CM26,   8, 
            CM27,   8, 
            CM28,   16, 
            CM2A,   16, 
            F4FG,   1, 
                    Offset (0x30), 
            CM30,   8, 
            CM31,   8, 
            CM32,   8
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Device (SMB0)
        {
            Name (_HID, "SBMUS01")
            Name (_UID, Zero)
            Mutex (SBMX, 0x00)
            OperationRegion (SMB0, EmbeddedControl, 0x18, 0x40)
            Field (SMB0, ByteAcc, Lock, Preserve)
            {
                SBPR,   8, 
                SBST,   8, 
                SBAD,   8, 
                SBCM,   8, 
                SBDA,   256, 
                SBBC,   8, 
                SBAA,   8, 
                SBAW,   16
            }

            Field (SMB0, ByteAcc, Lock, Preserve)
            {
                        Offset (0x04), 
                SBDB,   8
            }

            Field (SMB0, ByteAcc, Lock, Preserve)
            {
                        Offset (0x04), 
                SBDW,   16
            }

            Method (_SBI, 0, NotSerialized)
            {
                Store (Package (0x02)
                    {
                        0x10, 
                        Zero
                    }, Local0)
                Store (Buffer (0x41)
                    {
                        /* 0000 */    0x10, 0x10, 0x00, 0x00, 0x04, 0x09, 0x00, 0x00, 
                        /* 0008 */    0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x00, 0x53, 0x42, 0x53, 0x09, 0x00, 0x00, 0x00, 
                        /* 0018 */    0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 
                        /* 0020 */    0xFF, 0x00, 0x00, 0x00, 0x00, 0x53, 0x42, 0x53, 
                        /* 0028 */    0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 
                        /* 0030 */    0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 
                        /* 0038 */    0x00, 0x53, 0x42, 0x53, 0x0B, 0x00, 0x00, 0x00, 
                        /* 0040 */    0x00
                    }, Index (Local0, One))
                Return (Local0)
            }

            Method (_SBR, 3, NotSerialized)
            {
                If (LEqual (Arg0, 0x0B))
                {
                    Store (Package (0x03)
                        {
                            0x07, 
                            Zero, 
                            Buffer (0x20) {}
                        }, Local0)
                }
                Else
                {
                    Store (Package (0x03)
                        {
                            0x07, 
                            Zero, 
                            Zero
                        }, Local0)
                }

                If (LNotEqual (Arg0, 0x07))
                {
                    If (LNotEqual (Arg0, 0x09))
                    {
                        If (LNotEqual (Arg0, 0x0B))
                        {
                            Store (0x19, Index (Local0, Zero))
                            Return (Local0)
                        }
                    }
                }

                If (LNot (Acquire (SBMX, 0xFFFF)))
                {
                    If (LNotEqual (SBPR, Zero))
                    {
                        Store (0x1A, Index (Local0, Zero))
                    }
                    Else
                    {
                        Store (ShiftLeft (Arg1, One), SBAD)
                        Store (Arg2, SBCM)
                        Store (Arg0, SBPR)
                        Store (SBWT (0x03E8), Local1)
                        Store (Local1, Index (Local0, Zero))
                        If (LNot (Local1))
                        {
                            If (LEqual (Arg0, 0x07))
                            {
                                Store (One, Index (Local0, One))
                                Store (SBDB, Index (Local0, 0x02))
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x09))
                                {
                                    Store (0x02, Index (Local0, One))
                                    Store (SBDW, Index (Local0, 0x02))
                                }
                                Else
                                {
                                    If (LEqual (Arg0, 0x0B))
                                    {
                                        Store (SBBC, Index (Local0, One))
                                        Store (SBDA, Index (Local0, 0x02))
                                    }
                                }
                            }
                        }
                    }

                    Release (SBMX)
                }

                Return (Local0)
            }

            Method (_SBW, 5, NotSerialized)
            {
                Store (Package (0x01)
                    {
                        0x07
                    }, Local0)
                If (LNotEqual (Arg0, 0x06))
                {
                    If (LNotEqual (Arg0, 0x08))
                    {
                        If (LNotEqual (Arg0, 0x0A))
                        {
                            Store (0x19, Index (Local0, Zero))
                            Return (Local0)
                        }
                    }
                }

                If (LNot (Acquire (SBMX, 0xFFFF)))
                {
                    If (LNotEqual (SBPR, Zero))
                    {
                        Store (0x1A, Index (Local0, Zero))
                    }
                    Else
                    {
                        Store (ShiftLeft (Arg1, One), SBAD)
                        Store (Arg2, SBCM)
                        Store (Arg3, SBBC)
                        If (LEqual (Arg0, 0x06))
                        {
                            Store (Arg4, SBDB)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg4, SBDW)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x0A))
                                {
                                    Store (Arg4, SBDA)
                                }
                            }
                        }

                        Store (Arg0, SBPR)
                        Store (SBWT (0x03E8), Local0)
                    }

                    Release (SBMX)
                }

                Return (Local0)
            }

            Method (_SBA, 0, NotSerialized)
            {
                Store (Package (0x04)
                    {
                        0x07, 
                        Zero, 
                        Zero, 
                        Zero
                    }, Local0)
                If (And (SBST, 0x40))
                {
                    If (LNot (Acquire (SBMX, 0xFFFF)))
                    {
                        Store (Zero, Index (Local0, Zero))
                        Store (ShiftRight (SBAA, One), Index (Local0, One))
                        Store (0x02, Index (Local0, 0x02))
                        Store (SBAW, Index (Local0, 0x03))
                        Store (Zero, SBST)
                    }
                    Else
                    {
                        Store (One, Index (Local0, Zero))
                    }

                    Release (SBMX)
                }

                Return (Local0)
            }

            Method (SBWT, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                While (Local0)
                {
                    If (LEqual (SBPR, Zero))
                    {
                        Return (And (SBST, 0x1F))
                    }

                    Sleep (One)
                    Decrement (Local0)
                }

                Return (0x18)
            }

            Method (SBRW, 2, NotSerialized)
            {
                Store (_SBR (0x09, Arg0, Arg1), Local0)
                Return (DerefOf (Index (Local0, 0x02)))
            }

            Method (SBRS, 2, NotSerialized)
            {
                Store (_SBR (0x0B, Arg0, Arg1), Local0)
                Return (ToString (DerefOf (Index (Local0, 0x02)), DerefOf (Index (Local0, 
                    One))))
            }

            Method (SBWW, 3, NotSerialized)
            {
                Store (_SBW (0x08, Arg0, Arg1, 0x02, Arg2), Local0)
            }
        }
    }

    Scope (_SB)
    {
        Mutex (BAMX, 0x00)
        Method (ACQB, 1, NotSerialized)
        {
            If (LNot (Acquire (BAMX, 0xFFFF)))
            {
                Store (^PCI0.LPC0.EC0.SMB0.SBRW (0x0A, One), Local0)
                Or (ShiftLeft (One, Add (Arg0, 0x0C)), And (Local0, 
                    0x0FFF), Local1)
                ^PCI0.LPC0.EC0.SMB0.SBWW (0x0A, One, Local1)
                Store (^PCI0.LPC0.EC0.SMB0.SBRW (0x0A, One), Local0)
                If (LEqual (And (Local0, 0xF000), And (Local1, 0xF000)))
                {
                    Return (One)
                }

                Release (BAMX)
            }

            Return (Zero)
        }

        Method (RELB, 0, NotSerialized)
        {
            Release (BAMX)
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, Zero)
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (PBIF, Package (0x0D)
            {
                One, 
                Ones, 
                Ones, 
                One, 
                Ones, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                "BAT0", 
                " ", 
                " ", 
                " "
            })
            Name (PBST, Package (0x04)
            {
                Zero, 
                Ones, 
                Ones, 
                Ones
            })
            Name (BAST, Zero)
            Name (BAAL, Zero)
            Method (_STA, 0, NotSerialized)
            {
                If (ECOK)
                {
                    Store (^^PCI0.LPC0.EC0.SMB0.SBRW (0x0A, One), Local1)
                    If (And (Local1, One))
                    {
                        If (LNotEqual (BAST, 0x1F))
                        {
                            Store (0x1F, BAST)
                            SEBI ()
                        }
                    }
                    Else
                    {
                        Store (0x0F, BAST)
                    }
                }
                Else
                {
                    Store (0x0F, BAST)
                }

                Return (BAST)
            }

            Method (_BIF, 0, NotSerialized)
            {
                Return (PBIF)
            }

            Method (_BST, 0, NotSerialized)
            {
                SEBS ()
                Return (PBST)
            }

            Method (_BTP, 1, NotSerialized)
            {
                If (And (BAST, 0x10))
                {
                    If (ACQB (_UID))
                    {
                        ^^PCI0.LPC0.EC0.SMB0.SBWW (0x0B, One, Arg0)
                        ^^PCI0.LPC0.EC0.SMB0.SBWW (0x0B, 0x02, Zero)
                        Store (^^PCI0.LPC0.EC0.SMB0.SBRW (0x0B, 0x03), Local1)
                        ^^PCI0.LPC0.EC0.SMB0.SBWW (0x0B, 0x03, And (Local1, 0xC300))
                        RELB ()
                    }
                }
            }

            Method (SEBI, 0, NotSerialized)
            {
                If (And (BAST, 0x10))
                {
                    UPBI ()
                }
                Else
                {
                    IVBI ()
                }
            }

            Method (SEBS, 0, NotSerialized)
            {
                If (And (BAST, 0x10))
                {
                    UPBS ()
                }
                Else
                {
                    IVBS ()
                }
            }

            Method (UPBI, 0, NotSerialized)
            {
                Store (Buffer (0x0D)
                    {
                        /* 0000 */    0x03, 0x18, 0x10, 0x00, 0x19, 0x00, 0x00, 0x00, 
                        /* 0008 */    0x00, 0x21, 0x00, 0x22, 0x20
                    }, Local0)
                If (ACQB (_UID))
                {
                    Store (Zero, Local1)
                    While (LLess (Local1, 0x0D))
                    {
                        Store (DerefOf (Index (Local0, Local1)), Local2)
                        If (Local2)
                        {
                            If (LLess (Local1, 0x0A))
                            {
                                Store (^^PCI0.LPC0.EC0.SMB0.SBRW (0x0B, Local2), Index (PBIF, Local1))
                            }
                            Else
                            {
                                Store (^^PCI0.LPC0.EC0.SMB0.SBRS (0x0B, Local2), Index (PBIF, Local1))
                            }
                        }

                        Increment (Local1)
                    }

                    Store (DerefOf (Index (PBIF, Zero)), Local1)
                    If (And (Local1, 0x8000))
                    {
                        Store (Zero, Index (PBIF, Zero))
                        Store (DerefOf (Index (PBIF, 0x02)), Local2)
                        Multiply (Local2, 0x0A, Index (PBIF, 0x02))
                        Store (DerefOf (Index (PBIF, One)), Local2)
                        Multiply (Local2, 0x0A, Index (PBIF, One))
                        Store (Local2, Index (PBIF, 0x05))
                        Divide (Local2, 0x02, , Index (PBIF, 0x06))
                        Store (0x0A, Index (PBIF, 0x07))
                        Store (0x0A, Index (PBIF, 0x08))
                    }
                    Else
                    {
                        Store (One, Index (PBIF, Zero))
                        Store (DerefOf (Index (PBIF, One)), Local2)
                        Divide (Local2, 0x0A, , Index (PBIF, 0x05))
                        Divide (Local2, 0x14, , Index (PBIF, 0x06))
                        Store (One, Index (PBIF, 0x07))
                        Store (One, Index (PBIF, 0x08))
                    }

                    If (LEqual (And (Local1, 0x0202), 0x0202))
                    {
                        Store (Zero, Index (PBIF, 0x03))
                    }
                    Else
                    {
                        Store (One, Index (PBIF, 0x03))
                    }

                    Store (^^PCI0.LPC0.EC0.SMB0.SBRW (0x0B, 0x1C), Local1)
                    ToDecimalString (Local1, Index (PBIF, 0x0A))
                    RELB ()
                }
            }

            Method (UPBS, 0, NotSerialized)
            {
                Store (Buffer (0x0D)
                    {
                        0x00, 0x0A, 0x0F, 0x09
                    }, Local0)
                If (ACQB (_UID))
                {
                    Store (Zero, Local1)
                    While (LLess (Local1, 0x04))
                    {
                        Store (DerefOf (Index (Local0, Local1)), Local2)
                        If (Local2)
                        {
                            Store (DerefOf (Index (Local0, Local1)), Local2)
                            Store (^^PCI0.LPC0.EC0.SMB0.SBRW (0x0B, Local2), Index (PBST, Local1))
                        }

                        Increment (Local1)
                    }

                    Store (DerefOf (Index (PBIF, Zero)), Local1)
                    Store (WABS (DerefOf (Index (PBST, One))), Local2)
                    If (LNot (Local1))
                    {
                        Multiply (Local2, DerefOf (Index (PBST, 0x03)), Local2)
                        Divide (Local2, 0x03E8, , Index (PBST, One))
                        Multiply (DerefOf (Index (PBST, 0x02)), 0x0A, Index (PBST, 0x02
                            ))
                    }
                    Else
                    {
                        Store (Local2, Index (PBST, One))
                    }

                    Store (^^PCI0.LPC0.EC0.SMB0.SBRW (0x0B, 0x16), Local1)
                    Store (Zero, Local2)
                    If (^^ACAD._PSR ())
                    {
                        If (LNot (And (Local1, 0x40)))
                        {
                            Or (Local2, 0x02, Local2)
                        }
                    }
                    Else
                    {
                        If (DerefOf (Index (PBST, One)))
                        {
                            Or (Local2, One, Local2)
                        }
                    }

                    Store (Local2, Index (PBST, Zero))
                    RELB ()
                }
            }

            Method (IVBI, 0, NotSerialized)
            {
                Store (Ones, Index (PBIF, One))
                Store (Ones, Index (PBIF, 0x02))
                Store (Ones, Index (PBIF, 0x04))
                Store ("Invalid", Index (PBIF, 0x09))
                Store ("Invalid", Index (PBIF, 0x0A))
                Store ("Invalid", Index (PBIF, 0x0B))
                Store ("Invalid", Index (PBIF, 0x0C))
            }

            Method (IVBS, 0, NotSerialized)
            {
                Store (Ones, Index (PBST, One))
                Store (Ones, Index (PBST, 0x02))
            }

            Method (CKAL, 0, NotSerialized)
            {
                If (ACQB (_UID))
                {
                    Store (^^PCI0.LPC0.EC0.SMB0.SBRW (0x0B, 0x16), Local0)
                    And (Local0, 0x0300, Local0)
                    If (LNotEqual (Local0, BAAL))
                    {
                        Store (Local0, BAAL)
                        Notify (BAT0, 0x80)
                    }

                    RELB ()
                }
            }
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003")
            Name (_UID, Zero)
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Method (_PSR, 0, NotSerialized)
            {
                If (ECOK)
                {
                    If (And (^^PCI0.LPC0.EC0.SMB0.SBRW (0x09, 0x13), 0x8000))
                    {
                        Store (One, Local0)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                    }
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Name (PSST, Zero)
        Method (SLEV, 1, NotSerialized)
        {
            Store (Zero, Local0)
            Store (Zero, Local1)
            Store (Zero, Local3)
            Store (Zero, Local4)
            While (LLess (Local1, 0x04))
            {
                ShiftLeft (One, Local1, Local2)
                If (XOr (And (Arg0, Local2), And (PSST, Local2)
                    ))
                {
                    Or (Local0, Local2, Local0)
                }

                ShiftLeft (One, Add (Local1, 0x04), Local2)
                If (And (Arg0, Local2))
                {
                    Increment (Local3)
                }

                If (And (PSST, Local2))
                {
                    Increment (Local4)
                }

                Increment (Local1)
            }

            If (XOr (LLess (Local3, 0x02), LLess (Local4, 0x02)))
            {
                Or (Local0, 0x10, Local0)
            }

            Store (Arg0, PSST)
            Return (Local0)
        }

        Method (_Q09, 0, NotSerialized)
        {
            If (And (^^^^BAT0.BAST, 0x10))
            {
                ^^^^BAT0.CKAL ()
            }

            BPOL (0x3C)
        }

        Method (_Q20, 0, NotSerialized)
        {
            Store (^SMB0._SBA (), Local0)
            Store (DerefOf (Index (Local0, Zero)), Local1)
            Store (DerefOf (Index (Local0, One)), Local2)
            Store (DerefOf (Index (Local0, 0x03)), Local3)
            If (LNot (Local1))
            {
                If (LEqual (Local2, 0x0A))
                {
                    Store (SLEV (Local3), Local4)
                    If (And (Local4, One))
                    {
                        ^^^^BAT0.SEBI ()
                        Notify (BAT0, Zero)
                        Notify (BAT0, 0x81)
                    }

                    If (And (Local4, 0x10))
                    {
                        Notify (ACAD, 0x80)
                    }

                    Notify (BAT0, 0x80)
                }
                Else
                {
                    If (Local2)
                    {
                        Store ("_Q20: Unrecognized SMBus event:", Debug)
                        Store (Local1, Debug)
                        Store (Local2, Debug)
                        Store (Local3, Debug)
                    }
                }
            }
        }
    }

    Scope (_SB)
    {
        Method (WABS, 1, NotSerialized)
        {
            If (And (Arg0, 0x8000))
            {
                If (LEqual (Arg0, 0xFFFF))
                {
                    Return (Ones)
                }
                Else
                {
                    Not (Arg0, Local0)
                    Increment (Local0)
                    And (Local0, 0xFFFF, Local0)
                    Return (Local0)
                }
            }
            Else
            {
                Return (Arg0)
            }
        }
    }
}

