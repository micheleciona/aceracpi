/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of 4000, Mon Jul 16 13:46:40 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000064AC (25772)
 *     Revision         0x01
 *     OEM ID           "ATI"
 *     OEM Table ID     "SB400"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("4000.aml", "DSDT", 1, "ATI", "SB400", 0x06040000)
{
    External (Z00I)
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
    OperationRegion (\DBPO, SystemIO, 0x80, 0x01)
    Field (\DBPO, ByteAcc, NoLock, Preserve)
    {
        DBGP,   8
    }

    OperationRegion (\DEBG, SystemIO, 0x1080, 0x01)
    Field (\DEBG, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
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
        DCKI,   1
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00008010, 0x06) {}
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
    Name (HTTX, 0x00)
    Method (_PTS, 1, NotSerialized)
    {
        \_SB.PCI0.LPCB.PHSR (0x08, 0x00)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, INS4)
            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
            Store (0x01, \_SB.PCI0.LPCB.EC0.FLS4)
            Store (0x01, \_SB.PCI0.LPCB.EC0.PFLG)
            Release (\_SB.PCI0.LPCB.EC0.MUT1)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, \_SB.PCI0.SMB.SLPS)
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x80, \_SB.PCI0.LPCB.BCMD)
            Store (Zero, \_SB.PCI0.LPCB.SMIC)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (0x01, INSX)
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
            Store (0x83, \_SB.PCI0.LPCB.BCMD)
            Store (Zero, \_SB.PCI0.LPCB.SMIC)
            And (PST1, 0x04, Local0)
            If (LEqual (Local0, 0x00))
            {
                Notify (\_SB.PWRB, 0x02)
            }
        }

        If (LEqual (Arg0, 0x03))
        {
            \_SB.PCI0.LPCB.PHSR (0x00, 0x00)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x00, INS4)
        }

        \_SB.PCI0.LPCB.PHSR (0x08, 0x01)
        If (Or (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
            Store (\_SB.PCI0.LPCB.BTEN, \_SB.PCI0.LPCB.EC0.BLTH)
            Store (\_SB.PCI0.LPCB.WLAN, \_SB.PCI0.LPCB.EC0.WLAN)
            Store (0x01, \_SB.PCI0.LPCB.EC0.CPLE)
            Store (\_SB.PCI0.LPCB.EC0.PRCT, Local0)
            Release (\_SB.PCI0.LPCB.EC0.MUT1)
            Store (0x03FF, \_SB.PCI0.IDE.IPDC)
            If (LEqual (Local0, 0x01))
            {
                \_SB.PCI0.LPCB.PHSR (0x07, 0x00)
                Store (0x01, \_SB.PCI0.DOCK.DCKS)
                If (LEqual (\_SB.PCI0.PB5.CINS, 0x48))
                {
                    Store (0x01, \_SB.PCI0.LPCB.EC0.INNC)
                }

                Sleep (0x01F4)
                Notify (\_SB.PCI0.DOCK, 0x00)
            }
            Else
            {
                Store (0x00, \_SB.PCI0.DOCK.DCKS)
                Store (0x00, \_SB.PCI0.LPCB.EC0.INNC)
            }
        }

        Store (0x00, DCKI)
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
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x3FEFBDE4, 0x00000001)
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

        Method (OSHT, 0, NotSerialized)
        {
            \_SB.OSTP ()
            Store (0x48, \_SB.PCI0.LPCB.BCMD)
            Store (Zero, \_SB.PCI0.LPCB.SMIC)
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

    Name (FWSO, "FWSO")
    Name (_PSC, 0x00)
    Method (_PS0, 0, NotSerialized)
    {
        Store (_PSC, Local0)
        Store (0x00, _PSC)
        If (LEqual (Local0, 0x03))
        {
            Store (0x01, \_SB.PCI0.LPCB.INF)
            While (\_SB.PCI0.LPCB.INF)
            {
                Store (0x20, \_SB.PCI0.LPCB.BCMD)
                Store (Zero, \_SB.PCI0.LPCB.SMIC)
                If (LAnd (LEqual (\_SB.PCI0.LPCB.INF, 0x01), LGreaterEqual (\_SB.OSTB, 0x04)))
                {
                    Sleep (0x01F4)
                }
            }
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        Store (0x03, _PSC)
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

    Name (\GPIC, 0x00)
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
        If (Arg0)
        {
            \_SB.PCI0.LPCB.DSPI ()
        }
    }

    Scope (\_SB)
    {
        Name (ECOK, 0x00)
        Name (TOFF, 0x00)
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

            OperationRegion (K8ST, SystemMemory, 0x3FEFBF74, 0x00000048)
            Field (K8ST, AnyAcc, Lock, Preserve)
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
                            \_SB.PCI0.LPCB.LNKH, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKD, 
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

            Device (OHC1)
            {
                Name (_ADR, 0x00130000)
                OperationRegion (Z00A, PCI_Config, 0x00, 0x80)
                Field (Z00A, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x04), 
                    CMDE,   8
                }

                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130001)
                OperationRegion (Z00B, PCI_Config, 0x00, 0x80)
                Field (Z00B, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x04), 
                    CMDE,   8
                }

                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (EHCI)
            {
                Name (_ADR, 0x00130002)
                OperationRegion (EHC1, PCI_Config, 0x00, 0x80)
                Field (EHC1, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x04), 
                    CMDE,   8
                }

                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (SMB)
            {
                Name (_ADR, 0x00140000)
                OperationRegion (Z00C, PCI_Config, 0x08, 0x01)
                Field (Z00C, ByteAcc, NoLock, Preserve)
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
                            Offset (0x37), 
                        ,   4, 
                    GPX1,   1, 
                            Offset (0x38), 
                        ,   4, 
                    GPX6,   1, 
                    LIDP,   1, 
                            Offset (0x55), 
                    SPRE,   1, 
                            Offset (0x68), 
                        ,   3, 
                    TPDE,   1, 
                        ,   1
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

                OperationRegion (IDE1, PCI_Config, 0x00, 0xFF)
                Field (IDE1, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x6C), 
                    IPDC,   32
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (0x03FF, IPDC)
                }

                Method (ATPI, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    And (Local0, 0xFF, Local0)
                    Or (Local0, 0x41544900, Local0)
                    Store (Local0, \_SB.PCI0.LPCB.INFO)
                    Store (0x84, \_SB.PCI0.LPCB.BCMD)
                    Store (Zero, \_SB.PCI0.LPCB.SMIC)
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

                    Method (_STA, 0, NotSerialized)
                    {
                        And (PPIC, 0x01, Local0)
                        If (LAnd (Local0, 0x01))
                        {
                            Return (Z006)
                        }
                        Else
                        {
                            Return (Z005)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
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
                        Store (VPIT, ^^SPIT)
                        Store (VMDT, ^^SMDT)
                        Store (VPIM, ^^SPIM)
                        Store (VUDC, ^^SUDC)
                        Store (VUDM, ^^SUDM)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            Store (\_SB.PCI0.LPCB.PHSR (0x0E, 0x00), Local0)
                            If (Or (LEqual (Local0, 0x03), LEqual (Local0, 0x00)))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_EJ0, 1, NotSerialized)
                        {
                            If (Arg0)
                            {
                                \_SB.PCI0.LPCB.PHSR (0x0D, 0x00)
                            }
                        }

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
                }
            }

            Device (LPCB)
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
                Method (DSPI, 0, NotSerialized)
                {
                    Store (0x00, PIRA)
                    Store (0x00, PIRB)
                    Store (0x00, PIRC)
                    Store (0x00, PIRD)
                    Store (0x00, PIRS)
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
                            0x087F,             // Range Minimum
                            0x087F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0200,             // Range Minimum
                            0x0200,             // Range Maximum
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
                        IO (Decode16,
                            0x0F40,             // Range Minimum
                            0x0F40,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0280,             // Range Minimum
                            0x0280,             // Range Maximum
                            0x01,               // Alignment
                            0x14,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE0000000,         // Address Base
                            0x00000100,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE0010000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE0030000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE0098000,         // Address Base
                            0x00003000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE00A0000,         // Address Base
                            0x00002000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE00A3000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE0100000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE0500000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE0610000,         // Address Base
                            0x00008000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xE0648000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFEE00400,         // Address Base
                            0x00000C00,         // Address Length
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
                            0xFFF80000,         // Address Base
                            0x00080000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y19)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (TPOS, 0x04))
                        {
                            CreateDWordField (MSRC, \_SB.PCI0.LPCB.MEM._Y19._BAS, BARX)
                            CreateDWordField (MSRC, \_SB.PCI0.LPCB.MEM._Y19._LEN, GALN)
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

                OperationRegion (SMI1, SystemMemory, 0x3FEFBDE5, 0x00000120)
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
                            Offset (0x110), 
                    BTEN,   1, 
                    WLAN,   1, 
                    DOCK,   1, 
                            Offset (0x111), 
                    PNUM,   8
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x05), 
                    PAR0,   8, 
                    PAR1,   8, 
                    PAR2,   8, 
                    PAR3,   8, 
                    PAR4,   16
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x05), 
                    SXBF,   2048
                }

                Method (PHSR, 2, NotSerialized)
                {
                    Acquire (PSMX, 0xFFFF)
                    Store (0x90, BCMD)
                    Store (Arg0, DID)
                    Store (Arg1, INF)
                    Store (Zero, SMIC)
                    Store (INF, Local0)
                    Release (PSMX)
                    Return (Local0)
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    OperationRegion (SIIO, SystemIO, 0x2E, 0x02)
                    Field (SIIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (N383, 0x00)
                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x07), 
                        LDN,    8, 
                                Offset (0x26), 
                            ,   1, 
                        LPTE,   1, 
                        Z00D,   1, 
                        Z00E,   1, 
                                Offset (0x30), 
                        ACTR,   1, 
                                Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                                Offset (0x70), 
                        INTR,   8, 
                                Offset (0x74), 
                        DMCH,   8, 
                                Offset (0xF0), 
                        OPT1,   8
                    }

                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (N383, 0xFFFF)
                        Store (0x07, INDX)
                        Store (Arg0, DATA)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Release (N383)
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("NSC6001"))
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x02)
                            If (LEqual (Z00D, 0x00))
                            {
                                If (ACTR)
                                {
                                    Store (0x0F, Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }

                            EXFG ()
                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x02)
                            If (ACTR)
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                                Store (0x00, DMCH)
                            }

                            EXFG ()
                            Store (0x00, CMB3)
                            Store (0x00, CMA7)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
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
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            })
                            ENFG (0x02)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x09))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0A))
                                ShiftLeft (0x01, DMCH, Local0)
                                Store (Local0, Index (DCRS, 0x0C))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0D))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x09))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x0D))
                            }

                            EXFG ()
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
                            If (LEqual (ADRL, 0xF8))
                            {
                                Store (0x01, CMA7)
                            }
                            Else
                            {
                                Store (0x01, CMB3)
                            }

                            ENFG (0x02)
                            Store (Local0, INTR)
                            Store (Local1, DMCH)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            Or (0x80, OPT1, OPT1)
                            EXFG ()
                        }
                    }

                    Device (COMA)
                    {
                        Name (_HID, EisaId ("PNP0501"))
                        Method (_STA, 0, NotSerialized)
                        {
                            If (\_SB.PCI0.LPCB.DOCK)
                            {
                                ENFG (0x03)
                                If (LEqual (Z00E, 0x00))
                                {
                                    If (ACTR)
                                    {
                                        Store (0x0F, Local0)
                                    }
                                    Else
                                    {
                                        Store (0x0D, Local0)
                                    }
                                }
                                Else
                                {
                                    Store (0x00, Local0)
                                }

                                EXFG ()
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }

                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x03)
                            If (ACTR)
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                            }

                            EXFG ()
                            Store (0x00, CMA6)
                            Store (0x00, CMB5)
                        }

                        Name (_PRS, ResourceTemplate ()
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
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            })
                            ENFG (0x03)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x09))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0A))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x09))
                                Store (0x00, Index (DCRS, 0x0A))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            If (LEqual (ADRL, 0xF8))
                            {
                                Store (0x01, CMA6)
                            }
                            Else
                            {
                                Store (0x01, CMB5)
                            }

                            ENFG (0x03)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (ECP)
                    {
                        Name (_HID, EisaId ("PNP0401"))
                        Name (_UID, 0x03)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            Store (LPTE, Local2)
                            Store (ACTR, Local3)
                            EXFG ()
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (Local2, 0x00), LOr (LEqual (Local0, 0x04), LEqual (
                                Local0, 0x07))))
                            {
                                If (\_SB.PCI0.LPCB.DOCK)
                                {
                                    ShiftLeft (Local3, 0x01, Local1)
                                    Add (0x0D, Local1, Local1)
                                }
                                Else
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x04), LEqual (
                                Local0, 0x07))))
                            {
                                If (ACTR)
                                {
                                    Store (0x00, ACTR)
                                    Store (0x00, INTR)
                                    Store (0x00, IOAH)
                                    Store (0x00, IOAL)
                                    Store (0x00, DMCH)
                                }

                                Store (0x00, CMA0)
                                Store (0x00, CMA1)
                                Store (0x00, CMA2)
                                Store (0x00, CMA3)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
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
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                                ShiftLeft (0x01, DMCH, Local0)
                                Store (Local0, Index (DCRS, 0x14))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x15))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                                Store (0x00, Index (DCRS, 0x14))
                                Store (0x00, Index (DCRS, 0x15))
                            }

                            EXFG ()
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
                            If (LEqual (ADRM, 0x03))
                            {
                                Store (0x01, CMA0)
                                Store (0x01, CMA1)
                            }
                            Else
                            {
                                Store (0x01, CMA2)
                                Store (0x01, CMA3)
                            }

                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (Local1, DMCH)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (EPP)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x02)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            Store (LPTE, Local2)
                            Store (ACTR, Local3)
                            EXFG ()
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (Local2, 0x00), LOr (LEqual (Local0, 0x02), LEqual (
                                Local0, 0x03))))
                            {
                                If (\_SB.PCI0.LPCB.DOCK)
                                {
                                    ShiftLeft (Local3, 0x01, Local1)
                                    Add (0x0D, Local1, Local1)
                                }
                                Else
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x02), LEqual (
                                Local0, 0x03))))
                            {
                                If (ACTR)
                                {
                                    Store (0x00, ACTR)
                                    Store (0x00, INTR)
                                    Store (0x00, IOAH)
                                    Store (0x00, IOAL)
                                }

                                Store (0x00, CMA0)
                                Store (0x00, CMA1)
                                Store (0x00, CMA2)
                                Store (0x00, CMA3)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
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
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            If (LEqual (ADRM, 0x03))
                            {
                                Store (0x01, CMA0)
                                Store (0x01, CMA1)
                            }
                            Else
                            {
                                Store (0x01, CMA2)
                                Store (0x01, CMA3)
                            }

                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (LPTB)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            Store (LPTE, Local2)
                            Store (ACTR, Local3)
                            EXFG ()
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (Local2, 0x00), LEqual (Local0, 0x01)))
                            {
                                If (\_SB.PCI0.LPCB.DOCK)
                                {
                                    ShiftLeft (Local3, 0x01, Local1)
                                    Add (0x0D, Local1, Local1)
                                }
                                Else
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x01)))
                            {
                                If (ACTR)
                                {
                                    Store (0x00, ACTR)
                                    Store (0x00, INTR)
                                    Store (0x00, IOAH)
                                    Store (0x00, IOAL)
                                }

                                Store (0x00, CMA0)
                                Store (0x00, CMA1)
                                Store (0x00, CMA2)
                                Store (0x00, CMA3)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
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
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
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
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            If (LEqual (ADRM, 0x03))
                            {
                                Store (0x01, CMA0)
                                Store (0x01, CMA1)
                            }
                            Else
                            {
                                Store (0x01, CMA2)
                                Store (0x01, CMA3)
                            }

                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (LPT)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            Store (LPTE, Local2)
                            Store (ACTR, Local3)
                            EXFG ()
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (Local2, 0x00), LEqual (Local0, 0x00)))
                            {
                                If (\_SB.PCI0.LPCB.DOCK)
                                {
                                    ShiftLeft (Local3, 0x01, Local1)
                                    Add (0x0D, Local1, Local1)
                                }
                                Else
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x00)))
                            {
                                If (ACTR)
                                {
                                    Store (0x00, ACTR)
                                    Store (0x00, INTR)
                                    Store (0x00, IOAH)
                                    Store (0x00, IOAL)
                                }

                                Store (0x00, CMA0)
                                Store (0x00, CMA1)
                                Store (0x00, CMA2)
                                Store (0x00, CMA3)
                                Store (0x00, CMA4)
                                Store (0x00, CMA5)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
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
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
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
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            If (LEqual (ADRM, 0x03))
                            {
                                If (LEqual (ADRL, 0xBC))
                                {
                                    Store (0x01, CMA4)
                                    Store (0x01, CMA5)
                                }
                                Else
                                {
                                    Store (0x01, CMA0)
                                    Store (0x01, CMA1)
                                }
                            }
                            Else
                            {
                                Store (0x01, CMA2)
                                Store (0x01, CMA3)
                            }

                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
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
                    Name (_GPE, 0x10)
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
                            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                            Store (0x03, \_SB.PCI0.LPCB.EC0.RG59)
                            Store (\_SB.PCI0.LPCB.BTEN, \_SB.PCI0.LPCB.EC0.BLTH)
                            Store (\_SB.PCI0.LPCB.WLAN, \_SB.PCI0.LPCB.EC0.WLAN)
                            Store (0x01, \_SB.PCI0.LPCB.EC0.CPLE)
                            Store (\_SB.PCI0.LPCB.PHSR (0x05, 0x00), DOFF)
                            Release (\_SB.PCI0.LPCB.EC0.MUT1)
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
                                Offset (0x61), 
                        BRLV,   8, 
                                Offset (0x71), 
                        MBTS,   1, 
                        MBTF,   1, 
                                Offset (0x72), 
                        MBTC,   1, 
                            ,   2, 
                        LION,   1, 
                                Offset (0x77), 
                        BA1C,   8, 
                                Offset (0x81), 
                        ABTS,   1, 
                        ABFC,   1, 
                            ,   3, 
                        ABBL,   1, 
                        Z00F,   1, 
                        ABCT,   1, 
                        ABCG,   1, 
                            ,   2, 
                        ABTP,   1, 
                                Offset (0x87), 
                        BA2C,   8, 
                                Offset (0x8A), 
                        ACUR,   16, 
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
                            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
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
                                        Store (0x01, IQ20)
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

                            Release (\_SB.PCI0.LPCB.EC0.MUT1)
                        }
                    }

                    Name (IQ20, 0x01)
                    Name (INNC, 0x00)
                    Method (_Q09, 0, NotSerialized)
                    {
                        If (\_SB.ECOK)
                        {
                            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                            Store (0x00, \_SB.PCI0.LPCB.EC0.PSTA)
                            Release (\_SB.PCI0.LPCB.EC0.MUT1)
                            If (IQ20)
                            {
                                \_SB.BAT1.Z00G ()
                                Notify (\_SB.ACAD, 0x80)
                                Sleep (0x01F4)
                                Notify (\_SB.BAT1, 0x80)
                                If (\_SB.BAT1.BTCH)
                                {
                                    \_SB.BAT1.UBIF ()
                                    Notify (\_SB.BAT1, 0x81)
                                    Store (0x00, \_SB.BAT1.BTCH)
                                }

                                Store (0x00, IQ20)
                            }
                        }
                    }

                    Method (_Q8A, 0, NotSerialized)
                    {
                        Store (0x8A, P80H)
                        Notify (\_SB.LID, 0x80)
                    }

                    Method (_Q8B, 0, NotSerialized)
                    {
                        Store (0x8B, P80H)
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.BAYI, Local0)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                        If (LEqual (Local0, 0x01))
                        {
                            \_SB.PCI0.LPCB.PHSR (0x0C, 0x00)
                            Store (0x01, \_SB.PCI0.IDE.SUDC)
                            Store (0x02, \_SB.PCI0.IDE.SUDM)
                            Store (0x04, \_SB.PCI0.IDE.SPIM)
                            Store (\_SB.PCI0.IDE.SPIT, Local0)
                            And (Local0, 0xFF, Local0)
                            Or (Local0, 0x2000, Local0)
                            Store (Local0, \_SB.PCI0.IDE.SPIT)
                            Notify (\_SB.PCI0.IDE.SECD, 0x00)
                            Sleep (0x0BB8)
                            Notify (\_SB.PCI0.IDE.SECD.S_D0, 0x00)
                        }
                        Else
                        {
                            \_SB.PCI0.LPCB.PHSR (0x0D, 0x00)
                            Notify (\_SB.PCI0.IDE.SECD, 0x01)
                        }
                    }

                    Method (_Q8C, 0, NotSerialized)
                    {
                        Store (0x8C, P80H)
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.PRCT, Local0)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                        If (LEqual (Local0, 0x01))
                        {
                            \_SB.PCI0.LPCB.PHSR (0x07, 0x00)
                            Store (0x01, \_SB.PCI0.DOCK.DCKS)
                            Sleep (0x01F4)
                            Notify (\_SB.PCI0.DOCK, 0x00)
                        }
                        Else
                        {
                            \_SB.PCI0.LPCB.PHSR (0x0B, 0x00)
                            Store (0x00, \_SB.PCI0.DOCK.DCKS)
                            Store (0x00, INNC)
                            Sleep (0xC8)
                            Notify (\_SB.PCI0.PB4, 0x01)
                            Sleep (0xC8)
                            Notify (\_SB.PCI0.PB5, 0x01)
                            Notify (\_SB.PCI0.DOCK, 0x01)
                        }
                    }

                    Method (_Q8D, 0, NotSerialized)
                    {
                        Store (0x8D, P80H)
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.WC10, Local0)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                        If (LEqual (Local0, 0x01))
                        {
                            Notify (\_SB.PCI0.PB5.NCRD, 0x00)
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.PB5, 0x01)
                        }
                    }

                    Name (CPUT, 0x00)
                    Method (_Q80, 0, NotSerialized)
                    {
                        If (\_SB.ECOK)
                        {
                            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                            Store (\_SB.PCI0.LPCB.EC0.CTMP, Local0)
                            Release (\_SB.PCI0.LPCB.EC0.MUT1)
                        }
                        Else
                        {
                            Store (0x28, Local0)
                        }

                        If (LGreaterEqual (Local0, 0x64))
                        {
                            Notify (\_TZ.THRM, 0x80)
                        }

                        If (LAnd (LGreaterEqual (Local0, 0x5F), LEqual (CPUT, 0x00)))
                        {
                            Store (0x01, CPUT)
                            Store (PNUM, Local1)
                            If (LLess (\_PR.CPU0._PPC, Local1))
                            {
                                Store (Local1, \_PR.CPU0._PPC)
                                Notify (\_PR.CPU0, 0x80)
                                Sleep (0x01F4)
                            }
                        }
                        Else
                        {
                            If (LAnd (LLessEqual (Local0, 0x50), LNotEqual (CPUT, 0x00)))
                            {
                                Store (0x00, CPUT)
                                Store (0x00, Local1)
                                Notify (\_SB.ACAD, 0x80)
                                Sleep (0x01F4)
                                If (LEqual (Local1, 0x00))
                                {
                                    If (LNotEqual (\_PR.CPU0._PPC, 0x00))
                                    {
                                        Store (0x00, \_PR.CPU0._PPC)
                                        Notify (\_PR.CPU0, 0x80)
                                        Sleep (0x01F4)
                                    }
                                }
                            }
                        }
                    }

                    Method (_Q81, 0, NotSerialized)
                    {
                        \_SB.PCI0.LPCB.EC0._Q80 ()
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                    }
                }
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
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }
                        })
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)
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

                    Method (_PS2, 0, NotSerialized)
                    {
                        Store (0x02, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Name (DISW, 0x01)
                    Name (NDSP, 0x00)
                    Name (VRSM, 0x00)
                    Name (PDSP, 0x00)
                    Name (CDSP, 0x00)
                    Name (TGLT, Package (0x04)
                    {
                        Package (0x08)
                        {
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01
                        }, 

                        Package (0x08)
                        {
                            0x01, 
                            0x02, 
                            0x03, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01
                        }, 

                        Package (0x08)
                        {
                            0x01, 
                            0x05, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01
                        }, 

                        Package (0x08)
                        {
                            0x01, 
                            0x02, 
                            0x03, 
                            0x05, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01
                        }
                    })
                    Name (TGLP, 0x00)
                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Name (_PSC, 0x00)
                        Name (_S3D, 0x03)
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

                        Name (_DCS, 0x1B)
                        Name (_DGS, 0x00)
                        Method (_DSS, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (And (Local0, 0x01))
                            {
                                Store ("LCD._DSS(1) called", Debug)
                                Or (NDSP, 0x01, NDSP)
                            }
                            Else
                            {
                                Store ("LCD._DSS(0) called", Debug)
                                And (NDSP, 0xFE, NDSP)
                            }

                            And (Local0, 0xC0000000, Local0)
                            And (Local0, 0x80000000, Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Store ("LCD._DSS, update next _DGS", Debug)
                                Or (And (^^LCD._DCS, 0xFD), ShiftLeft (And (NDSP, 0x01), 
                                    0x01), ^^LCD._DCS)
                                Or (And (^^CRT._DCS, 0xFD), And (NDSP, 0x02), ^^CRT._DCS)
                                Or (And (^^TV._DCS, 0xFD), ShiftRight (And (NDSP, 0x04), 
                                    0x01), ^^TV._DCS)
                                UDGS ()
                            }
                        }
                    }

                    Device (CRT)
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

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, _PSC)
                        }

                        Name (_DCS, 0x1B)
                        Name (_DGS, 0x00)
                        Method (_DSS, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (And (Local0, 0x01))
                            {
                                Store ("CRT._DSS(1) called", Debug)
                                Or (NDSP, 0x02, NDSP)
                            }
                            Else
                            {
                                Store ("CRT._DSS(0) called", Debug)
                                And (NDSP, 0xFD, NDSP)
                            }

                            And (Local0, 0xC0000000, Local0)
                            And (Local0, 0x80000000, Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Store ("CRT._DSS, update next _DGS", Debug)
                                Or (And (^^LCD._DCS, 0xFD), ShiftLeft (And (NDSP, 0x01), 
                                    0x01), ^^LCD._DCS)
                                Or (And (^^CRT._DCS, 0xFD), And (NDSP, 0x02), ^^CRT._DCS)
                                Or (And (^^TV._DCS, 0xFD), ShiftRight (And (NDSP, 0x04), 
                                    0x01), ^^TV._DCS)
                                UDGS ()
                            }
                        }
                    }

                    Device (TV)
                    {
                        Name (_ADR, 0x0200)
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

                        Name (_DCS, 0x1B)
                        Name (_DGS, 0x00)
                        Method (_DSS, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (And (Local0, 0x01))
                            {
                                Store ("TV_._DSS(1) called", Debug)
                                Or (NDSP, 0x04, NDSP)
                            }
                            Else
                            {
                                Store ("TV_._DSS(0) called", Debug)
                                And (NDSP, 0xFB, NDSP)
                            }

                            And (Local0, 0xC0000000, Local0)
                            And (Local0, 0x80000000, Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Store ("TV_._DSS, update next _DGS", Debug)
                                Or (And (^^LCD._DCS, 0xFD), ShiftLeft (And (NDSP, 0x01), 
                                    0x01), ^^LCD._DCS)
                                Or (And (^^CRT._DCS, 0xFD), And (NDSP, 0x02), ^^CRT._DCS)
                                Or (And (^^TV._DCS, 0xFD), ShiftRight (And (NDSP, 0x04), 
                                    0x01), ^^TV._DCS)
                                UDGS ()
                            }
                        }
                    }

                    Method (_INI, 0, NotSerialized)
                    {
                        USTA ()
                        Store (CDSP, PDSP)
                        Store (CDSP, Local1)
                        Or (ShiftRight (And (Local1, 0x10), 0x03), 0x1D, ^LCD._DCS)
                        Or (Or (ShiftLeft (And (Local1, 0x02), 0x03), ShiftRight (
                            And (Local1, 0x20), 0x04)), 0x0D, ^CRT._DCS)
                        Or (Or (ShiftLeft (And (Local1, 0x04), 0x02), ShiftRight (
                            And (Local1, 0x40), 0x05)), 0x0D, ^TV._DCS)
                        ShiftRight (Local1, 0x04, NDSP)
                        Store (ShiftRight (And (^LCD._DCS, 0x02), 0x01), ^LCD._DGS)
                        Store (ShiftRight (And (^CRT._DCS, 0x02), 0x01), ^CRT._DGS)
                        Store (ShiftRight (And (^TV._DCS, 0x02), 0x01), ^TV._DGS)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (Arg0, DISW)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x00010200
                        })
                    }

                    Method (DRUL, 1, NotSerialized)
                    {
                        USTA ()
                        If (LNotEqual (And (PDSP, 0x07), And (CDSP, 0x07
                            )))
                        {
                            UDGS ()
                            Store (CDSP, PDSP)
                        }

                        Store (CDSP, Local2)
                        Store (^CRT._DCS, Local1)
                        Or (Or (ShiftLeft (And (Local2, 0x02), 0x03), ShiftRight (
                            And (Local2, 0x20), 0x04)), And (Local1, 0x0D), 
                            ^CRT._DCS)
                        Store (^TV._DCS, Local3)
                        Or (Or (ShiftLeft (And (Local2, 0x04), 0x02), ShiftRight (
                            And (Local2, 0x40), 0x05)), And (Local3, 0x0D), 
                            ^TV._DCS)
                        If (LEqual (Arg0, 0x01))
                        {
                            If (LOr (LAnd (^CRT._DGS, LNot (And (^CRT._DCS, 0x10))), LAnd (
                                ^TV._DGS, LNot (And (^TV._DCS, 0x10)))))
                            {
                                UDGS ()
                                Return (0x00)
                            }
                            Else
                            {
                                Notify (VGA, 0x80)
                                Return (0x00)
                            }
                        }
                    }

                    Method (USTA, 0, NotSerialized)
                    {
                        Store (\_SB.PCI0.LPCB.PHSR (0x06, 0x00), CDSP)
                        And (CDSP, 0x0F, Local1)
                        If (LEqual (Local1, 0x03))
                        {
                            Store (0x01, TGLP)
                        }
                        Else
                        {
                            If (LEqual (Local1, 0x05))
                            {
                                Store (0x02, TGLP)
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x07))
                                {
                                    Store (0x03, TGLP)
                                }
                                Else
                                {
                                    Store (0x00, TGLP)
                                }
                            }
                        }
                    }

                    Method (UDGS, 0, NotSerialized)
                    {
                        And (^LCD._DGS, 0x01, Local0)
                        Or (Local0, ShiftLeft (And (^CRT._DGS, 0x01), 0x01), Local0)
                        Or (Local0, ShiftLeft (And (^TV._DGS, 0x01), 0x02), Local0)
                        Store (DerefOf (Index (DerefOf (Index (TGLT, TGLP)), Local0)), 
                            Local1)
                        And (Local1, 0x01, ^LCD._DGS)
                        ShiftRight (And (Local1, 0x02), 0x01, ^CRT._DGS)
                        ShiftRight (And (Local1, 0x04), 0x02, ^TV._DGS)
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
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (PB4)
            {
                Name (_ADR, 0x00040000)
                OperationRegion (P3CS, PCI_Config, 0x40, 0x0100)
                Field (P3CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x28), 
                        ,   4, 
                    LDP3,   1
                }

                OperationRegion (PCIR, PCI_Config, 0x40, 0xC0)
                Field (PCIR, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x32), 
                        ,   6, 
                    DCKD,   1, 
                            Offset (0x33)
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
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }
                        })
                    }
                }

                Scope (\_SB.PCI0)
                {
                    Device (DOCK)
                    {
                        Name (_HID, EisaId ("PNP0C15"))
                        Name (_UID, 0x01)
                        Name (_BDN, "EZ4 ")
                        Name (DCKS, 0x00)
                        Method (_DCK, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_EJ0, 1, NotSerialized)
                        {
                            \_SB.PCI0.LPCB.PHSR (0x0B, 0x00)
                            Store (0x00, \_SB.PCI0.DOCK.DCKS)
                            Store (0x00, \_SB.PCI0.LPCB.EC0.INNC)
                            Sleep (0xC8)
                            Notify (\_SB.PCI0.PB4, 0x01)
                            Sleep (0xC8)
                            Notify (\_SB.PCI0.PB5, 0x01)
                            Notify (\_SB.PCI0.DOCK, 0x01)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            If (DCKS)
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

                Device (PXHA)
                {
                    Name (_ADR, 0x00)
                    OperationRegion (PXHR, PCI_Config, 0x00, 0xC0)
                    Field (PXHR, DWordAcc, NoLock, Preserve)
                    {
                        PVID,   16, 
                        PDID,   16
                    }

                    Name (_EJD, "_SB.PCI0.DOCK")
                    Method (_INI, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.PB4.PXHA.PDID, 0x032C))
                        {
                            Store (0x01, \_SB.PCI0.DOCK.DCKS)
                        }
                        Else
                        {
                            Store (0x00, \_SB.PCI0.DOCK.DCKS)
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

                    Method (_PRT, 0, NotSerialized)
                    {
                        If (GPIC)
                        {
                            Return (Package (0x0A)
                            {
                                Package (0x04)
                                {
                                    0x0002FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x10
                                }, 

                                Package (0x04)
                                {
                                    0x0002FFFF, 
                                    0x01, 
                                    0x00, 
                                    0x11
                                }, 

                                Package (0x04)
                                {
                                    0x0002FFFF, 
                                    0x02, 
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
                                    0x0003FFFF, 
                                    0x01, 
                                    0x00, 
                                    0x10
                                }, 

                                Package (0x04)
                                {
                                    0x0003FFFF, 
                                    0x02, 
                                    0x00, 
                                    0x11
                                }, 

                                Package (0x04)
                                {
                                    0x0004FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x12
                                }, 

                                Package (0x04)
                                {
                                    0x0005FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x13
                                }, 

                                Package (0x04)
                                {
                                    0x0006FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x10
                                }, 

                                Package (0x04)
                                {
                                    0x0006FFFF, 
                                    0x01, 
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
                                    \_SB.PCI0.LPCB.LNKA, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x01, 
                                    \_SB.PCI0.LPCB.LNKB, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x02, 
                                    \_SB.PCI0.LPCB.LNKC, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x03, 
                                    \_SB.PCI0.LPCB.LNKD, 
                                    0x00
                                }
                            })
                        }
                    }
                }
            }

            Device (PB5)
            {
                Name (_ADR, 0x00050000)
                OperationRegion (PCIR, PCI_Config, 0x40, 0xC0)
                Field (PCIR, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x32), 
                    CINS,   8
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
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }
                        })
                    }
                }

                Device (NCRD)
                {
                    Name (_ADR, 0x00)
                    OperationRegion (NCDR, PCI_Config, 0x00, 0xC0)
                    Field (NCDR, DWordAcc, NoLock, Preserve)
                    {
                        PVID,   16, 
                        PDID,   16
                    }

                    Name (_EJD, "_SB.PCI0.DOCK")
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.PB5.NCRD.PVID, 0xFFFF))
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

            Device (PB6)
            {
                Name (_ADR, 0x00060000)
                OperationRegion (P3CS, PCI_Config, 0x40, 0x0100)
                Field (P3CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x28), 
                        ,   4, 
                    LDP3,   1
                }

                OperationRegion (PCIR, PCI_Config, 0x40, 0xC0)
                Field (PCIR, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x32), 
                        ,   6, 
                    DCKD,   1, 
                            Offset (0x33)
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
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }
                        })
                    }
                }

                Device (LAN)
                {
                    Name (_ADR, 0x00)
                    Name (_PRW, Package (0x02)
                    {
                        0x18, 
                        0x04
                    })
                    OperationRegion (PCIR, PCI_Config, 0x00, 0x40)
                    Field (PCIR, AnyAcc, NoLock, Preserve)
                    {
                                Offset (0x05), 
                        DCMD,   8
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
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)
                OperationRegion (P2PP, PCI_Config, 0x00, 0x80)
                Field (P2PP, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x04), 
                    CMDE,   1, 
                            Offset (0x40), 
                        ,   5, 
                    SUBE,   1
                }

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x04
                })
                Device (MPCI)
                {
                    Name (_ADR, 0x00020000)
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
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x01, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                0x00, 
                                0x17
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x02, 
                                0x00, 
                                0x15
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKH, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKF, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (AUDO)
            {
                Name (_ADR, 0x00140005)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
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

            Device (AMD3)
            {
                Name (_ADR, 0x00180003)
                OperationRegion (K8F3, PCI_Config, 0xE0, 0x10)
                Field (K8F3, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x05), 
                    Z00H,   6
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (Z00H, \_SB.TOFF)
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
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.ACDF, ACST)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
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
                Z00I, 
                Z00I, 
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
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.BTDC, Local0)
                    Store (\_SB.PCI0.LPCB.EC0.LFCC, Local1)
                    Store (\_SB.PCI0.LPCB.EC0.BTDV, Local2)
                    Store (\_SB.PCI0.LPCB.EC0.BTMD, Local3)
                    Store (\_SB.PCI0.LPCB.EC0.BTMN, Local4)
                    Store (\_SB.PCI0.LPCB.EC0.BTSN, Local5)
                    Store (\_SB.PCI0.LPCB.EC0.LION, Local6)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    Store (Local0, Index (PBIF, 0x01))
                    Store (Local1, Index (PBIF, 0x02))
                    Store (Local2, Index (PBIF, 0x04))
                    Store (Local1, LFCC)
                    If (Local6)
                    {
                        Store ("NiMH", Index (PBIF, 0x0B))
                    }
                    Else
                    {
                        Store ("LION", Index (PBIF, 0x0B))
                    }

                    And (Local3, 0x0F, Local3)
                    If (LEqual (Local3, 0x01))
                    {
                        Store ("ZF01", Index (PBIF, 0x09))
                    }
                    Else
                    {
                        If (LEqual (Local3, 0x02))
                        {
                            Store ("ZF02", Index (PBIF, 0x09))
                        }
                        Else
                        {
                            If (LEqual (Local3, 0x03))
                            {
                                Store ("ZF03", Index (PBIF, 0x09))
                            }
                        }
                    }

                    If (LEqual (Local4, 0x0B))
                    {
                        Store ("SIMPLO", Index (PBIF, 0x0C))
                    }
                    Else
                    {
                        If (LEqual (Local4, 0x06))
                        {
                            Store ("SIMPLO", Index (PBIF, 0x0C))
                        }
                        Else
                        {
                            If (LEqual (Local4, 0x05))
                            {
                                Store ("SANYO", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local4, 0x04))
                                {
                                    Store ("SONY", Index (PBIF, 0x0C))
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
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.MBTC, Local0)
                    Store (\_SB.PCI0.LPCB.EC0.MBRM, Local1)
                    Store (\_SB.PCI0.LPCB.EC0.MBVG, Local2)
                    Store (\_SB.PCI0.LPCB.EC0.MCUR, Local3)
                    Store (\_SB.PCI0.LPCB.EC0.BTST, Local4)
                    Store (\_SB.PCI0.LPCB.EC0.MBTF, Local5)
                    Store (\_SB.PCI0.LPCB.EC0.ACDF, Local6)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
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
                        Store (Local7, Index (PBST, 0x03))
                    }

                    If (LAnd (Local3, 0x8000))
                    {
                        If (LNotEqual (Local3, 0xFFFF))
                        {
                            Not (Local3, Local3)
                            Increment (Local3)
                        }
                    }

                    And (Local3, 0xFFFF, Local3)
                    Store (Local3, Index (PBST, 0x01))
                }

                Return (PBST)
            }

            Method (Z00G, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.MBTS, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
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
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.LIDS, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    If (LEqual (Local0, 0x01))
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

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
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
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.CTMP, Local0)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                        Return (Add (Multiply (Local0, 0x0A), 0x0AAC))
                    }
                    Else
                    {
                        Return (0x0C3C)
                    }
                }

                Method (_PSV, 0, NotSerialized)
                {
                    Return (Add (Multiply (0x5A, 0x0A), 0x0AAC))
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
    }

    Scope (\_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.LPCB.KBC0, 0x02)
            Notify (\_SB.PCI0.LPCB.MSE0, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P2P, 0x02)
            Store (0xA1, DEBG)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.OHC1, 0x02)
            Notify (\_SB.PCI0.OHC2, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MODM, 0x02)
            Notify (\_SB.PCI0.AUDO, 0x02)
        }

        Method (_L18, 0, NotSerialized)
        {
            Store (0x18, P80H)
            Notify (\_SB.PCI0.PB6.LAN, 0x02)
        }
    }
}

