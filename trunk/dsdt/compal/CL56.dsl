/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of ../../pmtools-20070511/acpidump/DSDT.aml, Sat Aug 18 14:46:17 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00004E8A (20106)
 *     Revision         0x01
 *     OEM ID           "COMPAL"
 *     OEM Table ID     "DCL561"
 *     OEM Revision     0x00000006 (6)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("../../pmtools-20070511/acpidump/DSDT.aml", "DSDT", 1, "COMPAL", "DCL561", 0x00000006)
{
    OperationRegion (MNVS, SystemMemory, 0x1FFFFC00, 0x60)
    Field (MNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        CMAP,   8, 
        CMBP,   8, 
        FDCP,   8, 
        LPTP,   8, 
        BTEN,   8, 
        IGDS,   8, 
        LCDA,   16, 
        TLST,   8, 
        CADL,   16, 
        PADL,   16, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        BRAD,   8
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06)
        {
            Method (_CST, 0, NotSerialized)
            {
                Return (Package (0x05)
                {
                    0x04, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x08,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        0x01, 
                        0x01, 
                        0x03E8
                    }, 

                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x08,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001014, // Address
                                ,)
                        }, 

                        0x02, 
                        0x01, 
                        0x01F4
                    }, 

                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x08,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001015, // Address
                                ,)
                        }, 

                        0x03, 
                        0x55, 
                        0xFA
                    }, 

                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x08,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001016, // Address
                                ,)
                        }, 

                        0x03, 
                        0xB9, 
                        0x64
                    }
                })
            }
        }
    }

    Name (\_S0, Package (0x02)
    {
        0x00, 
        0x00
    })
    Name (\_S1, Package (0x02)
    {
        0x02, 
        0x02
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
    OperationRegion (PORT, SystemIO, 0x80, 0x01)
    Field (PORT, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
    }

    Name (ECDY, 0x03)
    Name (OSTP, 0x00)
    Name (\GPIC, 0x00)
    Name (\ACPS, 0x00)
    Method (_PTS, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            \_SB.GSMI (0x09)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x07, \_SB.PCI0.LPC0.UHCI)
            Store (0x01, \_SB.PCI0.LPC0.EHCI)
            \_SB.GSMI (0x02)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            If (LEqual (OSTP, 0x01))
            {
                Notify (\_SB.PWRB, 0x02)
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            Notify (\_SB.PWRB, 0x02)
            Store (0x00, \_SB.PCI0.LPC0.UHCI)
            Store (0x00, \_SB.PCI0.LPC0.EHCI)
            \_SB.GSMI (0x05)
        }

        Return (0x00)
    }

    Scope (_GPE)
    {
        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MODM, 0x02)
        }

        Method (_L08, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.HUB, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.HUB, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB3, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.EUSB, 0x02)
        }

        Method (_L1D, 0, NotSerialized)
        {
            Not (\_SB.PCI0.LPC0.LPOL, \_SB.PCI0.LPC0.LPOL)
            Notify (\_SB.LID, 0x80)
        }
    }

    Scope (_SB)
    {
        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                Return (\_SB.PCI0.LPC0.LPOL)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        OperationRegion (SMIO, SystemIO, 0xB2, 0x02)
        Field (SMIO, ByteAcc, NoLock, Preserve)
        {
            APMC,   8, 
            APMD,   8
        }

        Method (GSMI, 1, NotSerialized)
        {
            Store (Arg0, APMD)
            Store (0xE3, APMC)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_BBN, 0x00)
            Name (_ADR, 0x00)
            Method (_INI, 0, NotSerialized)
            {
                If (CondRefOf (\_OSI, Local0))
                {
                    If (\_OSI ("Windows 2001"))
                    {
                        Store (0x03, OSTP)
                    }
                    Else
                    {
                        Store (0x04, OSTP)
                    }
                }
                Else
                {
                    If (LEqual (SizeOf (_OS), 0x14))
                    {
                        Store (0x01, OSTP)
                    }
                    Else
                    {
                        If (LEqual (SizeOf (_OS), 0x27))
                        {
                            Store (0x02, OSTP)
                        }
                        Else
                        {
                            Store (0x00, OSTP)
                        }
                    }
                }

                Store (OSTP, OSYS)
            }

            Method (_S1D, 0, NotSerialized)
            {
                Return (0x02)
            }

            Method (_S3D, 0, NotSerialized)
            {
                Return (0x02)
            }

            Method (_S4D, 0, NotSerialized)
            {
                Return (0x02)
            }

            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                        Offset (0x20), 
                DRB0,   8, 
                DRB1,   8, 
                DRB2,   8, 
                DRB3,   8, 
                        Offset (0x50), 
                    ,   4, 
                PM0H,   2, 
                        Offset (0x51), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                        Offset (0x52), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                        Offset (0x53), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                        Offset (0x54), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                        Offset (0x55), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                        Offset (0x56), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                        Offset (0x57), 
                FDHC,   8
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
                Multiply (0x02000000, DRB3, M1MN)
                Add (Subtract (M1MX, M1MN), 0x01, M1LN)
                ShiftRight (And (\_SB.PCI0.LPC0.HPTE, 0x00038000), 0x0F, Local0)
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
                If (GPIC)
                {
                    Return (Package (0x06)
                    {
                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            0x00, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }
                    })
                }
                Else
                {
                    Return (Package (0x06)
                    {
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
            }

            Device (AGPB)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    Return (Package (0x01)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKA, 
                            0x00
                        }
                    })
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)
                }
            }

            Device (HUB)
            {
                Name (_ADR, 0x001E0000)
                Method (_PRT, 0, NotSerialized)
                {
                    Return (Package (0x05)
                    {
                        Package (0x04)
                        {
                            0xFFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }
                    })
                }

                Device (V394)
                {
                    Name (_ADR, 0x00)
                    Name (_PSC, 0x00)
                    OperationRegion (TIDS, PCI_Config, 0x00, 0x04)
                    Field (TIDS, DWordAcc, NoLock, Preserve)
                    {
                        VIID,   32
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (VIID, 0xFFFFFFFF))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

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
                }

                Device (CB1)
                {
                    Name (_ADR, 0x00030000)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (ELAN)
                {
                    Name (_ADR, 0x00010000)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_PRW, Package (0x02)
                    {
                        0x08, 
                        0x04
                    })
                }

                Device (MIN1)
                {
                    Name (_ADR, 0x00020000)
                    Name (_PSC, 0x00)
                    OperationRegion (MIDS, PCI_Config, 0x00, 0xC8)
                    Field (MIDS, DWordAcc, NoLock, Preserve)
                    {
                        MOID,   32, 
                                Offset (0xC4), 
                                Offset (0xC5), 
                        MPME,   1, 
                            ,   6, 
                        MPMS,   1
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (MOID, 0xFFFFFFFF))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

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

                    Name (_PRW, Package (0x02)
                    {
                        0x08, 
                        0x03
                    })
                }

                Device (MIN2)
                {
                    Name (_ADR, 0x00060000)
                    Name (_PSC, 0x00)
                    OperationRegion (LNDS, PCI_Config, 0x00, 0x04)
                    Field (LNDS, DWordAcc, NoLock, Preserve)
                    {
                        LNID,   32
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (LNID, 0xFFFFFFFF))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

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

                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x001F0000)
                Name (DVEN, 0x00)
                OperationRegion (REGS, PCI_Config, 0x40, 0xC0)
                Field (REGS, DWordAcc, Lock, Preserve)
                {
                    PMBA,   16, 
                            Offset (0x18), 
                    GPBA,   16, 
                            Offset (0xB0), 
                        ,   5, 
                    FUND,   2, 
                            Offset (0xB3), 
                    UHCI,   3, 
                        ,   4, 
                    EHCI,   1
                }

                Method (DECD, 4, Serialized)
                {
                    Store (Arg0, Debug)
                }

                Device (MBRD)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x1F)
                    Name (RSRC, ResourceTemplate ()
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
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            _Y0F)
                        IO (Decode16,
                            0x1180,             // Range Minimum
                            0x1180,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            _Y10)
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x004C,             // Range Minimum
                            0x004C,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0200,             // Range Minimum
                            0x0200,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0xFF2C,             // Range Minimum
                            0xFF2C,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFFF80000,         // Address Base
                            0x00080000,         // Address Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.MBRD._Y0F._MIN, PMMN)
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.MBRD._Y0F._MAX, PMMX)
                        And (^^PMBA, 0xFF80, PMMN)
                        Store (PMMN, PMMX)
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.MBRD._Y10._MIN, GPMN)
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.MBRD._Y10._MAX, GPMX)
                        And (^^GPBA, 0xFF80, GPMN)
                        Store (GPMN, GPMX)
                        Return (RSRC)
                    }
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
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x12,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
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
                        DMA (Compatibility, NotBusMaster, Transfer16, )
                            {4}
                    })
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
                            0x0F,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {13}
                    })
                }

                Device (PIC)
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
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (TIME)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
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
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {0}
                    })
                }

                Device (KBC0)
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
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                }

                Device (MSE0)
                {
                    Name (_HID, EisaId ("SYN0702"))
                    Name (_CID, Package (0x02)
                    {
                        0x00072E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {5,10}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y11)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRA, 0x80, PIRA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.LNKA._Y11._INT, IRQ0)
                        And (PIRA, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Store (RSRC, Debug)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRA, 0x70), PIRA)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRA, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {5,10}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y12)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRB, 0x80, PIRB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.LNKB._Y12._INT, IRQ0)
                        And (PIRB, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRB, 0x70), PIRB)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRB, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {5,10}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y13)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRC, 0x80, PIRC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.LNKC._Y13._INT, IRQ0)
                        And (PIRC, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRC, 0x70), PIRC)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRC, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {5,10}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y14)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRD, 0x80, PIRD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.LNKD._Y14._INT, IRQ0)
                        And (PIRD, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRD, 0x70), PIRD)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRD, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,10,11,12,14,15}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y15)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRE, 0x80, PIRE)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.LNKE._Y15._INT, IRQ0)
                        And (PIRE, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Store (RSRC, Debug)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRE, 0x70), PIRE)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRE, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,10,11,12,14,15}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y16)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRF, 0x80, PIRF)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.LNKF._Y16._INT, IRQ0)
                        And (PIRF, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Store (RSRC, Debug)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRF, 0x70), PIRF)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRF, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,10,11,12,14,15}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y17)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRG, 0x80, PIRG)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.LNKG._Y17._INT, IRQ0)
                        And (PIRG, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Store (RSRC, Debug)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRG, 0x70), PIRG)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRG, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {5,10}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y18)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRH, 0x80, PIRH)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (RSRC, \_SB.PCI0.LPC0.LNKH._Y18._INT, IRQ0)
                        And (PIRH, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0)
                        Store (RSRC, Debug)
                        Return (RSRC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRH, 0x70), PIRH)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRH, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                OperationRegion (PIRX, PCI_Config, 0x60, 0x04)
                Field (PIRX, DWordAcc, Lock, Preserve)
                {
                            AccessAs (ByteAcc, 0x00), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8
                }

                OperationRegion (PIRY, PCI_Config, 0x68, 0x04)
                Field (PIRY, DWordAcc, Lock, Preserve)
                {
                            AccessAs (ByteAcc, 0x00), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                OperationRegion (GPIO, SystemIO, 0x1300, 0x3C)
                Field (GPIO, DWordAcc, Lock, Preserve)
                {
                            Offset (0x0E), 
                    PRST,   1, 
                    SRST,   1, 
                            Offset (0x2D), 
                        ,   5, 
                    LPOL,   1, 
                            Offset (0x38), 
                        ,   1, 
                    SPWR,   1, 
                    IVB0,   1, 
                    IVB1,   1, 
                    IVB2,   1, 
                    BID0,   1, 
                    BID1,   1, 
                    BID2,   1
                }

                OperationRegion (PMIO, SystemIO, 0x1000, 0x40)
                Field (PMIO, WordAcc, Lock, Preserve)
                {
                            AccessAs (DWordAcc, 0x00), 
                            Offset (0x2B), 
                        ,   5, 
                    LPOS,   1, 
                            Offset (0x2F), 
                        ,   5, 
                    LIDE,   1, 
                            Offset (0x3A), 
                        ,   7, 
                    ACPW,   1, 
                        ,   5, 
                    LIDS,   1
                }

                OperationRegion (LPCR, PCI_Config, 0x00, 0xFF)
                Field (LPCR, ByteAcc, NoLock, Preserve)
                {
                            Offset (0xD0), 
                    HPTE,   32, 
                            Offset (0xE6), 
                    CMAD,   1
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Method (_INI, 0, NotSerialized)
                    {
                        Store (0x00, \_SB.PCI0.LPC0.CMAD)
                    }

                    OperationRegion (SIIO, SystemIO, 0x2E, 0x02)
                    Field (SIIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (S227, 0x00)
                    Method (ENTR, 0, NotSerialized)
                    {
                        Store (0x55, INDX)
                    }

                    Method (EXIT, 0, NotSerialized)
                    {
                        Store (0xAA, INDX)
                    }

                    Method (RDRG, 1, NotSerialized)
                    {
                        ENTR ()
                        Store (Arg0, INDX)
                        Store (DATA, Local0)
                        EXIT ()
                        Return (Local0)
                    }

                    Method (WRRG, 2, NotSerialized)
                    {
                        ENTR ()
                        Store (Arg0, INDX)
                        Store (Arg1, DATA)
                        EXIT ()
                    }

                    Method (READ, 3, NotSerialized)
                    {
                        Acquire (S227, 0xFFFF)
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (RDRG (Arg1), Local1)
                        }

                        And (Local1, Arg2, Local1)
                        Release (S227)
                        Return (Local1)
                    }

                    Method (WRIT, 3, NotSerialized)
                    {
                        Acquire (S227, 0xFFFF)
                        If (LEqual (Arg0, 0x00))
                        {
                            WRRG (Arg1, Arg2)
                        }

                        Release (S227)
                    }

                    Device (IRDA)
                    {
                        Name (_HID, EisaId ("PNP0510"))
                        Name (IENA, 0x01)
                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                            IRQNoFlags ()
                                {}
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x2B, 0xFF), Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x25, 0xFF), Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x0C, 0x38), Local0)
                            If (LNotEqual (Local0, 0x10))
                            {
                                If (LNotEqual (Local0, 0x08))
                                {
                                    Return (0x00)
                                }
                                Else
                                {
                                    Store (READ (0x00, 0x2B, 0xFF), Local0)
                                    If (LNotEqual (Local0, 0x00))
                                    {
                                        Return (0x00)
                                    }
                                }
                            }

                            Store (IENA, Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateByteField (Arg0, 0x09, IRQL)
                            WRIT (0x00, 0x25, 0x00)
                            FindSetRightBit (IRQL, Local0)
                            Decrement (Local0)
                            Store (READ (0x00, 0x28, 0xF0), Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x28, Local0)
                            Store (IOLO, Local0)
                            ShiftRight (Local0, 0x02, Local0)
                            And (Local0, 0xFE, Local0)
                            Store (IOHI, Local1)
                            ShiftLeft (Local1, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x25, Local0)
                            Store (READ (0x00, 0x02, 0xFF), Local0)
                            Or (Local0, 0x80, Local0)
                            WRIT (0x00, 0x02, Local0)
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x20, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x07, Local0)
                            Store (0x01, IENA)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            And (_STA (), 0x02, Local0)
                            If (LEqual (Local0, Zero))
                            {
                                Return (RSRC)
                            }

                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    _Y19)
                                IRQNoFlags (_Y1A)
                                    {4}
                            })
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.IRDA._CRS._Y19._MIN, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.IRDA._CRS._Y19._MAX, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.IRDA._CRS._Y1A._INT, IRQL)
                            CreateByteField (BUF0, 0x0A, IRQH)
                            Store (READ (0x00, 0x25, 0xFF), Local0)
                            Store (Local0, Local1)
                            And (Local1, 0xC0, Local1)
                            ShiftRight (Local1, 0x06, Local1)
                            ShiftLeft (Local0, 0x02, Local0)
                            Store (Local0, IOLO)
                            Store (Local1, IOHI)
                            Store (IOLO, IORL)
                            Store (IOHI, IORH)
                            Store (READ (0x00, 0x28, 0x0F), Local0)
                            Store (0x01, Local1)
                            ShiftLeft (Local1, Local0, IRQL)
                            Store (0x00, IRQH)
                            Return (BUF0)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            EndDependentFn ()
                        })
                        Method (_DIS, 0, NotSerialized)
                        {
                            Store (0x00, IENA)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x02, 0xFF), Local0)
                            Or (Local0, 0x80, Local0)
                            WRIT (0x00, 0x02, Local0)
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x20, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }

                        Method (_PS1, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Or (Local0, 0x20, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x02, 0xFF), Local0)
                            Not (0x80, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x02, Local0)
                        }
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("SMCF010"))
                        Name (FENA, 0x01)
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y1B)
                            IO (Decode16,
                                0x06F8,             // Range Minimum
                                0x06F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y1C)
                            IRQNoFlags (_Y1D)
                                {1,3}
                            DMA (Compatibility, NotBusMaster, Transfer8, _Y1E)
                                {1,3}
                        })
                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                            IRQNoFlags ()
                                {0}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {1,3}
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x25, 0xFF), Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x2B, 0xFF), Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (FENA, Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateByteField (Arg0, 0x0A, I2LO)
                            CreateByteField (Arg0, 0x0B, I2HI)
                            CreateByteField (Arg0, 0x11, IRQL)
                            CreateByteField (Arg0, 0x14, DMAC)
                            WRIT (0x00, 0x25, 0x00)
                            FindSetRightBit (IRQL, Local0)
                            Decrement (Local0)
                            Store (READ (0x00, 0x28, 0xF0), Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x28, Local0)
                            Store (IOLO, Local0)
                            ShiftRight (Local0, 0x02, Local0)
                            And (Local0, 0xFE, Local0)
                            Store (IOHI, Local1)
                            ShiftLeft (Local1, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x25, Local0)
                            Store (I2LO, Local0)
                            ShiftRight (Local0, 0x03, Local0)
                            Store (I2HI, Local1)
                            ShiftLeft (Local1, 0x05, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x2B, Local0)
                            FindSetRightBit (DMAC, Local0)
                            Decrement (Local0)
                            WRIT (0x00, 0x2C, Local0)
                            Store (READ (0x00, 0x0A, 0xFF), Local0)
                            Not (0xC0, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x40, Local0)
                            WRIT (0x00, 0x0A, Local0)
                            Store (READ (0x00, 0x0C, 0xFF), Local0)
                            Not (0x38, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x08, Local0)
                            WRIT (0x00, 0x0C, Local0)
                            Store (READ (0x00, 0x02, 0xFF), Local0)
                            Or (Local0, 0x80, Local0)
                            WRIT (0x00, 0x02, Local0)
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x20, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x07, Local0)
                            Store (0x01, FENA)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            And (_STA (), 0x02, Local0)
                            If (LEqual (Local0, Zero))
                            {
                                Return (RSRC)
                            }

                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._Y1B._MIN, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._Y1B._MAX, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._Y1C._MIN, I2LO)
                            CreateByteField (BUF0, 0x0B, I2HI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._Y1C._MAX, I2RL)
                            CreateByteField (BUF0, 0x0D, I2RH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._Y1D._INT, IRQL)
                            CreateByteField (BUF0, 0x12, IRQH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._Y1E._DMA, DMAC)
                            Store (READ (0x00, 0x25, 0xFF), Local0)
                            Store (Local0, Local1)
                            And (Local1, 0xC0, Local1)
                            ShiftRight (Local1, 0x06, Local1)
                            ShiftLeft (Local0, 0x02, Local0)
                            And (Local0, 0xFF, Local0)
                            Store (Local0, IOLO)
                            Store (Local1, IOHI)
                            Store (IOLO, IORL)
                            Store (IOHI, IORH)
                            Store (IOHI, Local0)
                            Add (Local0, 0x04, Local0)
                            Store (Local0, I2HI)
                            Store (Local0, I2RH)
                            Store (IOLO, Local0)
                            Store (Local0, I2LO)
                            Store (Local0, I2RL)
                            Store (READ (0x00, 0x28, 0x0F), Local0)
                            Store (0x01, Local1)
                            ShiftLeft (Local1, Local0, IRQL)
                            Store (0x00, IRQH)
                            Store (READ (0x00, 0x2C, 0x0F), Local0)
                            Store (0x01, Local1)
                            ShiftLeft (Local1, Local0, DMAC)
                            Return (BUF0)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x06F8,             // Range Minimum
                                    0x06F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x07F8,             // Range Minimum
                                    0x07F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x07E8,             // Range Minimum
                                    0x07E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x06E8,             // Range Minimum
                                    0x06E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            EndDependentFn ()
                        })
                        Method (_DIS, 0, NotSerialized)
                        {
                            Store (0x00, FENA)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x02, 0xFF), Local0)
                            Or (Local0, 0x80, Local0)
                            WRIT (0x00, 0x02, Local0)
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x20, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }

                        Method (_PS1, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Or (Local0, 0x20, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x02, 0xFF), Local0)
                            Not (0x80, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x02, Local0)
                        }
                    }

                    Device (LPT)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x01)
                        Name (Z000, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (Z000, 0x01))
                            {
                                Store (READ (0x00, 0x01, 0x04), Local0)
                                If (LEqual (Local0, 0x00))
                                {
                                    Return (0x00)
                                }
                            }

                            Store (READ (0x00, 0x01, 0x08), Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x23, 0xC0), Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateByteField (Arg0, 0x09, IRQL)
                            WRIT (0x00, 0x23, 0x00)
                            FindSetRightBit (IRQL, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                                Store (READ (0x00, 0x27, 0xF0), Local1)
                                Or (Local0, Local1, Local0)
                                WRIT (0x00, 0x27, Local0)
                            }
                            Else
                            {
                                Store (READ (0x00, 0x27, 0xF0), Local0)
                                WRIT (0x00, 0x27, Local0)
                            }

                            Store (IOLO, Local0)
                            ShiftRight (Local0, 0x02, Local0)
                            Store (IOHI, Local1)
                            ShiftLeft (Local1, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x23, Local0)
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Or (Local0, 0x0C, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x01, Z000)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y1F)
                                IRQNoFlags (_Y20)
                                    {}
                            })
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.LPT._CRS._Y1F._MIN, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.LPT._CRS._Y1F._MAX, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.LPT._CRS._Y1F._LEN, LNA1)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.LPT._CRS._Y20._INT, IRQL)
                            Store (READ (0x00, 0x23, 0xFF), Local0)
                            Store (Local0, Local1)
                            And (Local1, 0xC0, Local1)
                            ShiftRight (Local1, 0x06, Local1)
                            And (Local0, 0x3F, Local0)
                            ShiftLeft (Local0, 0x02, Local0)
                            Store (Local0, IOLO)
                            Store (Local1, IOHI)
                            Store (IOLO, IORL)
                            Store (IOHI, IORH)
                            If (Local0)
                            {
                                If (LEqual (Local0, 0xBC))
                                {
                                    Store (0x04, LNA1)
                                }
                                Else
                                {
                                    Store (0x08, LNA1)
                                }
                            }
                            Else
                            {
                                Store (0x00, LNA1)
                            }

                            If (Local0)
                            {
                                Store (READ (0x00, 0x27, 0xFF), Local0)
                                And (Local0, 0x0F, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRQL)
                            }

                            Return (BUF0)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x00)
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                            }
                            StartDependentFn (0x01, 0x01)
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                            }
                            EndDependentFn ()
                        })
                        Method (_DIS, 0, NotSerialized)
                        {
                            WRIT (0x00, 0x23, 0x00)
                            Store (READ (0x00, 0x27, 0xFF), Local0)
                            And (Local0, 0xF0, Local0)
                            WRIT (0x00, 0x27, Local0)
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            And (Local0, 0xFB, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x00, Z000)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Not (0x04, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x00, Z000)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Not (0x04, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x04, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x01, Z000)
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x10, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }

                        Method (_PS2, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x10, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x10, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }
                    }

                    Device (LPBI)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x02)
                        Name (Z001, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (Z001, 0x01))
                            {
                                Store (READ (0x00, 0x01, 0x04), Local0)
                                If (LEqual (Local0, 0x00))
                                {
                                    Return (0x00)
                                }
                            }

                            Store (READ (0x00, 0x01, 0x08), Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x04, 0x03), Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x23, 0xC0), Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateByteField (Arg0, 0x09, IRQL)
                            WRIT (0x00, 0x23, 0x00)
                            FindSetRightBit (IRQL, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                                Store (READ (0x00, 0x27, 0xF0), Local1)
                                Or (Local0, Local1, Local0)
                                WRIT (0x00, 0x27, Local0)
                            }
                            Else
                            {
                                Store (READ (0x00, 0x27, 0xF0), Local0)
                                WRIT (0x00, 0x27, Local0)
                            }

                            Store (IOLO, Local0)
                            ShiftRight (Local0, 0x02, Local0)
                            Store (IOHI, Local1)
                            ShiftLeft (Local1, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x23, Local0)
                            Store (READ (0x00, 0x04, 0xFC), Local0)
                            WRIT (0x00, 0x04, Local0)
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Or (Local0, 0x04, Local0)
                            And (Local0, 0xF7, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x01, Z001)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y21)
                                IRQNoFlags (_Y22)
                                    {}
                            })
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.LPBI._CRS._Y21._MIN, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.LPBI._CRS._Y21._MAX, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.LPBI._CRS._Y21._LEN, LNA1)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.LPBI._CRS._Y22._INT, IRQL)
                            Store (READ (0x00, 0x23, 0xFF), Local0)
                            Store (Local0, Local1)
                            And (Local1, 0xC0, Local1)
                            ShiftRight (Local1, 0x06, Local1)
                            And (Local0, 0x3F, Local0)
                            ShiftLeft (Local0, 0x02, Local0)
                            Store (Local0, IOLO)
                            Store (Local1, IOHI)
                            Store (IOLO, IORL)
                            Store (IOHI, IORH)
                            If (Local0)
                            {
                                If (LEqual (Local0, 0xBC))
                                {
                                    Store (0x04, LNA1)
                                }
                                Else
                                {
                                    Store (0x08, LNA1)
                                }
                            }
                            Else
                            {
                                Store (0x00, LNA1)
                            }

                            If (Local0)
                            {
                                Store (READ (0x00, 0x27, 0xFF), Local0)
                                And (Local0, 0x0F, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRQL)
                            }

                            Return (BUF0)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x00)
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                            }
                            StartDependentFn (0x01, 0x01)
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                            }
                            EndDependentFn ()
                        })
                        Method (_DIS, 0, NotSerialized)
                        {
                            WRIT (0x00, 0x23, 0x00)
                            Store (READ (0x00, 0x27, 0xFF), Local0)
                            And (Local0, 0xF0, Local0)
                            WRIT (0x00, 0x27, Local0)
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            And (Local0, 0xFB, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x00, Z001)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Not (0x04, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x00, Z001)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Not (0x04, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x04, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x01, Z001)
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x10, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }

                        Method (_PS2, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x10, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x10, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }
                    }

                    Device (ECP)
                    {
                        Name (_HID, EisaId ("PNP0401"))
                        Name (Z002, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (Z002, 0x01))
                            {
                                Store (READ (0x00, 0x01, 0x04), Local0)
                                If (LEqual (Local0, 0x00))
                                {
                                    Return (0x00)
                                }
                            }

                            Store (READ (0x00, 0x01, 0x08), Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x04, 0x03), Local0)
                            If (LNotEqual (Local0, 0x02))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x23, 0xC0), Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateByteField (Arg0, 0x11, IRQL)
                            CreateByteField (Arg0, 0x14, DMAC)
                            WRIT (0x00, 0x23, 0x00)
                            FindSetRightBit (IRQL, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                                Store (READ (0x00, 0x27, 0xF0), Local1)
                                Or (Local0, Local1, Local0)
                                WRIT (0x00, 0x27, Local0)
                            }
                            Else
                            {
                                Store (READ (0x00, 0x27, 0xF0), Local0)
                                WRIT (0x00, 0x27, Local0)
                            }

                            Store (IOLO, Local0)
                            ShiftRight (Local0, 0x02, Local0)
                            Store (IOHI, Local1)
                            ShiftLeft (Local1, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x23, Local0)
                            FindSetRightBit (DMAC, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                                Store (READ (0x00, 0x26, 0xF0), Local1)
                                Or (Local0, Local1, Local0)
                                WRIT (0x00, 0x26, Local0)
                            }
                            Else
                            {
                                Store (READ (0x00, 0x26, 0xF0), Local0)
                                WRIT (0x00, 0x26, Local0)
                            }

                            Store (READ (0x00, 0x04, 0xFC), Local0)
                            Or (Local0, 0x02, Local0)
                            WRIT (0x00, 0x04, Local0)
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Or (Local0, 0x04, Local0)
                            And (Local0, 0xF7, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x01, Z002)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x04,               // Length
                                    _Y23)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x04,               // Length
                                    _Y24)
                                IRQNoFlags (_Y25)
                                    {}
                                DMA (Compatibility, NotBusMaster, Transfer8, _Y26)
                                    {}
                            })
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.ECP._CRS._Y23._MIN, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.ECP._CRS._Y23._MAX, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.ECP._CRS._Y23._LEN, LNA1)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.ECP._CRS._Y24._MIN, DALO)
                            CreateByteField (BUF0, 0x0B, DAHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.ECP._CRS._Y24._MAX, DRLO)
                            CreateByteField (BUF0, 0x0D, DRHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.ECP._CRS._Y24._LEN, LNA2)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.ECP._CRS._Y25._INT, IRQL)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.ECP._CRS._Y26._DMA, DMAC)
                            Store (READ (0x00, 0x23, 0xFF), Local0)
                            Store (Local0, Local1)
                            And (Local1, 0xC0, Local1)
                            ShiftRight (Local1, 0x06, Local1)
                            And (Local0, 0x3F, Local0)
                            ShiftLeft (Local0, 0x02, Local0)
                            Store (Local0, IOLO)
                            Store (Local1, IOHI)
                            Store (IOLO, IORL)
                            Store (IOHI, IORH)
                            Add (Local1, 0x04, Local1)
                            Store (IOLO, DALO)
                            Store (Local1, DAHI)
                            Store (DALO, DRLO)
                            Store (DAHI, DRHI)
                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x00, LNA1)
                                Store (0x00, LNA2)
                            }

                            If (Local0)
                            {
                                Store (READ (0x00, 0x27, 0xFF), Local0)
                                And (Local0, 0x0F, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRQL)
                            }

                            If (Local0)
                            {
                                Store (READ (0x00, 0x26, 0xFF), Local0)
                                And (Local0, 0x0F, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, DMAC)
                            }

                            Return (BUF0)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x00)
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFn (0x01, 0x01)
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x08,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x08,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            EndDependentFn ()
                        })
                        Method (_DIS, 0, NotSerialized)
                        {
                            WRIT (0x00, 0x23, 0x00)
                            Store (READ (0x00, 0x27, 0xFF), Local0)
                            And (Local0, 0xF0, Local0)
                            WRIT (0x00, 0x27, Local0)
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            And (Local0, 0xFB, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x00, Z002)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Not (0x04, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x00, Z002)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Not (0x04, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x04, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x01, Z002)
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x10, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }

                        Method (_PS2, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x10, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x10, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }
                    }

                    Device (EPP)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x03)
                        Name (Z003, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (Z003, 0x01))
                            {
                                Store (READ (0x00, 0x01, 0x04), Local0)
                                If (LEqual (Local0, 0x00))
                                {
                                    Return (0x00)
                                }
                            }

                            Store (READ (0x00, 0x01, 0x08), Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x04, 0x03), Local0)
                            If (LNotEqual (Local0, 0x01))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x23, 0xC0), Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateByteField (Arg0, 0x09, IRQL)
                            WRIT (0x00, 0x23, 0x00)
                            FindSetRightBit (IRQL, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                                Store (READ (0x00, 0x27, 0xF0), Local1)
                                Or (Local0, Local1, Local0)
                                WRIT (0x00, 0x27, Local0)
                            }
                            Else
                            {
                                Store (READ (0x00, 0x27, 0xF0), Local0)
                                WRIT (0x00, 0x27, Local0)
                            }

                            Store (IOLO, Local0)
                            ShiftRight (Local0, 0x02, Local0)
                            Store (IOHI, Local1)
                            ShiftLeft (Local1, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x23, Local0)
                            Store (READ (0x00, 0x04, 0xFC), Local0)
                            Or (Local0, 0x01, Local0)
                            And (Local0, 0xBF, Local0)
                            WRIT (0x00, 0x04, Local0)
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Or (Local0, 0x04, Local0)
                            And (Local0, 0xF7, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x01, Z003)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y27)
                                IRQNoFlags (_Y28)
                                    {}
                            })
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.EPP._CRS._Y27._MIN, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.EPP._CRS._Y27._MAX, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.EPP._CRS._Y27._LEN, LNA1)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.EPP._CRS._Y28._INT, IRQL)
                            Store (READ (0x00, 0x23, 0xFF), Local0)
                            Store (Local0, Local1)
                            And (Local1, 0xC0, Local1)
                            ShiftRight (Local1, 0x06, Local1)
                            And (Local0, 0x3F, Local0)
                            ShiftLeft (Local0, 0x02, Local0)
                            Store (Local0, IOLO)
                            Store (Local1, IOHI)
                            Store (IOLO, IORL)
                            Store (IOHI, IORH)
                            If (Local0)
                            {
                                If (LEqual (Local0, 0xBC))
                                {
                                    Store (0x04, LNA1)
                                }
                                Else
                                {
                                    Store (0x08, LNA1)
                                }
                            }
                            Else
                            {
                                Store (0x00, LNA1)
                            }

                            If (Local0)
                            {
                                Store (READ (0x00, 0x27, 0xFF), Local0)
                                And (Local0, 0x0F, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRQL)
                            }

                            Return (BUF0)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x00)
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                            }
                            StartDependentFn (0x01, 0x01)
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                            }
                            StartDependentFn (0x02, 0x02)
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                            }
                            EndDependentFn ()
                        })
                        Method (_DIS, 0, NotSerialized)
                        {
                            WRIT (0x00, 0x23, 0x00)
                            Store (READ (0x00, 0x27, 0xFF), Local0)
                            And (Local0, 0xF0, Local0)
                            WRIT (0x00, 0x27, Local0)
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            And (Local0, 0xFB, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x00, Z003)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Not (0x04, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x00, Z003)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x01, 0xFF), Local0)
                            Not (0x04, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x04, Local0)
                            WRIT (0x00, 0x01, Local0)
                            Store (0x01, Z003)
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x10, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }

                        Method (_PS2, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x10, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x10, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }
                    }
                }

                Method (ECOK, 0, NotSerialized)
                {
                    If (LEqual (\_SB.PCI0.LPC0.EC0.ECOK, 0x01))
                    {
                        Return (0x01)
                    }
                    Else
                    {
                        Return (0x00)
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x1C)
                    Name (ECOK, Zero)
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
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECOK)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0x0100)
                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x2E), 
                        RSMT,   16, 
                                Offset (0x40), 
                                Offset (0x41), 
                        CSPR,   1, 
                                Offset (0x60), 
                        SPRO,   8, 
                        SMST,   8, 
                        SADD,   8, 
                        SMBC,   8, 
                        SD00,   8, 
                        SD01,   8, 
                        SD02,   8, 
                        SD03,   8, 
                        SD04,   8, 
                        SD05,   8, 
                        SD06,   8, 
                        SD07,   8, 
                        SD08,   8, 
                                Offset (0x84), 
                        SBCN,   8, 
                        SALA,   8, 
                        SAD0,   8, 
                        SAD1,   8, 
                                Offset (0x90), 
                        CHGM,   16, 
                        CHGS,   16, 
                        CHGC,   16, 
                        CHGV,   16, 
                        CHGA,   16, 
                        BAL0,   1, 
                        BAL1,   1, 
                        BAL2,   1, 
                        BAL3,   1, 
                                Offset (0x9C), 
                        BEEP,   1, 
                        FAN1,   1, 
                        FAN2,   1, 
                        CRT,    1, 
                        EXFD,   1, 
                        PHDD,   1, 
                        SHDD,   1, 
                        FDD,    1, 
                        SBTN,   1, 
                        VIDO,   1, 
                        VOLD,   1, 
                        VOLU,   1, 
                        MUTE,   1, 
                        CONT,   1, 
                        BRGT,   1, 
                        HBTN,   1, 
                        S4S,    1, 
                        SKEY,   1, 
                        BKEY,   1, 
                                Offset (0xA1), 
                        DKST,   1, 
                            ,   6, 
                        DKEV,   1, 
                                Offset (0xA3), 
                        S0LD,   1, 
                        S3LD,   1, 
                        VGAQ,   1, 
                        PCMQ,   1, 
                        PCMR,   1, 
                        ADP,    1, 
                        SYS6,   1, 
                        SYS7,   1, 
                        PWAK,   1, 
                        MWAK,   1, 
                        LWAK,   1, 
                                Offset (0xA5), 
                        FOT,    8, 
                        FSD1,   8, 
                        FSD2,   8, 
                                Offset (0xB0), 
                        CTMP,   8, 
                                Offset (0xB8), 
                        BTDT,   1, 
                        BTPW,   1, 
                        BTDS,   1, 
                        BTPS,   1, 
                        BTSW,   1, 
                            ,   1, 
                        BLED,   1, 
                                Offset (0xB9), 
                        BRTS,   8, 
                                Offset (0xBB), 
                        WLAT,   1, 
                        BTAT,   1, 
                        WLEX,   1, 
                        BTEX,   1, 
                        KLSW,   1, 
                                Offset (0xC0), 
                            ,   4, 
                        BMF0,   3, 
                        BTY0,   1, 
                        BDCH,   1, 
                        BTCH,   1, 
                        BLLB,   1, 
                        BST0,   5, 
                        BRC0,   16, 
                        BSN0,   16, 
                        BPV0,   16, 
                        BDV0,   16, 
                        BDC0,   16, 
                        BFC0,   16, 
                        GAU0,   8, 
                                Offset (0xD0), 
                            ,   4, 
                        BMF1,   3, 
                        BTY1,   1, 
                        BST1,   8, 
                        BRC1,   16, 
                        BSN1,   16, 
                        BPV1,   16, 
                        BDV1,   16, 
                        BDC1,   16, 
                        BFC1,   16, 
                        GAU1,   8, 
                                Offset (0xFB), 
                        BTEC,   8, 
                        UBDM,   4, 
                        UBPC,   3, 
                                Offset (0xFD), 
                        BTCS,   8, 
                        BMDL,   8, 
                        CBDM,   4, 
                        CBPC,   3, 
                                Offset (0x100)
                    }

                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x64), 
                        DTDW,   16
                    }

                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x64), 
                        BLOK,   256, 
                        BCNT,   8
                    }

                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x64), 
                        FLD0,   64
                    }

                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x64), 
                        FLD1,   128
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store ("=====QUERY_11=====", Debug)
                        If (\_SB.PCI0.LPC0.EC0.BRGT) {}
                    }

                    Method (_Q1C, 0, NotSerialized)
                    {
                        Store ("=====QUERY_1C=====", Debug)
                        If (\_SB.PCI0.LPC0.EC0.VIDO)
                        {
                            \_SB.GSMI (0x08)
                            Store (0x00, \_SB.PCI0.LPC0.EC0.VIDO)
                        }
                    }

                    Method (_Q1D, 0, NotSerialized)
                    {
                        \_SB.PCI0.LPC0.EC0.PCLK ()
                    }

                    Method (_Q1E, 0, NotSerialized)
                    {
                        \_SB.PCI0.LPC0.EC0.PCLK ()
                    }

                    Method (_Q22, 0, NotSerialized)
                    {
                        Store ("=====QUERY_22=====", Debug)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q23, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Store ("=====QUERY_25=====", Debug)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x81)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q37, 0, NotSerialized)
                    {
                        Store ("=====QUERY_37=====", Debug)
                        \_SB.GSMI (0x0D)
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x00)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q38, 0, NotSerialized)
                    {
                        Store ("=====QUERY_38=====", Debug)
                        \_SB.GSMI (0x0D)
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x01)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q42, 0, NotSerialized)
                    {
                        Store ("=====QUERY_42=====", Debug)
                        \_SB.GSMI (0x0A)
                    }

                    Method (_Q60, 0, NotSerialized)
                    {
                        Store ("=====QUERY_60=====", Debug)
                        \_SB.GSMI (0x0B)
                        Notify (\_SB.PCI0.IDEC.SECD, 0x01)
                    }

                    OperationRegion (CCLK, SystemIO, 0x1010, 0x04)
                    Field (CCLK, DWordAcc, NoLock, Preserve)
                    {
                            ,   1, 
                        DUTY,   3, 
                        THEN,   1, 
                                Offset (0x01), 
                            ,   9, 
                        TSTS,   1
                    }

                    OperationRegion (ECRM, EmbeddedControl, 0x00, 0xFF)
                    Field (ECRM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x94), 
                        ERIB,   16, 
                        ERBD,   8, 
                                Offset (0xAC), 
                        SDTM,   8, 
                        FSSN,   4, 
                        FANU,   4, 
                        PTVL,   3, 
                            ,   4, 
                        TTHR,   1, 
                                Offset (0xBC), 
                        PJID,   8, 
                                Offset (0xBE), 
                                Offset (0xF9), 
                        RFRD,   8, 
                                Offset (0xFB)
                    }

                    Mutex (FAMX, 0x00)
                    Method (FANG, 1, NotSerialized)
                    {
                        Acquire (FAMX, 0xFFFF)
                        Store (Arg0, ERIB)
                        Store (ERBD, Local0)
                        Release (FAMX)
                        Return (Local0)
                    }

                    Method (FANW, 2, NotSerialized)
                    {
                        Acquire (FAMX, 0xFFFF)
                        Store (Arg1, ERBD)
                        Store (Arg0, ERIB)
                        Release (FAMX)
                        Return (Arg1)
                    }

                    Method (TUVR, 1, NotSerialized)
                    {
                        Return (0x03)
                    }

                    Method (THRO, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Return (THEN)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (DUTY)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x02))
                                {
                                    Return (TTHR)
                                }
                                Else
                                {
                                    Return (0xFF)
                                }
                            }
                        }
                    }

                    Method (PCLK, 0, NotSerialized)
                    {
                        Store (PTVL, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Store (0x00, THEN)
                        }
                        Else
                        {
                            Not (Local0, Local0)
                            Add (Local0, 0x01, Local0)
                            And (Local0, 0x07, Local0)
                            Store (Local0, DUTY)
                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x00, THEN)
                            }
                            Else
                            {
                                Store (0x01, THEN)
                            }
                        }
                    }

                    Method (CLCK, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (0x00, THEN)
                        }
                        Else
                        {
                            Store (Arg0, DUTY)
                            Store (0x01, THEN)
                        }

                        Return (THEN)
                    }
                }

                Device (ACAD)
                {
                    Name (_HID, "ACPI0003")
                    Name (_PCL, Package (0x01)
                    {
                        \_SB
                    })
                    Method (_PSR, 0, NotSerialized)
                    {
                        If (LAnd (\_SB.PCI0.LPC0.EC0.ECOK, LEqual (ECDY, 0x00)))
                        {
                            If (\_SB.PCI0.LPC0.EC0.BTCH)
                            {
                                Return (0x01)
                            }

                            If (\_SB.PCI0.LPC0.EC0.BDCH)
                            {
                                Return (0x00)
                            }

                            Return (0x01)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }
                }

                Device (BAT1)
                {
                    Name (_HID, EisaId ("PNP0C0A"))
                    Name (_UID, 0x01)
                    Name (_PCL, Package (0x01)
                    {
                        \_SB
                    })
                    Name (PBIF, Package (0x0D)
                    {
                        0x01, 
                        0x0FA0, 
                        0x0FA0, 
                        0x01, 
                        0x39D0, 
                        0x01A4, 
                        0x9C, 
                        0x0108, 
                        0x0EC4, 
                        "Li_Ion 4000mA ", 
                        "", 
                        "LiON", 
                        "COMPAL "
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LAnd (ECOK (), LEqual (ECDY, 0x00)))
                        {
                            Store ("== Main Battery _STA==", Debug)
                            If (\_SB.PCI0.LPC0.EC0.BAL0)
                            {
                                Sleep (0x14)
                                Return (0x1F)
                            }
                            Else
                            {
                                Sleep (0x14)
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            Sleep (0x14)
                            Return (0x1F)
                        }
                    }

                    Method (_BIF, 0, NotSerialized)
                    {
                        If (LAnd (ECOK (), LEqual (ECDY, 0x00)))
                        {
                            Store ("==Main Battery Information _BIF==", Debug)
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BDC0, Local1)
                            Sleep (0x14)
                            If (LEqual (Local1, 0x0866))
                            {
                                Store (0xDC, Local1)
                                Store (Local1, Index (PBIF, 0x06))
                            }

                            Store (\_SB.PCI0.LPC0.EC0.BMF0, Local1)
                            Sleep (0x14)
                            If (LEqual (Local1, 0x01))
                            {
                                Store ("GC86508SAT0 ", Index (PBIF, 0x09))
                                Store ("SANYO ", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Store ("GC86503SY90 ", Index (PBIF, 0x09))
                                    Store ("SONY ", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local1, 0x04))
                                    {
                                        Store ("GC86503PAG0 ", Index (PBIF, 0x09))
                                        Store ("PANASONIC ", Index (PBIF, 0x0C))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x05))
                                        {
                                            Store ("GC86508SM60 ", Index (PBIF, 0x09))
                                            Store ("SAMSUNG ", Index (PBIF, 0x0C))
                                        }
                                        Else
                                        {
                                            Store ("BCL3100LiON ", Index (PBIF, 0x09))
                                            Store ("COMPAL ", Index (PBIF, 0x0C))
                                        }
                                    }
                                }
                            }
                        }

                        Return (PBIF)
                    }

                    Method (_BST, 0, NotSerialized)
                    {
                        Store ("==Main Battery Status _BST==", Debug)
                        If (LGreater (ECDY, 0x00))
                        {
                            Decrement (ECDY)
                            Notify (\_SB.PCI0.LPC0.BAT1, 0x81)
                        }

                        Name (PBST, Package (0x04)
                        {
                            0x00, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0x39D0
                        })
                        Store (0x00, Local0)
                        Store (0x33, Local2)
                        Store (0x39D0, Local3)
                        If (LAnd (ECOK (), LEqual (ECDY, 0x00)))
                        {
                            If (\_SB.PCI0.LPC0.EC0.BTCH)
                            {
                                Store (0x02, Local0)
                            }
                            Else
                            {
                                Store (0x01, Local0)
                            }

                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.GAU0, Local2)
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BPV0, Local3)
                            Sleep (0x14)
                            If (\_SB.PCI0.LPC0.ACPW)
                            {
                                If (LEqual (Local2, 0x64))
                                {
                                    Store (0x00, Local0)
                                }
                            }
                        }

                        Multiply (Local2, 0x28, Local2)
                        Store (Local0, Index (PBST, 0x00))
                        Store (0x00, Index (PBST, 0x01))
                        Store (Local2, Index (PBST, 0x02))
                        Store (Local3, Index (PBST, 0x03))
                        Return (PBST)
                    }
                }

                Device (W518)
                {
                    Name (_HID, EisaId ("WEC0518"))
                    OperationRegion (SDIO, SystemIO, 0x4E, 0x02)
                    Field (SDIO, ByteAcc, NoLock, Preserve)
                    {
                        WIND,   8, 
                        WDAT,   8
                    }

                    IndexField (WIND, WDAT, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x07), 
                        W007,   8, 
                                Offset (0x29), 
                        W029,   8, 
                                Offset (0x30), 
                        W030,   8, 
                                Offset (0x60), 
                        W060,   8, 
                        W061,   8, 
                                Offset (0x70), 
                        W070,   8, 
                                Offset (0x74), 
                        W074,   8, 
                                Offset (0xF0), 
                        W0F0,   8
                    }

                    Method (ENSD, 0, NotSerialized)
                    {
                        Store (0x83, WIND)
                        Store (0x83, WIND)
                        If (LEqual (0x4E, 0x4E))
                        {
                            Store (0x03, W007)
                        }
                        Else
                        {
                            Store (0x01, W007)
                        }
                    }

                    Method (EXSD, 0, NotSerialized)
                    {
                        Store (0xAA, WIND)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        ENSD ()
                        Store (W030, Local0)
                        EXSD ()
                        If (LEqual (Local0, 0xFF))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (LAnd (Local0, 0x01))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x0D)
                            }
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENSD ()
                        And (W030, 0xFE, W030)
                        EXSD ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (ICRS, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0248,             // Range Minimum
                                0x0248,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y29)
                            IRQNoFlags (_Y2A)
                                {6}
                        })
                        CreateWordField (ICRS, \_SB.PCI0.LPC0.W518._CRS._Y29._MIN, IMIN)
                        CreateWordField (ICRS, \_SB.PCI0.LPC0.W518._CRS._Y29._MAX, IMAX)
                        CreateWordField (ICRS, \_SB.PCI0.LPC0.W518._CRS._Y2A._INT, IRQ0)
                        ENSD ()
                        ShiftLeft (W060, 0x08, Local0)
                        Or (W061, Local0, IMIN)
                        Store (IMIN, IMAX)
                        Store (One, Local0)
                        ShiftLeft (Local0, W070, IRQ0)
                        EXSD ()
                        Return (ICRS)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0248,             // Range Minimum
                                0x0248,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0200,             // Range Minimum
                                0x02FF,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {6,10,11}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x09, IRQ0)
                        ENSD ()
                        Store (0x10, W029)
                        Store (IOHI, W060)
                        Store (IOLO, W061)
                        FindSetRightBit (IRQ0, Local0)
                        Subtract (Local0, 0x01, W070)
                        If (LEqual (0x4E, 0x4E))
                        {
                            Store (0x02, W0F0)
                        }

                        Or (W030, 0x01, W030)
                        EXSD ()
                    }
                }
            }

            Name (NATA, Package (0x01)
            {
                0x001F0001
            })
            Device (IDEC)
            {
                Name (_ADR, 0x001F0001)
                OperationRegion (IDEC, PCI_Config, 0x40, 0x18)
                Field (IDEC, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                            Offset (0x08), 
                    SYNC,   4, 
                            Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                            Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                            Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    OperationRegion (HDIO, SystemIO, 0x01F0, 0x08)
                    Field (HDIO, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x01), 
                                Offset (0x02), 
                                Offset (0x03), 
                                Offset (0x04), 
                                Offset (0x05), 
                                Offset (0x06), 
                        HDSL,   8, 
                        HDCM,   8
                    }

                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (PBUF, Buffer (0x14)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (PBUF, 0x00, PIO0)
                        CreateDWordField (PBUF, 0x04, DMA0)
                        CreateDWordField (PBUF, 0x08, PIO1)
                        CreateDWordField (PBUF, 0x0C, DMA1)
                        CreateDWordField (PBUF, 0x10, FLAG)
                        Store (GETP (PRIT), PIO0)
                        Store (GDMA (And (SYNC, 0x01), And (ICR3, 0x01), 
                            And (ICR0, 0x01), SDT0, And (ICR1, 0x01)), DMA0)
                        If (LEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (PIO0, DMA0)
                        }

                        If (And (PRIT, 0x4000))
                        {
                            If (LEqual (And (PRIT, 0x90), 0x80))
                            {
                                Store (0x0384, PIO1)
                            }
                            Else
                            {
                                Store (GETT (PSIT), PIO1)
                            }
                        }
                        Else
                        {
                            Store (0xFFFFFFFF, PIO1)
                        }

                        Store (GDMA (And (SYNC, 0x02), And (ICR3, 0x02), 
                            And (ICR0, 0x02), SDT1, And (ICR1, 0x02)), DMA1)
                        If (LEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (PIO1, DMA1)
                        }

                        Store (GETF (And (SYNC, 0x01), And (SYNC, 0x02), 
                            PRIT), FLAG)
                        Return (PBUF)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        CreateDWordField (Arg0, 0x00, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        Store (0x04, ICR2)
                        If (LEqual (SizeOf (Arg1), 0x0200))
                        {
                            And (PRIT, 0x40F0, PRIT)
                            And (SYNC, 0x0E, SYNC)
                            Store (0x00, SDT0)
                            And (ICR0, 0x0E, ICR0)
                            And (ICR1, 0x0E, ICR1)
                            And (ICR3, 0x0E, ICR3)
                            And (ICR5, 0x0E, ICR5)
                            CreateWordField (Arg1, 0x62, W490)
                            CreateWordField (Arg1, 0x6A, W530)
                            CreateWordField (Arg1, 0x7E, W630)
                            CreateWordField (Arg1, 0x80, W640)
                            CreateWordField (Arg1, 0xB0, W880)
                            CreateWordField (Arg1, 0xBA, W930)
                            Or (PRIT, 0x8004, PRIT)
                            If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                            {
                                Or (PRIT, 0x02, PRIT)
                            }

                            Or (PRIT, SETP (PIO0, W530, W640), PRIT)
                            If (And (FLAG, 0x01))
                            {
                                Or (SYNC, 0x01, SYNC)
                                Store (SDMA (DMA0), SDT0)
                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x01, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x01, ICR0)
                                }

                                If (And (W930, 0x2000))
                                {
                                    Or (ICR1, 0x01, ICR1)
                                }
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (PRIT, 0x3F0F, PRIT)
                            Store (0x00, PSIT)
                            And (SYNC, 0x0D, SYNC)
                            Store (0x00, SDT1)
                            And (ICR0, 0x0D, ICR0)
                            And (ICR1, 0x0D, ICR1)
                            And (ICR3, 0x0D, ICR3)
                            And (ICR5, 0x0D, ICR5)
                            CreateWordField (Arg2, 0x62, W491)
                            CreateWordField (Arg2, 0x6A, W531)
                            CreateWordField (Arg2, 0x7E, W631)
                            CreateWordField (Arg2, 0x80, W641)
                            CreateWordField (Arg2, 0xB0, W881)
                            CreateWordField (Arg2, 0xBA, W931)
                            Or (PRIT, 0x8040, PRIT)
                            If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                            {
                                Or (PRIT, 0x20, PRIT)
                            }

                            If (And (FLAG, 0x10))
                            {
                                Or (PRIT, 0x4000, PRIT)
                                If (LGreater (PIO1, 0xF0))
                                {
                                    Or (PRIT, 0x80, PRIT)
                                }
                                Else
                                {
                                    Or (PRIT, 0x10, PRIT)
                                    Store (SETT (PIO1, W531, W641), PSIT)
                                }
                            }

                            If (And (FLAG, 0x04))
                            {
                                Or (SYNC, 0x02, SYNC)
                                Store (SDMA (DMA1), SDT1)
                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x02, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x02, ICR0)
                                }

                                If (And (W931, 0x2000))
                                {
                                    Or (ICR1, 0x02, ICR1)
                                }
                            }
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB0, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            })
                            CreateByteField (PIB0, 0x01, PMD0)
                            CreateByteField (PIB0, 0x08, DMD0)
                            If (And (PRIT, 0x02))
                            {
                                If (LEqual (And (PRIT, 0x09), 0x08))
                                {
                                    Store (0x08, PMD0)
                                }
                                Else
                                {
                                    Store (0x0A, PMD0)
                                    ShiftRight (And (PRIT, 0x0300), 0x08, Local0)
                                    ShiftRight (And (PRIT, 0x3000), 0x0C, Local1)
                                    Add (Local0, Local1, Local2)
                                    If (LEqual (0x03, Local2))
                                    {
                                        Store (0x0B, PMD0)
                                    }

                                    If (LEqual (0x05, Local2))
                                    {
                                        Store (0x0C, PMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD0)
                            }

                            If (And (SYNC, 0x01))
                            {
                                Store (Or (SDT0, 0x40), DMD0)
                                If (And (ICR1, 0x01))
                                {
                                    If (And (ICR0, 0x01))
                                    {
                                        Add (DMD0, 0x02, DMD0)
                                    }

                                    If (And (ICR3, 0x01))
                                    {
                                        Store (0x45, DMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                            }

                            Return (PIB0)
                        }

                        Name (_PSC, 0x00)
                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0xA0, HDSL)
                            While (And (HDCM, 0x80))
                            {
                                Sleep (0x05)
                            }

                            Store (0x00, _PSC)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, _PSC)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB1, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            })
                            CreateByteField (PIB1, 0x01, PMD1)
                            CreateByteField (PIB1, 0x08, DMD1)
                            If (And (PRIT, 0x20))
                            {
                                If (LEqual (And (PRIT, 0x90), 0x80))
                                {
                                    Store (0x08, PMD1)
                                }
                                Else
                                {
                                    Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 
                                        0x02), Local0)
                                    If (LEqual (0x05, Local0))
                                    {
                                        Store (0x0C, PMD1)
                                    }
                                    Else
                                    {
                                        If (LEqual (0x03, Local0))
                                        {
                                            Store (0x0B, PMD1)
                                        }
                                        Else
                                        {
                                            Store (0x0A, PMD1)
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD1)
                            }

                            If (And (SYNC, 0x02))
                            {
                                Store (Or (SDT1, 0x40), DMD1)
                                If (And (ICR1, 0x02))
                                {
                                    If (And (ICR0, 0x02))
                                    {
                                        Add (DMD1, 0x02, DMD1)
                                    }

                                    If (And (ICR3, 0x02))
                                    {
                                        Store (0x45, DMD1)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                            }

                            Return (PIB1)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (SBUF, Buffer (0x14)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (SBUF, 0x00, PIO0)
                        CreateDWordField (SBUF, 0x04, DMA0)
                        CreateDWordField (SBUF, 0x08, PIO1)
                        CreateDWordField (SBUF, 0x0C, DMA1)
                        CreateDWordField (SBUF, 0x10, FLAG)
                        Store (GETP (SECT), PIO0)
                        Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                            And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                        If (LEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (PIO0, DMA0)
                        }

                        If (And (SECT, 0x4000))
                        {
                            If (LEqual (And (SECT, 0x90), 0x80))
                            {
                                Store (0x0384, PIO1)
                            }
                            Else
                            {
                                Store (GETT (SSIT), PIO1)
                            }
                        }
                        Else
                        {
                            Store (0xFFFFFFFF, PIO1)
                        }

                        Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                            And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                        If (LEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (PIO1, DMA1)
                        }

                        Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                            SECT), FLAG)
                        Return (SBUF)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        CreateDWordField (Arg0, 0x00, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        Store (0x04, ICR2)
                        If (LEqual (SizeOf (Arg1), 0x0200))
                        {
                            And (SECT, 0x40F0, SECT)
                            And (SYNC, 0x0B, SYNC)
                            Store (0x00, SDT2)
                            And (ICR0, 0x0B, ICR0)
                            And (ICR1, 0x0B, ICR1)
                            And (ICR3, 0x0B, ICR3)
                            And (ICR5, 0x0B, ICR5)
                            CreateWordField (Arg1, 0x62, W490)
                            CreateWordField (Arg1, 0x6A, W530)
                            CreateWordField (Arg1, 0x7E, W630)
                            CreateWordField (Arg1, 0x80, W640)
                            CreateWordField (Arg1, 0xB0, W880)
                            CreateWordField (Arg1, 0xBA, W930)
                            Or (SECT, 0x8004, SECT)
                            If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                            {
                                Or (SECT, 0x02, SECT)
                            }

                            Or (SECT, SETP (PIO0, W530, W640), SECT)
                            If (And (FLAG, 0x01))
                            {
                                Or (SYNC, 0x04, SYNC)
                                Store (SDMA (DMA0), SDT2)
                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x04, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x04, ICR0)
                                }

                                If (And (W930, 0x2000))
                                {
                                    Or (ICR1, 0x04, ICR1)
                                }
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (SECT, 0x3F0F, SECT)
                            Store (0x00, SSIT)
                            And (SYNC, 0x07, SYNC)
                            Store (0x00, SDT3)
                            And (ICR0, 0x07, ICR0)
                            And (ICR1, 0x07, ICR1)
                            And (ICR3, 0x07, ICR3)
                            And (ICR5, 0x07, ICR5)
                            CreateWordField (Arg2, 0x62, W491)
                            CreateWordField (Arg2, 0x6A, W531)
                            CreateWordField (Arg2, 0x7E, W631)
                            CreateWordField (Arg2, 0x80, W641)
                            CreateWordField (Arg2, 0xB0, W881)
                            CreateWordField (Arg2, 0xBA, W931)
                            Or (SECT, 0x8040, SECT)
                            If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                            {
                                Or (SECT, 0x20, SECT)
                            }

                            If (And (FLAG, 0x10))
                            {
                                Or (SECT, 0x4000, SECT)
                                If (LGreater (PIO1, 0xF0))
                                {
                                    Or (SECT, 0x80, SECT)
                                }
                                Else
                                {
                                    Or (SECT, 0x10, SECT)
                                    Store (SETT (PIO1, W531, W641), SSIT)
                                }
                            }

                            If (And (FLAG, 0x04))
                            {
                                Or (SYNC, 0x08, SYNC)
                                Store (SDMA (DMA1), SDT3)
                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x08, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x08, ICR0)
                                }

                                If (And (W931, 0x2000))
                                {
                                    Or (ICR1, 0x08, ICR1)
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (SIB0, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            })
                            CreateByteField (SIB0, 0x01, PMD0)
                            CreateByteField (SIB0, 0x08, DMD0)
                            If (And (SECT, 0x02))
                            {
                                If (LEqual (And (SECT, 0x09), 0x08))
                                {
                                    Store (0x08, PMD0)
                                }
                                Else
                                {
                                    Store (0x0A, PMD0)
                                    ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                    ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
                                    Add (Local0, Local1, Local2)
                                    If (LEqual (0x03, Local2))
                                    {
                                        Store (0x0B, PMD0)
                                    }

                                    If (LEqual (0x05, Local2))
                                    {
                                        Store (0x0C, PMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD0)
                            }

                            If (And (SYNC, 0x04))
                            {
                                Store (Or (SDT2, 0x40), DMD0)
                                If (And (ICR1, 0x04))
                                {
                                    If (And (ICR0, 0x04))
                                    {
                                        Add (DMD0, 0x02, DMD0)
                                    }

                                    If (And (ICR3, 0x04))
                                    {
                                        Store (0x45, DMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                            }

                            Return (SIB0)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (\_SB.PCI0.LPC0.SPWR, 0x00))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_LCK, 1, NotSerialized)
                        {
                        }

                        Method (_EJ0, 1, NotSerialized)
                        {
                            And (SECT, 0xFFDD, SECT)
                            Store (0x00, \_SB.PCI0.LPC0.SRST)
                            Sleep (0x1E)
                            Or (And (ICR4, 0x03), 0x04, ICR4)
                            Sleep (0x1E)
                            Store (0x00, \_SB.PCI0.LPC0.SPWR)
                        }

                        Name (_RMV, 0x01)
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (SIB1, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            })
                            CreateByteField (SIB1, 0x01, PMD1)
                            CreateByteField (SIB1, 0x08, DMD1)
                            If (And (SECT, 0x20))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x08, PMD1)
                                }
                                Else
                                {
                                    Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
                                        0x02), Local0)
                                    If (LEqual (0x05, Local0))
                                    {
                                        Store (0x0C, PMD1)
                                    }
                                    Else
                                    {
                                        If (LEqual (0x03, Local0))
                                        {
                                            Store (0x0B, PMD1)
                                        }
                                        Else
                                        {
                                            Store (0x0A, PMD1)
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD1)
                            }

                            If (And (SYNC, 0x08))
                            {
                                Store (Or (SDT3, 0x40), DMD1)
                                If (And (ICR1, 0x08))
                                {
                                    If (And (ICR0, 0x08))
                                    {
                                        Add (DMD1, 0x02, DMD1)
                                    }

                                    If (And (ICR3, 0x08))
                                    {
                                        Store (0x45, DMD1)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                            }

                            Return (SIB1)
                        }
                    }

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                        And (ICR4, 0x03, ICR4)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                        Or (And (ICR4, 0x03), 0x04, ICR4)
                    }
                }

                Method (GETP, 1, Serialized)
                {
                    If (LEqual (And (Arg0, 0x09), 0x00))
                    {
                        Return (0xFFFFFFFF)
                    }

                    If (LEqual (And (Arg0, 0x09), 0x08))
                    {
                        Return (0x0384)
                    }

                    ShiftRight (And (Arg0, 0x0300), 0x08, Local0)
                    ShiftRight (And (Arg0, 0x3000), 0x0C, Local1)
                    Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))
                        ))
                }

                Method (GDMA, 5, Serialized)
                {
                    If (Arg0)
                    {
                        If (LAnd (Arg1, Arg4))
                        {
                            Return (0x14)
                        }

                        If (LAnd (Arg2, Arg4))
                        {
                            Return (Multiply (Subtract (0x04, Arg3), 0x0F))
                        }

                        Return (Multiply (Subtract (0x04, Arg3), 0x1E))
                    }

                    Return (0xFFFFFFFF)
                }

                Method (GETT, 1, Serialized)
                {
                    Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
                        ), 0x03), And (Arg0, 0x03)))))
                }

                Method (GETF, 3, Serialized)
                {
                    Name (TMPF, 0x00)
                    If (Arg0)
                    {
                        Or (TMPF, 0x01, TMPF)
                    }

                    If (And (Arg2, 0x02))
                    {
                        Or (TMPF, 0x02, TMPF)
                    }

                    If (Arg1)
                    {
                        Or (TMPF, 0x04, TMPF)
                    }

                    If (And (Arg2, 0x20))
                    {
                        Or (TMPF, 0x08, TMPF)
                    }

                    If (And (Arg2, 0x4000))
                    {
                        Or (TMPF, 0x10, TMPF)
                    }

                    Return (TMPF)
                }

                Method (SETP, 3, Serialized)
                {
                    If (LGreater (Arg0, 0xF0))
                    {
                        Return (0x08)
                    }
                    Else
                    {
                        If (And (Arg1, 0x02))
                        {
                            If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                            {
                                Return (0x2301)
                            }

                            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                            {
                                Return (0x2101)
                            }
                        }

                        Return (0x1001)
                    }
                }

                Method (SDMA, 1, Serialized)
                {
                    If (LLessEqual (Arg0, 0x14))
                    {
                        Return (0x01)
                    }

                    If (LLessEqual (Arg0, 0x1E))
                    {
                        Return (0x02)
                    }

                    If (LLessEqual (Arg0, 0x2D))
                    {
                        Return (0x01)
                    }

                    If (LLessEqual (Arg0, 0x3C))
                    {
                        Return (0x02)
                    }

                    If (LLessEqual (Arg0, 0x5A))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SETT, 3, Serialized)
                {
                    If (And (Arg1, 0x02))
                    {
                        If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                        {
                            Return (0x0B)
                        }

                        If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                        {
                            Return (0x09)
                        }
                    }

                    Return (0x04)
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0000)
                OperationRegion (USBO, PCI_Config, 0xC4, 0x04)
                Field (USBO, DWordAcc, Lock, Preserve)
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
                        Store (0x00, RSEN)
                    }
                }

                Method (_S1D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0001)
                OperationRegion (USBO, PCI_Config, 0xC4, 0x04)
                Field (USBO, DWordAcc, Lock, Preserve)
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
                        Store (0x00, RSEN)
                    }
                }

                Method (_S1D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0002)
                OperationRegion (USBO, PCI_Config, 0xC4, 0x04)
                Field (USBO, DWordAcc, Lock, Preserve)
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
                        Store (0x00, RSEN)
                    }
                }

                Method (_S1D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (EUSB)
            {
                Name (_ADR, 0x001D0007)
                Name (_S1D, 0x02)
                Name (_S3D, 0x02)
                Name (_S4D, 0x02)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (SMBS)
            {
                Name (_ADR, 0x001F0003)
            }

            Device (AUDI)
            {
                Name (_ADR, 0x001F0005)
                Method (_S1D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (MODM)
            {
                Name (_ADR, 0x001F0006)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
                OperationRegion (MDIS, PCI_Config, 0x00, 0x04)
                Field (MDIS, DWordAcc, NoLock, Preserve)
                {
                    MDID,   32
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (MDID, 0xFFFFFFFF))
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }
}

