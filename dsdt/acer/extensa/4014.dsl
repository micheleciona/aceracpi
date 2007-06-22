/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of 4014, Fri Jun 22 22:55:41 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000700E (28686)
 *     Revision         0x01
 *     OEM ID           "ATI"
 *     OEM Table ID     "SB460"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x02000002 (33554434)
 */
DefinitionBlock ("4014.aml", "DSDT", 1, "ATI", "SB460", 0x06040000)
{
    External (Z00K)
    External (Z00E)
    External (\_PR_.CPU1._PPC, IntObj)
    External (\_PR_.CPU0._PPC, IntObj)

    Name (Z000, 0x01)
    Name (Z001, 0x02)
    Name (Z002, 0x04)
    Name (Z003, 0x08)
    Name (Z004, 0x00)
    Name (Z005, 0x0F)
    Name (Z006, 0x0D)
    Name (Z007, 0x0B)
    Name (Z008, 0x09)
    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00008010, 0x06) {}
        Processor (CPU1, 0x01, 0x00000000, 0x00) {}
    }

    Name (INSX, 0x00)
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

    OperationRegion (\PMIO, SystemIO, 0x0CD6, 0x02)
    Field (\PMIO, ByteAcc, NoLock, Preserve)
    {
        PIDX,   8, 
        PDAT,   8
    }

    OperationRegion (\P01, SystemIO, 0x8001, 0x01)
    Field (\P01, ByteAcc, NoLock, Preserve)
    {
        PST1,   8
    }

    OperationRegion (PLPT, SystemIO, 0x0378, 0x01)
    Field (PLPT, DWordAcc, Lock, Preserve)
    {
        P378,   8
    }

    Name (HTTX, 0x00)
    Method (_PTS, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x05))
        {
            Store (One, \_SB.PCI0.SMB.SLPS)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (Zero, \_SB.PCI0.SMB.RSTU)
            Store (One, \_SB.PCI0.SMB.SLPS)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Zero, \_SB.PCI0.SMB.RS3U)
            Store (One, \_SB.PCI0.SMB.SLPS)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, INS4)
        }

        If (\_SB.ECOK)
        {
            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
            If (LEqual (Arg0, 0x04))
            {
                Store (0x01, \_SB.PCI0.LPC0.EC0.FLS4)
            }

            Release (\_SB.PCI0.LPC0.EC0.MUT1)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (0x01, INSX)
        Store (0x81, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        Store (0x30, DBGP)
        If (LEqual (Arg0, 0x03))
        {
            Store (0x61, PIDX)
            Store (PDAT, Local0)
            And (Local0, 0x80, Local0)
            If (LEqual (Local0, 0x00))
            {
                Notify (\_SB.PWRB, 0x02)
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            Notify (\_SB.PWRB, 0x02)
        }

        If (LEqual (Arg0, 0x01))
        {
            And (PST1, 0x04, Local0)
            If (LEqual (Local0, 0x00))
            {
                Notify (\_SB.PWRB, 0x02)
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x00, INS4)
        }

        If (LEqual (Arg0, 0x04))
        {
            \_SB.PCI0.LPC0.PHSR (0x0C, 0x00)
        }
    }

    Scope (\_SI)
    {
        Method (_SST, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x01))
            {
                Store ("===== SST Working =====", Debug)
            }

            If (LEqual (Arg0, 0x02))
            {
                Store ("===== SST Waking =====", Debug)
            }

            If (LEqual (Arg0, 0x03))
            {
                Store ("===== SST Sleeping =====", Debug)
            }

            If (LEqual (Arg0, 0x04))
            {
                Store ("===== SST Sleeping S4 =====", Debug)
            }
        }
    }

    Scope (\_SB)
    {
        Name (LINX, 0x00)
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x1BE9CDE4, 0x00000001)
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
                    Store (0x00, ^OSTB)
                    Store (0x00, ^TPOS)
                    If (\_OSI ("Windows 2001"))
                    {
                        Store (0x08, ^OSTB)
                        Store (0x08, ^TPOS)
                    }

                    If (\_OSI ("Windows 2001.1"))
                    {
                        Store (0x20, ^OSTB)
                        Store (0x20, ^TPOS)
                    }

                    If (\_OSI ("Windows 2001 SP1"))
                    {
                        Store (0x10, ^OSTB)
                        Store (0x10, ^TPOS)
                    }

                    If (\_OSI ("Windows 2001 SP2"))
                    {
                        Store (0x11, ^OSTB)
                        Store (0x11, ^TPOS)
                    }

                    If (\_OSI ("Windows 2001 SP3"))
                    {
                        Store (0x12, ^OSTB)
                        Store (0x12, ^TPOS)
                    }

                    If (\_OSI ("Windows 2006"))
                    {
                        Store (0x40, ^OSTB)
                        Store (0x40, ^TPOS)
                    }

                    If (\_OSI ("Linux"))
                    {
                        Store (0x01, LINX)
                        Store (0x80, ^OSTB)
                        Store (0x80, ^TPOS)
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

        Method (OSHT, 0, NotSerialized)
        {
            \_SB.OSTP ()
            Store (0x48, \_SB.PCI0.LPC0.BCMD)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
        }

        Method (SEQL, 2, Serialized)
        {
            Store (SizeOf (Arg0), Local0)
            Store (SizeOf (Arg1), Local1)
            If (LNotEqual (Local0, Local1))
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
                If (LNotEqual (Local3, Local4))
                {
                    Return (Zero)
                }

                Increment (Local2)
            }

            Return (One)
        }
    }

    Method (VTOB, 1, NotSerialized)
    {
        Store (0x01, Local0)
        ShiftLeft (Local0, Arg0, Local0)
        Return (Local0)
    }

    Method (BTOV, 1, NotSerialized)
    {
        ShiftRight (Arg0, 0x01, Local0)
        Store (0x00, Local1)
        While (Local0)
        {
            Increment (Local1)
            ShiftRight (Local0, 0x01, Local0)
        }

        Return (Local1)
    }

    Method (MKWD, 2, NotSerialized)
    {
        If (And (Arg1, 0x80))
        {
            Store (0xFFFF0000, Local0)
        }
        Else
        {
            Store (Zero, Local0)
        }

        Or (Local0, Arg0, Local0)
        Or (Local0, ShiftLeft (Arg1, 0x08), Local0)
        Return (Local0)
    }

    Method (POSW, 1, NotSerialized)
    {
        If (And (Arg0, 0x8000))
        {
            If (LEqual (Arg0, 0xFFFF))
            {
                Return (0xFFFFFFFF)
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

    Method (GBFE, 3, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TIDX)
        Store (TIDX, Arg2)
    }

    Method (PBFE, 3, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TIDX)
        Store (Arg2, TIDX)
    }

    Method (ITOS, 1, NotSerialized)
    {
        Store (Buffer (0x09)
            {
                /* 0000 */    0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00
            }, Local0)
        Store (Buffer (0x11)
            {
                "0123456789ABCDEF"
            }, Local7)
        Store (0x08, Local1)
        Store (0x00, Local2)
        Store (0x00, Local3)
        While (Local1)
        {
            Decrement (Local1)
            And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
            If (Local4)
            {
                Store (Ones, Local3)
            }

            If (Local3)
            {
                GBFE (Local7, Local4, RefOf (Local5))
                PBFE (Local0, Local2, Local5)
                Increment (Local2)
            }
        }

        Return (Local0)
    }

    OperationRegion (NV1, SystemIO, 0x72, 0x02)
    Field (NV1, ByteAcc, NoLock, Preserve)
    {
        INDX,   8, 
        DATA,   8
    }

    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
    {
                Offset (0xEE), 
        INS4,   1, 
                Offset (0xF0), 
        DLST,   8
    }

    Name (\GPIC, 0x00)
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
        Name (ECOK, 0x00)
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_UID, 0x01)
            Name (_BBN, 0x00)
            Method (_INI, 0, NotSerialized)
            {
                \_SB.OSTP ()
            }

            OperationRegion (NBRV, PCI_Config, 0x08, 0x01)
            Field (NBRV, ByteAcc, NoLock, Preserve)
            {
                PREV,   8
            }

            Method (NBR2, 0, NotSerialized)
            {
                If (And (PREV, 0xF0))
                {
                    Return (Ones)
                }
                Else
                {
                    Return (Zero)
                }
            }

            OperationRegion (NBMS, PCI_Config, 0x60, 0x08)
            Field (NBMS, DWordAcc, NoLock, Preserve)
            {
                MIDX,   32, 
                MIDR,   32
            }

            Mutex (NBMM, 0x00)
            Method (NBMR, 1, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Store (Local0, MIDX)
                Store (MIDR, Local0)
                Store (0x7F, MIDX)
                Release (NBMM)
                Return (Local0)
            }

            Method (NBMW, 2, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Or (Local0, 0x80, Local0)
                Store (Local0, MIDX)
                Store (Arg1, MIDR)
                Store (0x7F, MIDX)
                Release (NBMM)
            }

            OperationRegion (NBXP, PCI_Config, 0xE0, 0x08)
            Field (NBXP, DWordAcc, NoLock, Preserve)
            {
                NBXI,   32, 
                NBXD,   32
            }

            Mutex (NBXM, 0x00)
            Method (NBXR, 1, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI)
                Store (NBXD, Local0)
                Store (0x00, NBXI)
                Release (NBXM)
                Return (Local0)
            }

            Method (NBXW, 2, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI)
                Store (Arg1, NBXD)
                Store (0x00, NBXI)
                Release (NBXM)
            }

            Method (GFXM, 0, NotSerialized)
            {
                Store (NBMR (0x08), Local0)
                And (Local0, 0x0F, Local0)
                Return (Local0)
            }

            Method (GPPM, 0, NotSerialized)
            {
                Store (NBMR (0x31), Local0)
                And (Local0, 0x0F, Local0)
                Return (Local0)
            }

            Method (XPTR, 2, NotSerialized)
            {
                If (LAnd (LLess (Arg0, 0x02), LGreater (Arg0, 0x07)))
                {
                    Return (0x00)
                }
                Else
                {
                    Store (0x01, Local0)
                    If (LLess (Arg0, 0x04))
                    {
                        Add (Arg0, 0x02, Local1)
                    }
                    Else
                    {
                        Add (Arg0, 0x11, Local1)
                    }

                    ShiftLeft (Local0, Local1, Local0)
                    Store (NBMR (0x08), Local2)
                    If (Arg1)
                    {
                        And (Local2, Not (Local0), Local2)
                    }
                    Else
                    {
                        Or (Local2, Local0, Local2)
                    }

                    NBMW (0x08, Local2)
                    Return (Ones)
                }
            }

            OperationRegion (K8ST, SystemMemory, 0x1BE9CF74, 0x00000048)
            Field (K8ST, AnyAcc, NoLock, Preserve)
            {
                C0_0,   16, 
                C2_0,   16, 
                C4_0,   16, 
                C6_0,   16, 
                C8_0,   16, 
                CA_0,   16, 
                CC_0,   16, 
                CE_0,   16, 
                D0_0,   16, 
                D2_0,   16, 
                D4_0,   16, 
                D6_0,   16, 
                D8_0,   16, 
                DA_0,   16, 
                DC_0,   16, 
                DE_0,   16, 
                E0_0,   16, 
                E2_0,   16, 
                E4_0,   16, 
                E6_0,   16, 
                E8_0,   16, 
                EA_0,   16, 
                EC_0,   16, 
                EE_0,   16, 
                F0_0,   16, 
                F2_0,   16, 
                F4_0,   16, 
                F6_0,   16, 
                F8_0,   16, 
                FA_0,   16, 
                FC_0,   16, 
                FE_0,   16, 
                TOML,   32, 
                TOMH,   32
            }

            Name (RSRC, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C2000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C6000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000C9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CA000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CE000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D2000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D6000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000D9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DA000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DE000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y10, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E2000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y11, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y12, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E6000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y13, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000E9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y14, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EA000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y15, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y16, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EE000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y17, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y18, AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    0x00,, , TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                CreateBitField (RSRC, \_SB.PCI0._Y00._RW, C0RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y00._LEN, C0LN)
                Store (One, C0RW)
                Store (0x2000, C0LN)
                If (And (C0_0, 0x1818))
                {
                    Store (0x00, C0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y01._RW, C2RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y01._LEN, C2LN)
                Store (One, C2RW)
                Store (0x2000, C2LN)
                If (And (C2_0, 0x1818))
                {
                    Store (0x00, C2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y02._RW, C4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y02._LEN, C4LN)
                Store (One, C4RW)
                Store (0x2000, C4LN)
                If (And (C4_0, 0x1818))
                {
                    Store (0x00, C4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y03._RW, C6RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y03._LEN, C6LN)
                Store (One, C6RW)
                Store (0x2000, C6LN)
                If (And (C6_0, 0x1818))
                {
                    Store (0x00, C6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y04._RW, C8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y04._LEN, C8LN)
                Store (One, C8RW)
                Store (0x2000, C8LN)
                If (And (C8_0, 0x1818))
                {
                    Store (0x00, C8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y05._RW, CARW)
                CreateDWordField (RSRC, \_SB.PCI0._Y05._LEN, CALN)
                Store (One, CARW)
                Store (0x2000, CALN)
                If (And (CA_0, 0x1818))
                {
                    Store (0x00, CALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y06._RW, CCRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y06._LEN, CCLN)
                Store (One, CCRW)
                Store (0x2000, CCLN)
                If (And (CC_0, 0x1818))
                {
                    Store (0x00, CCLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y07._RW, CERW)
                CreateDWordField (RSRC, \_SB.PCI0._Y07._LEN, CELN)
                Store (One, CERW)
                Store (0x2000, CELN)
                If (And (CE_0, 0x1818))
                {
                    Store (0x00, CELN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y08._RW, D0RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y08._LEN, D0LN)
                Store (One, D0RW)
                Store (0x2000, D0LN)
                If (And (D0_0, 0x1818))
                {
                    Store (0x00, D0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y09._RW, D2RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y09._LEN, D2LN)
                Store (One, D2RW)
                Store (0x2000, D2LN)
                If (And (D2_0, 0x1818))
                {
                    Store (0x00, D2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0A._RW, D4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0A._LEN, D4LN)
                Store (One, D4RW)
                Store (0x2000, D4LN)
                If (And (D4_0, 0x1818))
                {
                    Store (0x00, D4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0B._RW, D6RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0B._LEN, D6LN)
                Store (One, D6RW)
                Store (0x2000, D6LN)
                If (And (D6_0, 0x1818))
                {
                    Store (0x00, D6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0C._RW, D8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0C._LEN, D8LN)
                Store (One, D8RW)
                Store (0x2000, D8LN)
                If (And (D8_0, 0x1818))
                {
                    Store (0x00, D8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0D._RW, DARW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0D._LEN, DALN)
                Store (One, DARW)
                Store (0x2000, DALN)
                If (And (DA_0, 0x1818))
                {
                    Store (0x00, DALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0E._RW, DCRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0E._LEN, DCLN)
                Store (One, DCRW)
                Store (0x2000, DCLN)
                If (And (DC_0, 0x1818))
                {
                    Store (0x00, DCLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0F._RW, DERW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0F._LEN, DELN)
                Store (One, DERW)
                Store (0x2000, DELN)
                If (And (DE_0, 0x1818))
                {
                    Store (0x00, DELN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y10._RW, E0RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y10._LEN, E0LN)
                Store (One, E0RW)
                Store (0x2000, E0LN)
                If (And (E0_0, 0x1818))
                {
                    Store (0x00, E0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y11._RW, E2RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y11._LEN, E2LN)
                Store (One, E2RW)
                Store (0x2000, E2LN)
                If (And (E2_0, 0x1818))
                {
                    Store (0x00, E2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y12._RW, E4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y12._LEN, E4LN)
                Store (One, E4RW)
                Store (0x2000, E4LN)
                If (And (E4_0, 0x1818))
                {
                    Store (0x00, E4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y13._RW, E6RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y13._LEN, E6LN)
                Store (One, E6RW)
                Store (0x2000, E6LN)
                If (And (E6_0, 0x1818))
                {
                    Store (0x00, E6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y14._RW, E8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y14._LEN, E8LN)
                Store (One, E8RW)
                Store (0x2000, E8LN)
                If (And (E8_0, 0x1818))
                {
                    Store (0x00, E8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y15._RW, EARW)
                CreateDWordField (RSRC, \_SB.PCI0._Y15._LEN, EALN)
                Store (One, EARW)
                Store (0x2000, EALN)
                If (And (EA_0, 0x1818))
                {
                    Store (0x00, EALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y16._RW, ECRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y16._LEN, ECLN)
                Store (One, ECRW)
                Store (0x2000, ECLN)
                If (And (EC_0, 0x1818))
                {
                    Store (0x00, ECLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y17._RW, EERW)
                CreateDWordField (RSRC, \_SB.PCI0._Y17._LEN, EELN)
                Store (One, EERW)
                Store (0x2000, EELN)
                If (And (EE_0, 0x1818))
                {
                    Store (0x00, EELN)
                }

                CreateDWordField (RSRC, \_SB.PCI0._Y18._MIN, BTMN)
                CreateDWordField (RSRC, \_SB.PCI0._Y18._LEN, BTLN)
                Store (TOML, BTMN)
                Add (Not (BTMN), 0x01, BTLN)
                Return (RSRC)
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (MEM1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y19)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y1A)
                })
                Method (_CRS, 0, NotSerialized)
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y19._BAS, MB01)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y19._LEN, ML01)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._BAS, MB02)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._LEN, ML02)
                    If (GPIC)
                    {
                        Store (0xFEC00000, MB01)
                        Store (0xFEE00000, MB02)
                        Store (0x1000, ML01)
                        Store (0x1000, ML02)
                    }

                    Return (MEM1)
                }
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x07)
                    {
                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x00, 
                            0x00, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            0x00, 
                            0x16
                        }, 

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
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }
                    })
                }
                Else
                {
                    Return (Package (0x07)
                    {
                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKH, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            \_SB.PCI0.LPC0.LNKD, 
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

            Device (PB2)
            {
                Name (_ADR, 0x00020000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (PB3)
            {
                Name (_ADR, 0x00030000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (PB4)
            {
                Name (_ADR, 0x00040000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
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
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (PB5)
            {
                Name (_ADR, 0x00050000)
                Name (_PRW, Package (0x02)
                {
                    0x18, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
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
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (PB6)
            {
                Name (_ADR, 0x00060000)
                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                            Offset (0x1A), 
                    SLST,   16
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (XPEX, SystemMemory, 0xE0030100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x40), 
                    ECPH,   32, 
                            Offset (0x58), 
                    VC02,   32, 
                    VC0S,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (\_SB.PCI0.NBR2 ())
                    {
                        If (And (VC02, 0x00020000))
                        {
                            Store (Ones, Local0)
                        }
                    }
                    Else
                    {
                        If (And (VC0S, 0x02))
                        {
                            Store (Ones, Local0)
                        }
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (0x00, XPIR)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (0x00, XPIR)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, Not (0x07), Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Store (0x1010, Local1)
                    Store (\_SB.PCI0.NBXR (0x00010065), Local2)
                    If (Arg0)
                    {
                        And (Local2, Not (Local1), Local2)
                    }
                    Else
                    {
                        Or (Local2, Local1, Local2)
                    }

                    \_SB.PCI0.NBXW (0x00010065, Local2)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, Not (0x20), Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (0x01, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (0x01)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                        }
                    }

                    And (Local0, Not (0x20), Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Device (NCRD)
                {
                    Name (_ADR, 0x00)
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.SMB.GM4C)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (PB7)
            {
                Name (_ADR, 0x00070000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }
                        })
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

            Device (SATA)
            {
                Name (_ADR, 0x00120000)
                Name (B5EN, 0x00)
                Name (BA_5, 0x00)
                OperationRegion (SATX, PCI_Config, 0x00, 0x28)
                Field (SATX, AnyAcc, NoLock, Preserve)
                {
                    VIDI,   32, 
                            Offset (0x24), 
                    BA05,   32
                }

                Method (GBAA, 0, NotSerialized)
                {
                    Store (BA_5, B5EN)
                    If (LEqual (BA_5, 0xFFFFFFFF))
                    {
                        Store (0x00, B5EN)
                        Return (0xFFF80000)
                    }
                    Else
                    {
                        Store (0x01, B5EN)
                        Return (BA_5)
                    }
                }

                OperationRegion (SAP1, PCI_Config, 0x00, 0x44)
                Field (SAP1, WordAcc, NoLock, Preserve)
                {
                            Offset (0x08), 
                    CLCD,   32, 
                            Offset (0x10), 
                    P1F0,   16, 
                            Offset (0x14), 
                    P3F4,   16, 
                            Offset (0x18), 
                    P170,   16, 
                            Offset (0x1C), 
                    P1F4,   16, 
                            Offset (0x40), 
                    CNFG,   8
                }

                OperationRegion (BAR5, SystemMemory, GBAA, 0x0200)
                Field (BAR5, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x104), 
                    CSTX,   1, 
                    CST0,   1, 
                            Offset (0x10A), 
                    STA0,   1, 
                            Offset (0x184), 
                    CSTY,   1, 
                    CST1,   1, 
                            Offset (0x18A), 
                    STA1,   1
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (BA05, BA_5)
                    GBAA ()
                    If (B5EN)
                    {
                        If (\_SB.PCI0.SATA.STA0)
                        {
                            Store (\_SB.PCI0.SATA.STA0, \_SB.PCI0.SATA.STA0)
                        }

                        If (\_SB.PCI0.SATA.STA1)
                        {
                            Store (\_SB.PCI0.SATA.STA1, \_SB.PCI0.SATA.STA1)
                        }
                    }
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0010 */    0x13, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SPTM)
                    }

                    Name (S12P, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        If (LEqual (TPOS, 0x40))
                        {
                            Store (0x28, Local0)
                            OperationRegion (SAI1, SystemIO, P3F4, 0x04)
                            Field (SAI1, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY0,   1
                            }

                            While (LAnd (LEqual (BSY0, 0x01), Local0))
                            {
                                Store (Local0, DBGP)
                                Sleep (0xFA)
                                Decrement (Local0)
                            }
                        }

                        Store (0x00, S12P)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, S12P)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        Return (S12P)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (BA05, BA_5)
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (\_SB.PCI0.SATA.CST0)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0010 */    0x13, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SPTM)
                    }

                    Name (S12S, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        If (LEqual (TPOS, 0x40))
                        {
                            Store (0x28, Local2)
                            OperationRegion (SAI2, SystemIO, P1F4, 0x04)
                            Field (SAI2, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY1,   1
                            }

                            While (LAnd (LEqual (BSY1, 0x01), Local2))
                            {
                                Sleep (0xFA)
                                Store (Local2, DBGP)
                                Decrement (Local2)
                            }
                        }

                        Store (0x00, S12S)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, S12S)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        Return (S12S)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (BA05, BA_5)
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (\_SB.PCI0.SATA.CST1)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }
            }

            Device (SAT2)
            {
                Name (_ADR, 0x00110000)
                Name (B5EN, 0x00)
                Name (BA_5, 0x00)
                OperationRegion (SATX, PCI_Config, 0x00, 0x28)
                Field (SATX, AnyAcc, NoLock, Preserve)
                {
                    VIDI,   32, 
                            Offset (0x24), 
                    BA05,   32
                }

                Method (GBAA, 0, NotSerialized)
                {
                    Store (BA_5, B5EN)
                    If (LEqual (BA_5, 0xFFFFFFFF))
                    {
                        Store (0x00, B5EN)
                        Return (0xFFF80000)
                    }
                    Else
                    {
                        Store (0x01, B5EN)
                        Return (BA_5)
                    }
                }

                OperationRegion (SAP1, PCI_Config, 0x00, 0x44)
                Field (SAP1, WordAcc, NoLock, Preserve)
                {
                            Offset (0x08), 
                    CLCD,   32, 
                            Offset (0x10), 
                    P1F0,   16, 
                            Offset (0x14), 
                    P3F4,   16, 
                            Offset (0x18), 
                    P170,   16, 
                            Offset (0x1C), 
                    P1F4,   16, 
                            Offset (0x40), 
                    CNFG,   8
                }

                OperationRegion (BAR5, SystemMemory, GBAA, 0x0200)
                Field (BAR5, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x104), 
                    CSTX,   1, 
                    CST0,   1, 
                            Offset (0x10A), 
                    STA0,   1, 
                            Offset (0x184), 
                    CSTY,   1, 
                    CST1,   1, 
                            Offset (0x18A), 
                    STA1,   1
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (BA05, BA_5)
                    GBAA ()
                    If (B5EN)
                    {
                        If (\_SB.PCI0.SAT2.STA0)
                        {
                            Store (\_SB.PCI0.SAT2.STA0, \_SB.PCI0.SAT2.STA0)
                        }

                        If (\_SB.PCI0.SAT2.STA1)
                        {
                            Store (\_SB.PCI0.SAT2.STA1, \_SB.PCI0.SAT2.STA1)
                        }
                    }
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0010 */    0x13, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SPTM)
                    }

                    Name (S12P, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        If (LEqual (TPOS, 0x40))
                        {
                            Store (0x28, Local0)
                            OperationRegion (SAI1, SystemIO, P3F4, 0x04)
                            Field (SAI1, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY0,   1
                            }

                            While (LAnd (LEqual (BSY0, 0x01), Local0))
                            {
                                Store (Local0, DBGP)
                                Sleep (0xFA)
                                Decrement (Local0)
                            }
                        }

                        Store (0x00, S12P)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, S12P)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        Return (S12P)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (BA05, BA_5)
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (\_SB.PCI0.SAT2.CST0)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0010 */    0x13, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SPTM)
                    }

                    Name (S12S, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        If (LEqual (TPOS, 0x40))
                        {
                            Store (0x28, Local2)
                            OperationRegion (SAI2, SystemIO, P1F4, 0x04)
                            Field (SAI2, ByteAcc, NoLock, Preserve)
                            {
                                        Offset (0x01), 
                                    ,   7, 
                                BSY1,   1
                            }

                            While (LAnd (LEqual (BSY1, 0x01), Local2))
                            {
                                Sleep (0xFA)
                                Store (Local2, DBGP)
                                Decrement (Local2)
                            }
                        }

                        Store (0x00, S12S)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, S12S)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        Return (S12S)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (BA05, BA_5)
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (\_SB.PCI0.SAT2.CST1)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }
            }

            Scope (\_GPE)
            {
                Method (_L1F, 0, NotSerialized)
                {
                    Sleep (0x07D0)
                    Store (\_SB.PCI0.SATA.BA05, \_SB.PCI0.SATA.BA_5)
                    \_SB.PCI0.SATA.GBAA ()
                    If (\_SB.PCI0.SATA.B5EN)
                    {
                        If (\_SB.PCI0.SATA.STA0)
                        {
                            Notify (\_SB.PCI0.SATA.PRID.P_D0, 0x00)
                            Sleep (0x07D0)
                            Notify (\_SB.PCI0.SATA.PRID, 0x01)
                            Sleep (0x07D0)
                            Store (\_SB.PCI0.SATA.STA0, \_SB.PCI0.SATA.STA0)
                        }

                        If (\_SB.PCI0.SATA.STA1)
                        {
                            Notify (\_SB.PCI0.SATA.SECD.S_D0, 0x00)
                            Sleep (0x07D0)
                            Notify (\_SB.PCI0.SATA.SECD, 0x01)
                            Sleep (0x07D0)
                            Store (\_SB.PCI0.SATA.STA1, \_SB.PCI0.SATA.STA1)
                        }
                    }

                    Store (\_SB.PCI0.SAT2.BA05, \_SB.PCI0.SAT2.BA_5)
                    \_SB.PCI0.SAT2.GBAA ()
                    If (\_SB.PCI0.SAT2.B5EN)
                    {
                        If (\_SB.PCI0.SAT2.STA0)
                        {
                            Notify (\_SB.PCI0.SAT2.PRID.P_D0, 0x00)
                            Sleep (0x07D0)
                            Notify (\_SB.PCI0.SAT2.PRID, 0x01)
                            Sleep (0x07D0)
                            Store (\_SB.PCI0.SAT2.STA0, \_SB.PCI0.SAT2.STA0)
                        }

                        If (\_SB.PCI0.SAT2.STA1)
                        {
                            Notify (\_SB.PCI0.SAT2.SECD.S_D0, 0x00)
                            Sleep (0x07D0)
                            Notify (\_SB.PCI0.SAT2.SECD, 0x01)
                            Sleep (0x07D0)
                            Store (\_SB.PCI0.SAT2.STA1, \_SB.PCI0.SAT2.STA1)
                        }
                    }
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x00140000)
                OperationRegion (Z00A, PCI_Config, 0x08, 0x01)
                Field (Z00A, ByteAcc, NoLock, Preserve)
                {
                    RVID,   8
                }

                OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    INPM,   8, 
                    DAPM,   8
                }

                IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
                {
                        ,   1, 
                    TM1E,   1, 
                    TM2E,   1, 
                            Offset (0x01), 
                        ,   1, 
                    TM1S,   1, 
                    TM2S,   1, 
                            Offset (0x04), 
                        ,   7, 
                    SLPS,   1, 
                            Offset (0x1C), 
                        ,   3, 
                    MKME,   1, 
                    PI3E,   1, 
                    PI2E,   1, 
                    PI1E,   1, 
                    PI0E,   1, 
                        ,   3, 
                    MKMS,   1, 
                    PI3S,   1, 
                    PI2S,   1, 
                    PI1S,   1, 
                    PI0S,   1, 
                            Offset (0x36), 
                        ,   6, 
                    GE6C,   1, 
                    GE7C,   1, 
                        ,   4, 
                    GM1C,   1, 
                    GM2C,   1, 
                    GM3C,   1, 
                            Offset (0x38), 
                        ,   1, 
                    GM4C,   1, 
                    GM5C,   1, 
                        ,   1, 
                    GM6C,   1, 
                            Offset (0x3A), 
                        ,   4, 
                    GM1S,   1, 
                    GM2S,   1, 
                    GM3S,   1, 
                            Offset (0x3B), 
                        ,   1, 
                    GM4S,   1, 
                    GM5S,   1, 
                        ,   1, 
                    GM6S,   1, 
                            Offset (0x50), 
                    C4C3,   1, 
                            Offset (0x55), 
                    SPRE,   1, 
                            Offset (0x65), 
                        ,   4, 
                    RS3U,   1, 
                    RSTU,   1, 
                            Offset (0x68), 
                        ,   3, 
                    TPDE,   1, 
                        ,   1, 
                            Offset (0x92), 
                        ,   6, 
                    GE6S,   1, 
                    GE7S,   1
                }

                OperationRegion (GPIO, PCI_Config, 0x00, 0x0100)
                Field (GPIO, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x50), 
                    G49O,   1, 
                    G50O,   1, 
                    G51O,   1, 
                    G52O,   1, 
                    G49E,   1, 
                    G50E,   1, 
                    G51E,   1, 
                    G52E,   1, 
                            Offset (0x56), 
                        ,   3, 
                    G64O,   1, 
                        ,   3, 
                    G64E,   1, 
                            Offset (0x7E), 
                        ,   1, 
                    G66O,   1, 
                        ,   3, 
                    G66E,   1, 
                            Offset (0x7F), 
                        ,   1, 
                    G66S,   1, 
                            Offset (0x80), 
                        ,   3, 
                    G03O,   1, 
                        ,   3, 
                    BAYO,   1, 
                        ,   3, 
                    G03S,   1, 
                            Offset (0x82), 
                    G13O,   1, 
                        ,   3, 
                    G13E,   1, 
                            Offset (0xA6), 
                        ,   3, 
                    G48O,   1, 
                        ,   3, 
                    G48E,   1, 
                            Offset (0xA8), 
                        ,   1, 
                    G05O,   1, 
                        ,   1, 
                    BAYR,   1, 
                    G08O,   1, 
                    G09O,   1, 
                            Offset (0xA9), 
                        ,   1, 
                    G05E,   1, 
                        ,   1, 
                    G07E,   1, 
                    G08E,   1, 
                    G09E,   1, 
                            Offset (0xAA), 
                    Z00B,   2, 
                        ,   1, 
                    G07S,   1
                }

                Method (TRMD, 0, NotSerialized)
                {
                    Store (Zero, SPRE)
                    Store (Zero, TPDE)
                }

                Method (HTCD, 0, NotSerialized)
                {
                    Store (Zero, PI2E)
                    Store (Zero, TM2E)
                    Store (PI2S, PI2S)
                    Store (TM2S, TM2S)
                }
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
                    0x0F, 
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
                }

                Method (GETT, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F), Local0)
                    Store (ShiftRight (Arg0, 0x04), Local1)
                    Return (Multiply (0x1E, Add (Add (Local0, 0x01), Add (Local1, 
                        0x01))))
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
                        /* 0000 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0008 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0010 */    0x00, 0x00, 0x00, 0x00
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
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, Local0, UDMX)
                        Or (UDCX, 0x01, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (Match (^MDMT, MLE, DMA0, MTR, 0x00, 0x00), Local0)
                            Store (DerefOf (Index (^MDTR, Local0)), MDT0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (^UDMT, MLE, DMA1, MTR, 0x00, 0x00), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, ShiftLeft (Local0, 0x04), UDMX)
                        Or (UDCX, 0x02, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, 0xFFFFFFFF))
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
                        /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03, 
                        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF
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
                        Return (Buffer (0x14)
                        {
                            /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x1F, 0x00, 0x00, 0x00
                        })
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

                    Name (FWSO, "FWSO")
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)
                Mutex (PSMX, 0x00)
                OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
                Field (PIRQ, ByteAcc, NoLock, Preserve)
                {
                    PIID,   8, 
                    PIDA,   8
                }

                IndexField (PIID, PIDA, ByteAcc, NoLock, Preserve)
                {
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    PIRS,   8, 
                            Offset (0x06), 
                    PIRU,   8, 
                            Offset (0x09), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                Name (IPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,11}
                })
                Name (UPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Exclusive, )
                        {3,4,5,7}
                })
                Method (DSPI, 0, NotSerialized)
                {
                    Store (0x00, PIRA)
                    Store (0x00, PIRB)
                    Store (0x00, PIRC)
                    Store (0x00, PIRD)
                    Store (0x00, PIRU)
                    Store (0x00, PIRE)
                    Store (0x00, PIRF)
                    Store (0x00, PIRG)
                    Store (0x00, PIRH)
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRA)
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
                        Store (0x00, PIRA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRA, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRA)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRB)
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
                        Store (0x00, PIRB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRB, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRB)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRC)
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
                        Store (0x00, PIRC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRC, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRC)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRD)
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
                        Store (0x00, PIRD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRD, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRD)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRE)
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
                        Store (0x00, PIRE)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRE, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRE)
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRF)
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
                        Store (0x00, PIRF)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRF, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRF)
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRG)
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
                        Store (0x00, PIRG)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRG, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRG)
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRH)
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
                        Store (0x00, PIRH)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRH, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRH)
                    }
                }

                Device (LNKU)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRU)
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
                        Return (UPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (UPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRU, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRU)
                        Store (0x89, \_SB.PCI0.LPC0.BCMD)
                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                    }
                }

                OperationRegion (LCLM, SystemIO, 0x0C50, 0x03)
                Field (LCLM, ByteAcc, NoLock, Preserve)
                {
                    CLMI,   8, 
                    CLMD,   8, 
                    CLGP,   8
                }

                IndexField (CLMI, CLMD, ByteAcc, NoLock, Preserve)
                {
                    IDRG,   8, 
                            Offset (0x02), 
                    TSTS,   8, 
                    TINT,   8, 
                            Offset (0x12), 
                    I2CC,   8, 
                    GPIO,   8
                }

                Method (RGPM, 0, NotSerialized)
                {
                    Store (\_SB.PCI0.LPC0.GPIO, Local0)
                    And (Local0, Not (0xC0), Local0)
                    Store (Local0, \_SB.PCI0.LPC0.GPIO)
                    Store (\_SB.PCI0.LPC0.CLGP, Local1)
                    Return (Local1)
                }

                OperationRegion (LPCR, PCI_Config, 0x44, 0x02)
                Field (LPCR, ByteAcc, NoLock, Preserve)
                {
                    CMA0,   1, 
                    CMA1,   1, 
                    CMA2,   1, 
                    CMA3,   1, 
                    CMA4,   1, 
                    CMA5,   1, 
                    CMA6,   1, 
                    CMA7,   1, 
                    CMB0,   1, 
                    CMB1,   1, 
                    CMB2,   1, 
                    CMB3,   1, 
                    CMB4,   1, 
                    CMB5,   1, 
                    CMB6,   1, 
                    CMB7,   1
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
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
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
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
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
                    Name (_HID, EisaId ("SYN1003"))
                    Name (_CID, Package (0x03)
                    {
                        0x00102E4F, 
                        0x02002E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_CRS, ResourceTemplate ()
                    {
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
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x006F,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x1080,             // Range Minimum
                            0x1080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0220,             // Range Minimum
                            0x0220,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x040B,             // Range Minimum
                            0x040B,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0530,             // Range Minimum
                            0x0530,             // Range Maximum
                            0x08,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD4,             // Range Minimum
                            0x0CD4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD6,             // Range Minimum
                            0x0CD6,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD8,             // Range Minimum
                            0x0CD8,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x8000,             // Range Minimum
                            0x8000,             // Range Maximum
                            0x01,               // Alignment
                            0x60,               // Length
                            )
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8100,             // Range Minimum
                            0x81FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic)
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8200,             // Range Minimum
                            0x82FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic)
                        IO (Decode16,
                            0x0F40,             // Range Minimum
                            0x0F40,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x087F,             // Range Minimum
                            0x087F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFFF00000,         // Address Base
                            0x00100000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y1B)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (TPOS, 0x04))
                        {
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1B._BAS, BARX)
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1B._LEN, GALN)
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

                OperationRegion (SMI1, SystemMemory, 0x1BE9CDE5, 0x00000120)
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

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x50), 
                    BLK0,   64, 
                    BLK1,   64, 
                    BLK2,   64, 
                    BLK3,   64, 
                    BLK4,   64, 
                            Offset (0x110), 
                    BTEN,   1, 
                    WLAN,   1, 
                    DOCK,   1, 
                    IDEC,   1, 
                    TPMS,   1, 
                    G3LN,   1, 
                            Offset (0x111), 
                    PNUM,   8
                }

                Method (PHSR, 2, NotSerialized)
                {
                    Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                    Store (0x90, BCMD)
                    Store (Arg0, DID)
                    Store (Arg1, INF)
                    Store (Zero, SMIC)
                    Store (INF, Local0)
                    Release (\_SB.PCI0.LPC0.PSMX)
                    Return (Local0)
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
                    Name (_GPE, 0x14)
                    Name (SEL0, 0xF0)
                    Name (BFLG, 0x00)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Local0)
                            If (Local0)
                            {
                                Store (0x01, ECOK)
                            }
                            Else
                            {
                                Store (0x00, ECOK)
                            }
                        }

                        If (\_SB.ECOK)
                        {
                            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                            Store (0x03, \_SB.PCI0.LPC0.EC0.RG59)
                            Store (\_SB.PCI0.LPC0.BTEN, \_SB.PCI0.LPC0.EC0.BLTH)
                            Store (\_SB.PCI0.LPC0.WLAN, \_SB.PCI0.LPC0.EC0.WLAN)
                            Store (\_SB.PCI0.LPC0.G3LN, \_SB.PCI0.LPC0.EC0.G3LN)
                            Store (0x01, \_SB.PCI0.LPC0.EC0.CPLE)
                            Store (\_SB.PCI0.LPC0.PHSR (0x05, 0x00), DOFF)
                            Release (\_SB.PCI0.LPC0.EC0.MUT1)
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
                        FLS4,   1, 
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
                        BAYE,   1, 
                        PRDE,   1, 
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
                        BAYI,   1, 
                        PRCT,   1, 
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
                                Offset (0x53), 
                        DOFF,   8, 
                                Offset (0x57), 
                        RG57,   8, 
                        CTMP,   8, 
                        RG59,   8, 
                        RG5A,   8, 
                        RG5B,   8, 
                        FSPD,   16, 
                                Offset (0x5F), 
                        WLAN,   1, 
                        BLTH,   1, 
                        CPLE,   1, 
                        G3LN,   1, 
                                Offset (0x61), 
                        BRLV,   8, 
                                Offset (0x63), 
                            ,   7, 
                        VGAF,   1, 
                                Offset (0x71), 
                        MBTS,   1, 
                        MBTF,   1, 
                                Offset (0x72), 
                        MBTC,   1, 
                            ,   2, 
                        LION,   1, 
                                Offset (0x77), 
                        BA1C,   8, 
                                Offset (0x7A), 
                        MCYC,   16, 
                        MTMP,   16, 
                        MDAT,   16, 
                                Offset (0x81), 
                        ABTS,   1, 
                        ABFC,   1, 
                            ,   3, 
                        ABBL,   1, 
                        Z00C,   1, 
                        ABCT,   1, 
                        ABCG,   1, 
                            ,   2, 
                        ABTP,   1, 
                                Offset (0x87), 
                        BA2C,   8, 
                                Offset (0x8A), 
                        ACYC,   16, 
                        ATMP,   16, 
                        ADAT,   16, 
                                Offset (0xC1), 
                        MCUR,   16, 
                        MBRM,   16, 
                        MBVG,   16, 
                        BTST,   8, 
                        ABCR,   16, 
                        ABRM,   16, 
                        ABVG,   16, 
                                Offset (0xD0), 
                        EBPL,   1, 
                                Offset (0xD1), 
                        PWRE,   1, 
                                Offset (0xD2), 
                            ,   6, 
                        VAUX,   1, 
                                Offset (0xD6), 
                        DBPL,   8, 
                                Offset (0xD8), 
                        LFCC,   16, 
                        BTSN,   16, 
                        BTDC,   16, 
                        BTDV,   16, 
                        BTMN,   8, 
                        BTMD,   8, 
                        AFCC,   16, 
                        ABSN,   16, 
                        ABDC,   16, 
                        ABDV,   16, 
                        ABMN,   8, 
                        ABMD,   8, 
                        TRDV,   3
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

                    Mutex (MUT1, 0x00)
                    Mutex (MUT0, 0x00)
                    Method (SMRD, 4, NotSerialized)
                    {
                        If (LEqual (\_SB.ECOK, 0x00))
                        {
                            Return (0xFF)
                        }

                        If (LNotEqual (Arg0, 0x07))
                        {
                            If (LNotEqual (Arg0, 0x09))
                            {
                                If (LNotEqual (Arg0, 0x0B))
                                {
                                    Return (0x19)
                                }
                            }
                        }

                        Acquire (MUT0, 0xFFFF)
                        Store (0x04, Local0)
                        While (LGreater (Local0, 0x01))
                        {
                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            Store (0x00, Local3)
                            While (LNot (And (SMST, 0xBF, Local1)))
                            {
                                Sleep (0x02)
                                Increment (Local3)
                                If (LEqual (Local3, 0x32))
                                {
                                    And (SMST, 0x40, SMST)
                                    Store (Arg2, SMCM)
                                    Store (Arg1, SMAD)
                                    Store (Arg0, SMPR)
                                    Store (0x00, Local3)
                                }
                            }

                            If (LEqual (Local1, 0x80))
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Decrement (Local0)
                            }
                        }

                        If (Local0)
                        {
                            Store (And (Local1, 0x1F), Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x07))
                            {
                                Store (SMB0, Arg3)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (SMW0, Arg3)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (BCNT, Local3)
                                ShiftRight (0x0100, 0x03, Local2)
                                If (LGreater (Local3, Local2))
                                {
                                    Store (Local2, Local3)
                                }

                                If (LLess (Local3, 0x09))
                                {
                                    Store (FLD0, Local2)
                                }
                                Else
                                {
                                    If (LLess (Local3, 0x11))
                                    {
                                        Store (FLD1, Local2)
                                    }
                                    Else
                                    {
                                        If (LLess (Local3, 0x19))
                                        {
                                            Store (FLD2, Local2)
                                        }
                                        Else
                                        {
                                            Store (FLD3, Local2)
                                        }
                                    }
                                }

                                Increment (Local3)
                                Store (Buffer (Local3) {}, Local4)
                                Decrement (Local3)
                                Store (Zero, Local5)
                                While (LGreater (Local3, Local5))
                                {
                                    GBFE (Local2, Local5, RefOf (Local6))
                                    PBFE (Local4, Local5, Local6)
                                    Increment (Local5)
                                }

                                PBFE (Local4, Local5, 0x00)
                                Store (Local4, Arg3)
                            }
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (SMWR, 4, NotSerialized)
                    {
                        If (LEqual (\_SB.ECOK, 0x00))
                        {
                            Return (0xFF)
                        }

                        If (LNotEqual (Arg0, 0x06))
                        {
                            If (LNotEqual (Arg0, 0x08))
                            {
                                If (LNotEqual (Arg0, 0x0A))
                                {
                                    Return (0x19)
                                }
                            }
                        }

                        Acquire (MUT0, 0xFFFF)
                        Store (0x04, Local0)
                        While (LGreater (Local0, 0x01))
                        {
                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg3, SMB0)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg3, SMW0)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (Arg3, SMD0)
                            }

                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            Store (0x00, Local3)
                            While (LNot (And (SMST, 0xBF, Local1)))
                            {
                                Sleep (0x02)
                                Increment (Local3)
                                If (LEqual (Local3, 0x32))
                                {
                                    And (SMST, 0x40, SMST)
                                    Store (Arg2, SMCM)
                                    Store (Arg1, SMAD)
                                    Store (Arg0, SMPR)
                                    Store (0x00, Local3)
                                }
                            }

                            If (LEqual (Local1, 0x80))
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Decrement (Local0)
                            }
                        }

                        If (Local0)
                        {
                            Store (And (Local1, 0x1F), Local0)
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (APOL, 1, NotSerialized)
                    {
                        Store (Arg0, DBPL)
                        Store (0x01, EBPL)
                    }

                    Name (PSTA, 0x00)
                    Method (CPOL, 1, NotSerialized)
                    {
                        If (LEqual (PSTA, 0x00))
                        {
                            If (LNotEqual (\_SB.ECOK, 0x00))
                            {
                                APOL (Arg0)
                                Store (0x01, PSTA)
                            }
                        }
                    }

                    Method (_Q20, 0, NotSerialized)
                    {
                        If (\_SB.ECOK)
                        {
                            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                            If (And (SMST, 0x40))
                            {
                                Store (SMAA, Local0)
                                If (LEqual (Local0, 0x14))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (PWRE, Local1)
                                    If (Local1)
                                    {
                                        Store (0x00, PWRE)
                                        Store (0x12, BFLG)
                                        CPOL (0x01)
                                    }
                                }

                                If (LEqual (Local0, 0x16))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (0x04, \_SB.BAT1.BCRI)
                                    Notify (\_SB.BAT1, 0x80)
                                }
                                Else
                                {
                                    Store (0x00, \_SB.BAT1.BCRI)
                                }
                            }

                            Release (\_SB.PCI0.LPC0.EC0.MUT1)
                        }
                    }

                    Method (_Q09, 0, NotSerialized)
                    {
                        If (\_SB.ECOK)
                        {
                            Store (0x00, \_SB.PCI0.LPC0.EC0.PSTA)
                            \_SB.BAT1.Z00D ()
                            Notify (\_SB.ACAD, 0x80)
                            Sleep (0x01F4)
                            Notify (\_SB.BAT1, 0x80)
                            If (\_SB.BAT1.BTCH)
                            {
                                \_SB.BAT1.UBIF ()
                                Notify (\_SB.BAT1, 0x81)
                                Store (0x00, \_SB.BAT1.BTCH)
                            }
                        }
                    }

                    Method (_Q8A, 0, NotSerialized)
                    {
                        Notify (\_SB.LID, 0x80)
                    }

                    Name (CPUT, 0x00)
                    Method (_Q9C, 0, NotSerialized)
                    {
                        If (LEqual (CPUT, 0x00))
                        {
                            Store (0x01, CPUT)
                            Store (PNUM, Local1)
                            If (LLess (\_PR.CPU0._PPC, Local1))
                            {
                                Store (Local1, \_PR.CPU0._PPC)
                                Notify (\_PR.CPU0, 0x80)
                                Sleep (0x01F4)
                                Store (Local1, \_PR.CPU1._PPC)
                                Notify (\_PR.CPU1, 0x80)
                                Sleep (0x01F4)
                            }
                        }
                    }

                    Method (_Q9D, 0, NotSerialized)
                    {
                        If (LNotEqual (CPUT, 0x00))
                        {
                            Store (0x00, CPUT)
                            If (LNotEqual (\_PR.CPU0._PPC, 0x00))
                            {
                                Store (0x00, \_PR.CPU0._PPC)
                                Notify (\_PR.CPU0, 0x80)
                                Sleep (0x01F4)
                                Store (0x00, \_PR.CPU1._PPC)
                                Notify (\_PR.CPU1, 0x80)
                                Sleep (0x01F4)
                            }
                        }
                    }

                    Method (_Q9E, 0, NotSerialized)
                    {
                        \_SB.PCI0.LPC0.EC0._Q9C ()
                    }

                    Method (_Q9F, 0, NotSerialized)
                    {
                        \_SB.PCI0.LPC0.EC0._Q9D ()
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q90, 0, NotSerialized)
                    {
                        Store (0x01, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x80)
                    }

                    Method (_Q91, 0, NotSerialized)
                    {
                        Store (0x02, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x80)
                    }

                    Method (_Q92, 0, NotSerialized)
                    {
                        Store (0x03, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x80)
                    }

                    Method (_Q93, 0, NotSerialized)
                    {
                        Store (0x04, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x80)
                    }

                    Method (_Q8F, 0, NotSerialized)
                    {
                        Store (0x05, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x80)
                    }

                    Method (_Q8E, 0, NotSerialized)
                    {
                        Store (0x06, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x81)
                    }

                    Method (_Q8D, 0, NotSerialized)
                    {
                        Store (0x07, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x81)
                    }

                    Method (_Q8B, 0, NotSerialized)
                    {
                        Store (0x0A, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x81)
                    }

                    Method (_Q94, 0, NotSerialized)
                    {
                        Store (0x09, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x82)
                    }

                    Method (_Q95, 0, NotSerialized)
                    {
                        Store (0x08, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x82)
                    }
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)
                Device (LANC)
                {
                    Name (_ADR, 0x00020000)
                    Name (_PRW, Package (0x02)
                    {
                        0x04, 
                        0x05
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x00, 
                                0x00, 
                                0x17
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x01, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                0x00, 
                                0x14
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKG, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (AZLA)
            {
                Name (_ADR, 0x00140002)
                Name (_PRW, Package (0x02)
                {
                    0x1B, 
                    0x04
                })
            }

            Device (AGP)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }
                        })
                    }
                }
            }
        }

        Device (ACAD)
        {
            Method (_HID, 0, NotSerialized)
            {
                If (INSX)
                {
                    Store (0x00, INSX)
                    If (LNotEqual (\_PR.CPU0._PPC, 0x00))
                    {
                        Store (\_PR.CPU0._PPC, Local1)
                        Store (0x00, \_PR.CPU0._PPC)
                        Notify (\_PR.CPU0, 0x80)
                        Sleep (0x01F4)
                        Store (Local1, \_PR.CPU0._PPC)
                        Notify (\_PR.CPU0, 0x80)
                        Sleep (0x01F4)
                        Store (\_PR.CPU1._PPC, Local1)
                        Store (0x00, \_PR.CPU1._PPC)
                        Notify (\_PR.CPU1, 0x80)
                        Sleep (0x01F4)
                        Store (Local1, \_PR.CPU1._PPC)
                        Notify (\_PR.CPU1, 0x80)
                        Sleep (0x01F4)
                    }
                }

                Return ("ACPI0003")
            }

            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Name (ACST, 0x00)
            Method (_PSR, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPC0.EC0.ACDF, ACST)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                }
                Else
                {
                    Store (0x01, ACST)
                }

                If (ACST)
                {
                    Store (0x01, Local0)
                    Store (0x00, \_SB.BAT1.BCRI)
                }
                Else
                {
                    Store (0x00, Local0)
                }

                Return (Local0)
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, 0x01)
            Name (CBTI, 0x00)
            Name (PBTI, 0x00)
            Name (BTIN, 0x00)
            Name (BTCH, 0x00)
            Name (BIFI, 0x00)
            Name (SEL0, 0x00)
            Name (BCRI, 0x00)
            Name (PBIF, Package (0x0D)
            {
                0x01, 
                0x1130, 
                0x1130, 
                0x01, 
                0x2B5C, 
                0x012C, 
                0x84, 
                0x20, 
                0x20, 
                "BAT1      ", 
                "11        ", 
                "11        ", 
                "11        "
            })
            Name (PBST, Package (0x04)
            {
                0x00, 
                Z00E, 
                Z00E, 
                0x2710
            })
            Name (ERRC, 0x00)
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                If (BTIN)
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)
            {
                If (LEqual (BIFI, 0x00))
                {
                    \_SB.BAT1.UBIF ()
                    Store (0x01, BIFI)
                }

                Return (PBIF)
            }

            Name (LFCC, 0x1130)
            Method (UBIF, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPC0.EC0.BTDC, Local0)
                    Store (\_SB.PCI0.LPC0.EC0.LFCC, Local1)
                    Store (\_SB.PCI0.LPC0.EC0.BTDV, Local2)
                    Store (\_SB.PCI0.LPC0.EC0.BTMD, Local3)
                    Store (\_SB.PCI0.LPC0.EC0.BTMN, Local4)
                    Store (\_SB.PCI0.LPC0.EC0.BTSN, Local5)
                    Store (\_SB.PCI0.LPC0.EC0.LION, Local6)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    Store (Local0, Index (PBIF, 0x01))
                    Store (Local1, Index (PBIF, 0x02))
                    Store (Local2, Index (PBIF, 0x04))
                    Store (Local1, LFCC)
                    Multiply (Local1, 0x04, Local7)
                    Divide (Local7, 0x64, , Local7)
                    Store (Local7, Index (PBIF, 0x06))
                    If (Local6)
                    {
                        Store ("NiMH", Index (PBIF, 0x0B))
                    }
                    Else
                    {
                        Store ("LION", Index (PBIF, 0x0B))
                    }

                    And (Local3, 0x0F, Local3)
                    Store ("ZR3", Index (PBIF, 0x09))
                    If (LEqual (Local4, 0x08))
                    {
                        Store ("MOTOROLA", Index (PBIF, 0x0C))
                    }
                    Else
                    {
                        If (LEqual (Local4, 0x07))
                        {
                            Store ("SIMPLO", Index (PBIF, 0x0C))
                        }
                        Else
                        {
                            If (LEqual (Local4, 0x03))
                            {
                                Store ("SANYO", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local4, 0x04))
                                {
                                    Store ("SONY", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local4, 0x05))
                                    {
                                        Store ("PANASONIC", Index (PBIF, 0x0C))
                                    }
                                }
                            }
                        }
                    }

                    Store (ITOS (ToBCD (Local5)), Index (PBIF, 0x0A))
                }
            }

            Name (RCAP, 0x00)
            Method (_BST, 0, NotSerialized)
            {
                If (LEqual (BTIN, 0x00))
                {
                    Store (0x00, Index (PBST, 0x00))
                    Store (0xFFFFFFFF, Index (PBST, 0x01))
                    Store (0xFFFFFFFF, Index (PBST, 0x02))
                    Store (0xFFFFFFFF, Index (PBST, 0x03))
                    Return (PBST)
                }

                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPC0.EC0.MBTC, Local0)
                    Store (\_SB.PCI0.LPC0.EC0.MBRM, Local1)
                    Store (\_SB.PCI0.LPC0.EC0.MBVG, Local2)
                    Store (\_SB.PCI0.LPC0.EC0.MCUR, Local3)
                    Store (\_SB.PCI0.LPC0.EC0.BTST, Local4)
                    Store (\_SB.PCI0.LPC0.EC0.MBTF, Local5)
                    Store (\_SB.PCI0.LPC0.EC0.ACDF, Local6)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    If (Local6)
                    {
                        If (LEqual (Local5, 0x01))
                        {
                            Store (0x00, Local7)
                            Store (LFCC, Local1)
                        }
                        Else
                        {
                            Store (0x02, Local7)
                        }
                    }
                    Else
                    {
                        If (LAnd (Local4, 0x01))
                        {
                            Store (0x01, Local7)
                        }
                        Else
                        {
                            Store (0x00, Local7)
                        }
                    }

                    And (Local4, 0x04, Local4)
                    If (LEqual (Local4, 0x04))
                    {
                        Or (Local7, Local4, Local7)
                    }

                    Store (Local7, Index (PBST, 0x00))
                    If (LNot (And (Local1, 0x8000)))
                    {
                        Store (Local1, Index (PBST, 0x02))
                    }

                    If (LNot (And (Local2, 0x8000)))
                    {
                        Store (Local2, Index (PBST, 0x03))
                    }

                    If (LAnd (Local3, 0x8000))
                    {
                        If (LNotEqual (Local3, 0xFFFF))
                        {
                            Not (Local3, Local3)
                            Increment (Local3)
                            And (Local3, 0xFFFF, Local3)
                        }
                    }

                    Store (Local3, Index (PBST, 0x01))
                }

                Return (PBST)
            }

            Method (Z00D, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPC0.EC0.MBTS, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    If (LEqual (Local0, 0x01))
                    {
                        If (LEqual (\_SB.BAT1.BTIN, 0x00))
                        {
                            Store (0x01, \_SB.BAT1.BTCH)
                            Store (0x00, \_SB.BAT1.BIFI)
                        }

                        Store (0x01, \_SB.BAT1.BTIN)
                    }
                    Else
                    {
                        If (LEqual (\_SB.BAT1.BTIN, 0x01))
                        {
                            Store (0x01, \_SB.BAT1.BTCH)
                            Store (0x00, \_SB.BAT1.BIFI)
                        }

                        Store (0x00, \_SB.BAT1.BTIN)
                    }
                }
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPC0.EC0.LIDS, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    If (Local0)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x01)
                    }
                }
                Else
                {
                    Return (0x01)
                }
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Scope (\_TZ)
        {
            ThermalZone (THRM)
            {
                Method (_TMP, 0, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.CTMP, Local0)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                        Return (Add (Multiply (Local0, 0x0A), 0x0AAC))
                    }
                    Else
                    {
                        Return (0x0C3C)
                    }
                }

                Method (_PSV, 0, NotSerialized)
                {
                    Return (Add (Multiply (0x69, 0x0A), 0x0AAC))
                }

                Name (_PSL, Package (0x01)
                {
                    \_PR.CPU0
                })
                Name (_TSP, 0x28)
                Name (_TC1, 0x02)
                Name (_TC2, 0x03)
                Method (_CRT, 0, NotSerialized)
                {
                    Return (Add (Multiply (0x64, 0x0A), 0x0AAC))
                }
            }
        }

        Scope (\_SB)
        {
            Device (WMID)
            {
                Name (_HID, "PNP0C14")
                Name (_UID, 0x00)
                Name (WMIQ, 0x00)
                Name (ERRD, 0x00010000)
                Name (BUFF, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BUFF, 0x00, BF00)
                CreateByteField (BUFF, 0x01, BF01)
                CreateByteField (BUFF, 0x02, BF02)
                CreateByteField (BUFF, 0x03, BF03)
                Name (AADS, Buffer (0x04)
                {
                    0x00
                })
                CreateField (AADS, 0x00, 0x04, AS00)
                CreateField (AADS, 0x04, 0x01, AS01)
                CreateField (AADS, 0x05, 0x01, AS02)
                CreateField (AADS, 0x10, 0x10, AS03)
                CreateField (AADS, 0x00, 0x10, AS04)
                Name (BAEF, 0x00)
                Name (BADF, 0x00)
                Name (BADG, Package (0x03)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (BADS, Package (0x04)
                {
                    0x01, 
                    0x01, 
                    0x01, 
                    0x01
                })
                Name (WLDS, 0x00)
                Name (WLED, 0x00)
                Name (BTDS, 0x00)
                Name (BTED, 0x00)
                Name (BLDS, 0x00)
                Name (BLED, 0x00)
                Name (NTDC, 0x00)
                Name (WLSD, 0x0100)
                Name (WLSE, 0x0101)
                Name (BLTD, 0x0200)
                Name (BLTE, 0x0201)
                Name (LBL0, 0x0300)
                Name (LBL1, 0x0301)
                Name (LBL2, 0x0302)
                Name (LBL3, 0x0303)
                Name (LBL4, 0x0304)
                Name (LBL5, 0x0305)
                Name (LBL6, 0x0306)
                Name (LBL7, 0x0307)
                Name (LBL8, 0x0308)
                Name (LBL9, 0x0309)
                Name (LBLA, 0x030A)
                Name (LBLB, 0x030B)
                Name (LBLC, 0x030C)
                Name (LBLD, 0x030D)
                Name (LBLE, 0x030E)
                Name (LBLF, 0x030F)
                Name (VAPO, 0x0600)
                Name (VAPI, 0x0601)
                Name (CADI, 0x0401)
                Name (CADO, 0x0400)
                Name (GSEE, 0x0501)
                Name (GSED, 0x0502)
                Name (BBSB, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (BBSB, 0x00, 0x10, BBD0)
                CreateField (BBSB, 0x10, 0x10, BBD1)
                Name (TLS0, 0x00)
                Name (TLS1, 0x01)
                Name (TLS2, 0x02)
                Name (TLS3, 0x03)
                Name (TLS4, 0x04)
                Name (TLS5, 0x05)
                Name (TLS6, 0x06)
                Name (TLS7, 0x07)
                Name (BBPD, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BBPD, 0x00, BBP0)
                CreateByteField (BBPD, 0x04, BBP1)
                CreateByteField (BBPD, 0x08, BBP2)
                CreateByteField (BBPD, 0x0C, BBP3)
                CreateByteField (BBPD, 0x10, BBP4)
                Name (BBAR, Buffer (0x08)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BBAR, 0x00, BBA0)
                CreateByteField (BBAR, 0x04, BBA1)
                Name (BCDS, Package (0x0D)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (BDDS, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (BDDS, 0x00, 0x10, BDD0)
                CreateField (BDDS, 0x10, 0x10, BDD1)
                Name (DSY0, Buffer (0x28)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY1, Buffer (0x18)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY2, Buffer (0x10)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY3, Buffer (0x18)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY4, Buffer (0x10)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY5, Buffer (0x28)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateField (DSY0, 0x00, 0x40, DY00)
                CreateField (DSY0, 0x40, 0x40, DY01)
                CreateField (DSY0, 0x80, 0x40, DY02)
                CreateField (DSY0, 0xC0, 0x40, DY03)
                CreateField (DSY0, 0x0100, 0x40, DY04)
                CreateField (DSY1, 0x00, 0x40, DY10)
                CreateField (DSY1, 0x40, 0x40, DY11)
                CreateField (DSY1, 0x80, 0x40, DY12)
                CreateField (DSY2, 0x00, 0x40, DY20)
                CreateField (DSY2, 0x40, 0x10, DY21)
                CreateField (DSY2, 0x50, 0x10, DY22)
                CreateField (DSY0, 0x00, 0xC0, DSX4)
                Name (BEDS, Package (0x10)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (WIT0, 0x00)
                Name (DSY6, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateField (DSY6, 0x00, 0x20, DY60)
                CreateField (DSY6, 0x20, 0x20, DY61)
                CreateField (DSY6, 0x40, 0x20, DY62)
                CreateField (DSY6, 0x60, 0x20, DY63)
                CreateField (DSY6, 0x80, 0x20, DY64)
                Name (WPRW, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateField (WPRW, 0x00, 0x08, WWD0)
                CreateField (WPRW, 0x08, 0x08, WWD1)
                CreateField (WPRW, 0x10, 0x08, WWD2)
                CreateField (WPRW, 0x18, 0x08, WWD3)
                CreateField (WPRW, 0x20, 0x08, WWD4)
                CreateField (WPRW, 0x28, 0x20, WWD5)
                Name (WPCI, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (WPCI, 0x00, 0x08, WPIR)
                CreateField (WPCI, 0x08, 0x03, WPIF)
                CreateField (WPCI, 0x0B, 0x05, WPID)
                CreateField (WPCI, 0x10, 0x08, WPIB)
                Name (BFDS, Package (0x04)
                {
                    0x02, 
                    0x02, 
                    0x02, 
                    0x02
                })
                Name (GSTS, 0x00)
                Name (BFEF, 0x00)
                Name (BGEF, 0x00)
                Name (BGDS, Package (0x01)
                {
                    0x01
                })
                Method (PHSR, 2, NotSerialized)
                {
                    Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                    Store (0x91, \_SB.PCI0.LPC0.BCMD)
                    Store (Arg0, \_SB.PCI0.LPC0.DID)
                    Store (Arg1, \_SB.PCI0.LPC0.INF)
                    Store (Zero, \_SB.PCI0.LPC0.SMIC)
                    Store (\_SB.PCI0.LPC0.DID, Local0)
                    Release (\_SB.PCI0.LPC0.PSMX)
                    Return (Local0)
                }

                Name (TTRL, 0x00)
                Method (AAF1, 0, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x00, 0x00), AS04)
                    Store (0x00, AS03)
                }

                Method (Z00F, 1, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (\_SB.WMID.PHSR (0x01, 0x00), BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (\_SB.WMID.PHSR (0x01, 0x01), BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Store (\_SB.WMID.PHSR (0x01, 0x02), BUFF)
                                }
                                Else
                                {
                                    Store (0x01, BUFF)
                                }
                            }
                        }

                        Break
                    }
                }

                Method (Z00G, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    If (LEqual (BF00, 0x00))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        Store (0x01, Local0)
                    }

                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x04))
                        {
                            Or (Local0, 0x10, Local0)
                            Store (\_SB.WMID.PHSR (0x02, Local0), BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x05))
                            {
                                Or (Local0, 0x20, Local0)
                                Store (\_SB.WMID.PHSR (0x02, Local0), BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x06))
                                {
                                    Or (BF00, 0x40, Local0)
                                    Store (\_SB.WMID.PHSR (0x02, Local0), BUFF)
                                }
                                Else
                                {
                                    Store (0x01, BUFF)
                                }
                            }
                        }

                        Break
                    }
                }

                Method (Z00H, 0, NotSerialized)
                {
                    Store (\_SB.WMID.WMIQ, Local0)
                    Store (0x00, \_SB.WMID.WMIQ)
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Local0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Return (WLSE)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Return (WLSD)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Return (BLTE)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x04))
                                    {
                                        Return (BLTD)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x05))
                                        {
                                            Store (\_SB.WMID.PHSR (0x01, 0x02), Local1)
                                            And (Local1, 0x0F, Local1)
                                            And (LBL0, 0x0F00, LBL0)
                                            Or (Local1, LBL0, LBL0)
                                            Return (LBL0)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x06))
                                            {
                                                Store (0x0501, BUFF)
                                                Return (BUFF)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x07))
                                                {
                                                    Store (0x0502, BUFF)
                                                    Return (BUFF)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x08))
                                                    {
                                                        Return (VAPO)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x09))
                                                        {
                                                            Return (VAPI)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x0A))
                                                            {
                                                                Store (0x0501, BUFF)
                                                                Return (BUFF)
                                                            }
                                                            Else
                                                            {
                                                                Return (0xFFFF)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Break
                    }
                }

                Method (Z00I, 2, NotSerialized)
                {
                    Store (0x00, BUFF)
                    If (LEqual (Arg0, 0x01))
                    {
                        Store (TTRL, BF00)
                        Store (BUFF, BBSB)
                        Return (BBSB)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, BUFF)
                        Store (BF00, TTRL)
                        Store (0x00, BBSB)
                        Return (BBSB)
                    }
                }

                Method (Z00J, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (Z00K, Arg0), BUFF)
                    Store (BF00, BBP0)
                    Store (BF01, BBP1)
                    Store (BF02, BBP2)
                    Store (And (BF03, 0x0F), BBP3)
                    Store (ShiftRight (And (BF03, 0xF0), 0x04), BBP4)
                }

                Method (Z00L, 2, NotSerialized)
                {
                }

                Method (Z00M, 1, NotSerialized)
                {
                    \_SB.WMID.PHSR (0x04, Arg0)
                    Store (\_SB.PCI0.LPC0.BLK0, DY00)
                    Store (\_SB.PCI0.LPC0.BLK1, DY01)
                    Store (\_SB.PCI0.LPC0.BLK2, DY02)
                    Store (\_SB.PCI0.LPC0.BLK3, DY03)
                    Store (0x00, DY04)
                }

                Method (Z00N, 1, NotSerialized)
                {
                    Store (DY10, \_SB.PCI0.LPC0.BLK0)
                    If (LEqual (Arg0, 0x03))
                    {
                        Store (DY11, \_SB.PCI0.LPC0.BLK1)
                        Store (DY12, \_SB.PCI0.LPC0.BLK2)
                    }

                    Store (\_SB.WMID.PHSR (0x05, Arg0), Local0)
                    Store (\_SB.PCI0.LPC0.BLK0, DY10)
                    Store (\_SB.PCI0.LPC0.BLK1, DY11)
                    If (Local0)
                    {
                        Store (0x01, DY12)
                    }
                    Else
                    {
                        Store (0x00, DY12)
                    }
                }

                Method (Z00O, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    If (LEqual (Arg0, 0x05))
                    {
                        Store (0x00, BUFF)
                        Store (\_SB.PCI0.SMB.C4C3, BF00)
                        Return (BUFF)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (BF00, \_SB.PCI0.SMB.C4C3)
                        Store (0x00, BUFF)
                        Return (BUFF)
                    }
                }

                Method (Z00P, 0, NotSerialized)
                {
                }

                Method (Z00Q, 2, NotSerialized)
                {
                    Store (DSY4, DSY2)
                    Store (0x01, DY22)
                    If (LEqual (Arg0, 0x08)) {}
                    Else
                    {
                    }
                }

                Method (Z00R, 0, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x07, 0x00), BUFF)
                }

                Method (Z00S, 1, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (\_SB.BAT1._STA (), Local0)
                            If (And (Local0, 0x10))
                            {
                                Store (0x00, BUFF)
                            }
                            Else
                            {
                                Store (0x00020000, BUFF)
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (0x00010000, BUFF)
                            }
                            Else
                            {
                                Store (0x00010000, BUFF)
                            }
                        }

                        Break
                    }
                }

                Method (Z00T, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MTMP, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ATMP, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x1388, Local0)
                        Store (0x1388, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00V, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MCUR, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABCR, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00W, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MBVG, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABVG, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00X, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MBRM, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABRM, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00Y, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.LFCC, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.AFCC, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00Z, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MCYC, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ACYC, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z010, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.BTDC, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABDC, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z011, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.BTDV, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABDV, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z012, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MDAT, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ADAT, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z013, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.BTSN, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABSN, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00U, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (\_SB.BAT1._STA (), Local2)
                            If (And (Local2, 0x10))
                            {
                                Store (Arg1, Local3)
                            }
                            Else
                            {
                                Store (0xFFFF, Local3)
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (\_SB.BAT1._STA (), Local2)
                                If (And (Local2, 0x10))
                                {
                                    Store (Arg2, Local3)
                                }
                                Else
                                {
                                    Store (0xFFFF, Local3)
                                }
                            }
                            Else
                            {
                                Store (Arg1, Local3)
                            }
                        }

                        Break
                    }

                    If (LEqual (Local3, 0xFFFF))
                    {
                        Store (0x00020000, BUFF)
                    }
                    Else
                    {
                        Store (Local3, Index (BEDS, 0x01))
                        Store (DerefOf (Index (BEDS, 0x01)), BUFF)
                    }
                }

                Method (Z014, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x01), Local0)
                    If (LLessEqual (Local0, 0x01))
                    {
                        Store (\_SB.WMID.PHSR (0x08, Arg0), BUFF)
                    }
                    Else
                    {
                        Store (0x02, BUFF)
                    }
                }

                Method (Z015, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x09, Arg0), BUFF)
                }

                Method (Z016, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x01), Local0)
                    If (LLessEqual (Local0, 0x01))
                    {
                        Store (\_SB.WMID.PHSR (0x0A, Arg0), BUFF)
                    }
                    Else
                    {
                        Store (0x02, BUFF)
                    }
                }

                Method (Z017, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x0B, Arg0), BUFF)
                }

                Method (Z018, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LEqual (Local0, 0x01))
                    {
                        \_SB.WMID.PHSR (0x0D, Local0)
                    }

                    Store (0x00, BUFF)
                }

                Method (Z019, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x0C, Arg0), BUFF)
                }

                Method (Z01A, 0, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x0E, 0x00), BUFF)
                }

                Name (_WDG, Buffer (0xDC)
                {
                    /* 0000 */    0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                    /* 0008 */    0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                    /* 0010 */    0x41, 0x41, 0x01, 0x01, 0x58, 0xF2, 0xF4, 0x6A, 
                    /* 0018 */    0x01, 0xB4, 0xFD, 0x42, 0xBE, 0x91, 0x3D, 0x4A, 
                    /* 0020 */    0xC2, 0xD7, 0xC0, 0xD3, 0x42, 0x41, 0x01, 0x02, 
                    /* 0028 */    0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                    /* 0030 */    0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                    /* 0038 */    0x80, 0x00, 0x01, 0x08, 0x53, 0x44, 0x8C, 0xE7, 
                    /* 0040 */    0x27, 0x02, 0x61, 0x48, 0x9E, 0xDE, 0xF5, 0x60, 
                    /* 0048 */    0x0B, 0x4A, 0x3D, 0x39, 0x42, 0x42, 0x01, 0x02, 
                    /* 0050 */    0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                    /* 0058 */    0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                    /* 0060 */    0x42, 0x43, 0x01, 0x02, 0x79, 0x4C, 0xF9, 0xCF, 
                    /* 0068 */    0x77, 0x6C, 0xF7, 0x4A, 0xAC, 0x56, 0x7D, 0xD0, 
                    /* 0070 */    0xCE, 0x01, 0xC9, 0x97, 0x42, 0x44, 0x01, 0x02, 
                    /* 0078 */    0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                    /* 0080 */    0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                    /* 0088 */    0x42, 0x45, 0x01, 0x02, 0xB7, 0xA0, 0xC9, 0xA7, 
                    /* 0090 */    0x9D, 0x4C, 0x72, 0x4C, 0x83, 0xBB, 0x53, 0xA3, 
                    /* 0098 */    0x45, 0x91, 0x71, 0xDF, 0x42, 0x46, 0x01, 0x02, 
                    /* 00A0 */    0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                    /* 00A8 */    0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                    /* 00B0 */    0x42, 0x47, 0x01, 0x02, 0xA7, 0xB1, 0x85, 0xDB, 
                    /* 00B8 */    0x9A, 0x06, 0xBB, 0x4A, 0xA2, 0xB5, 0xD1, 0x86, 
                    /* 00C0 */    0xA2, 0x1B, 0x80, 0xF1, 0x81, 0x00, 0x01, 0x08, 
                    /* 00C8 */    0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                    /* 00D0 */    0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                    /* 00D8 */    0x82, 0x00, 0x01, 0x08
                })
                Method (WQAA, 1, NotSerialized)
                {
                    AAF1 ()
                    Store (AADS, BUFF)
                    Return (BUFF)
                }

                Method (WMBA, 3, NotSerialized)
                {
                    If (LLess (Arg1, 0x04))
                    {
                        Z00F (Arg1)
                    }
                    Else
                    {
                        If (LEqual (Arg1, 0x07))
                        {
                            Store (Arg2, BUFF)
                            If (BF00)
                            {
                                Store (0x01, BAEF)
                            }
                            Else
                            {
                                Store (0x00, BAEF)
                            }

                            Store (0x00, BUFF)
                        }
                        Else
                        {
                            Z00G (Arg1, Arg2)
                        }
                    }

                    Return (BUFF)
                }

                Method (_WED, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x81))
                    {
                        Return (Z00H ())
                    }
                    Else
                    {
                        If (LEqual (BAEF, 0x01))
                        {
                            If (LOr (LEqual (Arg0, 0x80), LEqual (Arg0, 0x82)))
                            {
                                Return (Z00H ())
                            }
                        }
                    }

                    Return (0xFFFF)
                }

                Method (WMBB, 3, NotSerialized)
                {
                    Z00I (Arg1, Arg2)
                    Store (BBSB, BUFF)
                    Return (BUFF)
                }

                Method (WMBC, 3, NotSerialized)
                {
                    Z00L (Arg1, Arg2)
                    If (LLess (Arg1, 0x0A))
                    {
                        Subtract (Arg1, 0x01, Local0)
                        Store (DerefOf (Index (BCDS, Subtract (Arg1, 0x01))), BUFF)
                    }
                    Else
                    {
                        ShiftRight (DerefOf (Index (BCDS, Subtract (Arg1, 0x0A))), 0x10, 
                            BUFF)
                    }

                    Return (BUFF)
                }

                Method (WMBD, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (Arg2, BUFF)
                            Z00M (BF00)
                            Return (DSY0)
                        }
                        Else
                        {
                            If (LNotEqual (Match (Package (0x02)
                                            {
                                                0x02, 
                                                0x03
                                            }, MEQ, _T_0, MTR, 0x00, 0x00), Ones))
                            {
                                If (LEqual (Arg1, 0x02))
                                {
                                    Store (Arg2, DY10)
                                }
                                Else
                                {
                                    Store (Arg2, DSY1)
                                }

                                Z00N (Arg1)
                                Return (DSY1)
                            }
                            Else
                            {
                                If (LNotEqual (Match (Package (0x02)
                                                {
                                                    0x04, 
                                                    0x05
                                                }, MEQ, _T_0, MTR, 0x00, 0x00), Ones))
                                {
                                    Z00O (Arg1, Arg2)
                                    Return (BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x07))
                                    {
                                        Store (\_TZ.THRM._TMP (), Local0)
                                        Divide (Local0, 0x0A, , Local0)
                                        Store (Local0, Index (BCDS, 0x0B))
                                        Store (DerefOf (Index (BCDS, 0x0B)), BUFF)
                                        Return (BUFF)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x0A))
                                        {
                                            Z00R ()
                                            Return (BUFF)
                                        }
                                        Else
                                        {
                                        }
                                    }
                                }
                            }
                        }

                        Break
                    }
                }

                Method (WMBE, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Z00S (Arg2)
                            Return (BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Z00T (Arg2)
                                Return (BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Z00W (Arg2)
                                    Return (BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x04))
                                    {
                                        Z00V (Arg2)
                                        Return (BUFF)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x05))
                                        {
                                            Z00X (Arg2)
                                            Return (BUFF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x06))
                                            {
                                                Z00Y (Arg2)
                                                Return (BUFF)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x07))
                                                {
                                                    Z00Z (Arg2)
                                                    Return (BUFF)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x08))
                                                    {
                                                        Z010 (Arg2)
                                                        Return (BUFF)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x09))
                                                        {
                                                            Z011 (Arg2)
                                                            Return (BUFF)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x0A))
                                                            {
                                                                Z012 (Arg2)
                                                                Return (BUFF)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_0, 0x0B))
                                                                {
                                                                    Z013 (Arg2)
                                                                    Return (BUFF)
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_0, 0x11))
                                                                    {
                                                                        Store (\_SB.WMID.PHSR (0x0F, 0x00), BUFF)
                                                                        Return (BUFF)
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_0, 0x12))
                                                                        {
                                                                            Store (\_SB.WMID.PHSR (0x0F, 0x01), BUFF)
                                                                            Return (BUFF)
                                                                        }
                                                                        Else
                                                                        {
                                                                            Store (0x00010000, BUFF)
                                                                            Return (BUFF)
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Break
                    }
                }

                Method (WMBF, 3, NotSerialized)
                {
                    Store (Arg2, BUFF)
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Z014 (BF00)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Z015 (BF00)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Z016 (BF00)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Z018 (BF00)
                                    }
                                    Else
                                    {
                                        Store (0x02, BF00)
                                    }
                                }
                            }
                        }

                        Break
                    }

                    Store (0x00, BF01)
                    Store (0x00, BF02)
                    Store (0x00, BF03)
                    Return (BUFF)
                }

                Method (WMBG, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (Arg2, BUFF)
                            Z019 (BF00)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Z01A ()
                            }
                            Else
                            {
                                Store (0x00010000, BUFF)
                            }
                        }

                        Break
                    }

                    Store (0x00, BF01)
                    Store (0x00, BF02)
                    Store (0x00, BF03)
                    Return (BUFF)
                }
            }
        }
    }

    Scope (\_GPE)
    {
        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P2P, 0x02)
        }

        Method (_L19, 0, NotSerialized)
        {
            Name (HPOK, 0x00)
            If (\_SB.PCI0.SMB.GM4C)
            {
                Sleep (0x14)
                Store (\_SB.PCI0.LPC0.RGPM (), Local0)
                If (And (Local0, 0x10))
                {
                    Store (0x00, \_SB.PCI0.SMB.GM4C)
                    Store ("HotPlug:06: Removal Event", Debug)
                    Store (0x08, \_SB.PCI0.PB6.SLST)
                    Store (\_SB.PCI0.PB6.NCRD.DVID, Local7)
                    Sleep (0x0A)
                    Store (0x01, Local4)
                    Store (0x05, Local5)
                    While (LAnd (Local4, Local5))
                    {
                        Store (\_SB.PCI0.PB6.XPRD (0xA5), Local6)
                        And (Local6, 0x3F, Local6)
                        If (LLessEqual (Local6, 0x04))
                        {
                            Store (0x00, Local4)
                        }
                        Else
                        {
                            Store (\_SB.PCI0.PB6.NCRD.DVID, Local7)
                            Sleep (0x05)
                            Decrement (Local5)
                        }
                    }

                    \_SB.PCI0.XPTR (0x06, 0x00)
                    \_SB.PCI0.PB6.XPLP (0x00)
                    Store (0x01, HPOK)
                }
            }
            Else
            {
                Sleep (0x14)
                Store (\_SB.PCI0.LPC0.RGPM (), Local0)
                If (LNot (And (Local0, 0x10)))
                {
                    Store (0x01, \_SB.PCI0.SMB.GM4C)
                    Store ("HotPlug:06: Insertion Event", Debug)
                    Store (0x00, HPOK)
                    \_SB.PCI0.PB6.XPLP (0x01)
                    Sleep (0xC8)
                    \_SB.PCI0.XPTR (0x06, 0x01)
                    Sleep (0x14)
                    Store (0x00, Local2)
                    While (LLess (Local2, 0x0F))
                    {
                        Store (\_SB.PCI0.PB6.SLST, Local1)
                        If (And (Local1, 0x08))
                        {
                            Store (0x08, \_SB.PCI0.PB6.SLST)
                            Store (0x01, Local3)
                            Store (0xC8, Local4)
                            While (LAnd (Local3, Local4))
                            {
                                Store (\_SB.PCI0.PB6.SLST, Local1)
                                If (And (Local1, 0x40))
                                {
                                    Store ("HotPlug:06: PresenceDetect=1", Debug)
                                    Store (0x00, Local3)
                                }
                                Else
                                {
                                    Sleep (0x01)
                                    Decrement (Local4)
                                }
                            }

                            If (LNot (Local3))
                            {
                                Store (0x01, Local4)
                                Store (0xC8, Local5)
                                While (LAnd (Local4, Local5))
                                {
                                    Store (\_SB.PCI0.PB6.XPRD (0xA5), Local6)
                                    And (Local6, 0x3F, Local6)
                                    If (LEqual (Local6, 0x10))
                                    {
                                        Store ("HotPlug:06: TrainingState=0x10", Debug)
                                        Store (0x00, Local4)
                                    }
                                    Else
                                    {
                                        Sleep (0x05)
                                        Decrement (Local5)
                                    }
                                }

                                If (LNot (Local4))
                                {
                                    Store ("HotPlug:06: Check VC Negotiation Pending", Debug)
                                    Store (\_SB.PCI0.PB6.XPDL (), Local5)
                                    If (Local5)
                                    {
                                        Store ("HotPlug:06: Retraining Link", Debug)
                                        \_SB.PCI0.PB6.XPRT ()
                                        Sleep (0x05)
                                        Increment (Local2)
                                    }
                                    Else
                                    {
                                        Store ("HotPlug:06: Device OK", Debug)
                                        Store (0x30, \_SB.PCI0.LPC0.INFO)
                                        Store (0x87, \_SB.PCI0.LPC0.BCMD)
                                        Store (Zero, \_SB.PCI0.LPC0.SMIC)
                                        If (LEqual (\_SB.PCI0.PB6.XPR2 (), Ones))
                                        {
                                            Store (0x01, HPOK)
                                            Store (0x10, Local2)
                                        }
                                        Else
                                        {
                                            Store ("HotPlug:06: Common Clock Retraining Failed", Debug)
                                            Store (0x00, HPOK)
                                            Store (0x10, Local2)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store ("HotPlug:06: TrainingState Timeout", Debug)
                                    Store (0x10, Local2)
                                }
                            }
                            Else
                            {
                                Store ("HotPlug:06: PresenceDetect Timeout", Debug)
                                Store (0x10, Local2)
                            }
                        }
                        Else
                        {
                            Store ("HotPlug:06 Presence Detect Change not Set", Debug)
                            Store (0x10, Local2)
                        }
                    }

                    If (LNot (HPOK))
                    {
                        Store ("HotPlug:06: Insertion Failed: Disable Training & PowerDown", Debug)
                        Store (\_SB.PCI0.PB6.NCRD.DVID, Local7)
                        Sleep (0x0A)
                        Store (0x01, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (\_SB.PCI0.PB6.XPRD (0xA5), Local6)
                            And (Local6, 0x3F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (\_SB.PCI0.PB6.NCRD.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        \_SB.PCI0.XPTR (0x06, 0x00)
                        \_SB.PCI0.PB6.XPLP (0x00)
                    }
                }
            }

            If (HPOK)
            {
                Notify (\_SB.PCI0.PB6, 0x00)
                Store (0x86, \_SB.PCI0.LPC0.BCMD)
                Store (Zero, \_SB.PCI0.LPC0.SMIC)
            }
        }
    }
}

