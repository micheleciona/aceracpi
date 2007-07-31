/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20041203
 *
 * Disassembly of dsdt.dat, Thu Dec 30 13:33:23 2004
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "COMPAL", "ELW80", 100925440)
{
    Name (Z000, 0x01)
    Name (Z001, 0x02)
    Name (Z002, 0x04)
    Name (Z003, 0x08)
    Name (Z004, 0x00)
    Name (Z005, 0x0F)
    Name (Z006, 0x0D)
    Name (Z007, 0x0B)
    Name (Z008, 0x09)
    OperationRegion (PORT, SystemIO, 0x1080, 0x01)
    Field (PORT, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
    }

    OperationRegion (MNVT, SystemMemory, 0x1BF7FFAC, 0x20)
    Field (MNVT, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        CMAP,   8, 
        CMBP,   8, 
        FDCP,   8, 
        LPTP,   8, 
        BTEN,   8, 
        THRT,   8, 
        BRAD,   8, 
        BGTL,   8, 
        CADL,   16, 
        CSTE,   16, 
        BGU1,   8, 
        BST1,   8
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00008010, 0x06) {}
        Processor (CPU1, 0x01, 0x00008010, 0x06) {}
    }

    Name (_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x04)
    {
        0x03, 
        0x03, 
        0x00, 
        0x00
    })
    Name (_S4, Package (0x04)
    {
        0x04, 
        0x04, 
        0x00, 
        0x00
    })
    Name (_S5, Package (0x04)
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    OperationRegion (\DEBG, SystemIO, 0x1080, 0x01)
    Field (\DEBG, ByteAcc, NoLock, Preserve)
    {
        DBGP,   8
    }

    Name (HTTX, 0x00)
    Name (ECDY, 0x07)
    Name (\PWRS, 0x01)
    Name (\DSEN, 0x01)
    Name (\ECON, 0x00)
    Name (\CTYP, 0x00)
    Name (\GPIC, 0x00)
    Method (_PTS, 1, NotSerialized)
    {
        Store (0x01, \_SB.PCI0.LPC0.PWSC)
        Store (0x00, \_SB.PCI0.LPC0.EC0.THEN)
        Store (0x00, \_SB.PCI0.LPC0.EC0.DUTY)
        If (LEqual (Arg0, 0x04))
        {
            \_SB.PCI0.LPC0.PHSS (0x0E)
            Store (0x01, \_SB.PCI0.LPC0.EC0.S4ST)
        }

        If (LEqual (Arg0, 0x03))
        {
            \_SB.PCI0.LPC0.PHSS (0x80)
            Store (0x01, \_SB.PCI0.LPC0.PWSC)
            Store (0x00, \_SB.PCI0.LPC0.EC0.THEN)
            Store (0x00, \_SB.PCI0.LPC0.EC0.DUTY)
        }

        If (LEqual (And (HTTX, 0x01), 0x01))
        {
            Store (0xA1, \_SB.PCI0.LPC0.BCMD)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x04))
        {
            Notify (\_SB.PWRB, 0x02)
        }

        If (LEqual (\_SB.OSTB, 0x04))
        {
            Store (0x00, \_SB.PCI0.LPC0.LPOL)
        }

        If (LEqual (And (HTTX, 0x01), 0x01))
        {
            Store (0xA0, \_SB.PCI0.LPC0.BCMD)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
        }
	Return(Package(0x02){0x00, 0x00})
    }

    Scope (\_GPE)
    {
        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P2P.ELAN, 0x02)
        }

        Method (_L07, 0, NotSerialized)
        {
            If (LEqual (\_SB.OSTB, 0x04))
            {
                Not (\_SB.PCI0.LPC0.LPOL, \_SB.PCI0.LPC0.LPOL)
            }
            Else
            {
                If (LEqual (\_SB.PCI0.LPC0.LIDS, 0x01))
                {
                    \_SB.PCI0.LPC0.PHSS (0x72)
                }

                Not (\_SB.PCI0.LPC0.LIDS, \_SB.PCI0.LPC0.LIDS)
            }

            Notify (\_SB.LID, 0x80)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.OHC1, 0x02)
            Notify (\_SB.PCI0.OHC2, 0x02)
            Notify (\_SB.PCI0.EHCI, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MODM, 0x02)
        }
    }

    Scope (\_SB)
    {
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x1BF7FF3C, 0x00000001)
        Field (OSTY, AnyAcc, NoLock, Preserve)
        {
            TPOS,   8
        }

        Method (OSTP, 0, NotSerialized)
        {
            If (LEqual (^OSTB, Ones))
            {
                If (CondRefOf (\_OSI, Local0))
                {
                    If (\_OSI ("Windows 2001.1"))
                    {
                        Store (0x20, ^OSTB)
                        Store (0x20, ^TPOS)
                    }
                    Else
                    {
                        If (\_OSI ("Windows 2001 SP1"))
                        {
                            Store (0x10, ^OSTB)
                            Store (0x10, ^TPOS)
                        }
                        Else
                        {
                            If (\_OSI ("Windows 2001"))
                            {
                                Store (0x08, ^OSTB)
                                Store (0x08, ^TPOS)
                            }
                            Else
                            {
                                Store (0x00, ^OSTB)
                                Store (0x00, ^TPOS)
                            }
                        }
                    }
                }
                Else
                {
                    If (CondRefOf (\_OS, Local0))
                    {
                        If (^SEQL (\_OS, "Microsoft Windows"))
                        {
                            Store (0x01, ^OSTB)
                            Store (0x01, ^TPOS)
                        }
                        Else
                        {
                            If (^SEQL (\_OS, "Microsoft WindowsME: Millennium Edition"))
                            {
                                Store (0x02, ^OSTB)
                                Store (0x02, ^TPOS)
                            }
                            Else
                            {
                                If (^SEQL (\_OS, "Microsoft Windows NT"))
                                {
                                    Store (0x04, ^OSTB)
                                    Store (0x04, ^TPOS)
                                }
                                Else
                                {
                                    Store (0x00, ^OSTB)
                                    Store (0x00, ^TPOS)
                                }
                            }
                        }
                    }
                    Else
                    {
                        Store (0x00, ^OSTB)
                        Store (0x00, ^TPOS)
                    }
                }
            }

            Return (^OSTB)
        }

        Method (SEQL, 2, Serialized)
        {
            Store (SizeOf (Arg0), Local0)
            Store (SizeOf (Arg1), Local1)
            If (LNot (LEqual (Local0, Local1)))
            {
                Return (Zero)
            }

            Name (BUF0, Buffer (Local0) {})
            Store (Arg0, BUF0)
            Name (BUF1, Buffer (Local0) {})
            Store (Arg1, BUF1)
            Store (Zero, Local2)
            While (LLess (Local2, Local0))
            {
                Store (DerefOf (Index (BUF0, Local2)), Local3)
                Store (DerefOf (Index (BUF1, Local2)), Local4)
                If (LNot (LEqual (Local3, Local4)))
                {
                    Return (Zero)
                }

                Increment (Local2)
            }

            Return (One)
        }
    }

    Name (FWSO, "FWSO")
    Name (_PSC, 0x00)
    Method (_PS0, 0, NotSerialized)
    {
        Store (_PSC, Local0)
        Store (0x00, _PSC)
    }

    Method (_PS3, 0, NotSerialized)
    {
        Store (0x03, _PSC)
    }

    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
        If (Arg0)
        {
            \_SB.PCI0.LPC0.DSPI ()
        }
    }

    Scope (\_SB)
    {
        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                Return (\_SB.PCI0.LPC0.LIDS)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_BBN, 0x00)
            Method (_INI, 0, NotSerialized)
            {
                \_SB.OSTP ()
            }

            OperationRegion (MREG, PCI_Config, 0x92, 0x02)
            Field (MREG, ByteAcc, NoLock, Preserve)
            {
                TOML,   8, 
                TOMH,   8
            }

            Method (TOM, 0, NotSerialized)
            {
                Multiply (TOML, 0x00010000, Local0)
                Multiply (TOMH, 0x01000000, Local1)
                Add (Local0, Local1, Local0)
                Return (Local0)
            }

            OperationRegion (REGS, PCI_Config, 0x59, 0x08)
            Field (REGS, ByteAcc, NoLock, Preserve)
            {
                SR59,   8, 
                SR5A,   8, 
                SR5B,   8, 
                SR5C,   8, 
                SR5D,   8, 
                SR5E,   8, 
                SR5F,   8
            }

            Name (RSRC, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,
                    0x0000,
                    0x00FF,
                    0x0000,
                    0x0100, 0x00)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,
                    0x000A0000,
                    0x000BFFFF,
                    0x00000000,
                    0x00020000, 0x00)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,
                    0x000C0000,
                    0x000C3FFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,
                    0x000C4000,
                    0x000C7FFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,
                    0x000C8000,
                    0x000CBFFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,
                    0x000CC000,
                    0x000CFFFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,
                    0x000D0000,
                    0x000D3FFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,
                    0x000D4000,
                    0x000D7FFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,
                    0x000D8000,
                    0x000DBFFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,
                    0x000DC000,
                    0x000DFFFF,
                    0x00000000,
                    0x00004000, 0x00)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,
                    0x00000000,
                    0xFFFDFFFF,
                    0x00000000,
                    0x00000000, 0x00)
                IO (Decode16, 0x0CF8, 0x0CF8, 0x01, 0x08)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,
                    0x0000,
                    0x0CF7,
                    0x0000,
                    0x0CF8, 0x00)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,
                    0x0D00,
                    0xFFFF,
                    0x0000,
                    0xF300, 0x00)
            })
            Method (_CRS, 0, Serialized)
            {
                CreateBitField (RSRC, 0x0188, C0RW)
                CreateDWordField (RSRC, 0x42, C0LN)
                Store (One, C0RW)
                If (LEqual (SR5A, 0x01))
                {
                    Store (Zero, C0RW)
                }

                Store (0x4000, C0LN)
                If (And (SR5A, 0x03))
                {
                    Store (0x00, C0LN)
                }

                CreateBitField (RSRC, 0x0260, C4RW)
                CreateDWordField (RSRC, 0x5D, C4LN)
                Store (One, C4RW)
                If (LEqual (SR5A, 0x10))
                {
                    Store (Zero, C4RW)
                }

                Store (0x4000, C4LN)
                If (And (SR5A, 0x30))
                {
                    Store (0x00, C4LN)
                }

                CreateBitField (RSRC, 0x0338, C8RW)
                CreateDWordField (RSRC, 0x78, C8LN)
                Store (One, C8RW)
                If (LEqual (SR5B, 0x01))
                {
                    Store (Zero, C8RW)
                }

                Store (0x4000, C8LN)
                If (And (SR5B, 0x03))
                {
                    Store (0x00, C8LN)
                }

                CreateBitField (RSRC, 0x0410, CCRW)
                CreateDWordField (RSRC, 0x93, CCLN)
                Store (One, CCRW)
                If (LEqual (SR5B, 0x10))
                {
                    Store (Zero, CCRW)
                }

                Store (0x4000, CCLN)
                If (And (SR5B, 0x30))
                {
                    Store (0x00, CCLN)
                }

                CreateBitField (RSRC, 0x04E8, D0RW)
                CreateDWordField (RSRC, 0xAE, D0LN)
                Store (One, D0RW)
                If (LEqual (SR5C, 0x01))
                {
                    Store (Zero, D0RW)
                }

                Store (0x4000, D0LN)
                If (And (SR5C, 0x03))
                {
                    Store (0x00, D0LN)
                }

                CreateBitField (RSRC, 0x05C0, D4RW)
                CreateDWordField (RSRC, 0xC9, D4LN)
                Store (One, D4RW)
                If (LEqual (SR5C, 0x10))
                {
                    Store (Zero, D4RW)
                }

                Store (0x4000, D4LN)
                If (And (SR5C, 0x30))
                {
                    Store (0x00, D4LN)
                }

                CreateBitField (RSRC, 0x0698, D8RW)
                CreateDWordField (RSRC, 0xE4, D8LN)
                Store (One, D8RW)
                If (LEqual (SR5D, 0x01))
                {
                    Store (Zero, D8RW)
                }

                Store (0x4000, D8LN)
                If (And (SR5D, 0x03))
                {
                    Store (0x00, D8LN)
                }

                CreateBitField (RSRC, 0x0770, DCRW)
                CreateDWordField (RSRC, 0xFF, DCLN)
                Store (One, DCRW)
                If (LEqual (SR5D, 0x10))
                {
                    Store (Zero, DCRW)
                }

                Store (0x4000, DCLN)
                If (And (SR5D, 0x30))
                {
                    Store (0x00, DCLN)
                }

                CreateDWordField (RSRC, 0x010E, BTMN)
                CreateDWordField (RSRC, 0x0112, BTMX)
                CreateDWordField (RSRC, 0x011A, BTLN)
                Store (\_SB.PCI0.TOM (), BTMN)
                Subtract (0xFEC00000, BTMN, BTLN)
                Subtract (Add (BTMN, BTLN), 0x01, BTMX)
                Return (RSRC)
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x03)
                    {
                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }
                    })
                }
                Else
                {
                    Return (Package (0x03)
                    {
                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNK3, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNK0, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNK1, 
                            0x00
                        }
                    })
                }
            }

            OperationRegion (BAR1, PCI_Config, 0x14, 0x04)
            Field (BAR1, ByteAcc, NoLock, Preserve)
            {
                Z009,   32
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)
                OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
                Field (PIRQ, ByteAcc, NoLock, Preserve)
                {
                    PIID,   8, 
                    PIDA,   8
                }

                IndexField (PIID, PIDA, ByteAcc, NoLock, Preserve)
                {
                    PIR0,   8, 
                    PIR1,   8, 
                    PIR2,   8, 
                    PIR3,   8, 
                    PIRS,   8
                }

                Name (IPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {10,11}
                })
                Method (DSPI, 0, NotSerialized)
                {
                    Store (0x00, PIR0)
                    Store (0x00, PIR1)
                    Store (0x00, PIR2)
                    Store (0x00, PIR3)
                    Store (0x00, PIRS)
                }

                Device (LNK0)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIR0)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIR0)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIR0, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIR0)
                    }
                }

                Device (LNK1)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIR1)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIR1)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIR1, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIR1)
                    }
                }

                Device (LNK2)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIR2)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIR2)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIR2, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIR2)
                    }
                }

                Device (LNK3)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIR3)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIR3)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIR3, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIR3)
                    }
                }

                OperationRegion (PMIO, SystemIO, 0x8020, 0x40)
                Field (PMIO, WordAcc, Lock, Preserve)
                {
                        ,   2, 
                    ACPW,   1, 
                        ,   4, 
                    LPOS,   1, 
                    Offset (0x04), 
                        ,   7, 
                    LPOE,   1
                }

                OperationRegion (PREG, SystemIO, 0x0CD6, 0x02)
                Field (PREG, ByteAcc, NoLock, Preserve)
                {
                    PIND,   8, 
                    PDAT,   8
                }

                IndexField (PIND, PDAT, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x36), 
                        ,   7, 
                    LPOL,   1, 
                    Offset (0x39), 
                        ,   7, 
                    LIDS,   1, 
                    Offset (0x54), 
                        ,   1, 
                    PWSC,   1, 
                    Offset (0x55), 
                    Offset (0x66), 
                        ,   5, 
                    USPD,   2
                }

                OperationRegion (LPCR, PCI_Config, 0x00, 0x7F)
                Field (LPCR, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x44), 
                    LP0E,   6, 
                    CMA0,   1, 
                    CMA1,   1, 
                        ,   3, 
                    CMA2,   1, 
                        ,   1, 
                    CMA3,   1, 
                    Offset (0x48), 
                        ,   2, 
                    ENIO,   1, 
                    Offset (0x64), 
                    IOBS,   16, 
                    Offset (0x74), 
                    ALTW,   1, 
                    Offset (0x75)
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0000, 0x0000, 0x01, 0x20)
                        IO (Decode16, 0x0080, 0x0080, 0x01, 0x10)
                        IO (Decode16, 0x00C0, 0x00C0, 0x01, 0x20)
                        IO (Decode16, 0x040B, 0x040B, 0x01, 0x01)
                        IO (Decode16, 0x04D6, 0x04D6, 0x01, 0x01)
                        DMA (Compatibility, NotBusMaster, Transfer8_16) {4}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x00F0, 0x00F0, 0x01, 0x0F)
                        IRQ (Edge, ActiveHigh, Exclusive) {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0020, 0x0020, 0x01, 0x02)
                        IO (Decode16, 0x00A0, 0x00A0, 0x01, 0x02)
                        IO (Decode16, 0x04D0, 0x04D0, 0x01, 0x02)
                        IO (Decode16, 0x0C00, 0x0C00, 0x01, 0x02)
                        IRQ (Edge, ActiveHigh, Exclusive) {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0070, 0x0070, 0x01, 0x02)
                        IRQ (Edge, ActiveHigh, Exclusive) {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0061, 0x0061, 0x01, 0x01)
                    })
                }

                Device (TIME)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0040, 0x0040, 0x01, 0x04)
                        IRQ (Edge, ActiveHigh, Exclusive) {0}
                    })
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0060, 0x0060, 0x01, 0x01)
                        IO (Decode16, 0x0064, 0x0064, 0x01, 0x01)
                        IRQ (Edge, ActiveHigh, Exclusive) {1}
                    })
                }

                Device (MSE0)
                {
                    Name (_HID, EisaId ("SYN0701"))
                    Name (_CID, Package (0x02)
                    {
                        0x00072E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive) {12}
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x002E, 0x002E, 0x01, 0x02)
                        IO (Decode16, 0x0072, 0x0072, 0x01, 0x02)
                        IO (Decode16, 0x1080, 0x1080, 0x01, 0x01)
                        IO (Decode16, 0x00B0, 0x00B0, 0x01, 0x02)
                        IO (Decode16, 0x0092, 0x0092, 0x01, 0x01)
                        IO (Decode16, 0x0220, 0x0220, 0x01, 0x10)
                        IO (Decode16, 0x040B, 0x040B, 0x01, 0x01)
                        IO (Decode16, 0x04D0, 0x04D0, 0x01, 0x02)
                        IO (Decode16, 0x04D6, 0x04D6, 0x01, 0x01)
                        IO (Decode16, 0x0530, 0x0530, 0x08, 0x08)
                        IO (Decode16, 0x0C00, 0x0C00, 0x01, 0x02)
                        IO (Decode16, 0x0C14, 0x0C14, 0x01, 0x01)
                        IO (Decode16, 0x0C50, 0x0C50, 0x01, 0x03)
                        IO (Decode16, 0x0C6C, 0x0C6C, 0x01, 0x01)
                        IO (Decode16, 0x0C6F, 0x0C6F, 0x01, 0x01)
                        IO (Decode16, 0x0CD6, 0x0CD6, 0x01, 0x02)
                        IO (Decode16, 0x8000, 0x8000, 0x01, 0x60)
                        IO (Decode16, 0x0F40, 0x0F40, 0x01, 0x08)
                        IO (Decode16, 0x0280, 0x0280, 0x01, 0x14)
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly, 0x000E0000, 0x00020000)
                        Memory32Fixed (ReadOnly, 0xFFF80000, 0x00080000)
                        Memory32Fixed (ReadWrite, 0x00000000, 0x00000000)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LNot (LLess (TPOS, 0x04)))
                        {
                            CreateDWordField (MSRC, 0x1C, BARX)
                            CreateDWordField (MSRC, 0x20, GALN)
                            Store (0x1000, GALN)
                            Store (\_SB.PCI0.Z009, Local0)
                            And (Local0, 0xFFFFFFF0, BARX)
                        }

                        Return (MSRC)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                OperationRegion (SMI0, SystemIO, 0x00000F40, 0x00000002)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x1BF7FE3C, 0x00000100)
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
                    INF,    8, 
                    INF1,   32
                }

                Mutex (PSMX, 0x00)
                Method (PHSS, 1, NotSerialized)
                {
                    Acquire (PSMX, 0xFFFF)
                    Store (0x80, BCMD)
                    Store (Arg0, DID)
                    Store (Zero, SMIC)
                    Release (PSMX)
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Method (_INI, 0, NotSerialized)
                    {
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

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("SMCF010"))
                        Name (FENA, 0x01)
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16, 0x02F8, 0x02F8, 0x01, 0x08)
                            IO (Decode16, 0x06F8, 0x06F8, 0x01, 0x08)
                            IRQNoFlags () {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                        })
                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16, 0x0000, 0x0000, 0x00, 0x00)
                            IO (Decode16, 0x0000, 0x0000, 0x00, 0x00)
                            IRQNoFlags () {0}
                            DMA (Compatibility, NotBusMaster, Transfer8) {0}
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (CMBP, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x25, 0xFF), Local0)
                            If (LEqual (Local0, 0xFE))
                            {
                                Store (0x01, CMA0)
                            }

                            If (LEqual (Local0, 0xBE))
                            {
                                Store (0x01, CMA1)
                            }

                            If (LEqual (Local0, 0xBA))
                            {
                                Store (0x01, CMA2)
                            }

                            If (LEqual (Local0, 0xFA))
                            {
                                Store (0x01, CMA3)
                            }

                            If (FENA)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x0D)
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
                            Store (Local0, Local3)
                            ShiftLeft (Local3, 0x03, Local3)
                            Store (0x01, \_SB.PCI0.LPC0.ALTW)
                            Store (Local3, \_SB.PCI0.LPC0.IOBS)
                            Store (0x01, \_SB.PCI0.LPC0.ENIO)
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
                            Or (Local0, 0x0E, Local0)
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
                            If (LNot (LEqual (_STA (), 0x0F)))
                            {
                                Return (RSRC)
                            }

                            CreateByteField (BUF0, 0x02, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, 0x04, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, 0x0A, I2LO)
                            CreateByteField (BUF0, 0x0B, I2HI)
                            CreateByteField (BUF0, 0x0C, I2RL)
                            CreateByteField (BUF0, 0x0D, I2RH)
                            CreateByteField (BUF0, 0x11, IRQL)
                            CreateByteField (BUF0, 0x12, IRQH)
                            CreateByteField (BUF0, 0x14, DMAC)
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
                                IO (Decode16, 0x02F8, 0x02F8, 0x01, 0x08)
                                IO (Decode16, 0x06F8, 0x06F8, 0x01, 0x08)
                                IRQNoFlags () {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16, 0x03F8, 0x03F8, 0x01, 0x08)
                                IO (Decode16, 0x07F8, 0x07F8, 0x01, 0x08)
                                IRQNoFlags () {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16, 0x03E8, 0x03E8, 0x01, 0x08)
                                IO (Decode16, 0x07E8, 0x07E8, 0x01, 0x08)
                                IRQNoFlags () {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16, 0x02E8, 0x02E8, 0x01, 0x08)
                                IO (Decode16, 0x06E8, 0x06E8, 0x01, 0x08)
                                IRQNoFlags () {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8) {1,3}
                            }
                            EndDependentFn ()
                        })
                        Method (_DIS, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x25, 0xFF), Local0)
                            If (LEqual (Local0, 0xFE))
                            {
                                Store (0x00, CMA0)
                            }

                            If (LEqual (Local0, 0xBE))
                            {
                                Store (0x00, CMA1)
                            }

                            If (LEqual (Local0, 0xBA))
                            {
                                Store (0x00, CMA2)
                            }

                            If (LEqual (Local0, 0xFA))
                            {
                                Store (0x00, CMA3)
                            }

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
                }

                Method (ECOK, 0, NotSerialized)
                {
                    If (LEqual (\_SB.PCI0.LPC0.EC0.Z00A, 0x01))
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
                    Name (_GPE, 0x06)
                    Name (Z00A, Zero)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0062, 0x0062, 0x01, 0x01)
                        IO (Decode16, 0x0066, 0x0066, 0x01, 0x01)
                    })
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Z00A)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x60), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   256, 
                        BCNT,   8, 
                        SMAA,   24, 
                        Offset (0x90), 
                        CHGM,   16, 
                        CHGS,   16, 
                        ENID,   8, 
                        ENIB,   8, 
                        ENDD,   8, 
                        CHGV,   8, 
                        CHGA,   16, 
                        BAL0,   1, 
                        BAL1,   1, 
                        BAL2,   1, 
                        BAL3,   1, 
                        BBC0,   1, 
                        BBC1,   1, 
                        BBC2,   1, 
                        BBC3,   1, 
                        Offset (0x9C), 
                        PHDD,   1, 
                        IFDD,   1, 
                        IODD,   1, 
                        SHDD,   1, 
                        S120,   1, 
                        EFDD,   1, 
                        CRTD,   1, 
                        Offset (0x9D), 
                        SBTN,   1, 
                        VIDO,   1, 
                        VOLD,   1, 
                        VOLU,   1, 
                        MUTE,   1, 
                        CONT,   1, 
                        BRGT,   1, 
                        HBTN,   1, 
                        SKEY,   1, 
                        S4ST,   1, 
                        BKEY,   1, 
                        TOUP,   1, 
                        FNBN,   1, 
                        LIDF,   1, 
                        DIGM,   1, 
                        CDLK,   1, 
                        Offset (0xA2), 
                        BTNS,   8, 
                        S1LD,   1, 
                        S3LD,   1, 
                        VGAQ,   1, 
                        PCMQ,   1, 
                        PCMR,   1, 
                        ADPT,   1, 
                        SLLS,   1, 
                        SYS7,   1, 
                        PWAK,   1, 
                        MWAK,   1, 
                        LWAK,   1, 
                        Offset (0xA5), 
                        Offset (0xAA), 
                        TCNL,   8, 
                        TMPI,   8, 
                        TMSD,   8, 
                        FASN,   4, 
                        FASU,   4, 
                        PCVL,   4, 
                            ,   2, 
                        SWTO,   1, 
                        HWTO,   1, 
                        MODE,   1, 
                        FANS,   2, 
                        INIT,   1, 
                        FAN1,   1, 
                        FAN2,   1, 
                        FANT,   1, 
                        SKNM,   1, 
                        CTMP,   8, 
                        LIDE,   1, 
                        PMEE,   1, 
                        PWBE,   1, 
                        RNGE,   1, 
                        BTWE,   1, 
                        DCKE,   1, 
                        Offset (0xB2), 
                        SK90,   8, 
                        SK92,   8, 
                        Offset (0xB8), 
                        BTDT,   1, 
                        BTPW,   1, 
                        BTDS,   1, 
                        BTPS,   1, 
                        BTSW,   1, 
                        BTWK,   1, 
                        BTLD,   1, 
                        Offset (0xB9), 
                        BRTS,   8, 
                        CNTS,   8, 
                        WLAT,   1, 
                        BTAT,   1, 
                        WLEX,   1, 
                        BTEX,   1, 
                        KLSW,   1, 
                        WLOK,   1, 
                        Offset (0xBC), 
                        PTID,   8, 
                        CPUT,   8, 
                        EPKT,   8, 
                        Offset (0xC0), 
                            ,   4, 
                        BMF0,   3, 
                        BTY0,   1, 
                        BST0,   8, 
                        BRC0,   16, 
                        BSN0,   16, 
                        BPV0,   16, 
                        BDV0,   16, 
                        BDC0,   16, 
                        BFC0,   16, 
                        GAU0,   8, 
                        CYC0,   8, 
                        BPC0,   16, 
                        BAC0,   16, 
                        BAT0,   8, 
                        BTW0,   16, 
                        BDN0,   8, 
                        Offset (0xE0), 
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
                        CYC1,   8, 
                        BPC1,   16, 
                        BAC1,   16, 
                        BAT1,   8, 
                        BTW1,   16
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

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store ("=====QUERY_11=====", Debug)
                        If (\_SB.PCI0.LPC0.EC0.BRGT)
                        {
                            Store (\_SB.PCI0.LPC0.EC0.BRTS, BGTL)
                            PHSS (0x08)
                            Store (0x00, \_SB.PCI0.LPC0.EC0.BRGT)
                        }
                    }

                    Method (_Q1C, 0, NotSerialized)
                    {
                        Store ("=====QUERY_1C=====", Debug)
                        If (\_SB.PCI0.LPC0.EC0.VIDO)
                        {
                            PHSS (0x01)
                            Store (0x00, \_SB.PCI0.LPC0.EC0.VIDO)
                        }
                    }

                    Method (_Q1D, 0, NotSerialized)
                    {
                        Store ("=====QUERY_1C=====", Debug)
                        \_SB.PCI0.LPC0.EC0.PCLK ()
                    }

                    Method (_Q1E, 0, NotSerialized)
                    {
                        Store ("=====QUERY_1E=====", Debug)
                        \_SB.PCI0.LPC0.EC0.PCLK ()
                    }

                    Method (_Q22, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Store ("=====QUERY_25=====", Debug)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x81)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store ("=====QUERY_33=====", Debug)
                        \_SB.PCI0.AGP.VGA.TVSW ()
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store ("=====QUERY_34=====", Debug)
                        If (\_SB.PCI0.LPC0.EC0.BKEY)
                        {
                            PHSS (0x71)
                            Store (0x00, \_SB.PCI0.LPC0.EC0.BKEY)
                        }
                    }

                    Method (_Q37, 0, NotSerialized)
                    {
                        Store ("=====QUERY_37=====", Debug)
                        PHSS (0x0D)
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x00)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q38, 0, NotSerialized)
                    {
                        Store ("=====QUERY_38=====", Debug)
                        PHSS (0x0D)
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x01)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    OperationRegion (CCLK, SystemIO, 0x8010, 0x04)
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
                        RFRD,   16
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
                        Store (Arg0, ERIB)
                        Store (Arg1, ERBD)
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
                        If (ECOK ())
                        {
                            Return (\_SB.PCI0.LPC0.EC0.ADPT)
                        }
                        Else
                        {
                            Return (0x01)
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
                        "Li_Ion 4000mA", 
                        "", 
                        "Li-Ion", 
                        "COMPAL "
                    })
                    Name (PBST, Package (0x04)
                    {
                        0x01, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0x39D0
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            Store ("== Main Battery _STA==", Debug)
                            If (\_SB.PCI0.LPC0.EC0.BAL0)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            Return (0x1F)
                        }
                    }

                    Method (_BIF, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            Store ("==Main Battery Information _BIF==", Debug)
                            Store (\_SB.PCI0.LPC0.EC0.BDC0, Local0)
                            Store (Local0, Index (PBIF, 0x01))
                            Store (\_SB.PCI0.LPC0.EC0.BFC0, Local2)
                            Store (Local2, Index (PBIF, 0x02))
                            Store (\_SB.PCI0.LPC0.EC0.BMF0, Local1)
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

                        If (ECOK ())
                        {
                            Store (\_SB.PCI0.LPC0.EC0.BST0, Local0)
                            Store (\_SB.PCI0.LPC0.EC0.GAU0, Local2)
                            Store (\_SB.PCI0.LPC0.EC0.BPV0, Local3)
                            Store (\_SB.PCI0.LPC0.EC0.BFC0, Local1)
                            Store (Local2, Local4)
                            Multiply (Local2, Local1, Local2)
                            If (Local2)
                            {
                                Divide (Local2, 0x64, Local6, Local2)
                                If (LNot (LGreater (Local4, 0x63)))
                                {
                                    Increment (Local2)
                                }
                            }

                            If (LEqual (Local0, 0x02))
                            {
                                If (LEqual (Local4, 0x64))
                                {
                                    Store (0x00, Local0)
                                }
                            }

                            Store (Local0, Index (PBST, 0x00))
                            Store (0x00, Index (PBST, 0x01))
                            Store (Local2, Index (PBST, 0x02))
                            Store (Local3, Index (PBST, 0x03))
                        }

                        Return (PBST)
                    }
                }
            }

            Device (SMB0)
            {
                Name (_ADR, 0x00140000)
                OperationRegion (Z00C, PCI_Config, 0x08, 0x01)
                Field (Z00C, ByteAcc, NoLock, Preserve)
                {
                    RVID,   8
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x05)
                        {
                            Package (0x03)
                            {
                                0xFFFF, 
                                \_SB.PCI0.LPC0.LNK0, 
                                0x00
                            }, 

                            Package (0x03)
                            {
                                0x0002FFFF, 
                                \_SB.PCI0.LPC0.LNK2, 
                                0x00
                            }, 

                            Package (0x03)
                            {
                                0x0003FFFF, 
                                \_SB.PCI0.LPC0.LNK3, 
                                0x00
                            }, 

                            Package (0x03)
                            {
                                0x0004FFFF, 
                                \_SB.PCI0.LPC0.LNK0, 
                                0x00
                            }, 

                            Package (0x03)
                            {
                                0x0004FFFF, 
                                \_SB.PCI0.LPC0.LNK1, 
                                0x00
                            }
                        })
                    }
                }

                Device (ELAN)
                {
                    Name (_ADR, 0x00030000)
                    Name (_PRW, Package (0x02)
                    {
                        0x05, 
                        0x04
                    })
                }

                Device (CB1)
                {
                    Name (_ADR, 0x00040000)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Method (_S1D, 0, NotSerialized)
                    {
                        Return (0x01)
                    }

                    Method (_S3D, 0, NotSerialized)
                    {
                        Return (0x03)
                    }

                    Method (_S4D, 0, NotSerialized)
                    {
                        Return (0x03)
                    }
                }
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00130000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130001)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (EHCI)
            {
                Name (_ADR, 0x00130002)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (AUDO)
            {
                Name (_ADR, 0x00140005)
            }

            Device (MODM)
            {
                Name (_ADR, 0x00140006)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
            }

            Device (IDE)
            {
                Name (_ADR, 0x00140001)
                Name (UDMT, Package (0x08)
                {
                    0x78, 
                    0x5A, 
                    0x3C, 
                    0x2D, 
                    0x1E, 
                    0x14, 
                    0x00, 
                    0x00
                })
                Name (PIOT, Package (0x06)
                {
                    0x0258, 
                    0x0186, 
                    0x010E, 
                    0xB4, 
                    0x78, 
                    0x00
                })
                Name (PITR, Package (0x06)
                {
                    0x99, 
                    0x47, 
                    0x34, 
                    0x22, 
                    0x20, 
                    0x99
                })
                Name (MDMT, Package (0x04)
                {
                    0x01E0, 
                    0x96, 
                    0x78, 
                    0x00
                })
                Name (MDTR, Package (0x04)
                {
                    0x77, 
                    0x21, 
                    0x20, 
                    0xFF
                })
                OperationRegion (IDE, PCI_Config, 0x40, 0x20)
                Field (IDE, WordAcc, NoLock, Preserve)
                {
                    PPIT,   16, 
                    SPIT,   16, 
                    PMDT,   16, 
                    SMDT,   16, 
                    PPIC,   8, 
                    SPIC,   8, 
                    PPIM,   8, 
                    SPIM,   8, 
                    Offset (0x14), 
                    PUDC,   2, 
                    SUDC,   2, 
                    Offset (0x16), 
                    PUDM,   8, 
                    SUDM,   8
                }

                Method (ATPI, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    And (Local0, 0xFF, Local0)
                    Or (Local0, 0x41544900, Local0)
                    Store (Local0, \_SB.PCI0.LPC0.INFO)
                    \_SB.PCI0.LPC0.PHSS (0x8A)
                }

                Method (GETT, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F), Local0)
                    Store (ShiftRight (Arg0, 0x04), Local1)
                    Return (Multiply (0x1E, Add (Add (Local0, 0x01), Add (Local1, 0x01))))
                }

                Method (GTM, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x00, PIT1)
                    CreateByteField (Arg0, 0x01, PIT0)
                    CreateByteField (Arg0, 0x02, MDT1)
                    CreateByteField (Arg0, 0x03, MDT0)
                    CreateByteField (Arg0, 0x04, PICX)
                    CreateByteField (Arg0, 0x05, UDCX)
                    CreateByteField (Arg0, 0x06, UDMX)
                    Name (BUF, Buffer (0x14)
                    {
                        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (BUF, 0x00, PIO0)
                    CreateDWordField (BUF, 0x04, DMA0)
                    CreateDWordField (BUF, 0x08, PIO1)
                    CreateDWordField (BUF, 0x0C, DMA1)
                    CreateDWordField (BUF, 0x10, FLAG)
                    If (And (PICX, 0x01))
                    {
                        Return (BUF)
                    }

                    Store (GETT (PIT0), PIO0)
                    Store (GETT (PIT1), PIO1)
                    If (And (UDCX, 0x01))
                    {
                        Or (FLAG, 0x01, FLAG)
                        Store (DerefOf (Index (^UDMT, And (UDMX, 0x0F))), DMA0)
                    }
                    Else
                    {
                        Store (GETT (MDT0), DMA0)
                    }

                    If (And (UDCX, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (DerefOf (Index (^UDMT, ShiftRight (UDMX, 0x04))), DMA1)
                    }
                    Else
                    {
                        Store (GETT (MDT1), DMA1)
                    }

                    Or (FLAG, 0x1A, FLAG)
                    Return (BUF)
                }

                Method (STM, 3, NotSerialized)
                {
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Name (BUF, Buffer (0x07)
                    {
                        0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                    })
                    CreateByteField (BUF, 0x00, PIT1)
                    CreateByteField (BUF, 0x01, PIT0)
                    CreateByteField (BUF, 0x02, MDT1)
                    CreateByteField (BUF, 0x03, MDT0)
                    CreateByteField (BUF, 0x04, PIMX)
                    CreateByteField (BUF, 0x05, UDCX)
                    CreateByteField (BUF, 0x06, UDMX)
                    Store (Match (^PIOT, MLE, PIO0, MTR, 0x00, 0x00), Local0)
                    Divide (Local0, 0x05, Local0)
                    Store (Match (^PIOT, MLE, PIO1, MTR, 0x00, 0x00), Local1)
                    Divide (Local1, 0x05, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), PIMX)
                    Store (DerefOf (Index (^PITR, Local0)), PIT0)
                    Store (DerefOf (Index (^PITR, Local1)), PIT1)
                    If (And (FLAG, 0x01))
                    {
                        Store (Match (^UDMT, MLE, DMA0, MTR, 0x00, 0x00), Local0)
                        Divide (Local0, 0x06, Local0)
                        Or (UDMX, Local0, UDMX)
                        Or (UDCX, 0x01, UDCX)
                    }
                    Else
                    {
                        If (LNot (LEqual (DMA0, 0xFFFFFFFF)))
                        {
                            Store (Match (^MDMT, MLE, DMA0, MTR, 0x00, 0x00), Local0)
                            Store (DerefOf (Index (^MDTR, Local0)), MDT0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (^UDMT, MLE, DMA1, MTR, 0x00, 0x00), Local0)
                        Divide (Local0, 0x06, Local0)
                        Or (UDMX, ShiftLeft (Local0, 0x04), UDMX)
                        Or (UDCX, 0x02, UDCX)
                    }
                    Else
                    {
                        If (LNot (LEqual (DMA1, 0xFFFFFFFF)))
                        {
                            Store (Match (^MDMT, MLE, DMA1, MTR, 0x00, 0x00), Local0)
                            Store (DerefOf (Index (^MDTR, Local0)), MDT1)
                        }
                    }

                    Return (BUF)
                }

                Method (GTF, 2, NotSerialized)
                {
                    CreateByteField (Arg1, 0x00, MDT1)
                    CreateByteField (Arg1, 0x01, MDT0)
                    CreateByteField (Arg1, 0x02, PIMX)
                    CreateByteField (Arg1, 0x03, UDCX)
                    CreateByteField (Arg1, 0x04, UDMX)
                    If (LEqual (Arg0, 0xA0))
                    {
                        Store (And (PIMX, 0x0F), Local0)
                        Store (MDT0, Local1)
                        And (UDCX, 0x01, Local2)
                        Store (And (UDMX, 0x0F), Local3)
                    }
                    Else
                    {
                        Store (ShiftRight (PIMX, 0x04), Local0)
                        Store (MDT1, Local1)
                        And (UDCX, 0x02, Local2)
                        Store (ShiftRight (UDMX, 0x04), Local3)
                    }

                    Name (BUF, Buffer (0x0E)
                    {
                        0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03, 
                        0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF
                    })
                    CreateByteField (BUF, 0x01, PMOD)
                    CreateByteField (BUF, 0x08, DMOD)
                    CreateByteField (BUF, 0x05, CMDA)
                    CreateByteField (BUF, 0x0C, CMDB)
                    Store (Arg0, CMDA)
                    Store (Arg0, CMDB)
                    Or (Local0, 0x08, PMOD)
                    If (Local2)
                    {
                        Or (Local3, 0x40, DMOD)
                    }
                    Else
                    {
                        Store (Match (^MDMT, MLE, GETT (Local1), MTR, 0x00, 0x00), Local4)
                        If (LLess (Local4, 0x03))
                        {
                            Or (0x20, Local4, DMOD)
                        }
                    }

                    Return (BUF)
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (^^PPIT, VPIT)
                        Store (^^PMDT, VMDT)
                        Store (^^PPIC, VPIC)
                        Store (^^PUDC, VUDC)
                        Store (^^PUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, ^^PPIT)
                        Store (VMDT, ^^PMDT)
                        Store (VPIM, ^^PPIM)
                        Store (VUDC, ^^PUDC)
                        Store (VUDM, ^^PUDM)
                        CreateDWordField (Arg0, 0x04, PDMA)
                        CreateDWordField (Arg0, 0x10, SDMA)
                        CreateWordField (Arg1, 0x00, AIDM)
                        CreateWordField (Arg2, 0x00, AIDS)
                        Store (Zero, Local0)
                        If (LEqual (And (AIDM, 0xC000), 0x8000))
                        {
                            If (LAnd (LNot (LEqual (PDMA, 0x00)), LNot (LEqual (PDMA, Ones))))
                            {
                                Or (Local0, 0x01, Local0)
                            }
                        }

                        If (LEqual (And (AIDS, 0xC000), 0x8000))
                        {
                            If (LAnd (LNot (LEqual (SDMA, 0x00)), LNot (LEqual (SDMA, Ones))))
                            {
                                Or (Local0, 0x02, Local0)
                            }
                        }

                        If (LNot (LLess (TPOS, 0x08)))
                        {
                            Store (\_SB.PCI0.SMB0.RVID, Local1)
                            If (LLess (Local1, 0x19))
                            {
                                ATPI (Local0)
                            }
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^PMDT, VMDT)
                            Store (^^^PPIM, VPIM)
                            Store (^^^PUDC, VUDC)
                            Store (^^^PUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^PMDT, VMDT)
                            Store (^^^PPIM, VPIM)
                            Store (^^^PUDC, VUDC)
                            Store (^^^PUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (^^SPIT, VPIT)
                        Store (^^SMDT, VMDT)
                        Store (^^SPIC, VPIC)
                        Store (^^SUDC, VUDC)
                        Store (^^SUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, ^^SPIT)
                        Store (VMDT, ^^SMDT)
                        Store (VPIM, ^^SPIM)
                        Store (VUDC, ^^SUDC)
                        Store (VUDM, ^^SUDM)
                        CreateDWordField (Arg0, 0x04, PDMA)
                        CreateDWordField (Arg0, 0x10, SDMA)
                        CreateWordField (Arg1, 0x00, AIDM)
                        CreateWordField (Arg2, 0x00, AIDS)
                        Store (0x10, Local0)
                        If (LEqual (And (AIDM, 0xC000), 0x8000))
                        {
                            If (LAnd (LNot (LEqual (PDMA, 0x00)), LNot (LEqual (PDMA, Ones))))
                            {
                                Or (Local0, 0x01, Local0)
                            }
                        }

                        If (LEqual (And (AIDS, 0xC000), 0x8000))
                        {
                            If (LAnd (LNot (LEqual (SDMA, 0x00)), LNot (LEqual (SDMA, Ones))))
                            {
                                Or (Local0, 0x02, Local0)
                            }
                        }

                        If (LNot (LLess (TPOS, 0x08)))
                        {
                            Store (\_SB.PCI0.SMB0.RVID, Local1)
                            If (LLess (Local1, 0x19))
                            {
                                ATPI (Local0)
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^SMDT, VMDT)
                            Store (^^^SPIM, VPIM)
                            Store (^^^SUDC, VUDC)
                            Store (^^^SUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^SMDT, VMDT)
                            Store (^^^SPIM, VPIM)
                            Store (^^^SUDC, VUDC)
                            Store (^^^SUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }
                }
            }

            Device (AGP)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNK0, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNK3, 
                                0x00
                            }
                        })
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00050000)
                    Name (SWIT, 0x01)
                    Name (CRTA, 0x01)
                    Name (LCDA, 0x01)
                    Name (TVAA, 0x01)
                    Name (VLDF, 0x01)
                    OperationRegion (VIDS, PCI_Config, 0x00, 0xC8)
                    Field (VIDS, DWordAcc, NoLock, Preserve)
                    {
                        VDID,   32
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS1, 0, NotSerialized)
                    {
                        Store (0x01, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (And (Arg0, 0x03), SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200
                        })
                    }

                    Device (CRT)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0100)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x02, Local0)
                            And (Local1, 0x02, Local1)
                            If (Local0)
                            {
                                Store (0x01, CRTA)
                            }
                            Else
                            {
                                Store (0x00, CRTA)
                            }

                            If (CRTA)
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0110)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x01, Local0)
                            And (Local1, 0x01, Local1)
                            If (Local0)
                            {
                                Store (0x01, LCDA)
                            }
                            Else
                            {
                                Store (0x00, LCDA)
                            }

                            If (LCDA)
                            {
                                If (LEqual (Local1, 0x01))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x01))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (LCDA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (TV)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0200)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x04, Local0)
                            And (Local1, 0x04, Local1)
                            If (Local0)
                            {
                                Store (0x01, TVAA)
                            }
                            Else
                            {
                                Store (0x00, TVAA)
                            }

                            If (TVAA)
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (TVAA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Method (DSSW, 0, NotSerialized)
                    {
                        If (LEqual (SWIT, 0x00))
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local1, 0x07, Local1)
                            Store (\_SB.PCI0.LPC0.INF, Local2)
                            If (LGreater (Local1, 0x01))
                            {
                                And (Local0, Local1, VLDF)
                                And (VLDF, 0xFE, VLDF)
                            }

                            If (VLDF)
                            {
                                If (LEqual (Local0, 0x03))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        STBL (0x02)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x01)
                                    }
                                }

                                If (LEqual (Local0, 0x05))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        STBL (0x04)
                                    }

                                    If (LEqual (Local1, 0x04))
                                    {
                                        If (LNot (LEqual (Local2, 0x00)))
                                        {
                                            STBL (0x01)
                                        }
                                        Else
                                        {
                                            STBL (0x05)
                                        }
                                    }

                                    If (LEqual (Local1, 0x05))
                                    {
                                        STBL (0x01)
                                    }
                                }

                                If (LEqual (Local0, 0x07))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        If (LNot (LEqual (Local2, 0x00)))
                                        {
                                            STBL (0x04)
                                        }
                                        Else
                                        {
                                            STBL (0x05)
                                        }
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x02)
                                    }

                                    If (LEqual (Local1, 0x04))
                                    {
                                        STBL (0x01)
                                    }

                                    If (LEqual (Local1, 0x05))
                                    {
                                        STBL (0x04)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, VLDF)
                                STBL (0x01)
                            }
                        }
                        Else
                        {
                            If (LEqual (SWIT, 0x01))
                            {
                                \_SB.PCI0.LPC0.PHSS (0x01)
                            }
                        }
                    }

                    Method (STBL, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Store (One, CRTA)
                            Store (Zero, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            Store (Zero, CRTA)
                            Store (Zero, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x06))
                        {
                            If (LEqual (VDID, 0x58351002))
                            {
                                Store (Zero, CRTA)
                                Store (One, LCDA)
                                Store (One, TVAA)
                            }
                            Else
                            {
                                Store (One, CRTA)
                                Store (Zero, LCDA)
                                Store (One, TVAA)
                            }
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x07))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        Notify (\_SB.PCI0.AGP.VGA, 0x80)
                    }

                    Method (TVSW, 0, NotSerialized)
                    {
                    }
                }
            }
        }
    }
}

