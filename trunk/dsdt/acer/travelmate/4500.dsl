/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20081031
 *
 * Disassembly of 4500, Sat Dec 27 14:32:31 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005824 (22564)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0x7F
 *     OEM ID           "ACER  "
 *     OEM Table ID     "Kestrel "
 *     OEM Revision     0x20021012 (537006098)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x0100000E (16777230)
 */
DefinitionBlock ("4500.aml", "DSDT", 1, "ACER  ", "Kestrel ", 0x20021012)
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

    OperationRegion (MNVS, SystemMemory, 0x1EEECE59, 0x60)
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
        CLNM,   8, 
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
                        0x0000000001481987, // Address
                        ,)
                }, 

                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x000000000148199C, // Address
                        ,)
                }
            })
            Method (_PSS, 0, NotSerialized)
            {
                If (CLNM)
                {
                    Return (CPSS)
                }

                Return (PPSS)
            }

            Name (CPSS, Package (0x01)
            {
                Package (0x06)
                {
                    0x0640, 
                    0x5DC0, 
                    0x0A, 
                    0x0A, 
                    0x89, 
                    0x00
                }
            })
            Name (PPSS, Package (0x05)
            {
                Package (0x06)
                {
                    0x0640, 
                    0x5DC0, 
                    0x0A, 
                    0x0A, 
                    0x89, 
                    0x00
                }, 

                Package (0x06)
                {
                    0x0578, 
                    0x4E20, 
                    0x0A, 
                    0x0A, 
                    0x8A, 
                    0x01
                }, 

                Package (0x06)
                {
                    0x04B0, 
                    0x4650, 
                    0x0A, 
                    0x0A, 
                    0x8B, 
                    0x02
                }, 

                Package (0x06)
                {
                    0x0320, 
                    0x3E80, 
                    0x0A, 
                    0x0A, 
                    0x8C, 
                    0x03
                }, 

                Package (0x06)
                {
                    0x0258, 
                    0x2EE0, 
                    0x0A, 
                    0x0A, 
                    0x8D, 
                    0x04
                }
            })
            Method (_PPC, 0, NotSerialized)
            {
                Return (0x00)
            }
        }
    }

    Name (\DSEN, 0x01)
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

    Name (\_S0, Package (0x02)
    {
        0x00, 
        0x00
    })
    Name (\_S3, Package (0x02)
    {
        0x05, 
        0x05
    })
    Name (\_S4, Package (0x02)
    {
        0x06, 
        0x06
    })
    Name (\_S5, Package (0x02)
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
        Store (0x00, \_SB.PCI0.LPC0.SMIC)
        If (Or (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            Store (0x01, \_SB.PCI0.LPC0.EC0.APWR)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0xE6, P80H)
            Store (0x80, \_SB.PCI0.LPC0.BCMD)
            Store (0x00, \_SB.PCI0.LPC0.SMIC)
            Store (0x01, \_SB.PCI0.LPC0.LV37)
            Sleep (0xC8)
            Store (0xE7, P80H)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, \_SB.S4WP)
            Store (0x82, \_SB.PCI0.LPC0.BCMD)
            Store (0x00, \_SB.PCI0.LPC0.SMIC)
            Store (One, \_SB.PCI0.LPC0.EC0.PFLG)
            Store (One, \_SB.PCI0.LPC0.EC0.S4LD)
        }

        If (LEqual (SizeOf (\_OS), 0x27)) {}
        If (LEqual (Arg0, 0x05))
        {
            Store (One, \_SB.PCI0.LPC0.EC0.S5LW)
            Store (0x00, \_SB.ECOK)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (Arg0, \_SB.STAT)
        If (Or (LEqual (\_SB.PCI0.MYOS, 0x03), LEqual (\_SB.PCI0.MYOS, 0x01)))
        {
            Store (\_SB.WLES, \_SB.PCI0.LPC0.EC0.WEST)
            Store (\_SB.BTES, \_SB.PCI0.LPC0.EC0.BEST)
            Store (One, \_SB.PCI0.LPC0.EC0.WBIN)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, \_SB.OKEC)
            Notify (\_SB.SLPB, 0x02)
        }

        If (LEqual (SizeOf (\_OS), 0x14))
        {
            Store (0xE4, P80H)
            Store (\_SB.PCI0.LPC0.RBID, Local0)
            Store (\_SB.PCI0.IDE0.BAYR, Local1)
            Store (Local0, \_SB.PCI0.IDE0.BAYR)
            If (LNotEqual (Local0, Local1))
            {
                If (Or (LEqual (Local1, 0x01), LEqual (Local1, 0x02)))
                {
                    If (And (LEqual (\_SB.PCI0.MYOS, 0x03), LEqual (Local0, 0x03)))
                    {
                        Notify (\_SB.PCI0.IDE0.SECN.BAY1, 0x03)
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.IDE0.SECN.BAY1, 0x01)
                    }
                }
            }

            If (Or (LEqual (Local0, 0x01), LEqual (Local0, 0x02)))
            {
                Notify (\_SB.PCI0.IDE0.SECN.BAY1, 0x00)
            }

            Store (0xE5, P80H)
        }

        If (LEqual (SizeOf (\_OS), 0x27)) {}
        Store (\_SB.PCI0.LPC0.EC0.ACDF, \_SB.ACST)
        If (LEqual (SizeOf (\_OS), 0x11))
        {
            Notify (\_SB.SLPB, 0x02)
        }

        Store (0x00, \_SB.SLEE)
    }

    Scope (_GPE)
    {
        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MDM0, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PCIB, 0x00)
            If (Or (LEqual (\_SB.PCI0.MYOS, 0x01), LEqual (\_SB.PCI0.MYOS, 0x03)))
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
            Sleep (0x01)
        }
    }

    Scope (_SB)
    {
        Name (STAT, 0x00)
        Name (D1ST, 0x00)
        Name (D1SJ, 0x01)
        Name (OKEC, 0x00)
        Device (PCI0)
        {
            Name (MYOS, 0x02)
            Method (_INI, 0, NotSerialized)
            {
                Store (0x01, \_SB.D1SJ)
                Store (0x02, MYOS)
                If (LEqual (SizeOf (\_OS), 0x14))
                {
                    Store (0x01, MYOS)
                    Store (0x07D0, OSYS)
                    Store (0x01, \_SB.W2KF)
                    If (CondRefOf (_OSI, Local0))
                    {
                        If (\_OSI ("Windows 2001"))
                        {
                            Store (0x03, MYOS)
                            Store (0x07D1, OSYS)
                            Store (0x03, \_SB.W2KF)
                        }
                    }
                }
                Else
                {
                    If (LEqual (SizeOf (\_OS), 0x11))
                    {
                        Store (0x00, MYOS)
                        Store (0x07CE, OSYS)
                        Store (0x00, \_SB.W2KF)
                    }
                    Else
                    {
                        If (LEqual (SizeOf (\_OS), 0x27))
                        {
                            Store (0x02, MYOS)
                            Store (0x07CF, OSYS)
                            Store (0x02, \_SB.W2KF)
                        }
                    }
                }
            }

            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_BBN, 0x00)
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
                    0x00,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    0x00,, , TypeStatic)
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
                    0x00,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y0E, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y00._LEN, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._RW, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MIN, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MAX, M1MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, M1LN)
                Multiply (0x02000000, \_SB.PCI0.MBUS.DRB3, M1MN)
                Add (Subtract (M1MX, M1MN), 0x01, M1LN)
                ShiftRight (And (\_SB.PCI0.LPC0.MTSE, 0x0380), 0x07, Local0)
                If (And (Local0, 0x04))
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0E._MIN, M2MN)
                    CreateDWordField (BUF0, \_SB.PCI0._Y0E._MAX, M2MX)
                    CreateDWordField (BUF0, \_SB.PCI0._Y0E._LEN, M2LN)
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
                        0x00, 
                        \_SB.PCI0.LPC0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x00, 
                        \_SB.PCI0.LPC0.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x01, 
                        \_SB.PCI0.LPC0.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x02, 
                        \_SB.PCI0.LPC0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001DFFFF, 
                        0x03, 
                        \_SB.PCI0.LPC0.LNKH, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x00, 
                        \_SB.PCI0.LPC0.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x001FFFFF, 
                        0x01, 
                        \_SB.PCI0.LPC0.LNKB, 
                        0x00
                    }
                })
            }

            Device (MBUS)
            {
                Name (_ADR, 0x01)
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
                OperationRegion (VNVS, SystemMemory, 0x1EEECEB9, 0x00010004)
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
                        Store (0x00, Local0)
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
                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS1, 0, NotSerialized)
                    {
                        Store (0x01, _PSC)
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
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
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
                            Return (0x01)
                        }

                        Return (0x00)
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
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
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
                            Return (0x01)
                        }

                        Return (0x00)
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
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
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
                            Return (0x01)
                        }

                        Return (0x00)
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
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
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
                            Return (0x01)
                        }

                        Return (0x00)
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
                            0x00, 
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
                            0x00, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKE, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKF, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            \_SB.PCI0.LPC0.LNKG, 
                            0x00
                        }
                    })
                }
            }

            Method (HKDS, 1, Serialized)
            {
                If (LEqual (0x00, DSEN))
                {
                    Store (Arg0, SMIF)
                    Store (0x00, TRP0)
                    If (LEqual (SMIF, 0x00))
                    {
                        If (LOr (LNotEqual (CADL, PADL), LEqual (NSTE, 0x01)))
                        {
                            Store (CADL, PADL)
                            If (LEqual (OSYS, 0x07D1))
                            {
                                Notify (\_SB.PCI0, 0x00)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.GFX0, 0x00)
                            }

                            Sleep (0x02EE)
                        }

                        Notify (\_SB.PCI0.GFX0, 0x80)
                    }
                }

                If (LEqual (0x01, DSEN))
                {
                    Store (Increment (Arg0), SMIF)
                    Store (0x00, TRP0)
                    If (LEqual (SMIF, 0x00))
                    {
                        Notify (\_SB.PCI0.GFX0, 0x81)
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
                            _Y0F)
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

                        Return (0x00)
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        ShiftRight (And (MTSE, 0x0380), 0x07, Local0)
                        If (And (Local0, 0x04))
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPC0.HPET._Y0F._BAS, HPT0)
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
                    Name (_UID, 0x01)
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
                            IRQ (Level, ActiveLow, Shared, _Y10)
                                {}
                        })
                        CreateWordField (RTLA, \_SB.PCI0.LPC0.LNKA._CRS._Y10._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRA, 0x0F), IRQ0)
                        Return (RTLA)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
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
                            IRQ (Level, ActiveLow, Shared, _Y11)
                                {}
                        })
                        CreateWordField (RTLB, \_SB.PCI0.LPC0.LNKB._CRS._Y11._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRB, 0x0F), IRQ0)
                        Return (RTLB)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
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
                            IRQ (Level, ActiveLow, Shared, _Y12)
                                {}
                        })
                        CreateWordField (RTLC, \_SB.PCI0.LPC0.LNKC._CRS._Y12._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRC, 0x0F), IRQ0)
                        Return (RTLC)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
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
                            IRQ (Level, ActiveLow, Shared, _Y13)
                                {}
                        })
                        CreateWordField (RTLD, \_SB.PCI0.LPC0.LNKD._CRS._Y13._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRD, 0x0F), IRQ0)
                        Return (RTLD)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
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
                            IRQ (Level, ActiveLow, Shared, _Y14)
                                {}
                        })
                        CreateWordField (RTLE, \_SB.PCI0.LPC0.LNKE._CRS._Y14._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRE, 0x0F), IRQ0)
                        Return (RTLE)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
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
                            IRQ (Level, ActiveLow, Shared, _Y15)
                                {}
                        })
                        CreateWordField (RTLF, \_SB.PCI0.LPC0.LNKF._CRS._Y15._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRF, 0x0F), IRQ0)
                        Return (RTLF)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
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
                            IRQ (Level, ActiveLow, Shared, _Y16)
                                {}
                        })
                        CreateWordField (RTLG, \_SB.PCI0.LPC0.LNKG._CRS._Y16._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRG, 0x0F), IRQ0)
                        Return (RTLG)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
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
                            IRQ (Level, ActiveLow, Shared, _Y17)
                                {}
                        })
                        CreateWordField (RTLH, \_SB.PCI0.LPC0.LNKH._CRS._Y17._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PIRH, 0x0F), IRQ0)
                        Return (RTLH)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
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
                    Name (_CID, EisaId ("SYN1003"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (SizeOf (\_OS), 0x14))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (PS2F)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                    }
                }

                Device (MOU2)
                {
                    Name (_HID, EisaId ("SYN1003"))
                    Name (_CID, Package (0x03)
                    {
                        EisaId ("SYN1002"), 
                        EisaId ("SYN1000"), 
                        EisaId ("PNP0F13")
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (SizeOf (\_OS), 0x14))
                        {
                            If (PS2F)
                            {
                                Store (PS2F, Local0)
                                Return (0x0F)
                            }
                            Else
                            {
                                Store (PS2F, Local0)
                                Return (0x00)
                            }
                        }
                        Else
                        {
                            Store (PS2F, Local0)
                            Return (0x00)
                        }
                    }
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    OperationRegion (SIIO, SystemIO, 0x164E, 0x02)
                    Field (SIIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (N393, 0x00)
                    Method (SETD, 1, Serialized)
                    {
                        Store (0x07, INDX)
                        Store (Arg0, DATA)
                    }

                    Method (READ, 1, Serialized)
                    {
                        Store (Arg0, INDX)
                        Store (DATA, Local0)
                        Return (Local0)
                    }

                    Method (WRIT, 2, Serialized)
                    {
                        Store (Arg0, INDX)
                        Store (Arg1, DATA)
                    }

                    Method (LDRS, 3, NotSerialized)
                    {
                        Acquire (N393, 0xFFFF)
                        Store (0x07, INDX)
                        Store (Arg0, DATA)
                        Store (Arg1, INDX)
                        Store (Arg2, DATA)
                        Release (N393)
                    }

                    Method (LDRG, 2, NotSerialized)
                    {
                        Acquire (N393, 0xFFFF)
                        Store (0x07, INDX)
                        Store (Arg0, DATA)
                        Store (Arg1, INDX)
                        Store (DATA, Local0)
                        Release (N393)
                        Return (Local0)
                    }

                    Method (RCF6, 1, NotSerialized)
                    {
                        Acquire (N393, 0xFFFF)
                        Store (0x26, INDX)
                        Store (DATA, Local0)
                        And (Local0, Arg0, Local0)
                        Release (N393)
                        Return (XOr (Local0, Arg0))
                    }

                    Method (PDRS, 2, NotSerialized)
                    {
                        If (\_SB.PCI0.LPC0.POSD)
                        {
                            If (LEqual (Arg0, 0x00))
                            {
                                If (LEqual (Arg1, 0x03F0))
                                {
                                    Store (0x00, Local0)
                                }
                                Else
                                {
                                    If (LEqual (Arg1, 0x0370))
                                    {
                                        Store (0x01, Local0)
                                    }
                                }

                                Store (Local0, \_SB.PCI0.LPC0.FDDD)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x01))
                                {
                                    If (LEqual (Arg1, 0x0378))
                                    {
                                        Store (0x00, Local0)
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg1, 0x0278))
                                        {
                                            Store (0x01, Local0)
                                        }
                                        Else
                                        {
                                            If (LEqual (Arg1, 0x03BC))
                                            {
                                                Store (0x02, Local0)
                                            }
                                        }
                                    }

                                    Store (Local0, \_SB.PCI0.LPC0.LPTD)
                                }
                                Else
                                {
                                    If (LEqual (Arg1, 0x03F8))
                                    {
                                        Store (0x00, Local0)
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg1, 0x02F8))
                                        {
                                            Store (0x01, Local0)
                                        }
                                        Else
                                        {
                                            If (LEqual (Arg1, 0x0220))
                                            {
                                                Store (0x02, Local0)
                                            }
                                            Else
                                            {
                                                If (LEqual (Arg1, 0x0228))
                                                {
                                                    Store (0x03, Local0)
                                                }
                                                Else
                                                {
                                                    If (LEqual (Arg1, 0x0238))
                                                    {
                                                        Store (0x04, Local0)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (Arg1, 0x02E8))
                                                        {
                                                            Store (0x05, Local0)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (Arg1, 0x0338))
                                                            {
                                                                Store (0x06, Local0)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (Arg1, 0x03E8))
                                                                {
                                                                    Store (0x07, Local0)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    If (LEqual (Arg0, 0x02))
                                    {
                                        Store (Local0, \_SB.PCI0.LPC0.CMBD)
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg0, 0x03))
                                        {
                                            Store (Local0, \_SB.PCI0.LPC0.CMAD)
                                        }
                                    }
                                }
                            }

                            Return (0x01)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Device (ECP)
                    {
                        Name (_HID, EisaId ("PNP0401"))
                        Name (_UID, 0x03)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (LDRG (0x01, 0xF0), Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LGreater (\_SB.PCI0.LPC0.MBTP, 0x01))
                            {
                                Return (0x00)
                            }

                            If (LAnd (RCF6 (0x02), LOr (LEqual (Local0, 0x04), LEqual (Local0, 
                                0x07))))
                            {
                                ShiftLeft (LDRG (0x01, 0x30), 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                                Return (Local1)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x01)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x00)
                        }

                        Method (_PRS, 0, NotSerialized)
                        {
                            Return (ResourceTemplate ()
                            {
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0778,             // Range Minimum
                                        0x0778,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0678,             // Range Minimum
                                        0x0678,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0778,             // Range Minimum
                                        0x0778,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0678,             // Range Minimum
                                        0x0678,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0778,             // Range Minimum
                                        0x0778,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0678,             // Range Minimum
                                        0x0678,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0778,             // Range Minimum
                                        0x0778,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0678,             // Range Minimum
                                        0x0678,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                EndDependentFn ()
                            })
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x00)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            })
                            Store (LDRG (0x01, 0x60), Local1)
                            Store (LDRG (0x01, 0x61), Local0)
                            Store (Local0, Index (DCRS, 0x02))
                            Store (Local0, Index (DCRS, 0x0A))
                            Store (Local0, Index (DCRS, 0x04))
                            Store (Local0, Index (DCRS, 0x0C))
                            Store (Local1, Index (DCRS, 0x03))
                            Store (Local1, Index (DCRS, 0x05))
                            Add (Local1, 0x04, Local1)
                            Store (Local1, Index (DCRS, 0x0B))
                            Store (Local1, Index (DCRS, 0x0D))
                            ShiftLeft (0x01, LDRG (0x01, 0x70), Local0)
                            Store (Local0, Index (DCRS, 0x11))
                            ShiftRight (Local0, 0x08, Local1)
                            Store (Local1, Index (DCRS, 0x12))
                            ShiftLeft (0x01, LDRG (0x01, 0x74), Local0)
                            Store (Local0, Index (DCRS, 0x14))
                            ShiftRight (Local0, 0x08, Local1)
                            Store (Local1, Index (DCRS, 0x15))
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            CreateWordField (Arg0, 0x14, DMAM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            FindSetRightBit (DMAM, Local1)
                            Decrement (Local1)
                            LDRS (0x01, 0x70, Local0)
                            LDRS (0x01, 0x74, Local1)
                            LDRS (0x01, 0x60, ADRM)
                            LDRS (0x01, 0x61, ADRL)
                            LDRS (0x01, 0x30, 0x01)
                        }
                    }

                    Device (EPP)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x02)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (LDRG (0x01, 0xF0), Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LGreater (\_SB.PCI0.LPC0.MBTP, 0x01))
                            {
                                Return (0x00)
                            }

                            If (LAnd (RCF6 (0x02), LOr (LEqual (Local0, 0x02), LEqual (Local0, 
                                0x03))))
                            {
                                ShiftLeft (LDRG (0x01, 0x30), 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                                Return (Local1)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x01)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x00)
                        }

                        Method (_PRS, 0, NotSerialized)
                        {
                            Return (ResourceTemplate ()
                            {
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0778,             // Range Minimum
                                        0x0778,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0678,             // Range Minimum
                                        0x0678,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0778,             // Range Minimum
                                        0x0778,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0678,             // Range Minimum
                                        0x0678,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0178,             // Range Minimum
                                        0x0178,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0578,             // Range Minimum
                                        0x0578,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0178,             // Range Minimum
                                        0x0178,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0578,             // Range Minimum
                                        0x0578,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                EndDependentFn ()
                            })
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x00)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            Store (LDRG (0x01, 0x60), Local1)
                            Store (LDRG (0x01, 0x61), Local0)
                            Store (Local0, Index (DCRS, 0x02))
                            Store (Local0, Index (DCRS, 0x0A))
                            Store (Local0, Index (DCRS, 0x04))
                            Store (Local0, Index (DCRS, 0x0C))
                            Store (Local1, Index (DCRS, 0x03))
                            Store (Local1, Index (DCRS, 0x05))
                            Add (Local1, 0x04, Local1)
                            Store (Local1, Index (DCRS, 0x0B))
                            Store (Local1, Index (DCRS, 0x0D))
                            ShiftLeft (0x01, LDRG (0x01, 0x70), Local0)
                            Store (Local0, Index (DCRS, 0x11))
                            ShiftRight (Local0, 0x08, Local1)
                            Store (Local1, Index (DCRS, 0x12))
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            LDRS (0x01, 0x70, Local0)
                            LDRS (0x01, 0x60, ADRM)
                            LDRS (0x01, 0x61, ADRL)
                            LDRS (0x01, 0x30, 0x01)
                        }
                    }

                    Device (LPTB)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (LDRG (0x01, 0xF0), Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LGreater (\_SB.PCI0.LPC0.MBTP, 0x01))
                            {
                                Return (0x00)
                            }

                            If (LAnd (RCF6 (0x02), LEqual (Local0, 0x01)))
                            {
                                ShiftLeft (LDRG (0x01, 0x30), 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                                Return (Local1)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x01)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x00)
                        }

                        Method (_PRS, 0, NotSerialized)
                        {
                            Return (ResourceTemplate ()
                            {
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0778,             // Range Minimum
                                        0x0778,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0678,             // Range Minimum
                                        0x0678,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0778,             // Range Minimum
                                        0x0778,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0678,             // Range Minimum
                                        0x0678,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03BC,             // Range Minimum
                                        0x03BC,             // Range Maximum
                                        0x04,               // Alignment
                                        0x04,               // Length
                                        )
                                    IO (Decode16,
                                        0x07BC,             // Range Minimum
                                        0x07BC,             // Range Maximum
                                        0x04,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03BC,             // Range Minimum
                                        0x03BC,             // Range Maximum
                                        0x04,               // Alignment
                                        0x04,               // Length
                                        )
                                    IO (Decode16,
                                        0x07BC,             // Range Minimum
                                        0x07BC,             // Range Maximum
                                        0x04,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                EndDependentFn ()
                            })
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x00)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            Store (LDRG (0x01, 0x60), Local1)
                            Store (LDRG (0x01, 0x61), Local0)
                            Store (Local0, Index (DCRS, 0x02))
                            Store (Local0, Index (DCRS, 0x0A))
                            Store (Local0, Index (DCRS, 0x04))
                            Store (Local0, Index (DCRS, 0x0C))
                            Store (Local1, Index (DCRS, 0x03))
                            Store (Local1, Index (DCRS, 0x05))
                            Add (Local1, 0x04, Local1)
                            Store (Local1, Index (DCRS, 0x0B))
                            Store (Local1, Index (DCRS, 0x0D))
                            If (And (Local0, 0x04))
                            {
                                Store (0x04, Local0)
                            }
                            Else
                            {
                                Store (0x08, Local0)
                            }

                            Store (Local0, Index (DCRS, 0x06))
                            Store (Local0, Index (DCRS, 0x07))
                            Store (Local0, Index (DCRS, 0x0E))
                            Store (Local0, Index (DCRS, 0x0F))
                            ShiftLeft (0x01, LDRG (0x01, 0x70), Local0)
                            Store (Local0, Index (DCRS, 0x11))
                            ShiftRight (Local0, 0x08, Local1)
                            Store (Local1, Index (DCRS, 0x12))
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            LDRS (0x01, 0x70, Local0)
                            LDRS (0x01, 0x60, ADRM)
                            LDRS (0x01, 0x61, ADRL)
                            LDRS (0x01, 0x30, 0x01)
                        }
                    }

                    Device (LPT)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (LDRG (0x01, 0xF0), Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LGreater (\_SB.PCI0.LPC0.MBTP, 0x01))
                            {
                                Return (0x00)
                            }

                            If (LAnd (RCF6 (0x02), LEqual (Local0, 0x00)))
                            {
                                ShiftLeft (LDRG (0x01, 0x30), 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                                Return (Local1)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x01)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x00)
                        }

                        Method (_PRS, 0, NotSerialized)
                        {
                            Return (ResourceTemplate ()
                            {
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0778,             // Range Minimum
                                        0x0778,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0678,             // Range Minimum
                                        0x0678,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0778,             // Range Minimum
                                        0x0778,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IO (Decode16,
                                        0x0678,             // Range Minimum
                                        0x0678,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03BC,             // Range Minimum
                                        0x03BC,             // Range Maximum
                                        0x04,               // Alignment
                                        0x04,               // Length
                                        )
                                    IO (Decode16,
                                        0x07BC,             // Range Minimum
                                        0x07BC,             // Range Maximum
                                        0x04,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03BC,             // Range Minimum
                                        0x03BC,             // Range Maximum
                                        0x04,               // Alignment
                                        0x04,               // Length
                                        )
                                    IO (Decode16,
                                        0x07BC,             // Range Minimum
                                        0x07BC,             // Range Maximum
                                        0x04,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                EndDependentFn ()
                            })
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            LDRS (0x01, 0x30, 0x00)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            Store (LDRG (0x01, 0x60), Local1)
                            Store (LDRG (0x01, 0x61), Local0)
                            Store (Local0, Index (DCRS, 0x02))
                            Store (Local0, Index (DCRS, 0x0A))
                            Store (Local0, Index (DCRS, 0x04))
                            Store (Local0, Index (DCRS, 0x0C))
                            Store (Local1, Index (DCRS, 0x03))
                            Store (Local1, Index (DCRS, 0x05))
                            Add (Local1, 0x04, Local1)
                            Store (Local1, Index (DCRS, 0x0B))
                            Store (Local1, Index (DCRS, 0x0D))
                            If (And (Local0, 0x04))
                            {
                                Store (0x04, Local0)
                            }
                            Else
                            {
                                Store (0x08, Local0)
                            }

                            Store (Local0, Index (DCRS, 0x06))
                            Store (Local0, Index (DCRS, 0x07))
                            Store (Local0, Index (DCRS, 0x0E))
                            Store (Local0, Index (DCRS, 0x0F))
                            ShiftLeft (0x01, LDRG (0x01, 0x70), Local0)
                            Store (Local0, Index (DCRS, 0x11))
                            ShiftRight (Local0, 0x08, Local1)
                            Store (Local1, Index (DCRS, 0x12))
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            LDRS (0x01, 0x70, Local0)
                            LDRS (0x01, 0x60, ADRM)
                            LDRS (0x01, 0x61, ADRL)
                            LDRS (0x01, 0x30, 0x01)
                        }
                    }

                    Device (COMA)
                    {
                        Name (_HID, EisaId ("PNP0501"))
                        Name (_UID, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LGreater (\_SB.PCI0.LPC0.MBTP, 0x01))
                            {
                                Return (0x00)
                            }

                            If (RCF6 (0x08))
                            {
                                ShiftLeft (LDRG (0x03, 0x30), 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                                Return (Local1)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            LDRS (0x03, 0x30, 0x01)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            LDRS (0x03, 0x30, 0x00)
                        }

                        Method (_PRS, 0, NotSerialized)
                        {
                            Return (ResourceTemplate ()
                            {
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                EndDependentFn ()
                            })
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            LDRS (0x03, 0x30, 0x00)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            })
                            Store (LDRG (0x03, 0x60), Local1)
                            Store (LDRG (0x03, 0x61), Local0)
                            Store (Local0, Index (DCRS, 0x02))
                            Store (Local0, Index (DCRS, 0x04))
                            Store (Local1, Index (DCRS, 0x03))
                            Store (Local1, Index (DCRS, 0x05))
                            ShiftLeft (0x01, LDRG (0x03, 0x70), Local0)
                            Store (Local0, Index (DCRS, 0x09))
                            ShiftRight (Local0, 0x08, Local1)
                            Store (Local1, Index (DCRS, 0x0A))
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            LDRS (0x03, 0x70, Local0)
                            LDRS (0x03, 0x60, ADRM)
                            LDRS (0x03, 0x61, ADRL)
                            LDRS (0x03, 0x30, 0x01)
                        }
                    }

                    Device (FIR)
                    {
                        Method (_HID, 0, NotSerialized)
                        {
                            If (LOr (LEqual (MYOS, 0x01), LEqual (MYOS, 0x03)))
                            {
                                Return (0x0160633A)
                            }
                            Else
                            {
                                Return (0x0160633A)
                            }
                        }

                        Name (_UID, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (LDRG (0x02, 0x74), Local0)
                            If (LAnd (RCF6 (0x04), LNotEqual (Local0, 0x04)))
                            {
                                ShiftLeft (LDRG (0x02, 0x30), 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                                Return (Local1)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            LDRS (0x02, 0x30, 0x01)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            LDRS (0x02, 0x30, 0x00)
                        }

                        Method (_PRS, 0, NotSerialized)
                        {
                            Return (ResourceTemplate ()
                            {
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {0}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {0}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {0}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {0}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {0}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {0}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {0}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {0}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {1}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8, )
                                        {3}
                                }
                                EndDependentFn ()
                            })
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            LDRS (0x02, 0x30, 0x00)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            })
                            Store (LDRG (0x02, 0x60), Local1)
                            Store (LDRG (0x02, 0x61), Local0)
                            Store (Local0, Index (DCRS, 0x02))
                            Store (Local0, Index (DCRS, 0x04))
                            Store (Local1, Index (DCRS, 0x03))
                            Store (Local1, Index (DCRS, 0x05))
                            ShiftLeft (0x01, LDRG (0x02, 0x70), Local0)
                            Store (Local0, Index (DCRS, 0x09))
                            ShiftRight (Local0, 0x08, Local1)
                            Store (Local1, Index (DCRS, 0x0A))
                            ShiftLeft (0x01, LDRG (0x02, 0x74), Local0)
                            Store (Local0, Index (DCRS, 0x0C))
                            ShiftRight (Local0, 0x08, Local1)
                            Store (Local1, Index (DCRS, 0x0D))
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            CreateWordField (Arg0, 0x0C, DMAM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            FindSetRightBit (DMAM, Local1)
                            Decrement (Local1)
                            LDRS (0x02, 0x70, Local0)
                            LDRS (0x02, 0x74, Local1)
                            LDRS (0x02, 0x60, ADRM)
                            LDRS (0x02, 0x61, ADRL)
                            PDRS (0x02, Add (ShiftLeft (ADRM, 0x08), ADRL))
                            LDRS (0x02, 0x30, 0x01)
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
                    Name (OSEJ, 0x00)
                    Device (SMBC)
                    {
                        Name (_HID, "ACPI0001")
                        Name (_EC, 0x1820)
                        Device (SBS0)
                        {
                            Name (_HID, "ACPI0002")
                            Name (_SBS, 0x02)
                        }
                    }

                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, \_SB.OKEC)
                            Store (Arg1, \_SB.ECOK)
                            If (Or (LEqual (\_SB.PCI0.MYOS, 0x03), LEqual (\_SB.PCI0.MYOS, 0x01)))
                            {
                                If (Arg1)
                                {
                                    Store (0x01, \_SB.PCI0.LPC0.EC0.RG57)
                                }

                                Store (\_SB.WLES, \_SB.PCI0.LPC0.EC0.WEST)
                                Store (\_SB.BTES, \_SB.PCI0.LPC0.EC0.BEST)
                                Store (One, \_SB.PCI0.LPC0.EC0.WBIN)
                                Store (DOFF, \_SB.PCI0.LPC0.EC0.TMOF)
                            }
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
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
                        SMW0,   16
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        SMB0,   8
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
                        Store (0x01, EBPL)
                    }

                    Name (ECUS, 0x00)
                    Name (BATO, 0x00)
                    Name (BATN, 0x00)
                    Name (BATF, 0xC0)
                    Method (_Q09, 0, NotSerialized)
                    {
                        If (LEqual (SizeOf (\_OS), 0x14)) {}
                        If (LEqual (SizeOf (\_OS), 0x14))
                        {
                            BPOL (0x3C)
                        }
                    }

                    Method (_Q20, 0, NotSerialized)
                    {
                        If (And (SMST, 0x40))
                        {
                            Store (SMAA, Local0)
                            If (LEqual (Local0, 0x14))
                            {
                                And (SMST, 0xBF, SMST)
                            }
                        }
                    }

                    Method (SELE, 0, NotSerialized)
                    {
                        Store (BATD, BATN)
                        Store (0x00, BATF)
                        If (And (0xC0, BATN))
                        {
                            Or (BATF, 0x01, BATF)
                        }

                        If (And (0x0300, BATN))
                        {
                            Or (BATF, 0x04, BATF)
                        }

                        And (BATN, 0x01, Local0)
                        And (BATO, 0x01, Local1)
                        If (Local0)
                        {
                            Or (BATF, 0x0100, BATF)
                        }
                        Else
                        {
                            And (BATF, 0xFEFF, BATF)
                        }

                        If (Not (LEqual (Local0, Local1)))
                        {
                            Or (BATF, 0x40, BATF)
                        }

                        And (BATN, 0x02, Local0)
                        And (BATO, 0x02, Local1)
                        If (Local0)
                        {
                            Or (BATF, 0x0200, BATF)
                        }
                        Else
                        {
                            And (BATF, 0xFDFF, BATF)
                        }

                        If (Not (LEqual (Local0, Local1)))
                        {
                            Or (BATF, 0x80, BATF)
                        }

                        And (BATN, 0xC0, Local0)
                        And (BATO, 0xC0, Local1)
                        If (Not (LEqual (Local0, Local1)))
                        {
                            Or (BATF, 0x02, BATF)
                        }

                        If (And (0x01, BATF))
                        {
                            If (And (0x04, BATF))
                            {
                                If (And (BATN, 0x20))
                                {
                                    Or (BATF, 0x10, BATF)
                                }
                                Else
                                {
                                    Or (BATF, 0x20, BATF)
                                }
                            }
                        }
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Store ("Sleep Button Query: Fn+F4", Debug)
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                        Store ("Switch Display: Fn+F5", Debug)
                        If (IGDS)
                        {
                            Store (0x01, PAR2)
                            HKDS (0x10)
                        }
                    }

                    Name (DSID, 0x01)
                    Name (SDST, 0x00)
                    Method (_Q0F, 0, NotSerialized)
                    {
                        Store ("NMB Switch Display: Ny NMB Utility", Debug)
                        If (IGDS)
                        {
                            Store (\_SB.DISD, Local0)
                            If (LEqual (Local0, DSID))
                            {
                                Store (Increment (SDST), SDST)
                            }
                            Else
                            {
                                Store (0x00, SDST)
                            }

                            If (LLessEqual (SDST, 0x06))
                            {
                                If (LEqual (Local0, 0x01))
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
                        Store (0x8C, \_SB.PCI0.LPC0.BCMD)
                        Store (0x00, \_SB.PCI0.LPC0.SMIC)
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store ("Brightness Down: Fn+<-", Debug)
                        Store (0x8D, \_SB.PCI0.LPC0.BCMD)
                        Store (0x00, \_SB.PCI0.LPC0.SMIC)
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
                            Store (0x01, LIDE)
                            Notify (\_SB.LID, 0x80)
                        }

                        If (DB2E)
                        {
                            Store ("-------- Device R-Bay Event ------", Debug)
                            Store (0x01, DB2E)
                            Store (0xB1, P80H)
                            If (Or (LEqual (\_SB.PCI0.MYOS, 0x01), LEqual (\_SB.PCI0.MYOS, 0x03)))
                            {
                                If (DB2S)
                                {
                                    Store (0xB2, P80H)
                                    Store ("----------- Device Bay Change Status ---------- IN ", Debug)
                                    Store (\_SB.PCI0.LPC0.RBID, Local0)
                                    Store (Local0, \_SB.PCI0.IDE0.BAYR)
                                    If (LEqual (Local0, 0x00))
                                    {
                                        Store (0xB4, P80H)
                                        Store (0x00, \_SB.PCI0.LPC0.LV37)
                                        Sleep (0xC8)
                                    }
                                    Else
                                    {
                                        Store (0xB5, P80H)
                                        Store (0x00, \_SB.PCI0.LPC0.LV37)
                                        Sleep (0x64)
                                        Store (0x00, \_SB.PCI0.LPC0.LV39)
                                        Sleep (0xC8)
                                        Store (0x01, \_SB.PCI0.LPC0.LV39)
                                        Sleep (0x09C4)
                                        Sleep (0xC8)
                                        Sleep (0xC8)
                                        Sleep (0x64)
                                        Store (0x01, \_SB.PCI0.IDE0.SSIG)
                                        Store (0x01, \_SB.PCI0.IDE0.UDC1)
                                        Store (0x02, \_SB.PCI0.IDE0.UDT1)
                                        Or (\_SB.PCI0.IDE0.FSCB, 0x04, \_SB.PCI0.IDE0.FSCB)
                                        Store (0xE303, \_SB.PCI0.IDE0.ITM1)
                                        Store (0x00, \_SB.PCI0.IDE0.SSIG)
                                        Notify (\_SB.PCI0.IDE0.SECN.BAY1, 0x00)
                                        Store (0xB6, P80H)
                                    }
                                }
                                Else
                                {
                                    Store (0xB7, P80H)
                                    Store ("-------- Device Bay Event ------ OUT ", Debug)
                                    Store (\_SB.PCI0.IDE0.BAYR, Local0)
                                    Store (0x01, \_SB.PCI0.LPC0.LV37)
                                    Sleep (0xC8)
                                    If (Or (LEqual (Local0, 0x01), LEqual (Local0, 0x02)))
                                    {
                                        Notify (\_SB.PCI0.IDE0.SECN.BAY1, 0x01)
                                        Store (0xB8, P80H)
                                    }
                                }
                            }
                        }
                    }
                }

                OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x1EEFCEBD, 0x00000090)
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
                OperationRegion (PCI, PCI_Config, 0x00, 0x58)
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
                Name (CMDC, 0x00)
                Name (BAYR, 0x00)
                Method (_INI, 0, NotSerialized)
                {
                    Store (\_SB.PCI0.LPC0.RBID, BAYR)
                }

                Method (GTFB, 3, Serialized)
                {
                    Multiply (CMDC, 0x38, Local0)
                    CreateField (ATAB, Local0, 0x38, CMDX)
                    Multiply (CMDC, 0x07, Local0)
                    CreateByteField (ATAB, Add (Local0, 0x01), A001)
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
                    CreateDWordField (Arg2, 0x00, PIO0)
                    CreateDWordField (Arg2, 0x04, DMA0)
                    CreateDWordField (Arg2, 0x08, PIO1)
                    CreateDWordField (Arg2, 0x0C, DMA1)
                    CreateDWordField (Arg2, 0x10, CHNF)
                    Store (0x00, CMDC)
                    Name (ID00, 0x80)
                    Name (ID49, 0x0C00)
                    Name (ID59, 0x00)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, 0x01)
                    Name (PIOT, 0x00)
                    Name (DMAT, 0x00)
                    If (LEqual (SizeOf (Arg1), 0x0200))
                    {
                        CreateByteField (Arg1, 0x00, IB00)
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
                        If (And (CHNF, 0x01))
                        {
                            Store (DMA0, DMAT)
                        }
                    }

                    If (LAnd (And (ID53, 0x04), And (ID88, 0xFF)))
                    {
                        Store (0x00, Local1)
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
                        Store (Match (DerefOf (Index (TIM0, 0x00)), MGE, PIOT, MTR, 
                            0x00, 0x00), Local1)
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
                            GTFB (AT01, 0x01, Local7)
                        }
                    }

                    Release (GTFM)
                    Return (ATAB)
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x00, CMDN)
                    Multiply (CMDN, 0x38, Local0)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Return (RETB)
                }

                Name (REGF, 0x01)
                Method (_REG, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, REGF)
                    }
                }

                Name (BAYD, 0x00)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (GTM, 6, NotSerialized)
                {
                    Store (Buffer (0x14) {}, Local0)
                    CreateDWordField (Local0, 0x00, PIO0)
                    CreateDWordField (Local0, 0x04, DMA0)
                    CreateDWordField (Local0, 0x08, PIO1)
                    CreateDWordField (Local0, 0x0C, DMA1)
                    CreateDWordField (Local0, 0x10, FLAG)
                    If (LOr (And (Arg0, 0x08), LNot (And (Arg0, 0x01
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

                    If (And (Arg2, 0x01))
                    {
                        If (And (Arg5, 0x01))
                        {
                            Store (0x08, DMA0)
                        }
                        Else
                        {
                            Subtract (0x04, And (Arg3, 0x03), Local1)
                            If (And (Arg4, 0x01))
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
                    If (And (Arg0, 0x01))
                    {
                        Or (FLAG, 0x10, FLAG)
                    }

                    If (And (Arg2, 0x01))
                    {
                        Or (FLAG, 0x01, FLAG)
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
                    CreateDWordField (Local7, 0x00, ITM)
                    CreateDWordField (Local7, 0x04, SIT)
                    CreateDWordField (Local7, 0x08, UDC)
                    CreateDWordField (Local7, 0x0C, UDT)
                    CreateDWordField (Local7, 0x10, ICF)
                    CreateDWordField (Local7, 0x14, A100)
                    Store (0x01, WPPE)
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Store (FLAG, Local4)
                    Store (0x4000, Local0)
                    Name (W49M, 0x00)
                    Name (W53M, 0x00)
                    Name (W62M, 0x00)
                    Name (W64M, 0x00)
                    Name (W88M, 0x00)
                    If (LEqual (SizeOf (Arg1), 0x0200))
                    {
                        CreateDWordField (Arg1, 0x00, W00A)
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
                        Store (0x00, W49M)
                        Store (0x00, W53M)
                        Store (0x00, W62M)
                        Store (0x00, W64M)
                        Store (0x00, W88M)
                    }

                    Name (W49S, 0x00)
                    Name (W53S, 0x00)
                    Name (W62S, 0x00)
                    Name (W64S, 0x00)
                    Name (W88S, 0x00)
                    If (LEqual (SizeOf (Arg2), 0x0200))
                    {
                        CreateDWordField (Arg2, 0x00, W00B)
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
                        Store (0x00, W49S)
                        Store (0x00, W53S)
                        Store (0x00, W62S)
                        Store (0x00, W64S)
                        Store (0x00, W88S)
                    }

                    Store (0x00, A100)
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
                        Or (Local0, 0x01, Local0)
                    }

                    If (LAnd (And (W49S, 0x0800), And (Local4, 0x08)))
                    {
                        Or (Local0, 0x20, Local0)
                    }

                    If (LLess (PIO1, 0x0384))
                    {
                        Or (Local0, 0x10, Local0)
                    }

                    If (And (Local4, 0x01))
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
                                If (LAnd (And (W64M, 0x01), LLessEqual (Local1, 0xB4)))
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
                                    If (LAnd (And (W64S, 0x01), LLessEqual (Local1, 0xB4)))
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
                    Store (0x00, Local0)
                    If (LAnd (And (0x3F, W88M), And (Local4, 0x01)))
                    {
                        Or (Local0, 0x01, Local0)
                    }

                    If (And (Local4, 0x04))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    Store (Local0, UDC)
                    Store (0x00, Local0)
                    If (And (Local4, 0x01))
                    {
                        If (LLess (DMA0, 0x1E))
                        {
                            Or (A100, 0x1000, A100)
                            Or (Local0, 0x01, Local0)
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
                    Store (0x00, Local0)
                    If (LLess (DMA0, 0x3C))
                    {
                        Or (Local0, 0x01, Local0)
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
                    CreateByteField (Local7, 0x01, MODE)
                    If (And (Arg2, 0x01))
                    {
                        If (And (Arg6, 0x01))
                        {
                            Store (0x45, MODE)
                        }
                        Else
                        {
                            And (Arg3, 0x03, Local0)
                            If (And (Arg4, 0x01))
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
                    If (LOr (And (Arg0, 0x08), LNot (And (Arg0, 0x01
                        ))))
                    {
                        If (And (Arg0, 0x02))
                        {
                            Store (0x00, MODE)
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
                    Name (_ADR, 0x00)
                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
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
                        Store (^^GTM (^^ITM0, ^^SIT0, ^^UDC0, ^^UDT0, ^^ICF0, ^^FSCB), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (GTF (0x00, Arg1, Arg0), ATA0)
                        Store (GTF (0x01, Arg2, Arg0), ATA1)
                        Store (^^STMS (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        Store (ITM, ^^ITM0)
                        Store (SIT, ^^SIT0)
                        Store (UDC, ^^UDC0)
                        Store (UDT, ^^UDT0)
                        CreateDWordField (Local0, 0x14, A100)
                        Or (And (^^CB80, 0x0C), ShiftRight (And (0x30, A100), 
                            0x04), ^^CB80)
                        Or (And (^^FSCB, 0x0C), ShiftRight (And (0x3000, A100), 
                            0x0C), ^^FSCB)
                        Or (And (^^FATS, 0x0C), ShiftRight (And (0x00300000, A100), 
                            0x14), ^^FATS)
                        Store (ICF, ^^ICF0)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA0))
                        }
                    }
                }

                Device (SECN)
                {
                    Name (_ADR, 0x01)
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

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
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
                        Store (^^FSCB, Local1)
                        ShiftRight (Local1, 0x02, Local1)
                        Store (^^GTM (^^ITM1, ^^SIT1, ^^UDC1, ^^UDT1, ^^ICF1, Local1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (GTF (0x00, Arg1, Arg0), ATA2)
                        Store (GTF (0x01, Arg2, Arg0), ATA3)
                        Store (^^STMS (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, 0x00, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        Store (ITM, ^^ITM1)
                        Store (SIT, ^^SIT1)
                        Store (UDC, ^^UDC1)
                        Store (UDT, ^^UDT1)
                        CreateDWordField (Local0, 0x14, A100)
                        Or (And (^^CB80, 0x03), ShiftRight (And (0x30, A100), 
                            0x02), ^^CB80)
                        Or (And (^^FSCB, 0x03), ShiftRight (And (0x3000, A100), 
                            0x0A), ^^FSCB)
                        Or (And (^^FATS, 0x03), ShiftRight (And (0x00300000, A100), 
                            0x12), ^^FATS)
                        Store (ICF, ^^ICF1)
                    }

                    Device (BAY1)
                    {
                        Name (_ADR, 0x00)
                        Name (H15F, Zero)
                        Name (EJ0F, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA2))
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            If (\_SB.PCI0.IDE0.ESID)
                            {
                                \_SB.PCI0.IDE0.SECN.CBAY ()
                                Store (^^BFLG, Local0)
                                If (LEqual (^^BNUM, 0x01))
                                {
                                    If (And (Local0, 0x01))
                                    {
                                        If (\_SB.PCI0.LPC0.LV37)
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
                                    If (LEqual (^^BNUM, 0x02))
                                    {
                                        If (\_SB.PCI0.LPC0.LV37)
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

                        Method (_EJ0, 1, NotSerialized)
                        {
                            If (Arg0)
                            {
                                If (LGreater (\_SB.PCI0.LPC0.MBTP, 0x01))
                                {
                                    Sleep (0x32)
                                }
                                Else
                                {
                                    Store (0x01, ^^^SSIG)
                                    Sleep (0x32)
                                    Store (0xC000, ^^^ITM1)
                                    Store (0x01, \_SB.PCI0.LPC0.LV37)
                                    Sleep (0xC8)
                                    Store (0x00, \_SB.PCI0.LPC0.LV39)
                                    Sleep (0xC8)
                                }
                            }
                        }
                    }

                    Name (BNUM, 0x00)
                    Name (BFLG, 0x00)
                    Method (CBAY, 0, NotSerialized)
                    {
                        Store (0x00, BNUM)
                        Store (0x00, BFLG)
                        Store (\_SB.PCI0.LPC0.RBID, Local0)
                        If (Or (LEqual (Local0, 0x01), LEqual (Local0, 0x02)))
                        {
                            Increment (BNUM)
                            Or (BFLG, 0x01, BFLG)
                        }
                    }
                }

                Method (_PS0, 0, NotSerialized)
                {
                    If (And (LEqual (_PSC, 0x03), LEqual (\_SB.STAT, 0x03)))
                    {
                        Store (0x89, \_SB.PCI0.LPC0.BCMD)
                        Store (0x00, \_SB.PCI0.LPC0.SMIC)
                        Store (0xB0, P80H)
                    }

                    Store (0x00, _PSC)
                }

                Method (_PS3, 0, NotSerialized)
                {
                    Store (0x03, _PSC)
                    Store (0xB3, P80H)
                }

                Name (_PSC, 0x00)
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
                        Store (0x03, \_SB.PCI0.USB1.RSEN)
                    }
                    Else
                    {
                        Store (0x00, \_SB.PCI0.USB1.RSEN)
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
                        Store (0x03, \_SB.PCI0.USB2.RSEN)
                    }
                    Else
                    {
                        Store (0x00, \_SB.PCI0.USB2.RSEN)
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
                        Store (0x03, \_SB.PCI0.USB3.RSEN)
                    }
                    Else
                    {
                        Store (0x00, \_SB.PCI0.USB3.RSEN)
                    }
                }
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Name (LSTS, 0x00)
            Method (_LID, 0, NotSerialized)
            {
                If (\_SB.OKEC)
                {
                    If (\_SB.PCI0.LPC0.EC0.LIDS)
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
            CreateByteField (TVAR, 0x00, PLCY)
            CreateWordField (TVAR, 0x01, CTOS)
            CreateWordField (TVAR, 0x03, CTHY)
            Device (FAN0)
            {
                Name (_HID, EisaId ("PNP0C0B"))
                Name (_UID, 0x01)
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
                Name (FNS1, 0x00)
                Name (FFST, 0x01)
                Method (_STA, 0, NotSerialized)
                {
                    Store (FNS1, Local1)
                    Return (Local1)
                }

                Method (_ON, 0, NotSerialized)
                {
                    Store (0x01, FNS1)
                    If (\_TZ.PFN1.FNS2)
                    {
                        Store ("FAN 1 (High speed already turn on) ", Debug)
                    }
                    Else
                    {
                        If (\_SB.OKEC)
                        {
                            Store (0xB4, \_SB.PCI0.LPC0.EC0.FSPD)
                            Store (0x01, \_SB.PCI0.LPC0.EC0.FPR1)
                        }
                    }

                    If (Or (LEqual (\_SB.PCI0.MYOS, 0x01), LEqual (\_SB.PCI0.MYOS, 0x03)))
                    {
                        \_TZ.THRM._SCP (0x01)
                    }
                }

                Method (_OFF, 0, NotSerialized)
                {
                    Store (0x00, FNS1)
                    If (LEqual (SizeOf (\_OS), 0x14))
                    {
                        If (\_SB.OKEC)
                        {
                            If (\_TZ.PFN1.FNS2)
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
                            Store (0x00, \_SB.PCI0.LPC0.SMIC)
                            Increment (FFST)
                        }
                        Else
                        {
                            If (\_SB.OKEC)
                            {
                                Store (0x00, \_SB.PCI0.LPC0.EC0.FPR1)
                            }
                        }
                    }

                    If (Or (LEqual (\_SB.PCI0.MYOS, 0x01), LEqual (\_SB.PCI0.MYOS, 0x03)))
                    {
                        \_TZ.THRM._SCP (0x01)
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
                Name (FNS2, 0x00)
                Method (_STA, 0, NotSerialized)
                {
                    Return (FNS2)
                }

                Method (_ON, 0, NotSerialized)
                {
                    Store (0x01, FNS2)
                    If (\_SB.OKEC)
                    {
                        Store (0xFF, \_SB.PCI0.LPC0.EC0.FSPD)
                        Store (0x01, \_SB.PCI0.LPC0.EC0.FPR1)
                    }

                    If (Or (LEqual (\_SB.PCI0.MYOS, 0x01), LEqual (\_SB.PCI0.MYOS, 0x03)))
                    {
                        \_TZ.THRM._SCP (0x01)
                    }
                }

                Method (_OFF, 0, NotSerialized)
                {
                    Store (Zero, FNS2)
                    Store (0x00, FNS2)
                    If (\_TZ.PFN0.FNS1)
                    {
                        If (\_SB.OKEC)
                        {
                            Store (0xB4, \_SB.PCI0.LPC0.EC0.FSPD)
                            Store (0x01, \_SB.PCI0.LPC0.EC0.FPR1)
                        }
                    }
                    Else
                    {
                        If (\_SB.OKEC)
                        {
                            Store (0x00, \_SB.PCI0.LPC0.EC0.FPR1)
                        }
                    }

                    If (Or (LEqual (\_SB.PCI0.MYOS, 0x01), LEqual (\_SB.PCI0.MYOS, 0x03)))
                    {
                        \_TZ.THRM._SCP (0x01)
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
                    If (\_TZ.PFN0.FNS1)
                    {
                        If (LEqual (\_TZ.PFN1.FNS2, 0x00))
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
                        If (\_TZ.PFN1.FNS2)
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
                    Notify (\_TZ.THRM, 0x81)
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
}

